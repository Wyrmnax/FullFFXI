-- Feary's COR LUA
-- Created: 3/10/2014
-- Last Updated: 01/5/2017
-- To Do List
-- 
-- 
--
--includes
	include('include/functions.lua')
	-- Global Buffs
	include('include/status.lua')
	
-- Gear Sets 
function get_sets()
	-- Ammo 
	-- Rare Quick Draw Ammo
		QDBullets = T{"Omphalos Bullet","Animikii Bullet"}
	-- Ammo
		-- Quick Draw Only
		QDBullet = {ammo="Animikii Bullet"}
		-- Normal TP Bullets
		TPBullet = {ammo="Chrono Bullet"}
		-- WS Bullets
		WSBullet = {ammo="Chrono Bullet"}
		-- Magical WS Bullets "use the cheapest"
		MBullet = {ammo="Chrono Bullet"}
	-- Luzaf's Ring - 1 to use
	luzaf = 1
	
	Mode = 0
	PDT = 0
	MDT = 0
	ShadowType = 'None'
	
--includes
	--include('include/autoexec.lua')
	include('include/binds.lua')
	include('include/utility.lua')
	include('include/macro.lua')
	
-- Get COR Gearsets
	include('Gearsets/'..player.name..'/COR_Gearsets.lua')   

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
					windower.add_to_chat(121,'Melee TP Set')
				elseif Mode == 1 then
					windower.add_to_chat(121,'Ranged TP Set')
				elseif Mode == 2 then
					windower.add_to_chat(121,'Melee Acc TP Set')
				elseif Mode == 3 then
					windower.add_to_chat(121,'Ranged Acc TP Set')
				end
				equip(sets.idle.Standard)
			end
		end
	elseif commmand == "luzaf" then
		if lufaz == 1 then
			lufaz = 0
			windower.add_to_chat(121,'Luzaf\'s Ring Enabled')
		else
			lufaz = 1
			windower.add_to_chat(121,'Luzaf\'s Ring Enabled')
		end
	elseif command == "RA" then
		windower.send_command('input /ra <t>')
	end
end

function status_change(new,old)
    if T{'Idle','Resting'}:contains(new) then
		if areas.Town:contains(world.zone) then
			windower.add_to_chat(121, "Town Gear")
			equip(sets.misc.Town)
		else
			if PDT == 1 then
				equip(sets.idle.PDT)
			elseif MDT == 1 then
				equip(sets.idle.MDT)
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
		else
			-- Equip previous TP set 
				previous_set()
		end
    end
end

function precast(spell,arg)
-- Range Attack 
    if spell.name == 'Ranged' then
		-- Check for Rare Quick Draw Bullet
		if QDBullets:contains(player.equipment.ammo) then
			windower.add_to_chat(121, 'Canceled RA - '..player.equipment.ammo..' Equipped')
			equip(TPBullet)
			cancel_spell()
		else
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
-- Cor Rolls
	elseif spell.type == 'CorsairRoll' or spell.english == "Double-Up" then
		if player.inventory["Luzaf's Ring"] or player.wardrobe["Luzaf's Ring"] and luzaf == 1 then
			if spell.english:wcmatch('Caster\'s Roll|Courser\'s Roll|Blitzer\'s Roll|Tactician\'s Roll|Allies\' Roll') then
				if player.inventory['Barataria Ring'] or player.wardrobe['Barataria Ring'] then
					equip(sets.precast.JA[spell.name],{lring="Barataria Ring", rring="Luzaf's Ring"})
				elseif player.inventory['Merirosvo Ring'] or player.wardrobe['Merirosvo Ring'] then
					equip(sets.precast.JA[spell.name],{lring="Merirosvo Ring", rring="Luzaf's Ring"})
				else
					equip(sets.precast.JA[spell.name],{rring="Luzaf's Ring"})
				end
			else
				if player.inventory['Barataria Ring'] or player.wardrobe['Barataria Ring'] then
					equip(sets.precast.JA["Phantom Roll"],{lring="Barataria Ring", rring="Luzaf's Ring"})
				elseif player.inventory['Merirosvo Ring'] or player.wardrobe['Merirosvo Ring'] then
					equip(sets.precast.JA["Phantom Roll"],{lring="Merirosvo Ring", rring="Luzaf's Ring"})
				else
					equip(sets.precast.JA["Phantom Roll"],{rring="Luzaf's Ring"})
				end
				
			end
		else
			if spell.english:wcmatch('Caster\'s Roll|Courser\'s Roll|Blitzer\'s Roll|Tactician\'s Roll|Allies\' Roll') then
				if player.inventory['Barataria Ring'] or player.wardrobe['Barataria Ring'] then
					equip(sets.precast.JA[spell.name],{lring="Barataria Ring"})
				elseif player.inventory['Merirosvo Ring'] or player.wardrobe['Merirosvo Ring'] then
					equip(sets.precast.JA[spell.name],{lring="Merirosvo Ring"})
				else
					equip(sets.precast.JA[spell.name])
				end
			else
				if player.inventory['Barataria Ring'] or player.wardrobe['Barataria Ring'] then
					equip(sets.precast.JA["Phantom Roll"],{lring="Barataria Ring"})
				elseif player.inventory['Merirosvo Ring'] or player.wardrobe['Merirosvo Ring'] then
					equip(sets.precast.JA["Phantom Roll"],{lring="Merirosvo Ring"})
				else
					equip(sets.precast.JA["Phantom Roll"])
				end
				
			end
		end
