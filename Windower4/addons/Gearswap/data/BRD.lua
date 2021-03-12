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
	Mode = 0
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
				equip(sets.idle.Standard)
			end
		end
	elseif command == "fishing" then
		if fishing == 1 then
			fishing = 0
			-- Place Me in my previous set.
			if player.status == 'Engaged' then
				previous_set()
			else
				equip(sets.idle.Standard)
			end
			windower.add_to_chat(121,'Fishing Set UnLocked')
		else
			fishing = 1
			equip(sets.idle.Fishing)
			windower.add_to_chat(121,'Fishing Set Locked')
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
			if PDT == 1 or buffactive['Weakness'] or player.hpp < 30 then
				equip(sets.idle.PDT)
			elseif MDT == 1 then
				equip(sets.idle.MDT)
			else
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
		if buffactive.Nightingale then
			-- Dummy Songs
			-- 3rd Song
			if spell.name == "Fowl Aubade" then
				if player.inventory["Daurdabla"] or player.wardrobe["Daurdabla"] or player.wardrobe2["Daurdabla"] or player.wardrobe3["Daurdabla"] or player.wardrobe4["Daurdabla"] then
					equip({range="Daurdabla"})
				elseif player.inventory["Terpander"] or player.wardrobe["Terpander"] then
					equip({range="Terpander"})
				end
			-- 4th Song
			elseif spell.name == "Herb Pastoral" then
				if player.inventory["Daurdabla"] or player.wardrobe["Daurdabla"] or player.wardrobe2["Daurdabla"] or player.wardrobe3["Daurdabla"] or player.wardrobe4["Daurdabla"] then
					equip({range="Daurdabla"})
				elseif player.inventory["Terpander"] or player.wardrobe["Terpander"] then
					equip({range="Terpander"})
				end
			else
				-- Instrument check 
				if player.inventory["Gjallarhorn"] or player.wardrobe["Gjallarhorn"] or player.wardrobe2["Daurdabla"] or player.wardrobe3["Daurdabla"] or player.wardrobe4["Daurdabla"] then
					-- Use Gjallarhorn
					equip(sets.precast.Fastcast,{range="Gjallarhorn"})
					if string.find(spell.english,'Ballad') then
						equip(sets.precast.Fastcast,{range="Gjallarhorn"},{legs="Fili Rhingrave +1"})
					elseif string.find(spell.english,'March') then
						equip(sets.precast.Fastcast,march,{hands="Fili Manchettes +1"})
					elseif string.find(spell.english,'Minuet') then
						equip(sets.precast.Fastcast,{range="Gjallarhorn"},{Body="Fili Hongreline +1"})					
					elseif string.find(spell.english,'Madrigal') then
						equip(sets.precast.Fastcast,{range="Gjallarhorn"}, {head="Fili Calot +1", back="Intarabus's Cape"})
					elseif string.find(spell.english,'Prelude') then
						equip(sets.precast.Fastcast,{range="Gjallarhorn"}, {back="Intarabus's Cape"}) 
					elseif string.find(spell.english,'Scherzo') then
						equip(sets.midcast.Skillsong,{range="Gjallarhorn"}, {feet="Fili Cothurnes +1"})
					end
				else
					if string.find(spell.english,'Ballad') then
						equip(sets.precast.Fastcast,ballad,{legs="Fili Rhingrave +1"})
					elseif string.find(spell.english,'March') then
						equip(sets.precast.Fastcast,march,{hands="Fili Manchettes +1"})
					elseif string.find(spell.english,'Minuet') then
						equip(sets.precast.Fastcast,minuet,{Body="Fili Hongreline +1"})					
					elseif string.find(spell.english,'Madrigal') then
						equip(sets.precast.Fastcast,madrigal, {head="Fili Calot +1", back="Intarabus's Cape"})
					elseif string.find(spell.english,'Minne') then
						equip(sets.precast.Fastcast,minne) 
					elseif string.find(spell.english,'Etude') then
						equip(sets.precast.Fastcast,etude) 
					elseif string.find(spell.english,'Carol') then
						equip(sets.precast.Fastcast,carol) 
					elseif string.find(spell.english,'Mambo') then
						equip(sets.precast.Fastcast, mambo)
					elseif string.find(spell.english,'Mazurka') then
						equip(sets.precast.Fastcast,mazurka)
					elseif string.find(spell.english,'Paeon') then
						equip(sets.precast.Fastcast,paeon) 
					elseif string.find(spell.english,'Prelude') then
						equip(sets.precast.Fastcast,prelude, {back="Intarabus's Cape"}) 
					elseif string.find(spell.english,'Scherzo') then
						equip(sets.midcast.Skillsong, scherzo, {feet="Fili Cothurnes +1"})
					elseif string.find(spell.english,'Hymnus') then
						equip(sets.precast.Fastcast,hymnus)
					-- Debuffs 
					elseif string.find(spell.english,'Elegy') then
						equip(sets.precast.Fastcast,elegy)
					elseif string.find(spell.english,'Threnody') then
						equip(sets.precast.Fastcast,threnody)
					elseif string.find(spell.english,'Horde') then
						equip(sets.precast.Fastcast,horde)
					elseif string.find(spell.english,'Lullaby') then
						equip(sets.precast.Fastcast,lullaby)
					elseif string.find(spell.english,'Finale') then
						equip(sets.precast.Fastcast,finale)
					elseif string.find(spell.english,'Requiem') then
						equip(sets.precast.Fastcast,requiem)
					elseif string.find(spell.english,'Virelai') then
						equip(sets.precast.Fastcast,virelai)
					elseif string.find(spell.english,'Nocturne') then
						equip(sets.precast.Fastcast,nocturne)
					else
						windower.add_to_chat(121,'Default DeBuff Instrument')
						equip(sets.precast.Fastcast,default)
					end
				end
			end
		else
			-- Magian Staff
			if Fastcast.Staff[spell.element] and (player.inventory[Fastcast.Staff[spell.element]] or player.inventory[Fastcast.Staff[spell.element]]) then
				equip(sets.precast.Fastcast.Song, {main=Fastcast.Staff[spell.element]})
			else
				equip(sets.precast.Fastcast.Song,{main="Felibre's Dague"})
			end	
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
		-- Dummy Songs
		if spell.name == "Fowl Aubade" then
			if player.inventory["Daurdabla"] or player.wardrobe["Daurdabla"] or player.wardrobe2["Daurdabla"] or player.wardrobe3["Daurdabla"] or player.wardrobe4["Daurdabla"] then
				equip(sets.midcast.Recast, {range="Daurdabla"})
			elseif player.inventory["Terpander"] or player.wardrobe["Terpander"] or player.wardrobe2["Terpander"] or player.wardrobe3["Terpander"] or player.wardrobe4["Terpander"] then
				equip(sets.midcast.Recast, {range="Terpander"})
			end
		elseif spell.name == "Herb Pastoral" then
			if player.inventory["Daurdabla"] or player.wardrobe["Daurdabla"] or player.wardrobe2["Daurdabla"] or player.wardrobe3["Daurdabla"] or player.wardrobe4["Daurdabla"]then
				equip(sets.midcast.Recast, {range="Daurdabla"})
			elseif player.inventory["Terpander"] or player.wardrobe["Terpander"] or player.wardrobe2["Terpander"] or player.wardrobe3["Terpander"] or player.wardrobe4["Terpander"] then
				equip(sets.midcast.Recast, {range="Terpander"})
			end
		else
			if player.inventory["Gjallarhorn"] or player.wardrobe["Gjallarhorn"] or player.wardrobe2["Gjallarhorn"] or player.wardrobe3["Gjallarhorn"] or player.wardrobe4["Gjallarhorn"] then
				-- Buff Songs
				if spell.target.type == "SELF" then
					if string.find(spell.english,'Scherzo') then
						equip(sets.midcast.Skillsong,{range="Gjallarhorn", feet="Fili Cothurnes +1"})
					elseif string.find(spell.english,'Ballad') then
						equip(sets.midcast.Buffsong,{range="Gjallarhorn", legs="Fili Rhingrave +1"})
					elseif string.find(spell.english,'Minuet') then
						equip(sets.midcast.Buffsong,{range="Gjallarhorn", body="Fili Hongreline +1"})
					elseif string.find(spell.english,'March') then
						equip(sets.midcast.Buffsong,{range="Gjallarhorn", hands="Fili Manchettes +1"})
					elseif string.find(spell.english,'Madrigal') then
						equip(sets.midcast.Buffsong,{range="Gjallarhorn", head="Fili Calot +1", back="Intarabus's Cape"})
					elseif string.find(spell.english,'Mazurka') then
						equip(sets.midcast.Buffsong,{range="Daurdabla"})
					--Everything else
					else	
						equip(sets.midcast.Buffsong,{range="Gjallarhorn"})
					end
				else
					-- Lullaby
					if string.find(spell.english,'Lullaby') then
						if buffactive['Troubadour'] then
							windower.add_to_chat(121,'Nitro Duration')
							equip(sets.midcast.Debuff.Buffsong,{range="Gjallarhorn"})							
						else
							equip(sets.midcast.Debuff,lullaby)
						end
					elseif string.find(spell.english,'Horde') then
						if buffactive['Troubadour'] then
							windower.add_to_chat(121,'Nitro Duration')
							equip(sets.midcast.Debuff.Buffsong,{range="Gjallarhorn"})							
						else
							equip(sets.midcast.Debuff,horde)
						end
					else	
					-- Debuff				
						equip(sets.midcast.Debuff,{range="Gjallarhorn"})
					end
				end
			-- Not Ghorn
			else
			-- BuffSongs
				if spell.target.type == "SELF" then
					if string.find(spell.english,'Ballad') then
						equip(sets.midcast.Buffsong,ballad,{legs="Fili Rhingrave +1"})
					elseif string.find(spell.english,'March') then
						equip(sets.midcast.Buffsong,march,{hands="Fili Manchettes +1"})
					elseif string.find(spell.english,'Minuet') then
						equip(sets.midcast.Buffsong,minuet,{Body="Fili Hongreline +1"})					
					elseif string.find(spell.english,'Madrigal') then
						equip(sets.midcast.Buffsong,madrigal, {head="Fili Calot +1", back="Intarabus's Cape"})
					elseif string.find(spell.english,'Minne') then
						equip(sets.midcast.Buffsong,minne) 
					elseif string.find(spell.english,'Etude') then
						equip(sets.midcast.Buffsong,etude) 
					elseif string.find(spell.english,'Carol') then
						equip(sets.midcast.Buffsong,carol) 
					elseif string.find(spell.english,'Mambo') then
						equip(sets.midcast.Buffsong, mambo)
					elseif string.find(spell.english,'Mazurka') then
						equip(sets.midcast.Buffsong,mazurka)
					elseif string.find(spell.english,'Paeon') then
						equip(sets.midcast.Buffsong,paeon) 
					elseif string.find(spell.english,'Prelude') then
						equip(sets.midcast.Buffsong,prelude, {back="Intarabus's Cape"}) 
					elseif string.find(spell.english,'Scherzo') then
						equip(sets.midcast.Skillsong, scherzo, {feet="Fili Cothurnes +1"})
					elseif string.find(spell.english,'Hymnus') then
						equip(sets.midcast.Buffsong,hymnus)
					else	
						windower.add_to_chat(121,'Default Buff Instrument')
						equip(sets.midcast.Buffsong,default)
					end
			-- Debuff Songs
				else
					if string.find(spell.english,'Lullaby') then
						if buffactive['Troubadour'] then
							windower.add_to_chat(121,'Nitro Duration')
							equip(sets.midcast.Debuff.Buffsong,lullaby)							
						else
							equip(sets.midcast.Debuff,lullaby)
						end
					elseif string.find(spell.english,'Horde') then
						if buffactive['Troubadour'] then
							windower.add_to_chat(121,'Nitro Duration')
							equip(sets.midcast.Debuff.Buffsong,horde)							
						else
							equip(sets.midcast.Debuff,horde)
						end
					else	
						if string.find(spell.english,'Elegy') then
							equip(sets.midcast.Debuff,elegy)
						elseif string.find(spell.english,'Threnody') then
							equip(sets.midcast.Debuff,threnody)
						elseif string.find(spell.english,'Finale') then
							equip(sets.midcast.Debuff,finale)
						elseif string.find(spell.english,'Requiem') then
							equip(sets.midcast.Debuff,requiem)
						elseif string.find(spell.english,'Virelai') then
							equip(sets.midcast.Debuff,virelai)
						elseif string.find(spell.english,'Nocturne') then
							equip(sets.midcast.Debuff,nocturne)
						else
							windower.add_to_chat(121,'Default DeBuff Instrument')
							equip(sets.midcast.Debuff,default)
						end
					end
				end
			end
		end
	end
end 

function aftercast(spell,arg)
-- Autoset
	if areas.Town:contains(world.zone) then
		windower.add_to_chat(121, "Town Gear")
		equip(sets.misc.Town)
	elseif fishing == 1 then
		windower.add_to_chat(121, "Fishing Gear")
		equip(sets.idle.Fishing)
	else
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
			if player.status == 'Engaged' then
				previous_set()
			else
				equip(sets.idle.Standard)
			end
		end
	end
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
-- Convert
	if spell.name == 'Convert' then
		cancel_spell()
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
	if Mode == 0 then
		equip(sets.TP)
		windower.add_to_chat(121,'TP Set')
	elseif Mode == 1 then
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
