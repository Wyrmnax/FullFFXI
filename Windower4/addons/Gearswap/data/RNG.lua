-- Feary's RNG LUA
-- Created: 3/10/2014
-- Last Update: 9/1/2014
-- To Do:
-- Overkill Set?
-- Ammo Check?
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
	
-- Get RNG Gearsets
	include('Gearsets/'..player.name..'/RNG_Gearsets.lua')   
	
	
-- Define Default Values for Variables
	Mode = 0
	PDT = 0
	MDT = 0
	ShadowType = 'None'
	flurry2 = 0
	
end
-- Called when this job file is unloaded (eg: job change)
function file_unload()
	clear_binds()
end
 
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
			-- Place me in previous set
			if player.status == 'Engaged' then
				previous_set()
			else
				if Mode == 0 then
					windower.add_to_chat(121,'Ranged TP Set')
				elseif Mode == 1 then
					windower.add_to_chat(121,'Ranged Acc TP Set')
				elseif Mode == 2 then
					windower.add_to_chat(121,'Melee TP Set')
				elseif Mode == 3 then
					windower.add_to_chat(121,'Melee Acc TP Set')
				end
				equip(sets.idle.Standard)
			end
		end
	elseif command == 'RA' then
		if player.status == 'Engaged' then
			if not buffactive['Decoy Shot'] and not buffactive['Camouflage'] and windower.ffxi.get_ability_recasts()[52] < 1 then 
				 windower.send_command('Decoy Shot')
			elseif not buffactive['Camouflage'] and not buffactive['Decoy Shot'] and windower.ffxi.get_ability_recasts()[123] < 1 then 
				windower.send_command('Camouflage')
			elseif not buffactive['Sharpshot'] and not buffactive['Camouflage'] and windower.ffxi.get_ability_recasts()[124] < 1 then 
				windower.send_command('Sharpshot')
			end
			windower.send_command('input /range <t>')
		else
			windower.send_command('input /attack <t>')
			windower.send_command('wait 2;input /ra <t>')
		end
	elseif command == 'ws' then
		if player.status == 'Engaged' then
			if buffactive['Camouflage'] then
				cancel_spell()
				windower.send_command('gs c RA')
			else
				if player.equipment.range == "Yoichinoyumi" or player.equipment.range == "Annihilator" then
					if buffactive['Aftermath'] then
						windower.add_to_chat(121,'Woot Aftermath')
						windower.send_command('Jishnu\'s Radiance')
					else
						if player.TP == 3000 then
							windower.send_command('Namas Arrow')
						else
							windower.add_to_chat(121,'You need Aftermath TP to 3000')
						end
					end
				else
					windower.add_to_chat(121,'Cannot find weapon - defaulting to jishnu')
					windower.send_command('Jishnu\'s Radiance')
				end
			end
		else
			windower.send_command('input /attack <t>')
			windower.send_command('gs c ws')
		end
	elseif command == 'flurry' then
		if flurry >= 1 then
			flurry = 0
		else
			flutry = flurry + 1
		end
	end
end

function status_change(new,old)
    if T{'Idle','Resting'}:contains(new) then		
		if PDT == 1 then
			equip(sets.idle.PDT)
		elseif MDT == 1 then
			equip(sets.idle.MDT)
		else
			if new == "Resting" then
				equip(sets.Resting)
			else
				equip(sets.idle.PDT)
			end
		end
	elseif new == 'Engaged' then
		-- Engaged Sets
		if PDT == 1 or buffactive['Weakness'] or player.hpp <= 30 then
			equip(sets.idle.PDT)
		elseif MDT == 1 then
			equip(sets.idle.MDT)
		--else
		-- Equip previous TP set 
		--	previous_set()
		end
    end
end

