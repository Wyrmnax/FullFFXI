-- Feary's MNK LUA
-- Created: 1/18/2014
-- Last Updated: 4/20/2014
-- To Do List 
--
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

	-- Get MNK Gearsets
	include('Gearsets/'..player.name..'/Mnk_Gearsets.lua')
	
-- Define Default Values for Variables
	boostCount = 0
	Mode = 0
	PDT = 0
	MDT = 0
	ShadowType = 'None'
end -- End gear sets

-- Called when this job file is unloaded (eg: job change)
function file_unload()
	clear_binds()
end

-- Rules
function self_command(command)
-- Lock PDT
	if command == 'PDT' then
		if PDT == 1 then
			windower.add_to_chat(121,'PDT Unlocked')
			-- make sure other values are set to default
			PDT = 0
			-- Unlock MDT set and equip Current TP set
			MDT = 0
			-- Place Me in my previous set.
			if player.status == 'Engaged' then
				previous_set()
			else
				equip(sets.idle.Standard)
			end
		else
		-- Make sure other values are set to default
			MDT = 0
		-- Set PDT set and equip it
			PDT = 1
			equip(sets.idle.PDT)
			windower.add_to_chat(121,'PDT Set')
		end
--  Lock MDT
	elseif command == 'MDT' then
		if MDT == 1 then
		-- make sure other values are set to default
			PDT = 0
		-- Unlock MDT set and equip Current TP set
			MDT = 0
			windower.add_to_chat(121,'MDT Unlocked')
		-- Place Me in my previous set.
			if player.status == 'Engaged' then
				previous_set()
			else
				equip(sets.idle.Standard)
			end
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
		else
			if Mode >= 3 then
			-- Reset to 0
				Mode = 0
			else
			-- Increment by 1
				Mode = Mode + 1
			end
			-- Place me in previous set
			if player.status == 'Engaged' then
				previous_set()
			else
				equip(sets.idle.Standard)
			end
		end
	elseif command == 'testing' then
		windower.add_to_chat(121,'PDT:'..PDT..'MDT:'..MDT..'Mode:'..Mode)
	end
end
	
function status_change(new,old)
-- Autoset
    if T{'Idle'}:contains(new) then
		if areas.Town:contains(world.zone) then
			windower.add_to_chat(121, "Town Gear")
			equip(sets.misc.Town)
		else
			if PDT == 1 then
				equip(sets.idle.PDT)
			elseif MDT == 1 then
				equip(sets.idle.MDT)
			else
				windower.add_to_chat(121,'Idle/Resting Set')
				equip(sets.idle.Standard)
			end
		end
	elseif new == 'Resting' then
		equip(sets.Resting)
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
			-- Automatically activate Impetus when engaging
            --if not buffactive.Impetus and not buffactive.Amnesia and not buffactive.Obliviscence and not buffactive.Paralysis and windower.ffxi.get_ability_recasts()[31] < 1 then
            --    windower.send_command('impetus')
            --end
			-- Equip Previous TP
			previous_set()
		end
	end
end

function self_command(cmd)
    if cmd == 'ws' then
		--if player.tp == 3000 and not buffactive.Aftermath then
		--	windower.send_command('input /ws "Final Heaven" <t>')
		--elseif buffactive.Footwork then
		if buffactive.Footwork then
			windower.send_command('input /ws "Tornado Kick" <t>')	
        elseif player.tp < 1500 then
            windower.send_command('input /ws "Victory Smite" <t>')
        else
            windower.send_command('input /ws "Raging Fists" <t>')
        end
    end
end

function precast(spell,arg)
 -- Generic equip command for all Job Abilities and Weaponskills
    if sets.precast.JA[spell.name] then
        equip(sets.precast.JA[spell.name])
   elseif sets.precast.WS[spell.name] then
		if player.status == 'Engaged' then
			if player.tp >= 100 then
				if spell.target.distance <= 5 then
					if sets.precast.WS[spell.name] then
						if Mode	>= 1 then
							if buffactive['Impetus'] and player.inventory['Bhikku Cyclas'] then
								equip(sets.precast.WS.Acc[spell.name],{body="Bhikku Cyclas"})
							else
								equip(sets.precast.WS.Acc[spell.name])
							end
						else
							if buffactive['Impetus'] then
								equip(sets.precast.WS[spell.name],{body="Bhikku Cyclas"})
							else
								equip(sets.precast.WS[spell.name])
							end
						end
					else
						windower.add_to_chat(121,'Default WS Gear')
						if Mode	>= 1 then
							equip(sets.precast.WS)
						else
							equip(sets.precast.WS.Acc)
						end
					end
				else
					cancel_spell()
					windower.add_to_chat(121, 'Canceled '..spell.name..'.'..spell.target.name..' is Too Far')
				end
			else 
				cancel_spell()
				windower.add_to_chat(121, ''..player.tp..'tp is not enough to WS')
			end
		else
			cancel_spell()
			windower.add_to_chat(121, 'You must be Engaged to WS')
		end
    end

 -- Ninjutsu spell gear handling(Precast)
    if spell.skill == 'Ninjutsu' then
        equip(sets.precast.Fastcast)
        if windower.wc_match(spell.name,'Utsusemi*') then
            equip(sets.precast.Utsusemi)
        end
    end


 -- Special handling to remove Dancer sub job Sneak effect
    if spell.name == 'Spectral Jig' and buffactive.Sneak then
        windower.ffxi.cancel_buff(71)
        cast_delay(0.3)
    elseif windower.wc_match(spell.name,'Curing*') then
        equip(sets.misc.Waltz)
    elseif windower.wc_match(spell.name,'*Step') then
        equip(sets.TP.HighAcc)
    end
end

function midcast(spell,arg)
	-- Utsusemi
	if windower.wc_match(spell.name,'Utsusemi*') then
		-- Equip PDT then Utsusemi Gear sets
        equip(sets.idle.PDT, sets.precast.Utsusemi)
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
        end
    elseif spell.name == 'Monomi: Ichi' or spell.name == 'Sneak' and buffactive.Sneak and spell.target.type == 'SELF' then
        windower.ffxi.cancel_buff(71)
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
    elseif spell and spell.name == 'Boost' then
        boostCount = boostCount +1
        windower.add_to_chat(8,'Boost Count - [ '..boostCount..' / 12 ] ('..math.floor(100*boostCount/12)..'% Boosted!)')
    end
end

function previous_set()
	if Mode == 0 then	
		if  buffactive['Hundred Fists'] then
			windower.add_to_chat(121,'Hundred Fists')
			if Mode	>= 1 then
				equip(sets.TP.HF.Acc)
			else
				equip(sets.TP.HF)
			end
		else
			windower.add_to_chat(121,'TP')
			equip(sets.TP)
		end
	elseif Mode == 1 then
		windower.add_to_chat(121,'MidAcc TP')
		equip(sets.TP.MidAcc)
	elseif Mode == 2 then
		windower.add_to_chat(121,'HighAcc TP')
		equip(sets.TP.HighAcc)
	elseif Mode == 3 then
		windower.add_to_chat(121,'Hybrid TP')
		equip(sets.TP.Hybrid)
	end
end