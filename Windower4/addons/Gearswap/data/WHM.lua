-- Feary's WHM LUA
-- Date Created : 1/29/2014
-- Last Update: 5/13/2015
-- To Do:
-- Add Enmity Cure Sets Toggle
-- Weather cures


--includes
	include('include/functions.lua')
	-- Global Buffs
	include('include/status.lua')
	
function get_sets()
--includes
	--include('include/autoexec.lua')
	include('include/binds.lua')
	include('include/utility.lua')
	include('include/macro.lua')
	
	-- Get WHM gearsets
	include('Gearsets/'..player.name..'/WHM_Gearsets.lua')
	
	-- Variables
	ShadowType = 'None'
	Mode = 0
	PDT = 0
	PDT = 0
	MDT = 0
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

function precast(spell,arg)
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
		if spell.skill == 'Healing Magic' then
			-- Cure casting time
			if spell.english:startswith('Cure') or spell.english:startswith("Curaga") then
				equip(sets.precast.Cure)
			else
				equip(sets.precast.Healing)
			end
		elseif spell.skill == 'Enhancing Magic' then
			-- Cancel Sneak
			if spell.name == 'Sneak' and buffactive.Sneak and spell.target.type == 'SELF' then
				windower.ffxi.cancel_buff(71)
				cast_delay(0.3)
			-- Auspice 
			elseif spell.name == 'Auspice' then
				equip(sets.precast.Auspice)
			elseif spell.english:wcmatch('Protectra*') then
				equip(sets.precast.Protectra)
			elseif spell.english:wcmatch('Shellra*') then
				equip(sets.precast.Shellra)
			elseif spell.english:wcmatch('Stoneskin') then
				equip(sets.precast.Stoneskin)
			else
				equip(sets.precast.Enhancing)
			end		
		end
		if Fastcast.Staff[spell.element] and (player.inventory[Fastcast.Staff[spell.element]] or player.wardrobe[Fastcast.Staff[spell.element]] or player.wardrobe2[Fastcast.Staff[spell.element]]) then
			equip({main=Fastcast.Staff[spell.element]})
		end
-- Ninjutsu
	elseif spell.type == 'Ninjutsu' then
		equip(sets.precast.Fastcast)
-- BardSongs
	elseif spell.type == 'BardSong' then
		equip(sets.precast.Fastcast)
	end
end

function midcast(spell,arg)
-- Healing Magic
	if spell.skill == 'Healing Magic' then
		-- Cure Curaga Cura
		if spell.english:startswith('Cure') then
			if buffactive['Aurorastorm'] then
				equip(sets.midcast.Cure.Weather)
			else
				equip(sets.midcast.Cure)
			end
		elseif spell.english:startswith("Curaga") then
			if buffactive['Aurorastorm'] then
				equip(sets.midcast.Curaga.Weather)
			else
				equip(sets.midcast.Curaga)
			end
		elseif spell.english:startswith('Cura') then
			equip(sets.midcast.Cura)
		-- Na Spells
		elseif spell.english:wcmatch('Poisona|Paralyna|Blindna|Silena|Viruna|Stona|Erase') then
			-- With Yagrush
			if player.inventory["Yagrush"] or player.wardrobe["Yagrush"] or player.wardrobe2["Yagrush"] or player.wardrobe3["Yagrush"] or player.wardrobe4["Yagrush"] then
				if buffactive['Divine Caress'] then
					equip(sets.midcast.Lyna.Yagrush.DC,sets.precast.JA['Divine Caress'])	
				else
					equip(sets.midcast.Lyna.Yagrush)
				end
			else
			-- Without Yagrush
				if buffactive['Divine Caress'] then
					equip(sets.midcast.Lyna.DC, sets.precast.JA['Divine Caress'])	
				else
					equip(sets.midcast.Lyna)
				end
			end
		elseif spell.name == 'Cursna' then
			if player.inventory["Yagrush"] or player.wardrobe["Yagrush"] or player.wardrobe2["Yagrush"] or player.wardrobe3["Yagrush"] or player.wardrobe4["Yagrush"] then
				equip(sets.midcast.Cursna,{main={name="Gambanteinn",priority=2}})
			else
				equip(sets.midcast.Cursna)
			end
		elseif spell.english:startswith('Raise') or spell.name == 'Arise' then
			equip(sets.midcast.Reraise)
		else
			equip(sets.midcast.Recast)
		end
