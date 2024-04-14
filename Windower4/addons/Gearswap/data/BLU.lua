-- Feary BLU Lua
-- Created: 4/26/2014
-- Last Updated: 4/26/2014
-- To Do List:
-- Configure Spells Sets - Adds spells
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
	--include('include/macro.lua')
	
-- Get BLU gearsets
	include('Gearsets/'..player.name..'/BLU_Gearsets.lua')
	
-- Define Default Values for Variables
	
	windower.send_command('autows use Expiacion')			
	windower.send_command('autows keepam')
	ModeWeapon = sets.mainweapon.Melee
	Mode = 'Melee'
	Type = 0
	ShadowType = 'None'
	
	-- Maps Blue Mage spell Stats per spell for the midcast function, can expand mapping as needed
	-- Options - STR, STRAcc, VIT, AGI, MND, CurePot, Nuke, Macc, Recast
    bluSpellStats = T{
				-- STR
				["Amorphic Spikes"]="STR", ["Bloodrake"]="STR", ["Disseverment"]="STR", ["Glutinous Dart"]="STR", ["Goblin Rush"]="STR",
                ["Paralyzing Triad"]="STR", ["Ram Charge"]="STR", ["Vanity Dive"]="STR", ["Vertical Cleave"]="STR", ["Whirl of Rage"]="STR",
				["Empty Thrash"]="STR",
				-- STR/Acc
				["Heavy Strike"]="STRAcc",
				-- STR/VIT
                ["Cannonball"]="VIT", ["Delta Thrust"]="VIT", ["Quad. Continuum"]="VIT", ["Sinker Drill"]="VIT",
                -- AGI
				["Benthic Typhoon"]="AGI", ["Final Sting"]="AGI", ["Spiral Spin"]="AGI",
				-- MND
                ["Magic Hammer"]="MND", ["Mind Blast"]="MND",
				-- Nukes
				["Subduction"]="Nuke",["Entomb"]="Nuke",["Silent Storm"]="Nuke",["Anvil Lightning"]="Nuke",
				["Scouring Spate"]="Nuke",["Spectral Floe"]="Nuke",["Searing Tempest"]="Nuke",
				-- Nukes Dark
				["Tenebral Crush"]="NukeDark"}
    bluSpells = T{
				-- Recast
				["Animating Wail"]="Recast", ["Battery Charge"]="Recast", ["Cocoon"]="Recast", ["Nat. Meditation"]="Recast", 
				["Winds of Promy."]="Recast", ["Erratic Flutter"]="Recast",
                -- CurePot
				["Magic Fruit"]="CurePot", ["Plenilune Embrace"]="CurePot",
				-- White Wind
				["White Wind"]="WW",
				-- Macc/Additional Effects
                ["Sudden Lunge"]="Macc", ["Head Butt"]="Macc", ["Absolute Terror"]="Macc", ["Dream Flower"]="Macc"}
end 
-- Called when this job file is unloaded (eg: job change)
function file_unload()
	clear_binds()
end

-- Rules
function self_command(command)
-- Lock PDT
	if command == 'Mode' then
		if Mode == 'Melee' then
			Mode = 'Melagic'
			windower.send_command('autows use Expiacion')			
			windower.send_command('autows keepam')
			ModeWeapon = sets.mainweapon.Melagic			
				previous_set()		
			windower.add_to_chat(121,'Mode Melagic')
		elseif Mode == 'Melagic' then
			Mode = 'Magic'
			windower.send_command('autows use Black Halo')					
			windower.send_command('autows noam')
			ModeWeapon = sets.mainweapon.Magic			
				previous_set()		
			windower.add_to_chat(121,'Mode Magic')
		elseif Mode == 'Magic' then
			Mode = 'Melee'
			windower.send_command('autows use Expiacion')			
			windower.send_command('autows keepam')
			ModeWeapon = sets.mainweapon.Melee
				previous_set()
			windower.add_to_chat(121,'Mode Melee')
		end	
	elseif command == 'ModeX' then
		if Mode == 'Melee' then
			Mode = 'Magic'
			windower.send_command('autows use Black Halo')			
			windower.send_command('autows noam')
			ModeWeapon = sets.mainweapon.Magic			
				previous_set()		
			windower.add_to_chat(121,'Mode Magic')
		elseif Mode == 'Magic' then
			Mode = 'Melagic'
			windower.send_command('autows use Expiacion')			
			windower.send_command('autows keepam')
			ModeWeapon = sets.mainweapon.Melagic			
				previous_set()		
			windower.add_to_chat(121,'Mode Melagic')
		elseif Mode == 'Melagic' then
			Mode = 'Melee'
			windower.send_command('autows use Expiacion')			
			windower.send_command('autows keepam')
			ModeWeapon = sets.mainweapon.Melee
				previous_set()
			windower.add_to_chat(121,'Mode Melee')
		end	
	end
