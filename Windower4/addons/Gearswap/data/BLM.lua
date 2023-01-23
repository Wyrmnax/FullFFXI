-- Feary's BLM LUA
-- Created - 4/11/2014
-- Last Update: 4/11/2016
-- To Do List
-- 
-- 
--
--includes
	include('include/functions.lua')
	-- Global Buffs
	include('include/status.lua')
	
-- Gear Sets 
function get_sets(spell)
--includes
	--include('include/autoexec.lua')
	include('include/binds.lua')
	include('include/utility.lua')
	include('include/macro.lua')
	
-- Get BLM gearsets
	include('Gearsets/'..player.name..'/BLM_Gearsets.lua')
	
-- Define Default Values for Variables
	Mode = 0
	PDT = 0
	MDT = 0
	Skill = 0
	MP = 0
	MB = 0
	ShadowType = 'None'
	time_start = 0
	MB_Window = 0
	Degraded = 0
	
	degrade_array = {
        ['Fire'] = {'Fire','Fire II','Fire III','Fire IV','Fire V','Fire VI'},
		['Thunder'] = {'Thunder','Thunder II','Thunder III','Thunder IV','Thunder V','Thunder VI'},
		['Aero'] = {'Aero','Aero II','Aero III','Aero IV','Aero V','Aero VI'},
		['Blizzard'] = {'Blizzard','Blizzard II','Blizzard III','Blizzard IV','Blizzard V','Blizzard VI'},
		['Water'] = {'Water','Water II','Water III','Water IV','Water V','Water VI'},
		['Stone'] = {'Stone','Stone II','Stone III','Stone IV','Stone V','Stone VI'},
        }
end 

-- Called when this job file is unloaded (eg: job change)
function file_unload()
	clear_binds()
end

-- Rules
function self_command(command)
-- Lock PDT
	if command == "MP" or command == "mp" then
		if MP >= 1 then
			MP = 0
		else 
			MP = MP + 1
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
			if new == "Resting" then
				equip(sets.Resting)
			else
				if PDT == 1 or buffactive['Weakness'] or player.hpp < 30 then
					equip(sets.idle.PDT)
				elseif MDT == 1 then
					equip(sets.idle.MDT)
				else
					if buffactive['Mana Wall'] then
						equip(sets.idle.Standard,{feet="Goetia Sabots"})
					else
						equip(sets.idle.Standard)
					end
				end
			end
		end
	elseif new == 'Engaged' then
		slot_lock()
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

function pretarget(spell)
	
end

function precast(spell,arg)
-- Job Abilities
	if spell.type == 'JobAbility' then
		if sets.precast.JA[spell.name] then
			equip(sets.precast.JA[spell.name])
		end
-- Weaponskills
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
-- Magic
	elseif spell.type:endswith('Magic') then
		-- Healing Magic 
		if spell.skill == 'Healing Magic' then
			-- Cure Casting Time
			if spell.english:wcmatch('Cure*') or spell.english:wcmatch("Curaga*") then
				equip(sets.precast.Cure)
			else
				equip(sets.precast.Fastcast)
			end
		-- Enhancing Magic
		elseif spell.skill == 'Enhancing Magic' then
			equip(sets.precast.Fastcast)
			-- Cancel Sneak
			if spell.name == 'Sneak' and buffactive.Sneak and spell.target.type == 'SELF' then
				windower.ffxi.cancel_buff(71)
				cast_delay(0.3)
			end
		-- Elemental Magic 
		elseif spell.skill == 'Elemental Magic' then
			refine_various_spells(spell, action, spellMap, eventArgs)		
			if spell.name == "Impact" or player.equipment.body == "Twilight Cloak" then
				equip(sets.precast.Elemental, {head="Empty", body="Twilight Cloak"})
			else				
				equip(sets.precast.Elemental)
			end
		-- Dark Magic 
		elseif spell.skill == 'Dark Magic' then
			if spell.name == "Stun" then
				equip(sets.midcast.Stun)
			elseif spell.name == "Death" then
				equip(sets.precast.Death)
			else
				equip(sets.precast.Fastcast)
			end		
		else
			equip(sets.precast.Fastcast)
		end