-- Quick Draw
	elseif spell.type == "CorsairShot" then
		if spell.english:wcmatch('Dark Shot|Light Shot') then
			if spell.element == world.day_element or spell.element == world.weather_element or buffactive[elements.storm_of[spell.element]] then
				equip(sets.midcast.Nuke.MB.Acc,{waist="Hachirin-no-Obi"})
			else
				equip(sets.precast.QD.ACC,QDBullet)
			end
		else
			if spell.element == world.day_element or spell.element == world.weather_element or buffactive[elements.storm_of[spell.element]] then
				equip(sets.precast.QD.MAB,QDBullet, {waist="Hachirin-no-Obi"})
			else
				equip(sets.precast.QD.MAB,QDBullet)
			end
		end
-- JobAbility
	elseif spell.type == "JobAbility" then
		-- Generic equip command for all Job Abilities and Weaponskills
		if sets.precast.JA[spell.name] then
			equip(sets.precast.JA[spell.name])
		end
	elseif spell.type == "WeaponSkill" then
		-- Ranged Weaponskills
		if ranged_weaponskills:contains(spell.name) then
			if player.status == 'Engaged' then
				if player.tp >= 100 then
					if spell.target.distance <= ranged_weaponskills_Distance[spell.name] then
						if sets.precast.RAWS[spell.name] then
							if spell.name == "Wildfire" or spell.name == "Leaden Salute" then
								if spell.element == world.day_element or spell.element == world.weather_element or buffactive[elements.storm_of[spell.element]] then
									equip(sets .precast.RAWS[spell.name],{waist="Hachirin-no-Obi"})
								else
									equip(sets.precast.RAWS[spell.name])
								end
							else
								equip(sets.precast.RAWS[spell.name])
							end
						else
							equip(sets.precast.RAWS)
						end
					else
						cancel_spell()
						windower.add_to_chat(121,''..spell.target.name..'is too far to ws')
					end
				else 
					cancel_spell()
					windower.add_to_chat(121, ''..player.tp..'TP is not enough to WS')
				end
			else
				windower.add_to_chat(121, 'You must be Engaged to WS')
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
	elseif spell.type == "Ninjustu" then
		-- Magic spell gear handling(Precast)
		if spell.skill == 'Ninjutsu' then
			equip(sets.precast.Fastcast)
			if windower.wc_match(spell.name,'Utsusemi*') then
				equip(sets.precast.Utsusemi)
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
    if spell.name == 'Ranged' then
		if buffactive.Barrage then
            equip(sets.precast.JA["Barrage"])
        end
		-- Triple Shot
		if buffactive["Triple Shot"] then
			-- Acc Sets 
			if Mode == 1 or Mode == 3 then
				if player.equipment.range == "Armageddon" then
					equip(sets.RA.Armageddon.Acc, sets.precast.JA["Triple Shot"])
				elseif player.equipment.range == "Eminent Gun" then
					equip(sets.RA.Acc. sets.precast.JA["Triple Shot"])
				else
					equip(sets.RA, sets.precast.JA["Triple Shot"])
				end
			else
				if player.equipment.range == "Armageddon" then
					equip(sets.RA.Armageddon, sets.precast.JA["Triple Shot"])
				elseif player.equipment.range == "Eminent Gun" then
					equip(sets.RA, sets.precast.JA["Triple Shot"])
				else
					equip(sets.RA, sets.precast.JA["Triple Shot"])
				end
			end
		else
			-- Acc Sets 
			if Mode == 1 or Mode == 3 then
				if player.equipment.range == "Armageddon" then
					equip(sets.RA.Armageddon.Acc)
				elseif player.equipment.range == "Eminent Gun" then
					equip(sets.RA.Acc)
				else
					equip(sets.RA)
				end
			else
				if player.equipment.range == "Armageddon" then
					equip(sets.RA.Armageddon)
				elseif player.equipment.range == "Eminent Gun" then
					equip(sets.RA)
				else
					equip(sets.RA)
				end
			end
		end
    end

	if spell.type == "Ninjutsu" then
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
end

function aftercast(spell,arg)
-- Auto sets
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
			if player.status == 'Engaged' then
				if spell.target.distance <= 6 then
					previous_set()
				else
					equip(sets.idle.Standard)
				end
			else
				equip(sets.idle.Standard)
			end
		end
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
		windower.add_to_chat(121,'Melee TP Set')
	elseif Mode == 1 then
		if player.equipment.range == "Armageddon" then
			equip(sets.RA.Armageddon)
		elseif player.equipment.range == "Eminent Gun" then
			equip(sets.RA)
		end
		windower.add_to_chat(121,'Ranged TP Set')
	elseif Mode == 2 then
		equip(sets.TP.Acc)
		windower.add_to_chat(121,'Melee Acc TP Set')
	elseif Mode == 3 then
		if player.equipment.range == "Armageddon" then
			equip(sets.RA.Armageddon.Acc)
		elseif player.equipment.range == "Eminent Gun" then
			equip(sets.RA.Acc)
		end
		windower.add_to_chat(121,'Ranged Acc TP Set')
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