-- Feary's DNC LUA
-- Created: 4/26/2014
-- Updated: 4/26/2014
-- To Do:
--
--
--includes
	include('include/functions.lua')
	-- Global Buffs
	include('include/status.lua')
	
-- Gear Sets 
function get_sets()
--includes
	--include('include/autoexec.lua')
	include('include/binds.lua')
	include('include/utility.lua')
	include('include/macro.lua')
	
	-- Get DNC gearsets
	include('Gearsets/'..player.name..'/DNC_Gearsets.lua')
	
-- Define Default Values for Variables
	Mode = 0
	PDT = 0
	MDT = 0
	ShadowType = 'None'
	
	Waltzes = T{"Curing Waltz","Divine Waltz","Curing Waltz II","Healing Waltz","Curing Waltz III","Curing Waltz IV","Divine Waltz II","Curing Waltz V"}
	Sambas = T{"Drain Samba","Aspir Samba","Drain Samba II","Haste Samba","Aspir Samba II","Drain Samba III"}
	Steps = T{"Quickstep","Box Step","Stutter Step","Feather Step"}
	Jigs = T{"Spectral Jig","Chocobo Jig","Chocobo Jig II"}
	Flourish = T{"Animated Flourish","Desperate Flourish","Violent Flourish","Reverse Flourish","Building Flourish","Wild Flourish","Climactic Flourish","Striking Flourish","Ternary Flourish"}

end 

-- Called when this job file is unloaded (eg: job change)
function file_unload()
	clear_binds()
end

-- Rules
function self_command(command)
-- Lock PDT
	if command == 'PDT' then
		if PDT == 1 then
			-- make sure other values are set to default
			-- Unlock PDT/MDT Variables
			PDT = 0
			MDT = 0
			-- Place Me in my previous set.
			if player.status == 'Engaged' then
				previous_set()
			else
				equip(sets.idle.Standard)
			end
			windower.add_to_chat(121,'PDT Set UnLocked')
		else
		-- Make sure other values are set to default
				MDT = 0
			-- Set PDT set and equip it
				PDT = 1
				equip(sets.idle.PDT)
				windower.add_to_chat(121,'PDT Set Locked')
		end
--  Lock MDT
	elseif command == 'MDT' then
		if MDT == 1 then
		-- make sure other values are set to default
		-- Unlock PDT/MDT Variables
			PDT = 0
			MDT = 0
			-- Place Me in my previous set.
			if player.status == 'Engaged' then
				previous_set()
			else
				equip(sets.idle.Standard)
			end
			windower.add_to_chat(121,'MDT Set UnLocked')
		else
		-- make sure other values are set to default
			PDT = 0
		-- lock MDT set and equip it
			MDT = 1	
			equip(sets.idle.MDT)
			windower.add_to_chat(121,'MDT Set Locked')
		end
	elseif command == 'TP' then
		if PDT == 1 or MDT == 1 then
			-- Reset to Default
			PDT = 0
			MDT = 0
			-- Place me in previous set
			if player.status == 'Engaged' then
				previous_set()
			else
				equip(sets.idle.Standard)
			end
			windower.add_to_chat(121,'PDT/MDT Set UnLocked')
		else
			if Mode >= 3 then
				-- Reset to 0
				Mode = 0
			else
				-- Increment by 1
				Mode = Mode + 1
			end
			if Mode == 0 then	
				windower.add_to_chat(121,'TP')
			elseif Mode == 1 then
				windower.add_to_chat(121,'Acc TP')		
			elseif Mode == 2 then
				windower.add_to_chat(121,'Alliance Buffed TP')
			elseif Mode == 3 then
				windower.add_to_chat(121,'Hybrid Evasion TP')
			end
			-- Place me in previous set
			if player.status == 'Engaged' then
				previous_set()
			else
				equip(sets.idle.Standard)
			end
		end
	end
end

function status_change(new,old)
-- Auto set
    if T{'Idle','Resting'}:contains(new) then
		slot_lock()
		if areas.Town:contains(world.zone) then
			windower.add_to_chat(121, "Town Gear")
			equip(sets.misc.Town)
		else
			if PDT == 1 or buffactive['Weakness'] or player.hpp < 30 then
				equip(sets.idle.PDT)
			elseif MDT == 1 then
				equip(sets.idle.MDT)
			else
				equip(sets.idle.Standard)
			end
		end
	elseif new == 'Engaged' then
		if PDT == 1 or MDT == 1 then
			if PDT == 1 and MDT == 0 then
				windower.add_to_chat(121,'PDT Locked')
				equip(sets.idle.PDT)
			elseif MDT == 1 and PDT == 0 then
				windower.add_to_chat(121,'MDT Locked')
				equip(sets.idle.MDT)
			else
				MDT = 0
				PDT = 0
			end
		else
			-- Equip previous TP set 
				previous_set()
		end
	end
end