-- Ninjutsu
	elseif spell.type == 'Ninjutsu' then
			equip(sets.precast.Fastcast)
-- BardSongs
	elseif spell.type == 'BardSong' then
			equip(sets.precast.Fastcast)
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
-- Healing Magic
	if spell.skill == 'Healing Magic' then
		-- Add Light Obi Twilight Cape and Chatoyant Staff
		-- Cure Curaga Cura
		if spell.english:startswith('Cure') then
			equip(sets.midcast.Cure)
		elseif spell.english:startswith("Curaga") then
			equip(sets.midcast.Curaga)	
		elseif spell.english:startswith('Reraise') then
			equip(sets.midcast.ConserveMP)
		else
			equip(sets.midcast.Recast)
		end
-- Enhancing Magic
	elseif spell.skill == 'Enhancing Magic' then
		if spell.name == 'Phalanx' then
			equip(sets.midcast.Phalanx) 
		elseif spell.english:contains("Spikes") then
			equip(sets.midcast.INT)
		elseif spell.english:contains("Refresh") then
			equip(sets.midcast.ConserveMP)
		elseif spell.name == 'Stoneskin' then
			equip(sets.midcast.Stoneskin)
			if buffactive.Stoneskin then
				windower.ffxi.cancel_buff(36)
			end
		elseif spell.name == 'Blink' then
			equip(sets.midcast.Blink)
		elseif spell.name == 'Aquaveil' then
			equip(sets.midcast.Aquaveil)
		elseif spell.name == 'Haste' then
			equip(sets.midcast.Hastespell)
		elseif spell.english:wcmatch('Reraise*') then
			equip(sets.midcast.ConserveMP)
		else
			equip(sets.midcast.ConserveMP)
		end
-- Enfeebling Magic
	elseif spell.skill == 'Enfeebling Magic' then
		if spell.english:startswith('Dia') then
			equip(sets.midcast.Dia)
		elseif spell.english:wcmatch('Paralyze*|Slow*|Addle') then
			equip(sets.midcast.Enfeebling)
		else
			equip(sets.midcast.Macc)
		end
-- Divine Magic
	elseif spell.skill == 'Divine Magic' then
		if spell.english:startswith('Banish') then
			equip(sets.midcast.Macc)
		elseif spell.english:startswith('Holy') then
			equip(sets.midcast.Macc)
		elseif spell.name == 'Repose' then
			equip(sets.midcast.Macc)
		elseif spell.name == 'Flash' then
			equip(sets.midcast.Macc)
		end
-- Dark Magic
	elseif spell.skill == 'Dark Magic' then
		if spell.name == "Drain" then
			equip(sets.midcast.Aspir) 
		elseif spell.english:wcmatch('Aspir|Aspir II|Aspir III') then
			if Mode == 2 then
				-- Death 
				equip(sets.midcast.Aspir.Death)
			else
				equip(sets.midcast.Aspir)
			end
		elseif spell.name == "Stun" then
			equip(sets.midcast.Stun)
		elseif spell.name == "Death" then
			-- Magic Burst
			if Skill == 2 then
				equip(sets.midcast.Nuke.Death.MB)
			else
				-- Acc
				if Skill == 1 then 
					equip(sets.midcast.Nuke.Death.Acc)
				else   
					equip(sets.midcast.Nuke.Death)
				end
			end
		else
			equip(sets.midcast.Macc)
		end
