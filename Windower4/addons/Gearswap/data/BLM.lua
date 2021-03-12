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
	ShadowType = 'None'
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
-- Lock MDT
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
-- Reset	
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
				windower.add_to_chat(121,'PDT/MDT Set UnLocked')
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
				-- Nuke
				if Mode == 0 then
					if Skill == 1 then
						windower.add_to_chat(121,'Nuke.Acc')
						equip(sets.idle.Standard)
					else
						windower.add_to_chat(121,'Nuke Mode')
						equip(sets.idle.Standard)
					end
				-- MB
				elseif Mode == 1 then 
					if Skill == 1 then
						windower.add_to_chat(121,'MB.Acc Mode')
						equip(sets.idle.Standard)
					else
						windower.add_to_chat(121,'MB Mode')
						equip(sets.idle.Standard)
					end
				-- Death
				elseif Mode == 2 then
					if Skill == 2 then
						windower.add_to_chat(121,'Death MB Mode')
						equip(sets.idle.Death)
					elseif Skill == 1 then
						windower.add_to_chat(121,'Death Acc Mode')
						equip(sets.idle.Death)
					else
						windower.add_to_chat(121,'Death Mode')
						equip(sets.idle.Death)
					end
				end
			end
		end
	elseif command == 'skill' or command == "acc" or command == "Skill" then
		-- Death Mode 
		if Mode == 2 then
			if Skill >=2 then
				--Reset to 0
				Skill = 0
			else
				-- Increment by 1
				Skill = Skill + 1
			end
		-- Nuke or Magic Burst Mode.
		else
			if Skill >=1 then
				-- Reset to 0
				Skill = 0
			else
				-- Increment by 1
				Skill = Skill + 1
			end
		end
	elseif command == "MP" or command == "mp" then
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
			if spell.name == "Stoneskin" then 
				-- Magian Staff
				if Fastcast.Staff[spell.element] and (player.inventory[Fastcast.Staff[spell.element]] or player.wardrobe[Fastcast.Staff[spell.element]] or player.wardrobe2[Fastcast.Staff[spell.element]]) then
					equip(sets.precast.Stoneskin, {main=Fastcast.Staff[spell.element]})
				else
					equip(sets.precast.Stoneskin)
				end
			else
				if Fastcast.Staff[spell.element] and (player.inventory[Fastcast.Staff[spell.element]] or player.wardrobe[Fastcast.Staff[spell.element]] or player.wardrobe2[Fastcast.Staff[spell.element]]) then
					equip(sets.precast.Enhancing, {main=Fastcast.Staff[spell.element]})
				else
					equip(sets.precast.Enhancing)
				end
			end
			-- Cancel Sneak
			if spell.name == 'Sneak' and buffactive.Sneak and spell.target.type == 'SELF' then
				windower.ffxi.cancel_buff(71)
				cast_delay(0.3)
			end
		-- Elemental Magic 
		elseif spell.skill == 'Elemental Magic' then
			if spell.name == "Impact" or player.equipment.body == "Twilight Cloak" then
				equip(sets.precast.Elemental, {head="Empty", body="Twilight Cloak"})
			else
				-- Magian Staff
				if Fastcast.Staff[spell.element] and (player.inventory[Fastcast.Staff[spell.element]] or player.wardrobe[Fastcast.Staff[spell.element]] or player.wardrobe2[Fastcast.Staff[spell.element]]) then
					equip(sets.precast.Elemental, {main=Fastcast.Staff[spell.element]})
				else
					equip(sets.precast.Elemental)
				end
			end
		-- Dark Magic 
		elseif spell.skill == 'Dark Magic' then
			if spell.name == "Stun" then
				equip(sets.midcast.Stun)
			elseif spell.name == "Death" then
				equip(sets.precast.Death)
			else
				if Fastcast.Staff[spell.element] and (player.inventory[Fastcast.Staff[spell.element]] or player.wardrobe[Fastcast.Staff[spell.element]] or player.wardrobe2[Fastcast.Staff[spell.element]]) then
					equip(sets.precast.Fastcast, {main=Fastcast.Staff[spell.element]})
				else
					equip(sets.precast.Fastcast)
				end
			end		
		else
			-- Magian Staff
			if Fastcast.Staff[spell.element] and (player.inventory[Fastcast.Staff[spell.element]] or player.wardrobe[Fastcast.Staff[spell.element]] or player.wardrobe2[Fastcast.Staff[spell.element]]) then
				equip(sets.precast.Fastcast, {main=Fastcast.Staff[spell.element]})
			else
				equip(sets.precast.Fastcast)
			end	
		end
