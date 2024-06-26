-- Feary's BRD LUA
-- Created: 1/18/2014
-- Updated: 6/4/2014
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
	
	-- Get BRD gearsets
	include('Gearsets/'..player.name..'/BRD_Gearsets.lua')
	
-- Define Default Values for Variables
	Mode = 'Evisceration'
	ModeWeapon = sets.Evisceration
	PDT = 0
	MDT = 0
	ShadowType = 'None'
	Gjallarhorn = 1
end 

-- Called when this job file is unloaded (eg: job change)
function file_unload()
	clear_binds()
end

function pretarget(spell)
	if spell.type == 'BardSong' then
		if buffactive.Pianissimo then
			--Default to stpc
			change_target("<stpc>")
		elseif buffactive.Tenuto then
			-- Default to me
			change_target("<me>")
		else
			if spell.target.type == "SELF" then
				-- Default to me
				change_target("<me>")
			else
				change_target("<stnpc>")
			end
		end
	end
end

function self_command(command)
-- Lock PDT
	if command == 'PDT' then
		if PDT == 1 then
			-- make sure other values are set to default
			-- Unlock PDT/MDT Variables
			PDT = 0
			-- Place Me in my previous set.
			previous_set()
			windower.add_to_chat(121,'PDT Set UnLocked')
		else
		-- Make sure other values are set to default
			-- Set PDT set and equip it
				PDT = 1
				previous_set()
				windower.add_to_chat(121,'PDT Set Locked')
		end		
	elseif command == 'Mode' then
		if Mode == 'Evisceration' then
			Mode = 'SavageBlade'
			windower.send_command('autows use Savage Blade')
			ModeWeapon = sets.SavageBlade			
				previous_set()		
			windower.add_to_chat(121,'Mode Savage Blade')
		elseif Mode == 'SavageBlade' then
			Mode = 'Rudra'
			windower.send_command("autows use Rudra's Storm")
			ModeWeapon = sets.Rudra			
				previous_set()	
			windower.add_to_chat(121,'Mode Rudra Storm')
		elseif Mode == 'Rudra' then
			Mode = 'AccSB'
			windower.send_command('autows use Savage Blade')
			ModeWeapon = sets.AccSB
				previous_set()
			windower.add_to_chat(121,'Mode ACC Savage Blade')
		elseif Mode == 'AccSB' then
			Mode = 'AccRudra'
			windower.send_command("autows use Rudra's Storm")
			ModeWeapon = sets.AccRudra
				previous_set()
			windower.add_to_chat(121,'Mode ACC Rudra Storm')		
		elseif Mode == 'AccRudra' then
			Mode = 'Mordant'
			windower.send_command('autows use Mordant Rime')
			ModeWeapon = sets.Mordant
				previous_set()
			windower.add_to_chat(121,'Mode Mordant Rime')
		elseif Mode == 'Mordant' then
			Mode = 'Evisceration'
			windower.send_command("autows use Evisceration")
			ModeWeapon = sets.Evisceration
				previous_set()
			windower.add_to_chat(121,'Mode Evisceration')
		end	
		
	elseif command == 'ModeX' then
		if Mode == 'Evisceration' then
			Mode = 'Mordant'
			windower.send_command('autows use Mordant Rime')
			ModeWeapon = sets.Mordant			
				previous_set()		
			windower.add_to_chat(121,'Mode Mordant Rime')
		elseif Mode == 'SavageBlade' then
			Mode = 'Evisceration'
			windower.send_command('autows use Evisceration')
			ModeWeapon = sets.Evisceration			
				previous_set()		
			windower.add_to_chat(121,'Mode Evisceration')
		elseif Mode == 'Rudra' then
			Mode = 'SavageBlade'
			windower.send_command('autows use Savage Blade')
			ModeWeapon = sets.SavageBlade
				previous_set()
			windower.add_to_chat(121,'Mode Savage Blade')
		elseif Mode == 'AccSB' then
			Mode = 'Rudra'
			windower.send_command("autows use Rudra's Storm")
			ModeWeapon = sets.Rudra
				previous_set()
			windower.add_to_chat(121,'Mode Rudra Storm')
		elseif Mode == 'AccRudra' then
			Mode = 'AccSB'
			windower.send_command('autows use Savage Blade')
			ModeWeapon = sets.AccSB			
				previous_set()		
			windower.add_to_chat(121,'Mode ACC Savage Blade')		
		elseif Mode == 'Mordant' then
			Mode = 'AccRudra'
			windower.send_command("autows use Rudra's Storm")
			ModeWeapon = sets.AccRudra
				previous_set()
			windower.add_to_chat(121,'Mode ACC Rudra Storm')
		end	
	end
end


function status_change(new,old)
-- Auto set
	if T{'Idle'}:contains(new) then
		slot_lock()
		if areas.Town:contains(world.zone) then
			windower.add_to_chat(121, "Town Gear")
			equip(sets.misc.Town)
		else
			previous_set()
		end
	else
		previous_set()
    end
end


function precast(spell,arg)
	windower.add_to_chat(121, spell.type)
-- Job Abilities
	if spell.type == 'JobAbility' then
		if sets.precast.JA[spell.name] then
			equip(sets.precast.JA[spell.name])
		end