-- Elemental Magic
	elseif spell.skill == 'Elemental Magic' then
		if spell.name == "Impact" or player.equipment.body == "Twilight Cloak" then
			equip(sets.midcast.Macc, {head="Empty", body="Twilight Cloak"})
		elseif spell.english:wcmatch('Frost|Drown|Rasp|Burn|Shock|Choke') then
			equip(sets.midcast.Elemental)
		else
			-- Normal Nuke
			if MB == 0 then
				if MP == 1 then					
					-- High Magic Accuracy
					if Skill == 1 then
						if spell.element == world.day_element or spell.element == world.weather_element or buffactive[elements.storm_of[spell.element]] then
							equip(sets.midcast.Nuke.Acc, {waist="Hachirin-no-Obi"})
						else
							equip(sets.midcast.Nuke.Acc,{})
						end
					else
						if spell.element == world.day_element or spell.element == world.weather_element or buffactive[elements.storm_of[spell.element]] then
							equip(sets.midcast.Nuke,{waist="Hachirin-no-Obi"})
						else
							windower.add_to_chat(121, 'Nuke NOT MB 2')
							equip(sets.midcast.Nuke,{})
						end
					end
				else
					-- High Magic Accuracy
					if Skill == 1 then
						if spell.element == world.day_element or spell.element == world.weather_element or buffactive[elements.storm_of[spell.element]] then
							equip(sets.midcast.Nuke, {waist="Hachirin-no-Obi"})
						else
							equip(sets.midcast.Nuke)
						end
					else
						if spell.element == world.day_element or spell.element == world.weather_element or buffactive[elements.storm_of[spell.element]] then
							equip(sets.midcast.Nuke,{waist="Hachirin-no-Obi"})
						else
							windower.add_to_chat(121, 'Nuke NOT MB 2')
							equip(sets.midcast.Nuke)
						end
					end
				end
			-- Magic Burst
			elseif MB == 1 then
				if MP == 1 then
					if Skill == 1 then
						if spell.element == world.day_element or spell.element == world.weather_element or buffactive[elements.storm_of[spell.element]] then
							equip(sets.midcast.Nuke.MB.Acc,{waist="Hachirin-no-Obi"})
						else
							equip(sets.midcast.Nuke.MB.Acc,{})
						end
					else
						if spell.element == world.day_element or spell.element == world.weather_element or buffactive[elements.storm_of[spell.element]] then
							equip(sets.midcast.Nuke.MB,{waist="Hachirin-no-Obi"})
						else
							windower.add_to_chat(121, 'Nuke MB')
							equip(sets.midcast.Nuke.MB,{})
						end
					end
				else
					if Skill == 1 then
						if spell.element == world.day_element or spell.element == world.weather_element or buffactive[elements.storm_of[spell.element]] then
							equip(sets.midcast.Nuke.MB.Acc,{waist="Hachirin-no-Obi"})
						else
							equip(sets.midcast.Nuke.MB.Acc)
						end
					else
						if spell.element == world.day_element or spell.element == world.weather_element or buffactive[elements.storm_of[spell.element]] then
							equip(sets.midcast.Nuke.MB,{waist="Hachirin-no-Obi"})
						else
							windower.add_to_chat(121, 'Nuke MB 2')
							equip(sets.midcast.Nuke.MB)
						end
					end
				end
			-- Death
			elseif Mode == 2 then
				if MP == 1 then
					if Skill == 1 then
						if spell.element == world.day_element or spell.element == world.weather_element or buffactive[elements.storm_of[spell.element]] then
							equip(sets.midcast.Death.Acc,{waist="Hachirin-no-Obi"})
						else
							equip(sets.midcast.Death.Acc)
						end
					elseif Skill == 2 then
						if spell.element == world.day_element or spell.element == world.weather_element or buffactive[elements.storm_of[spell.element]] then
							equip(sets.midcast.Death.MB,{waist="Hachirin-no-Obi"})
						else
							equip(sets.midcast.Death.MB)
						end
					else
						if spell.element == world.day_element or spell.element == world.weather_element or buffactive[elements.storm_of[spell.element]] then
							equip(sets.midcast.Death,{waist="Hachirin-no-Obi"})
						else
							equip(sets.midcast.Death)
						end
					end
				else
					if Skill == 1 then
						if spell.element == world.day_element or spell.element == world.weather_element or buffactive[elements.storm_of[spell.element]] then
							equip(sets.midcast.Death.Acc,{waist="Hachirin-no-Obi"})
						else
							equip(sets.midcast.Death.Acc)
						end
					elseif Skill == 2 then
						if spell.element == world.day_element or spell.element == world.weather_element or buffactive[elements.storm_of[spell.element]] then
							equip(sets.midcast.Death.MB,{waist="Hachirin-no-Obi"})
						else
							equip(sets.midcast.Death.MB)
						end
					else
						if spell.element == world.day_element or spell.element == world.weather_element or buffactive[elements.storm_of[spell.element]] then
							equip(sets.midcast.Death,{waist="Hachirin-no-Obi"})
						else
							equip(sets.midcast.Death)
						end
					end
				end
			end
		end
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
-- Songs
	elseif spell.skill == "Singing" then
		equip(sets.midcast.Macc)
	end
