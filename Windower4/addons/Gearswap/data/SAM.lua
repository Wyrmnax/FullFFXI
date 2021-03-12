-- Feary's SAM LUA
-- Created On: 4/8/2014
-- Last Update: 6/13/2014
-- To Do:
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
	
	-- Get SAM Gearsets
	include('Gearsets/'..player.name..'/SAM_Gearsets.lua')
	
-- Define Default Values for Variables
	-- STP Bow does not go here, only bows for Namas/Apex that us sets.TP.Bow, have to test the other bow.
	Bow = T{"Yoichinoyumi", "Speleogen Bow"}
	Ammo = {ammo="Tulfaire Arrow"}
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
			windower.add_to_chat(121,'PDT Set Locked')
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
			if Mode >= 2 then
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
	elseif command == 'twilight' or command == "t" then
		-- Twilight Helm/Mail logic
		-- if i have twilight gear on, put on my tp set 
		if player.equipment.head == 'Twilight Helm' and player.equipment.body == 'Twilight Mail' then
			enable('head','body')
			if player.status == "Engaged" then
				-- equip appropriate set
				previous_set()
			else
				equip(sets.idle.Standard)
			end
			windower.add_to_chat(121, 'Twilight Unequipped')
		else
			-- if i dont have twilight on equip it
			equip({head="Twilight Helm",body="Twilight Mail"})
		end
	end
end
	
function status_change(new,old)
-- Autoset
    if T{'Idle','Resting'}:contains(new) then
		slot_lock()
		windower.add_to_chat(121,'Idle/Resting Set')
		if areas.Town:contains(world.zone) then
			windower.add_to_chat(121, "Town Gear")
			equip(sets.misc.Town)
		else
			if buffactive['Weakness'] then
				windower.send_command('gs c twilight')
			elseif PDT == 1 then
				equip(sets.idle.PDT)
			elseif MDT == 1 then
				equip(sets.idle.MDT)
			elseif new == 'Resting' then
				equip(sets.Resting)
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
		elseif player.hpp <= 30 or buffactive['Weakness'] then
			windower.send_command('gs c twilight')
			slot_lock()
			previous_set()
		else
			 -- Automatically activate Hasso when engaging if Seigan isn't active
            if not buffactive.Hasso and not buffactive.Seigan and not buffactive.Amnesia and not buffactive.Obliviscence and not buffactive.Paralysis and windower.ffxi.get_ability_recasts()[138] < 1 then
			   windower.send_command('hasso')
            end
			slot_lock()
			previous_set()
		end
	end
end

