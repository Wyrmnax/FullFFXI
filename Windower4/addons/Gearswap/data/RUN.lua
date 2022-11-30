-- Feary's RUN LUA
-- Created: 7/18/2014
-- Last Modified: 7/19/2014
-- To Do:
--	
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
	
	-- Get RUN Gearsets
	include('Gearsets/'..player.name..'/RUN_Gearsets.lua')
	
-- Define Default Values for Variables
	Mode = 0
	PDT = 0
	MDT = 0
	ShadowType = 'None'
	Runes = 'Tenebrae'
	
	degrade_array = {
        ['Attack'] = {'Swipe','Lunge'},
		['Ward'] = { 'Vallation','Valiance'},
        }
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
				if Mode == 4 then
					equip(sets.idle.Standard,sets.idle.Evasion)
				else
					equip(sets.idle.Standard)
				end
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
				if Mode == 3 then
					equip(sets.TP.Hybrid)
				else
					equip(sets.idle.Standard)
				end
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
				if Mode == 3 then
					equip(sets.TP.Hybrid)
				else
					equip(sets.idle.Standard)
				end
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
				if Mode == 3 then
					equip(sets.TP.Hybrid)
				else
					equip(sets.idle.Standard)
				end
			end
		end
	elseif command == 'rune' then
		send_command('@input /ja '..Runes..' <me>')		
	--elseif command == 'Dimidiation' then
		--send_command('@input /ws Dimidiation <t>')
	elseif command == 'cycleRunes' then
		if Runes =='Tenebrae' then
			Runes = 'Lux'
			windower.add_to_chat(121,'Lux Set')
		elseif Runes =='Lux' then
			Runes = 'Ignis'
			windower.add_to_chat(121,'Ignis Set')		
		elseif Runes =='Ignis' then
			Runes = 'Gelus'
			windower.add_to_chat(121,'Gelus Set')
		elseif Runes =='Gelus' then
			Runes = 'Flabra'
			windower.add_to_chat(121,'Flabra Set')
		elseif Runes =='Flabra' then
			Runes = 'Tellus'
			windower.add_to_chat(121,'Tellus Set')
		elseif Runes =='Tellus' then
			Runes = 'Sulpor'
			windower.add_to_chat(121,'Sulpor Set')
		elseif Runes =='Sulpor' then
			Runes = 'Unda'
			windower.add_to_chat(121,'Unda Set')
		elseif Runes =='Unda' then
			Runes = 'Tenebrae'
			windower.add_to_chat(121,'Tenebrae Set')
		end	
	elseif command == 'cyclebackRunes' then
		if Runes =='Tenebrae' then
			Runes = 'Unda'
			windower.add_to_chat(121,'Unda Set')
		elseif Runes =='Lux' then
			Runes = 'Tenebrae'
			windower.add_to_chat(121,'Tenebrae Set')		
		elseif Runes =='Ignis' then
			Runes = 'Lux'
			windower.add_to_chat(121,'Lux Set')
		elseif Runes =='Gelus' then
			Runes = 'Ignis'
			windower.add_to_chat(121,'Ignis Set')
		elseif Runes =='Flabra' then
			Runes = 'Gelus'
			windower.add_to_chat(121,'Gelus Set')
		elseif Runes =='Tellus' then
			Runes = 'Flabra'
			windower.add_to_chat(121,'Flabra Set')
		elseif Runes =='Sulpor' then
			Runes = 'Tellus'
			windower.add_to_chat(121,'Tellus Set')
		elseif Runes =='Unda' then
			Runes = 'Sulpor'
			windower.add_to_chat(121,'Sulpor Set')
		end	
		
	end
end
	
function status_change(new,old)
-- Autoset
    if T{'Idle','Resting'}:contains(new) then
		weapon_check()
		slot_lock()
		if areas.Town:contains(world.zone) then
			windower.add_to_chat(121, "Town Gear")
			equip(sets.misc.Town)
		else
			if Mode == 3 then
				windower.add_to_chat(121,'Tank Set')
				equip(sets.TP.Hybrid)
			else
				if new == "Resting" then
					equip(sets.Resting)
				else
					windower.add_to_chat(121,'Idle/Resting Set')
					equip(sets.idle.Standard)
				end
			end
		end
	elseif new == 'Engaged' then
		weapon_check()
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
			previous_set()
		end
	end
end