end -- end midcast

function aftercast(spell,arg)
	
	if Degraded == 1 then
		Degraded = 0
	elseif player.status == 'Engaged' then
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
	else
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
				-- Death Mode
				if Mode == 2 then 
					if buffactive['Mana Wall'] then
						equip(sets.idle.Death,sets.precast.JA["Manawall"])
					else
						equip(sets.idle.Death)
					end
				else
					if buffactive['Mana Wall'] then
						equip(sets.idle.Standard,sets.precast.JA["Manawall"])
					else
						equip(sets.idle.Standard)
					end
				end
			end
		end
	end
-- Sleep Timers
	if spell.name == "Sleep II" or spell.name == "Sleepga II" or spell.name == "Repose" or spell.name == "Dream Flower" then
		windower.send_command('wait 75;input /echo [ WARNING! '..spell.name..' : Will wear off within 0:15 ]')
        windower.send_command('wait 80;input /echo [ WARNING! '..spell.name..' : Will wear off within 0:10 ]')
        windower.send_command('wait 85;input /echo [ WARNING! '..spell.name..' : Will wear off within 0:05 ]')
	elseif spell.name == "Sleep" or spell.name == "Sleepga" then
		windower.send_command('wait 45;input /echo [ WARNING! '..spell.name..' : Will wear off within 0:15 ]')
        windower.send_command('wait 50;input /echo [ WARNING! '..spell.name..' : Will wear off within 0:10 ]')
        windower.send_command('wait 55;input /echo [ WARNING! '..spell.name..' : Will wear off within 0:05 ]')
	end
 -- Changes shadow type variable to allow cancel Copy Image if last cast was Utsusemi: Ni
    if spell and spell.name == 'Utsusemi: Ni' then
        ShadowType = 'Ni'
    elseif spell and spell.name == 'Utsusemi: Ichi' then
        ShadowType = 'Ichi'
	end
end

function previous_set()
	slot_lock()
	if Mode == 2 then
		equip(sets.idle.Death)
	else
		if player.status == 'Engaged'then
			equip(sets.TP)
			windower.add_to_chat(121,'TP Set')
		else
			
			windower.add_to_chat(121,'Trigger 1')
			equip(sets.idle.PDT)
			windower.add_to_chat(121,'Idle')
		end
	end
end

--SC Listener
--windower.register_event('incoming chunk', function(id, packet, data, modified, is_injected, is_blocked)
--	if id == 0x28 then
--		windower.add_to_chat(121,'Event ID ' ..id)
--	end
--end)

local skillchains = {
	[288] = {id=288,english='Light',elements={'Light','Fire','Lightning','Wind'}},
	[289] = {id=289,english='Darkness',elements={'Dark','Earth','Water','Ice'}},
	[290] = {id=290,english='Gravitation',elements={'Earth', 'Dark'}},
	[291] = {id=291,english='Fragmentation',elements={'Lightning','Wind'}},
	[292] = {id=292,english='Distortion',elements={'Ice', 'Water'}},
	[293] = {id=293,english='Fusion',elements={'Fire', 'Light'}},
	[294] = {id=294,english='Compression',elements={'Dark'}},
	[295] = {id=295,english='Liquefaction',elements={'Fire'}},
	[296] = {id=296,english='Induration',elements={'Ice'}},
	[297] = {id=297,english='Reverberation',elements={'Water'}},
	[298] = {id=298,english='Transfixion', elements={'Light'}},
	[299] = {id=299,english='Scission',elements={'Earth'}},
	[300] = {id=300,english='Detonation',elements={'Wind'}},
	[301] = {id=301,english='Impaction',elements={'Lightning'}}
}