function precast(spell,arg)
    if spell.name == 'Ranged' then
		if buffactive['Flurry'] then
			if flurry2 == 1 then
				equip(sets.precast.Snapshot.Flurry2)
			else
				equip(sets.precast.Snapshot.Flurry)
			end
		else
			equip(sets.precast.Snapshot)
		end
    end
    -- Generic equip command for all Job Abilities and Weaponskills
	if spell.type == "JobAbility" then
		if spell.name == "Barrage" or spell.name == "Eagle Eye Shot" or spell.name == "Overkill" then
			if Mode == 1 or Mode == 3 then
				if ranged_Bow:contains(player.equipment.range) then
					equip(sets.RA,sets.precast.JA.Acc[spell.name])
				elseif ranged_Gun:contains(player.equipment.range) then
					equip(sets.RA.Gun,sets.precast.JA.Acc[spell.name])
				end
			elseif ranged_Bow:contains(player.equipment.range) then
				equip(sets.RA,sets.precast.JA[spell.name])
			elseif ranged_Gun:contains(player.equipment.range) then
				equip(sets.RA.Gun,sets.precast.JA[spell.name])
			end
		else
			if buffactive['Camouflage'] then
				if spell.name == 'Shadowbind' then
					equip(sets.precast.JA[spell.name])
				else 
					cancel_spell()
				end
			else
				equip(sets.precast.JA[spell.name])
			end
		end
    elseif spell.type == "WeaponSkill" then
		-- when /war Make sure Berserk is up when using a WS
		if (spell.name == 'Jishnu\'s Radiance' or spell.name == 'Namas Arrow') and not buffactive.Berserk and not buffactive.Amnesia and not buffactive.Obliviscence and not buffactive.Paralysis and player.sub_job == 'WAR' and windower.ffxi.get_ability_recasts()[1] < 1 then
			windower.send_command('berserk; wait 1; warcry; wait 1; '..spell.name..' '..spell.target.raw)
			cancel_spell()
			return
		end
		-- Ranged Weaponskills
		if ranged_weaponskills:contains(spell.name) then
			if player.status == 'Engaged' then
				if player.tp >= 100 then
					if spell.target.distance <= ranged_weaponskills_Distance[spell.name] then
						if sets.precast.RAWS[spell.name] then
							equip(sets.precast.RAWS[spell.name])
						else
							equip(sets.precast.RAWS)
						end
					else
						cancel_spell()
						windower.add_to_chat(121, 'Canceled '..spell.name..'. '..ranged_weaponskills_Distance[spell.name]..' is Too Far from '..spell.target.name..'.')
					end
				else 
					cancel_spell()
					windower.add_to_chat(121, ''..player.tp..'TP is not enough to WS')
				end
			else
				windower.send_command('gs c ws')
				cancel_spell()
			end
		else
	-- Melee Weaponskills
			if player.status == 'Engaged' then
				if player.tp >= 100 then
					if spell.target.distance <= 5 then
						if sets.precast.WS[spell.name] then
							equip(sets.precast.WS[spell.name])
						else
							equip(sets.precast.WS)
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
		end
    -- Magic spell gear handling(Precast)
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
		elseif windower.wc_match(spell.name,'*Flourish') then
			equip(sets.misc.flourish)
		end
	end
end

function midcast(spell,arg)
	windower.add_to_chat(121, "Spell name " ..spell.name)
    if spell.name == 'Ranged' then
		if buffactive.Barrage then
			equip(sets.precast.JA["Barrage"])
		elseif buffactive.Overkill then
			equip(sets.precast.JA["Overkill"])
		else
			if ranged_Bow:contains(player.equipment.range) then
				equip(sets.RA)
			elseif ranged_Gun:contains(player.equipment.range) then
				equip(sets.RA.Gun)
			end
		end
    end

    -- Gear change to Damage Taken set when in midcast of Utsusemi
    -- Special handling to remove Utsusemi, Sneak, and Stoneskin effects if they are active
    if windower.wc_match(spell.name,'Utsusemi*') then
        equip(sets.precast.Utsusemi)
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
		if PDT == 1 or MDT == 1 or buffactive['Weakness'] then
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
			equip(sets.idle.Standard)
		end
	end
    -- Changes shadow type variable to allow cancel Copy Image if last cast was Utsusemi: Ni
    if spell and spell.name == 'Utsusemi: Ni' then
        ShadowType = 'Ni'
    elseif spell and spell.name == 'Utsusemi: Ichi' then
        ShadowType = 'Ichi'
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

function previous_set()
slot_lock()
	if Mode == 0 then
		if ranged_Bow:contains(player.equipment.range) then
			equip(sets.RA)
		elseif ranged_Gun:contains(player.equipment.range) then
			equip(sets.RA.Gun)
		end
		windower.add_to_chat(121,'Ranged TP Set')
	elseif Mode == 1 then
		if ranged_Bow:contains(player.equipment.range) then
			equip(sets.RA.Acc)
		elseif ranged_Gun:contains(player.equipment.range) then
			equip(sets.RA.Acc.Gun)
		end
		windower.add_to_chat(121,'Ranged Acc TP Set')		
	elseif Mode == 2 then
		equip(sets.TP)
		windower.add_to_chat(121,'Melee TP Set')
	elseif Mode == 3 then
		equip(sets.TP.Acc)
		windower.add_to_chat(121,'Melee Acc TP Set')
	end		
end