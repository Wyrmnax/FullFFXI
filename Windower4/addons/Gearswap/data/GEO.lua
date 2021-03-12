-- Feary's GEO LUA
-- Created - 3/11/2016
-- Last Update - 4/16/2016
-- To do list
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
	
-- Get RDM gearsets
	include('Gearsets/'..player.name..'/Geo_Gearsets.lua')
	
-- Define Default Values for Variables
	Mode = 0
	PDT = 0
	MDT = 0
	Skill = 0
	MB = 0
	idle = 1
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
			if Mode >= 1 then
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
					else
						windower.add_to_chat(121,'Nuke Mode')
					end
				-- MB
				elseif Mode == 1 then 
					if Skill == 1 then
						windower.add_to_chat(121,'MB.Acc Mode')
					else
						windower.add_to_chat(121,'MB Mode')
					end
				end
				equip(sets.idle.Standard)
			end
		end
	elseif command == 'skill' or command == "acc" or command == "Skill" then
		if Skill >=1 then
			-- Reset to 0
			Skill = 0
		else
			-- Increment by 1
			Skill = Skill + 1
		end
	end
end

function status_change(new,old)
-- Auto set
    if T{'Idle','Resting'}:contains(new) then
		slot_lock()
		if new == "Resting" then
			equip(sets.Resting)
		else
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
	if spell.type == 'Geomancy' then
		if spell.english:startswith('Indi') then
			if spell.target.type == "SELF" then
				-- Default to me
				change_target("<me>")
			end
		elseif spell.english:startswith('Geo') then
			if spell.target.type == "SELF, PARTY" then
				change_target("<stpc>")
			elseif spell.target.type == "MONSTER" then
				change_target("<stnpc>")
			end
		end
	end
end

function precast(spell,arg)
-- Job Abilities
	if spell.type == 'JobAbility' then
		if sets.precast.JA[spell.name] then
			equip(sets.precast.JA[spell.name])
		end
		if spell.name == "Mending Halation" then
			windower.send_command("wait 3;input /p Casting %Spell - HP Return in 3 secs. Gather together!")
		elseif spell.name == "Radial Arcana" then
			windower.send_command("wait 3;input /p Casting %Spell - HP Return in 3 secs. Gather together!")
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
	elseif spell.type == 'Geomancy' then
		if pet.isvalid and spell.name:startswith('Geo') then
			cancel_spell()
			windower.send_command('wait 1;Full Cicle;wait 1;'..spell.name)
		else
			if Fastcast.Staff[spell.element] and (player.inventory[Fastcast.Staff[spell.element]] or player.wardrobe[Fastcast.Staff[spell.element]] or player.wardrobe2[Fastcast.Staff[spell.element]]) then
				equip(sets.precast.Fastcast, {main=Fastcast.Staff[spell.element]})
			else
				equip(sets.precast.Fastcast)
			end
		end		