windower.register_event('action', function(act)
	for _, target in pairs(act.targets) do
		local battle_target = windower.ffxi.get_mob_by_target("t")
		if battle_target ~= nil and target.id == battle_target.id then
			for _, action in pairs(target.actions) do
				if action.add_effect_message > 287 and action.add_effect_message < 302 then
					last_skillchain = skillchains[action.add_effect_message]
					equip(sets.midcast.Nuke.MB)
					MB = 1
					--windower.add_to_chat(121,'Last sc ' ..last_skillchain.english)
                    MB_Window = 12
					MB_Time = os.time()
				end
			end
		end
	end
end)

function refine_various_spells(spell, action, spellMap, eventArgs)

    local newSpell = spell.english
    local spell_recasts = windower.ffxi.get_spell_recasts()
    local cancelling = 'All '..spell.english..' are on cooldown. Cancelling.'

    local spell_index

    if spell_recasts[spell.recast_id] > 0 then
        if spell.name:startswith('Fire') then
            spell_index = table.find(degrade_array['Fire'],spell.name)
            if spell_index > 1 then
                newSpell = degrade_array['Fire'][spell_index - 1]
				Degraded = 1
                send_command('@input /ma '..newSpell..' '..tostring(spell.target.raw))
            end
		elseif spell.name:startswith('Thunder') then
            spell_index = table.find(degrade_array['Thunder'],spell.name)
            if spell_index > 1 then
                newSpell = degrade_array['Thunder'][spell_index - 1]
				Degraded = 1
                send_command('@input /ma '..newSpell..' '..tostring(spell.target.raw))
			end
		elseif spell.name:startswith('Blizzard') then
            spell_index = table.find(degrade_array['Blizzard'],spell.name)
            if spell_index > 1 then
                newSpell = degrade_array['Blizzard'][spell_index - 1]
				Degraded = 1
                send_command('@input /ma '..newSpell..' '..tostring(spell.target.raw))
			end
		elseif spell.name:startswith('Aero') then
            spell_index = table.find(degrade_array['Aero'],spell.name)
            if spell_index > 1 then
                newSpell = degrade_array['Aero'][spell_index - 1]
				Degraded = 1
                send_command('@input /ma '..newSpell..' '..tostring(spell.target.raw))
			end
		elseif spell.name:startswith('Stone') then
            spell_index = table.find(degrade_array['Stone'],spell.name)
            if spell_index > 1 then
                newSpell = degrade_array['Stone'][spell_index - 1]
				Degraded = 1
                send_command('@input /ma '..newSpell..' '..tostring(spell.target.raw))
        end
		elseif spell.name:startswith('Water') then
            spell_index = table.find(degrade_array['Water'],spell.name)
            if spell_index > 1 then
                newSpell = degrade_array['Water'][spell_index - 1]
				Degraded = 1
                send_command('@input /ma '..newSpell..' '..tostring(spell.target.raw))
			end
		end	
	end
end

windower.register_event('prerender', function()
	--Items we want to check every second
	if os.time() > time_start then
		time_start = os.time()
		if MB_Window > 0 then
			MB_Window = 10 - (os.time() - MB_Time)
        else
			if MB == 1 then
				MB = 0
				previous_set()
			end
		end
	end
end)

function slot_lock()					
    if player.equipment.left_ear == 'Reraise Earring' then
        disable('left_ear')
        windower.add_to_chat(8,'Reraise Earring equipped on left ear')
    elseif player.equipment.right_ear == 'Reraise Earring' then
        disable('right_ear')
        windower.add_to_chat(8,'Reraise Earring equipped on right ear')
	else
        enable('left_ear','right_ear')
    end
	
	if player.equipment.left_ring == "Warp Ring" then
		disable('left_ring')
        windower.add_to_chat(8,'Warp Ring equipped on left ring')
	elseif player.equipment.right_ring == "Warp Ring" then
		disable('right_ring')
        windower.add_to_chat(8,'Warp Ring equipped on right ring')
	else
		enable('left_ring','right_ring')
	end
	
	if player.equipment.back == "Mecistopins Mantle" or player.equipment.back == "Aptitude Mantle" then
		disable('back')
        windower.add_to_chat(8,'Capacity Back equipped')
	else
		enable('back')
	end
end