function precast(spell,arg)
	if spell.type == "JobAbility" then
		if sets.precast.JA[spell.name] then
			equip(sets.precast.JA[spell.name])
		end
	elseif spell.type == "WeaponSkill" then
		if player.status == 'Engaged' then
			if player.tp >= 100 then
				-- Situational spell logic for Warrior sub job
				if (spell.name == 'Namas Arrow' or spell.name == 'Requiescat' or spell.name == 'Tachi: Fudo' or spell.name == 'Tachi: Kaiten' or spell.name == 'Tachi: Shoha') and not buffactive.Berserk and not buffactive.Amnesia and not buffactive.Obliviscence and not buffactive.Paralysis and player.sub_job == 'WAR' and windower.ffxi.get_ability_recasts()[1] < 1 then
					--windower.send_command('berserk; wait 1; warcry; wait 1; '..spell.name..' '..spell.target.raw)
					--cancel_spell()
					return
				end
				-- Ranged WS
				if ranged_weaponskills:contains(spell.name) then
					-- Check Ranged WS Distance
					if spell.target.distance <= ranged_weaponskills_Distance[spell.name] then
						if sets.precast.RAWS[spell.name] then
							equip(sets.precast.RAWS[spell.name],Ammo)
						else
							equip(sets.precast.RAWS,Ammo)
						end
						-- Layered this way to allow for proper equiping of gear when any combo of the below buffs are in effect
						if buffactive.Sekkanoki then
							equip(sets.precast.JA["Sekkanoki"])
							if buffactive.Sengikori then
								equip(sets.precast.JA["Sengikori"])
							end
						end
						if buffactive['Meikyo Shisui'] then
							equip(sets.precast.JA['Meikyo Shisui'])
						end	
					else
						cancel_spell()
						windower.add_to_chat(121, 'Canceled '..spell.name..'.'..spell.target.name..' is Too Far')
					end
				-- Check WS Distance
				else
					if spell.target.distance <= 6 then
						if sets.precast.WS[spell.name] then
							equip(sets.precast.WS[spell.name])
						else
							equip(sets.precast.WS)
						end
						-- Layered this way to allow for proper equiping of gear when any combo of the below buffs are in effect
						if buffactive.Sekkanoki then
							equip(sets.precast.JA["Sekkanoki"])
							if buffactive.Sengikori then
								equip(sets.precast.JA["Sengikori"])
							end
						end
						if buffactive['Meikyo Shisui'] then
							equip(sets.precast.JA['Meikyo Shisui'])
						end	
					else
						cancel_spell()
						windower.add_to_chat(121,''..spell.target..'is too far to ws')
					end
				end					
			else 
				cancel_spell()
				windower.add_to_chat(121, ''..player.tp..' TP is Not enough to WS')
			end
		else
			cancel_spell()
			windower.add_to_chat(121, 'You must be Engaged to WS')
		end
	elseif spell.type == 'Ninjutsu' then
			equip(sets.precast.Fastcast)
			if windower.wc_match(spell.name,'Utsusemi*') then
				equip(sets.precast.Utsusemi)
			end
	else
		-- Special handling to remove Dancer sub job Sneak effect
		if spell.name == 'Spectral Jig' and buffactive.Sneak then
			windower.ffxi.cancel_buff(71)
			cast_delay(0.3)
		elseif windower.wc_match(spell.name,'Curing*') then
			equip(sets.misc.Waltz)
		elseif windower.wc_match(spell.name,'*Step') then
			equip(sets.misc.Steps)
		end
	end
end

function midcast(spell,arg)
	if spell.type == 'Ninjutsu' then	
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
end

function aftercast(spell,arg)
-- Autoset
	if areas.Town:contains(world.zone) then
		windower.add_to_chat(121, "Town Gear")
		equip(sets.misc.Town)
	else
		if player.status == 'Engaged' then
			slot_lock()
			-- Equip appropriate TP set
				previous_set()
		else
			slot_lock()
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

function previous_set(spell)
	if player.equipment.range == "Yoichinoyumi" then
		if Mode == 0 then
			equip(sets.TP.Bow)
			--windower.add_to_chat(121,'Bow TP Set')
		elseif Mode == 1 then 
			equip(sets.TP.Bow.Acc)
			--windower.add_to_chat(121,'Bow Acc Set')
		elseif Mode == 2 then 
			equip(sets.TP.Bow.Buffed)
			--windower.add_to_chat(121,'Buffed Bow Acc Set')
		end		
	else
		if Mode == 0 then
			equip(sets.TP)
			--windower.add_to_chat(121,'TP Set')
		elseif Mode == 1 then 
			equip(sets.TP.Acc)
			--windower.add_to_chat(121,'Acc Set')
		elseif Mode == 2 then 
			equip(sets.TP.Buffed)
			--windower.add_to_chat(121,'Buffed Set')
		end
	end
end

function slot_lock()
    if player.equipment.left_ear == 'Reraise Earring' then
        disable('left_ear')
        windower.add_to_chat(121,'Reraise Earring equiped on left ear')
    elseif player.equipment.right_ear == 'Reraise Earring' then
        disable('right_ear')
        windower.add_to_chat(121,'Reraise Earring equiped on right ear')
    else
        enable('left_ear','right_ear')
    end
end