-- Magic
	elseif spell.type:endswith('Magic') then
		if spell.skill == 'Healing Magic' then
			-- Cure casting time
			if spell.english:wcmatch('Cure*') or spell.english:wcmatch("Curaga*") then
				equip(sets.precast.Cure)
			else
				equip(sets.precast.Fastcast)
			end
		elseif spell.skill == 'Enhancing Magic' then
			if Fastcast.Staff[spell.element] and (player.inventory[Fastcast.Staff[spell.element]] or player.wardrobe[Fastcast.Staff[spell.element]] or player.wardrobe2[Fastcast.Staff[spell.element]]) then
				equip(sets.precast.Enhancing, {main=Fastcast.Staff[spell.element]})
			else
				equip(sets.precast.Enhancing)
			end
			-- Cancel Sneak
			if spell.name == 'Sneak' and buffactive.Sneak and spell.target.type == 'SELF' then
				windower.ffxi.cancel_buff(71)
				cast_delay(0.3)
			end
		elseif spell.skill == "Elemental Magic" then
			-- Impact
			if spell.name == "Impact" or player.equipment.body == "Twilight Cloak" then
				if Fastcast.Staff[spell.element] and (player.inventory[Fastcast.Staff[spell.element]] or player.wardrobe[Fastcast.Staff[spell.element]] or player.wardrobe2[Fastcast.Staff[spell.element]]) then
					equip(sets.precast.Fastcast, {main=Fastcast.Staff[spell.element],head="Empty", body="Twilight Cloak"})
				else
					equip(sets.precast.Elemental, {head="Empty", body="Twilight Cloak"})
				end				
			else
				if Fastcast.Staff[spell.element] and (player.inventory[Fastcast.Staff[spell.element]] or player.wardrobe[Fastcast.Staff[spell.element]] or player.wardrobe2[Fastcast.Staff[spell.element]]) then
					equip(sets.precast.Fastcast, {main=Fastcast.Staff[spell.element]})
				else
					equip(sets.precast.Elemental)
				end
			end
		elseif spell.skill == 'Dark Magic' then
			if spell.name == "Stun" then
				equip(sets.midcast.Stun)
			else
				if Fastcast.Staff[spell.element] and (player.inventory[Fastcast.Staff[spell.element]] or player.wardrobe[Fastcast.Staff[spell.element]] or player.wardrobe2[Fastcast.Staff[spell.element]]) then
					equip(sets.precast.Fastcast, {main=Fastcast.Staff[spell.element]})
				else
					equip(sets.precast.Fastcast)
				end
			end	
		-- All Other Magic
		else
			if Fastcast.Staff[spell.element] and (player.inventory[Fastcast.Staff[spell.element]] or player.wardrobe[Fastcast.Staff[spell.element]] or player.wardrobe2[Fastcast.Staff[spell.element]]) then
				equip(sets.precast.Fastcast, {main=Fastcast.Staff[spell.element]})
			else
				equip(sets.precast.Fastcast)
			end
		end
-- Ninjutsu
	elseif spell.type == 'Ninjutsu' then
		if Fastcast.Staff[spell.element] and (player.inventory[Fastcast.Staff[spell.element]] or player.wardrobe[Fastcast.Staff[spell.element]] or player.wardrobe2[Fastcast.Staff[spell.element]]) then
			equip(sets.precast.Fastcast, {main=Fastcast.Staff[spell.element]})
		else
			equip(sets.precast.Fastcast)
		end
-- BardSongs
	elseif spell.type == 'BardSong' then
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
-- Geomancy
	if spell.skill == 'Geomancy' or spell.skill == 'Handbell' then
		if buffactive["Lasting Emanation"] then
		
		end
		if buffactive["Ecliptic Attriction"] then
		
		end
		if buffactive["Collimated Fervor"] then
		
		end
		if buffactive["Dematerilize"] then
		
		end
		if buffactive["Bolster"] then
		
		end
		if spell.english:wcmatch('Indi*') then
			equip(sets.midcast.Geomancy.Indi)
			if spell.target.type == "SELF" then
				windower.add_to_chat(121,"===== Self AOE =====")
			end
		elseif spell.english:wcmatch('Geo*') then
			equip(sets.midcast.Geomancy)
			if spell.target.type == "SELF, PlAYER" then
				windower.add_to_chat(121,"Cast %Spell on a Party Member to make Loupon")
			elseif spell.target.type == "MONSTER" then
				windower.add_to_chat(121,"Cast %Spell.Name on a Mob to make Loupon")
			end
		end
-- Healing Magic
	elseif spell.skill == 'Healing Magic' then
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
		equip(sets.midcast.Macc)
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
		elseif spell.name == "Aspir" then
			equip(sets.midcast.Aspir)
		elseif spell.name == "Stun" then
			equip(sets.midcast.Stun)
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
				if Skill == 1 then
					if (spell.element == world.day_element or spell.element == world.weather_element) or buffactive[elements.storm_of[spell.element]] then
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
			-- Magic Burst
			elseif Mode == 1 then
				if Skill == 1 then
					if spell.element == world.day_element or spell.element == world.weather_element or buffactive[elements.storm_of[spell.element]] then
						equip(sets.midcast.Nuke.MB.Acc,{lring="Zodiac Ring", waist="Hachirin-no-Obi"})
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
			else
			
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
	
	if spell.interuppeted then
		aftercast()
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
				if Pet == 1 then 
					equip(sets.idle.Standard.Pet)
				else
					equip(sets.idle.Standard)
				end
			end
		end
	end