function precast(spell,arg)
 -- Generic equip command for all Job Abilities and Weaponskills
	if spell.type == 'JobAbility' then
		if sets.precast.JA[spell.name] then
			equip(sets.precast.JA[spell.name])
		end
	elseif spell.type == 'Effusion' then
		if spell.name:startswith("Lunge") then
			refine_various_spells(spell, action, spellMap, eventArgs)
		end
		if sets.precast.JA[spell.name] then
			equip(sets.precast.JA[spell.name])
		end
	elseif spell.type == 'Ward' then
		refine_various_spells(spell, action, spellMap, eventArgs)
	elseif spell.type == 'WeaponSkill' then
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
 -- Ninjutsu spell gear handling(Precast)
    elseif spell.skill == 'Ninjutsu' then
        if windower.wc_match(spell.name,'Utsusemi*') then
            equip(sets.precast.Utsusemi)
		else	
			equip(sets.precast.FastCast)
        end
	elseif spell.type:endswith('Magic') then
		if spell.skill == 'Healing Magic' then
			if spell.english:wcmatch("Cure*") and (player.name == spell.target.name) then
				equip(sets.precast.HPDown)
			else
				equip(sets.precast.Fastcast)
			end
		elseif spell.skill == 'Enhancing Magic' then
			equip(sets.precast.Fastcast)
			if spell.name == 'Sneak' and buffactive.Sneak and spell.target.type == 'SELF' then
				windower.ffxi.cancel_buff(71)
			end
		elseif spell.skill == 'Divine Magic' then
			equip(sets.precast.Fastcast)
		elseif spell.skill == 'Blue Magic' then
			equip(sets.precast.Fastcast)
		elseif spell.skill == 'Elemental Magic' then
			equip(sets.precast.Fastcast)
		else
			equip(sets.precast.Fastcast)
		end
	else
	 -- Special handling to remove Dancer sub job Sneak effect
		if spell.name == 'Spectral Jig' and buffactive.Sneak then
			windower.ffxi.cancel_buff(71)
			cast_delay(0.3)
		elseif windower.wc_match(spell.name,'Curing*') then
			equip(sets.misc.Waltz)
		elseif windower.wc_match(spell.name,'*Step') then
			equip(sets.TP.Acc)
		end
	end
end

function midcast(spell,arg)	
	if spell.type == 'Ninjutsu' then
		-- Utsusemi
		if windower.wc_match(spell.name,'Utsusemi*') then
			-- Equip PDT then Utsusemi Gear sets
			equip(sets.idle.PDT, sets.midcast.Utsusemi)
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
		elseif spell.name == "Migawara: Ichi" then
			equip(sets.midcast.Skill)
		elseif spell.english:wcmatch("Katon*|Doton*|Suiton*|Huton*|Hyoton*|Raiton") then
			equip(sets.midcast.Wheel)
		end
	elseif spell.skill == 'Enhancing Magic' then	
		if spell.name == 'Phalanx' then
	 		equip(sets.midcast.Phalanx) 
			
		elseif spell.english:startswith("Regen") then	
	 		equip(sets.midcast.Regen) 
		else
			equip(sets.midcast.Enhancing)	
		end
	-- enmity spells
	elseif spell.type:endswith('Magic') then
		equip(sets.Enmity)
	end
end

function aftercast(spell,arg)
-- Autoset
	if areas.Town:contains(world.zone) then
		windower.add_to_chat(121, "Town Gear")
		equip(sets.misc.Town)
	else
		if player.status == 'Engaged' then
			-- Equip Previous TP set
			previous_set()
		else
			if Mode == 3 then
				equip(sets.TP.Hybrid)
			else
				equip(sets.idle.Standard)
			end
		end
	end
-- Utsusemi Variable Sets
	if spell and spell.name == 'Utsusemi: Ni' then
        ShadowType = 'Ni'
    elseif spell and spell.name == 'Utsusemi: Ichi' then
        ShadowType = 'Ichi'
	end
end

function refine_various_spells(spell, action, spellMap, eventArgs)

    local newSpell = spell.english
    local spell_recasts = windower.ffxi.get_ability_recasts()
    local cancelling = 'All '..spell.english..' are on cooldown. Cancelling.'

    local spell_index

    if spell_recasts[spell.recast_id] > 0 then
        if spell.name:startswith('Lunge') then
            spell_index = table.find(degrade_array['Attack'],spell.name)
            if spell_index > 1 then
                newSpell = degrade_array['Attack'][spell_index - 1]
                send_command('@input /ja '..newSpell..' '..tostring(spell.target.raw))
            end
		elseif spell.name:startswith('Valiance') then
            spell_index = table.find(degrade_array['Ward'],spell.name)
            if spell_index > 1 then
                newSpell = degrade_array['Ward'][spell_index - 1]
                send_command('@input /ja '..newSpell..' '..tostring(spell.target.raw))
            end
        end
		
    end
end

function previous_set(spell)
	if PDT == 1 then
		equip(sets.idle.PDT)
		windower.add_to_chat(121,'PDT Set')
	elseif Mode == 0 then
		equip(sets.TP)
		windower.add_to_chat(121,'TP Set')
	elseif Mode == 1 then 
		equip(sets.TP.Acc)
		windower.add_to_chat(121,'Acc Set')
	elseif Mode == 2 then
		equip(sets.TP.Buffed)
		windower.add_to_chat(121,'Alliance Buffed Set')
	elseif Mode == 3 then
		equip(sets.TP.Hybrid)
		windower.add_to_chat(121,'Tank Set')
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

function weapon_check()
	if player.equipment.main == 'empty' then
		windower.add_to_chat(121,"No Weapon Equipped")
	elseif player.equipment.sub == 'empty' then
		windower.add_to_chat(121,"No Sub Equipped")
	end
end