-- Ninjutsu
	elseif spell.type == 'Ninjutsu' then
		-- Magian Staff
			if Fastcast.Staff[spell.element] and (player.inventory[Fastcast.Staff[spell.element]] or player.wardrobe[Fastcast.Staff[spell.element]] or player.wardrobe2[Fastcast.Staff[spell.element]]) then
				equip(sets.precast.Fastcast, {main=Fastcast.Staff[spell.element]})
			else
				equip(sets.precast.Fastcast)
			end
-- BardSongs
	elseif spell.type == 'BardSong' then
		-- Magian Staff
			if Fastcast.Staff[spell.element] and (player.inventory[Fastcast.Staff[spell.element]] or player.wardrobe[Fastcast.Staff[spell.element]] or player.wardrobe2[Fastcast.Staff[spell.element]]) then
				equip(sets.precast.Fastcast, {main=Fastcast.Staff[spell.element]})
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
			if Mode == 0 then
				if MP == 1 then
					-- High Magic Accuracy
					if Skill == 1 then
						if spell.element == world.day_element or spell.element == world.weather_element or buffactive[elements.storm_of[spell.element]] then
							equip(sets.midcast.Nuke.Acc, {body="Spaekona's Coat", lring="Zodiac Ring", waist="Hachirin-no-Obi", back="Twilight Cape"})
						else
							equip(sets.midcast.Nuke.Acc,{body="Spaekona's Coat"})
						end
					else
						if spell.element == world.day_element or spell.element == world.weather_element or buffactive[elements.storm_of[spell.element]] then
							equip(sets.midcast.Nuke,{body="Spaekona's Coat", lring="Zodiac Ring", waist="Hachirin-no-Obi", back="Twilight Cape"})
						else
							equip(sets.midcast.Nuke,{body="Spaekona's Coat"})
						end
					end
				else
					-- High Magic Accuracy
					if Skill == 1 then
						if spell.element == world.day_element or spell.element == world.weather_element or buffactive[elements.storm_of[spell.element]] then
							equip(sets.midcast.Nuke.Acc, {lring="Zodiac Ring", waist="Hachirin-no-Obi", back="Twilight Cape"})
						else
							equip(sets.midcast.Nuke.Acc)
						end
					else
						if spell.element == world.day_element or spell.element == world.weather_element or buffactive[elements.storm_of[spell.element]] then
							equip(sets.midcast.Nuke,{lring="Zodiac Ring", waist="Hachirin-no-Obi", back="Twilight Cape"})
						else
							equip(sets.midcast.Nuke)
						end
					end
				end
			-- Magic Burst
			elseif Mode == 1 then
				if MP == 1 then
					if Skill == 1 then
						if spell.element == world.day_element or spell.element == world.weather_element or buffactive[elements.storm_of[spell.element]] then
							equip(sets.midcast.Nuke.MB.Acc,{body="Spaekona Coat", waist="Hachirin-no-Obi"})
						else
							equip(sets.midcast.Nuke.MB.Acc,{body="Spaekona Coat"})
						end
					else
						if spell.element == world.day_element or spell.element == world.weather_element or buffactive[elements.storm_of[spell.element]] then
							equip(sets.midcast.Nuke.MB,{body="Spaekona Coat", waist="Hachirin-no-Obi"})
						else
							equip(sets.midcast.Nuke.MB,{body="Spaekona Coat"})
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
	if player.status == 'Engaged' then
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
-- Convert
	if spell.name == 'Convert' then
	  windower.send_command('wait 2;input /ma "Cure IV" me')
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
		if Skill == 0 then
			equip(sets.TP)
			windower.add_to_chat(121,'TP Set')
		elseif Skill >= 1 then
			equip(sets.TP.Acc)
			windower.add_to_chat(121,'Acc TP Set')
		end
	end
end

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