end

function status_change(new,old)
-- Auto set
    previous_set()
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
		-- Blue Magic 
		if spell.skill:startswith("Blue") then
			equip(sets.precast.BlueMagic)
		-- Healing Magic
		elseif spell.skill:startswith("Healing") then
			-- Cure casting time
			if spell.english:wcmatch('Cure*') or spell.english:wcmatch("Curaga*") then
				equip(sets.precast.Cure)
			else
				equip(sets.precast.Fastcast)
			end
		-- Enhancing Magic 
		elseif spell.skill:startswith("Enhancing") then
			equip(sets.precast.Fastcast)
			-- Cancel Sneak
			if spell.name == 'Sneak' and buffactive.Sneak and spell.target.type == 'SELF' then
				windower.ffxi.cancel_buff(71)
				cast_delay(0.3)
			end
		elseif spell.skill:startswith('Elemental') then
			equip(sets.precast.Fastcast)
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
-- BlueMagic
	if spell.skill == 'Blue Magic' then
		if spell.name == "White Wind" and spell.targets == "SELF" then
			equip(sets.midcast.BlueMagic.WW.Self)
		
		elseif bluSpellStats[spell.english] then
			equip(sets.midcast.BlueMagic[bluSpellStats[spell.english]])
			if buffactive['Chain Affinity'] then
				equip(sets.precast.JA['Chain Affinity'])
			end
			if buffactive.Efflux then
				equip(sets.precast.JA['Effux'])
			end
		elseif bluSpells[spell.english] then
			equip(sets.midcast.BlueMagic[bluSpells[spell.english]])
        else
			windower.add_to_chat(121,"Default Skill Set")
            equip(sets.midcast.BlueMagic)
        end				
		if buffactive['Diffusion'] then
			equip(sets.precast.JA["Diffusion"])
		end
-- Healing Magic
	elseif spell.skill == 'Healing Magic' then
		-- Add Light Obi Twilight Cape and Chatoyant Staff
		-- Cure Curaga Cura
		if spell.english:startswith('Cure') then
			equip(sets.midcast.BlueMagic.CurePot)
		elseif spell.english:startswith("Curaga") then
			equip(sets.midcast.BlueMagic.CurePot)	
		elseif spell.english:startswith('Reraise') then
			equip(sets.midcast.ConserveMP)
		else
			equip(sets.midcast.Recast)
		end
-- Enhancing Magic
	elseif spell.skill == 'Enhancing Magic' then
		equip(sets.midcast.Enhancing)
-- Enfeebling Magic
	elseif spell.skill == 'Enfeebling Magic' then
		if spell.english:startswith('Dia') then
			equip(sets.midcast.BlueMagic.Macc)
		elseif spell.english:wcmatch('Paralyze*|Slow*|Addle') then
			equip(sets.midcast.BlueMagic.Macc)
		else
			equip(sets.midcast.BlueMagic.Macc)
		end
-- Divine Magic
	elseif spell.skill == 'Divine Magic' then
		if spell.english:startswith('Banish') then
			equip(sets.midcast.BlueMagic.Macc)
		elseif spell.english:startswith('Holy') then
			equip(sets.midcast.BlueMagic.Macc)
		elseif spell.name == 'Repose' then
			equip(sets.midcast.BlueMagic.Macc)
		elseif spell.name == 'Flash' then
			equip(sets.midcast.BlueMagic.Macc)
		end
-- Dark Magic
	elseif spell.skill == 'Dark Magic' then
		equip(sets.midcast.BlueMagic.Macc)
-- Elemental Magic
	elseif spell.skill == 'Elemental Magic' then
		equip(sets.midcast.BlueMagic.Macc)
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
		equip(sets.midcast.BlueMagic.Macc)
	end
end

function aftercast(spell)
	previous_set()
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
	if player.status == 'Engaged' then
		--if buffactive['Aftermath: Lv.3'] then			
			--equip(ModeWeapon, sets.TP.AM3)
		--else
			equip(ModeWeapon, sets.TP)
		--end
	else
		equip(ModeWeapon, sets.idle)
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