function precast(spell,arg)
-- Job Abilities
	if spell.type == 'JobAbility' then
		if sets.precast.JA[spell.name] then
			equip(sets.precast.JA[spell.name])
		end
-- Weaponskills
	elseif spell.type == 'Weaponskill' then
		if player.status == 'Engaged' then
			if player.tp >= 100 then
				if spell.target.distance <= 5 then
					if Mode == 1 then
						if sets.precast.WS[spell.name] then
							equip(sets.precast.WS.Acc[spell.name])
						else
							equip(sets.precast.WS.Acc)
						end
					else				
						if sets.precast.WS[spell.name] then
							equip(sets.precast.WS[spell.name])
						else
							equip(sets.precast.WS)
						end
					end
				else
					cancel_spell()
					windower.add_to_chat(121, 'Canceled '..spell.name..'.'..spell.target.name..' is Too Far')
				end
			else 
				cancel_spell()
				windower.add_to_chat(121, ''..player.tp..'TP is not enough to WS')
			end
		else
			cancel_spell()
			windower.add_to_chat(121, 'You must be Engaged to WS')
		end
-- Magic
	elseif spell.type:endswith('Magic') then
		equip(sets.precast.Fastcast)
-- Ninjutsu
	elseif spell.type == 'Ninjutsu' then
		equip(sets.precast.Fastcast)
-- Dancer Stuff
	elseif spell.type == "Samba" then
		if Sambas:contains(spell.name) then
			equip(sets.precast.JA["Sambas"])
		end
	elseif spell.type == "Waltz" then
		if Waltzes:contains(spell.name) then
			equip(sets.precast.JA["Waltz"])
		end
	elseif spell.type == "Jig" then
		if Jigs:contains(spell.name) then
			equip(sets.precast.JA["Jigs"])
		end
	elseif spell.type == "Step" then
		if Steps:contains(spell.name) then
			if spell.name == "Feather Step" then
				equip(sets.precast.JA[spell.name])
			else
				equip(sets.precast.JA["Step"])
			end
		end
	elseif spell.type == "Flourish1" or spell.type == "Flourish2" or spell.type == "Flourish3" then
		if Flourish:contains(spell.name) then
			if spell.name == "Violent Flourish" then
				equip(sets.precast.JA[spell.name])
			elseif spell.name == "Striking Flourish" then
				equip(sets.precast.JA[spell.name])
			else
				equip(sets.precast.JA["Flourish"])
			end
		end
	else
		
	end
end

function midcast(spell,arg)
-- Magic
	if spell.skill:endswith('Magic') then
		equip(sets.midcast.Recast)
-- Ninjutsu
	elseif spell.skill == "Ninjutsu" then
		equip(sets.midcast.Recast)
        if spell.name == 'Utsusemi: Ichi' and ShadowType == 'Ni' then
            if buffactive['Copy Image'] then
                windower.ffxi.cancel_buff(66)
            elseif buffactive['Copy Image (2)'] then
                windower.ffxi.cancel_buff(444)
            elseif buffactive['Copy Image (3)'] then
                windower.ffxi.cancel_buff(445)
            elseif buffactive['Copy Image (4+)'] then
                windower.ffxi.cancel_buff(446)
            end
		elseif spell.name == 'Monomi: Ichi' and buffactive.Sneak and spell.target.type == 'SELF' then
			windower.ffxi.cancel_buff(71)
        end
    else
	
    end
end 

function aftercast(spell,arg)
-- Autoset
	if areas.Town:contains(world.zone) then
		windower.add_to_chat(121, "Town Gear")
		equip(sets.misc.Town)
	else
		if player.status == 'Engaged' then
			previous_set()
		else
			equip(sets.idle.Standard)
		end
	end
-- Utsusemi Variable Sets
	if spell and spell.name == 'Utsusemi: Ni' then
        ShadowType = 'Ni'
    elseif spell and spell.name == 'Utsusemi: Ichi' then
        ShadowType = 'Ichi'
	end
end

function previous_set()
	slot_lock()
	if Mode == 0 then	
		windower.add_to_chat(121,'TP')
		equip(sets.TP)
	elseif Mode == 1 then
		windower.add_to_chat(121,'Acc TP')
		equip(sets.TP.Acc)
	elseif Mode == 2 then
		windower.add_to_chat(121,'Alliance Buffed TP')
		equip(sets.TP.sets.TP.Buffed )
	elseif Mode == 3 then
		windower.add_to_chat(121,'Hybrid Evasion TP')
		equip(sets.TP.Hybrid)
	end
end

function slot_lock()
    if player.equipment.left_ear == 'Reraise Earring' then
        disable('left_ear')
        windower.add_to_chat(8,'Reraise Earring equiped on left ear')
    elseif player.equipment.right_ear == 'Reraise Earring' then
        disable('right_ear')
        windower.add_to_chat(8,'Reraise Earring equiped on right ear')
    else
        enable('left_ear','right_ear')
    end
end