-- Enhancing Magic
	elseif spell.skill == 'Enhancing Magic' then
		if spell.name == 'Phalanx' then
			equip(sets.midcast.Phalanx) 
		elseif spell.english:wcmatch('Regen*') then
			equip(sets.midcast.Regen)
		elseif spell.english:wcmatch('BarStona|BarWatera|BarAera|BarFira|BarBlizzara|BarThundra') then
			equip(sets.midcast.BarElement)
		elseif spell.english:wcmatch('BarSleepra|BarPoisonra|BarParalyna|BarBlindra|BarSilencra|BarVira|BarPetra|BarAmnesra') then
			equip(sets.midcast.BarStatus)
		elseif spell.english:wcmatch('Boost-*') then
			equip(sets.midcast.Boost)
		elseif spell.english:endswith('Spikes') then
			equip(sets.midcast.Spikes)
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
		elseif spell.name == 'Auspice' then
			equip(sets.midcast.BarElement)
		elseif spell.english:wcmatch('Protectra*') then
			equip(sets.midcast.ConserveMP, sets.precast.Protectra)
		elseif spell.english:wcmatch('Shellra*') then
			equip(sets.midcast.ConserveMP, sets.precast.Shellra)
		elseif spell.english:wcmatch('Reraise*') then
			equip(sets.midcast.ConserveMP)
		elseif spell.english:wcmatch('Erase*') then
			equip(sets.midcast.Erase)
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
			equip(sets.midcast.Banish)
		elseif spell.english:startswith('Holy') then
			equip(sets.midcast.Holy)
		elseif spell.name == 'Repose' then
			equip(sets.midcast.Repose)
		elseif spell.name == 'Flash' then
			equip(sets.midcast.Flash)
		end
-- Dark Magic
	elseif spell.skill == 'Dark Magic' then
		if spell.name == 'Drain' then
			equip(sets.midcast.Drain)
		elseif spell.name == 'Aspir' then
			equip(sets.midcast.Aspir)
		elseif spell.name == 'Stun' then
			equip(sets.midcast.Macc)
		else
			equip(sets.midcast.DarkMagic)
		end
-- Elemental Magic
	elseif spell.skill == 'Elemental Magic' then
		if spell.english:wcmatch('Fir*|Ston*|Water*|Aero*|Blizza*|Thund*') then
			equip(sets.midcast.Nuke)
		elseif spell.english:wcmatch('Burn|Rasp|Drown|Choke|Frost|Shock') then
			equip(sets.midcast.DOT)
		else
			equip(sets.midcast.Macc)
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
        end
    elseif spell.name == 'Monomi: Ichi' and buffactive.Sneak and spell.target.type == 'SELF' then
        windower.ffxi.cancel_buff(71)
    end
end -- end midcast 

function aftercast(spell,arg)
-- Autoset
	if areas.Town:contains(world.zone) then
		windower.add_to_chat(121, "Town Gear")
		equip(sets.misc.Town)
	else
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
			if PDT == 1 or buffactive['Weakness'] or player.hpp < 30 then
				equip(sets.idle.PDT)
			elseif MDT == 1 then
				equip(sets.idle.MDT)
			else
				equip(sets.idle.Standard)
			end
		end
	end
-- Sleep and repose
	if spell.name == "Sleep II" or spell.name == "Repose" then
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
		windower.send_command('wait 1; input /ma "Cure V" <me>')
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