-- Timers
	if spell.name == "Sleep II" or spell.name == "Sleepga II" or spell.name == "Repose" then
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
	  windower.send_command('wait 2;input /ma "Cure *IV" me')
	end
-- Changes shadow type variable to allow cancel Copy Image if last cast was Utsusemi: Ni
    if spell and spell.name == 'Utsusemi: Ni' then
        ShadowType = 'Ni'
    elseif spell and spell.name == 'Utsusemi: Ichi' then
        ShadowType = 'Ichi'
	end
	-- Add to chat 
	if spell.type == "JobAbility" then
		if spell.name == "Full Circle" then
			windower.add_to_chat(121, 'Releasing Loupan - Returned some MP')
		elseif spell.name == "Lasting Emanation" then
			windower.add_to_chat(121,'%Spell.Name - Decreases HP consumed')
			windower.send_command('wait 120;input [%Spell.Name]/[Ecliptic Attrition]  Ready in 3 Minutes')
			windower.send_command('wait 240;input /echo [%Spell.Name]/[Ecliptic Attrition]  Ready in 1 Minutes')
			windower.send_command('wait 300;input /echo [%Spell.Name]/[Ecliptic Attrition]  Ready!')
		elseif spell.name == "Ecliptic Attraction" then
			windower.add_to_chat(121,'%Spell.Name - Loupon Potency +25%')
			windower.send_command('wait 120;input [%Spell.Name]/[Lasting Emanation]  Ready in 3 Minutes')
			windower.send_command('wait 240;input /echo [%Spell.Name]/[Lasting Emanation]  Ready in 1 Minutes')
			windower.send_command('wait 300;input /echo [%Spell.Name]/[Lasting Emanation] Ready!')
		elseif spell.name == "Collimated Fervor" then
			windower.add_to_chat(121,'%Spell.Name - Enhances Nukes by Direction Job trait')
		elseif spell.name == "Life Cycle" then
			windower.add_to_chat(121,'%Spell.Name - Distributes one fourth of your HP to heal your luopan.')
		elseif spell.name == "Blaze of Glory" then
			windower.add_to_chat(121,'%Spell.Name - Loupon Potency +50%')
		elseif spell.name == "Dematerialize" then
			windower.add_to_chat(121,'Loupon DT')
		elseif spell.name == "Theurgic Focus" then
			windower.add_to_chat(121,"%Spell.Name - Increases next Nuke by +50 MAB")
		elseif spell.name == "Concetric Pulse" then
			windower.add_to_chat(121,"%Spell.Name - Dismiss Loupon and Deals Damage")
		elseif spell.name == "Mending Halation" then
			windower.send_command("wait 3;input /p Casting %Spell.Name - HP Return in 3 secs. Gather together!")
			windower.send_command("wait 120;input /echo [%Spell.Name] Ready in 3 Minutes")
			windower.send_command("wait 240;input /echo [%Spell.Name] Ready in 1 Minutes")
			windower.send_command("wait 300;input /echo [%Spell.Name] Ready!")
		elseif spell.name == "Radial Arcana" then
			windower.send_command("wait 3;input /p Casting %Spell.Name - HP Return in 3 secs. Gather together!")
			windower.send_command("wait 120;input /echo [%Spell.Name] Ready in 3 Minutes")
			windower.send_command("wait 240;input /echo [%Spell.Name] Ready in 1 Minutes")
			windower.send_command("wait 300;input /echo [%Spell.Name] Ready!")
		end
	end
end

function previous_set()
	slot_lock()
	if Skill == 0 then
		equip(sets.TP)
		windower.add_to_chat(121,'TP Set')
	elseif Skill == 1 then
		equip(sets.TP.Acc)
		windower.add_to_chat(121,'Acc TP Set')
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