-- Weaponskills
	elseif spell.type == "WeaponSkill" then
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
		if spell.skill == "Healing Magic" then
			-- Cure casting time
			if spell.english:wcmatch('Cure*') or spell.english:wcmatch("Curaga*") then
				--windower.add_to_chat(121, "Cure")
				equip(sets.precast.Cure)
			else
				equip(sets.precast.Fastcast)
			end
		elseif spell.skill == "Enhancing Magic" then
			if spell.name == "Stoneskin" then
				equip(sets.precast.Stoneskin)
			else 
				equip(sets.precast.Enhancing)
			end
			-- Cancel Sneak
			if spell.name == 'Sneak' and buffactive.Sneak and spell.target.type == 'SELF' then
				windower.ffxi.cancel_buff(71)
				cast_delay(0.3)
			end	
		else
			equip(sets.precast.Fastcast)
		end
-- Ninjutsu
	elseif spell.type == 'Ninjutsu' then
		-- Magian Staff
			if Fastcast.Staff[spell.element] and (player.inventory[Fastcast.Staff[spell.element]] or player.wardrobe[Fastcast.Staff[spell.element]] or player.wardrobe2[Fastcast.Staff[spell.element]]) then
				equip(sets.precast.Fastcast, {main=Fastcast.Staff[spell.element]})
			else
				equip(sets.precast.Fastcast)
			end	
-- Bard Songs
	elseif spell.type == 'BardSong' then
			if spell.name == "Honor March" then
				equip(sets.precast.Song, honormarch)			
			-- Dummy Songs
			elseif spell.name == "Fowl Aubade" then
				equip(sets.precast.Song, dummy)
			-- 4th Song
			elseif spell.name == "Herb Pastoral" then
				equip(sets.precast.Song, dummy)
			else
				equip(sets.precast.Song, defaultinstrument)
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
		-- Cure Curaga
		if spell.english:startswith('Cure') then
			-- Elemental Obi
			if (spell.element == world.day_element) or (spell.element == world.weather_element) or (spell.element == buffactive[elements.storm_of[spell.element]]) and player.inventory[elemental.Obi[spell.element]] then
				equip(sets.midcast.Cure, {waist=elemental.Obi[spell.element], back="Twilight Cape"})
			else
				equip(sets.midcast.Cure)
			end
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
			equip(sets.midcast.enfeebling)
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
		
-- Elemental Magic
	elseif spell.skill == 'Elemental Magic' then
		
-- Ninjutsu
	elseif spell.skill == 'Ninjutsu' then
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
	elseif spell.skill == "Singing" or spell.skill == "Stringed Instrument" or spell.skill == "Wind Instrument" then
		if spell.name == "Honor March" then
			equip(sets.midcast.Buffsong)
		-- Dummy Songs
		elseif spell.name == "Fowl Aubade" then
			equip(sets.idle.PDT, dummy)
			
		elseif spell.name == "Herb Pastoral" then
			equip(sets.idle.PDT, dummy)
			
		elseif string.find(spell.english,'Scherzo') then
			equip(sets.midcast.Skillsong, scherzo)
		elseif string.find(spell.english,'Ballad') then
			equip(sets.midcast.Buffsong,ballad)
		elseif string.find(spell.english,'Minuet') then
			equip(sets.midcast.Buffsong,minuet)
		elseif string.find(spell.english,'March') then
			equip(sets.midcast.Buffsong,march)
		elseif string.find(spell.english,'Madrigal') then
			equip(sets.midcast.Buffsong,madrigal)
		elseif string.find(spell.english,'Mazurka') then
			equip(sets.midcast.Buffsong,mazurka)
		elseif string.find(spell.english,'Lullaby') then
			equip(sets.midcast.Skillsong,lullaby)							
		elseif string.find(spell.english,'Horde') then
			equip(sets.midcast.Skillsong,horde)	
		else
			equip(sets.midcast.Buffsong,defaultinstrument)
		end
	end
end 


function aftercast(spell,arg)
-- Autoset	
	previous_set()
-- Lullaby
	if spell.name == "Foe Lullaby II" or spell.name == "Horde Lullaby II" then
		windower.send_command('wait 75;input /echo [ WARNING! Lullaby II : Will wear off within 0:15 ]')
        windower.send_command('wait 80;input /echo [ WARNING! Lullaby II : Will wear off within 0:10 ]')
        windower.send_command('wait 85;input /echo [ WARNING! Lullaby II : Will wear off within 0:05 ]')
	elseif spell.name == "Foe Lullaby" or spell.name == "Horde Lullaby" then
		windower.send_command('wait 45;input /echo [ WARNING! Lullaby : Will wear off within 0:15 ]')
        windower.send_command('wait 50;input /echo [ WARNING! Lullaby : Will wear off within 0:10 ]')
        windower.send_command('wait 55;input /echo [ WARNING! Lullaby : Will wear off within 0:05 ]')
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
	if player.status == 'Engaged' then
		if PDT == 0 then
			equip(ModeWeapon, sets.TP)
			windower.add_to_chat(121,'Tp Set ' ..Mode)
		else 
			equip(ModeWeapon, sets.idle.PDT)
			windower.add_to_chat(121,'PDT Set Locked')
		end
	else 
		equip(ModeWeapon, sets.idle.Standard)
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
