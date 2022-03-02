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
		QDBullet = {ammo="Living Bullet"}
		-- Normal TP Bullets
		TPBullet = {ammo="Chrono Bullet"}
		-- WS Bullets
		WSBullet = {ammo="Chrono Bullet"}
		-- Magical WS Bullets "use the cheapest"
		MBullet = {ammo="Living Bullet"}
	
	-- Luzaf's Ring - 1 to use
	luzaf = 1
	
	KillTpRoll = 1
	PDT = 0
	Mode = 'MeleeSB'
	ShadowType = 'None'
	ModeWeapon = sets.MeleeSB
	
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
	if command == 'KillTpRoll' then
		if KillTpRoll == 1 then
			KillTpRoll = 0
			windower.add_to_chat(121,'Keep TP When Rolling')
		else 
			KillTpRoll = 1
			windower.add_to_chat(121,'Max Duration Rolls')
		end
   
	elseif command == 'PDT' then
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
--  Lock Acc	
	elseif command == 'Mode' then
		if Mode == 'MeleeSB' then
			Mode = 'MeleeLeaden'
			windower.send_command('autows use Leaden Salute')
			ModeWeapon = sets.MeleeLeaden			
				previous_set()		
			windower.add_to_chat(121,'Mode Melee Leaden')
		elseif Mode == 'MeleeLeaden' then
			Mode = 'RangedLastStand'
			windower.send_command('autows use Last Stand')
			ModeWeapon = sets.RangedLastStand
				previous_set()
			windower.add_to_chat(121,'Mode Ranged Last Stand')
		elseif Mode == 'RangedLastStand' then
			Mode = 'RangedLeaden'
			windower.send_command('autows use Leaden Salute')
			ModeWeapon = sets.RangedLeaden
				previous_set()
			windower.add_to_chat(121,'Mode Ranged Leaden')
		elseif Mode == 'RangedLeaden' then
			Mode = 'MeleeSB'
			windower.send_command('autows use Savage Blade')
			ModeWeapon = sets.MeleeSB
				previous_set()
			windower.add_to_chat(121,'Mode Melee Savage Blade')
		end	
	end
end

function status_change(new,old)
    if T{'Idle','Resting'}:contains(new) then
		if areas.Town:contains(world.zone) then
			windower.add_to_chat(121, "Town Gear")
			equip(sets.misc.Town)
		else
			previous_set()
		end
	elseif new == 'Engaged' then
		previous_set()
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
			equip(sets.precast.Snapshot)
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
				equip(sets.precast.QD.ACC,QDBullet)
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
					--if spell.target.distance <= ranged_weaponskills_Distance[spell.name] then
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
					--else
						--cancel_spell()
						--windower.add_to_chat(121,''..spell.target.name..'is too far to ws')
					--end
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
			if Acc == 1 then
				equip(sets.RA.Acc, sets.precast.JA["Triple Shot"])
			else
				equip(sets.RA, sets.precast.JA["Triple Shot"])				
			end
		else
			-- Acc Sets 
			if Acc == 1 then
				equip(sets.RA.Acc)				
			else
				equip(sets.RA)
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
	previous_set()
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