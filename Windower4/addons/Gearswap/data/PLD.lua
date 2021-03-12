-- Feary's PLD LUA
-- Created: 4/1/2014
-- Last Update: 8/9/2014
-- To Do List:
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
		
		-- Get PLD Gearsets
		include('Gearsets/'..player.name..'/PLD_Gearsets.lua')
		
	-- Define Default Values for Variables
		Mode = 0
		PDT = 0
		MDT = 0
		ShadowType = 'None'
		-- Sword 
		Sword = "Buramenk'ah"		
		-- Magical Shield
		mshield = "Aegis"
		-- Physical Shield
		pshield = "Ochain"
		-- Default Shield
		Shield = "Aegis"
end 

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
			if buffactive['Shell'] then
				equip(sets.idle.MDT.Shell)
			else
				equip(sets.idle.MDT)
			end
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
			if Mode >= 4 then
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
				if Mode == 0 then
					windower.add_to_chat(121,'TP')
				elseif Mode == 1 then
					windower.add_to_chat(121,'Acc TP')
				elseif Mode == 2 then
					windower.add_to_chat(121,'Hybrid')
				elseif Mode == 3 then 
					windower.add_to_chat(121,'Tank')
				end
			end
		end
	elseif command == 'twilight' or command == "t" then
		-- Twilight Helm/Mail logic
		if player.equipment.head == 'Twilight Helm' and player.equipment.body == 'Twilight Mail' then
			enable('head','body')
			if player.status == "Engaged" then
				-- equip appropriate set
				previous_set()
			else
				equip(sets.idle.Standard)
			end
			windower.add_to_chat(121, 'Twilight Unequipped')
		else
			equip({head="Twilight Helm",body="Twilight Mail"})
		end
	elseif command == "shield" then
		-- use a toggle
		if player.equipment.sub == "Aegis" then
			Shield = "Ochain"
			equip({sub="Ochain"})
			windower.add_to_chat(121,'Ochain')
		elseif player.equipment.sub == "Ochain" then
			Shield = "Aegis"
			equip({sub="Aegis"})
			windower.add_to_chat(121,'Aegis')
		end
	elseif command == "w" then
		equip({main={name=Sword,priority=2}, sub={name=Shield,priority=1}})
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
			if new == "Resting" then
				equip(sets.Resting)
			else
				if PDT == 1 or buffactive['Weakness'] or player.hpp < 30 then
					equip(sets.idle.PDT)
				elseif MDT == 1 then
					equip(sets.idle.MDT)
				elseif Mode == 2 then
					equip(sets.idle.DT)
				else
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
		elseif Mode == 2 then
			equip(sets.TP.Hybrid)
		elseif Mode == 3 then
			equip(sets.TP.Tank)
		else
			-- Equip previous TP set 
				previous_set()
		end
	end
end

function precast(spell,arg)
	if spell.type == 'JobAbility' and not buffactive['amnesia'] then
		if spell.name == 'Convert' then
			cancel_spell()
		elseif spell.name == 'Chivalry' and player.tp <= 700 then
			cancel_spell()
			windower.add_to_chat(121,'Not Enough TP to Chivalry')
		elseif sets.precast.JA[spell.name] then
			equip(sets.precast.JA[spell.name])
		else
			equip(sets.Enmity)
		end
	elseif spell.type == 'WeaponSkill' and not buffactive['amnesia'] then
		if player.status == 'Engaged' then
			if player.tp >= 1000 then
				if spell.target.distance <= 5 then
					if Mode == 1 then
						if sets.precast.WS.Acc[spell.name] then
							equip(sets.precast.WS.Acc[spell.name])
						else
							equip(sets.precast.WS)
						end
					else
						if sets.precast.WS[spell.name] then
							equip(sets.precast.WS[spell.name])
						else
							equip(sets.precast.WS)
						end
					end
				else
					cancel_spell()
					windower.add_to_chat(121, 'Canceled '..spell.name..'.'..spell.target.name..' is Too Far')
				end
			else 
				cancel_spell()
				windower.add_to_chat(121, ''..player.tp..'Not enough TP to WS')
			end
		else
			cancel_spell()
			windower.add_to_chat(121, 'You must be Engaged to WS')
		end
	elseif spell.type:endswith('Magic') and not (buffactive['silence'] or  buffactive['mute'] or not spell.interrupted) then
		if spell.skill == 'Healing Magic' then
			if spell.english:wcmatch("Cure*") then
				equip(sets.precast.Cure)
			else
				equip(sets.precast.Fastcast)
			end
		elseif spell.skill == 'Enhancing Magic' then
			equip(sets.precast.Enhancing)
			if spell.name == 'Sneak' and buffactive.Sneak and spell.target.type == 'SELF' then
				windower.ffxi.cancel_buff(71)
			end
		elseif spell.skill == 'Divine Magic' then
			equip(sets.precast.Fastcast)
		elseif spell.skill == 'Blue Magic' then
			equip(sets.precast.Fastcast,sets.Enmity)
		elseif spell.skill == 'Elemental Magic' then
			equip(sets.precast.Fastcast)
		end
	elseif spell.type == 'Ninjutsu' and not (buffactive['silence'] or  buffactive['mute']) then
		if windower.wc_match(spell.name,'Utsusemi*') then
			equip(sets.precast.Utsusemi)
		else
			-- Ninjutsu spell gear handling(Precast)
			equip(sets.precast.FastCast)
		end
	else
		-- Special handling to remove Dancer sub job Sneak effect
		if spell.name == 'Spectral Jig' and buffactive.Sneak then
			windower.ffxi.cancel_buff(71)
			cast_delay(0.3)
		elseif windower.wc_match(spell.name,'Curing*') then
			equip(sets.precast.Waltz)
		elseif windower.wc_match(spell.name,'*Step') then
			equip(sets.TP.Acc)
		end
	end
	if spell.interrupted == true then
		aftercast()
	end 
end

function midcast(spell,arg)
	if spell.skill == 'Healing Magic' then
		-- Self Cure 
		if spell.english:wcmatch("Cure*") and (player.name == spell.target.name) then
			equip(sets.midcast.Cure.Self)
		elseif spell.english:wcmatch("Cure*") then
			equip(sets.midcast.Cure)
		else
			equip(sets.Enmity)
		end
	elseif spell.skill == 'Enhancing Magic' then
		if spell.name == "Reprisal" then
			equip(sets.midcast.EnhancingMagic.Reprisal)
		elseif spell.name == "Phalanx" then
			equip(sets.midcast.EnhancingMagic.Phalanx)
		elseif spell.name == "Crusade" then
			equip(sets.Enmity)
		else
			equip(sets.precast.Fastcast)
		end
	elseif spell.skill == 'Divine Magic' then
		if spell.name == "Flash" then
			equip(sets.midcast.DivineMagic.Flash)
		elseif spell.english:wcmatch('Banish*') then
			equip(sets.midcast.DivineMagic,sets.Enmity,sets.midcast.Recast)
		elseif spell.english:wcmatch('Holy*') then
			equip(sets.midcast.DivineMagic, sets.Enmity,sets.midcast.Recast)
		elseif spell.english:wcmatch('Enlight') then
			equip(sets.midcast.DivineMagic)	
		else
			equip(sets.midcast.Recast, sets.Enmity)
		end
	elseif spell.skill == 'Blue Magic' then
		equip(sets.precast.Fastcast)
	elseif spell.skill == 'Elemental Magic' then
		equip(sets.precast.Fastcast)
	elseif spell.type == 'Ninjutsu' and not (buffactive['silence'] or  buffactive['mute']) then
	-- Utsusemi
		if windower.wc_match(spell.name,'Utsusemi*') then
			-- Equip PDT then Utsusemi Gear sets
			equip(sets.idle.PDT, sets.precast.Utsusemi)
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
	if spell.interrupted == true then
		aftercast()
	end 
end

function aftercast(spell,arg)
-- Autoset
	weapon_check()
	if areas.Town:contains(world.zone) then
		windower.add_to_chat(121, "Town Gear")
		equip(sets.misc.Town)
	else
		if PDT == 1 or MDT == 1 and not Mode >= 3 then
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
-- Utsusemi Variable Sets
	if spell and spell.name == 'Utsusemi: Ni' then
        ShadowType = 'Ni'
    elseif spell and spell.name == 'Utsusemi: Ichi' then
        ShadowType = 'Ichi'
    end
end

function previous_set()
	slot_lock()
	if player.equipment.sub == mshield then
		if buffactive["Cover"] then
			if Mode == 0 then
				equip(sets.TP,{main={name=Sword, priority=2},sub={name=mshield,priority=1}},{body="Cab. Surcoat +1"})
				windower.add_to_chat(121,'Aegis - Cover - TP Set')
			elseif Mode == 1 then
				equip(sets.TP.Acc,{main={name=Sword, priority=2},sub={name=mshield,priority=1}},{body="Cab. Surcoat +1"})
				windower.add_to_chat(121,'Aegis - Cover - Acc TP Set')
			elseif Mode == 2 then
				equip(sets.TP.Hybrid,{main={name=Sword, priority=2},sub={name=mshield,priority=1}},{body="Cab. Surcoat +1"})
				windower.add_to_chat(121,'Aegis - Cover - Hybrid TP Set')
			elseif Mode == 3 then
				equip(sets.TP.Tank,{main={name=Sword, priority=2},sub={name=mshield,priority=1}},{body="Cab. Surcoat +1"})
				windower.add_to_chat(121,'Aegis - Cover - Tank TP Set')
			elseif Mode == 4 then
				equip(sets.TP.Tank,{main={name=Sword, priority=2},sub={name=mshield,priority=1}},{body="Cab. Surcoat +1"})
				windower.add_to_chat(121,'Aegis - Cover - Tank TP Set')
			
			end
		else
			if Mode == 0 then
				equip(sets.TP,{main={name=Sword, priority=2},sub={name=mshield,priority=1}})
				windower.add_to_chat(121,'Aegis - TP Set')
			elseif Mode == 1 then
				equip(sets.TP.Acc,{main={name=Sword, priority=2},sub={name=mshield,priority=1}})
				windower.add_to_chat(121,'Aegis - Acc TP Set')
			elseif Mode == 2 then
				equip(sets.TP.Hybrid,{main={name=Sword, priority=2},sub={name=mshield,priority=1}})
				windower.add_to_chat(121,'Aegis - Hybrid TP Set')
			elseif Mode == 3 then
				equip(sets.TP.Tank,{main={name=Sword, priority=2},sub={name=mshield,priority=1}})
				windower.add_to_chat(121,'Aegis - Tank TP Set')
			elseif Mode == 4 then
				equip(sets.TP.Tank,{main={name=Sword, priority=2},sub={name=mshield,priority=1}})
				windower.add_to_chat(121,'Aegis - Tank TP Set')
			end	
		end
	elseif player.equipment.sub == pshield then
		if buffactive["Cover"] then
			if Mode == 0 then
				equip(sets.TP,{main={name=Sword, priority=2},sub={name=pshield,priority=1}},{body="Cab. Surcoat +1"})
				windower.add_to_chat(121,'Ochain - Cover - TP Set')
			elseif Mode == 1 then
				equip(sets.TP.Acc,{main={name=Sword, priority=2},sub={name=pshield,priority=1}},{body="Cab. Surcoat +1"})
				windower.add_to_chat(121,'Ochain - Cover - Acc TP Set')
			elseif Mode == 2 then
				equip(sets.TP.Hybrid,{main={name=Sword, priority=2},sub={name=pshield,priority=1}},{body="Cab. Surcoat +1"})
				windower.add_to_chat(121,'Ochain - Cover - Hybrid TP Set')
			elseif Mode == 3 then
				equip(sets.TP.Tank,{main={name=Sword, priority=2},sub={name=mshield,priority=1}},{body="Cab. Surcoat +1"})
				windower.add_to_chat(121,'Ochain - Cover - Tank TP Set')
			elseif Mode == 4 then
				equip(sets.TP.Tank,{main={name=Sword, priority=2},sub={name=mshield,priority=1}},{body="Cab. Surcoat +1"})
				windower.add_to_chat(121,'Ochain - Cover - Tank TP Set')
			end
		else
			if Mode == 0 then
				equip(sets.TP,{main={name=Sword, priority=2},sub={name=pshield,priority=1}})
				windower.add_to_chat(121,'Ochain - TP Set')
			elseif Mode == 1 then
				equip(sets.TP.Acc,{main={name=Sword, priority=2},sub={name=pshield,priority=1}})
				windower.add_to_chat(121,'Ochain - Acc TP Set')
			elseif Mode == 2 then
				equip(sets.TP.Hybrid,{main={name=Sword, priority=2},sub={name=pshield,priority=1}})
				windower.add_to_chat(121,'Ochain - Hybrid TP Set')
			elseif Mode == 3 then
				equip(sets.TP.Tank,{main={name=Sword, priority=2},sub={name=mshield,priority=1}})
				windower.add_to_chat(121,'Ochain - Tank TP Set')
			elseif Mode == 4 then
				equip(sets.TP.Tank,{main={name=Sword, priority=2},sub={name=mshield,priority=1}})
				windower.add_to_chat(121,'Ochain - Tank TP Set')
			end
		end
	else
		weapon_check()
		equip(sets.TP.Hybrid)
		windower.add_to_chat(121, "No Known Shield Equipped. Equipping Hybrid")
	end
end

function slot_lock()
    -- Twilight Helm/Mail logic
    if player.equipment.head == 'Twilight Helm' and player.equipment.body == 'Twilight Mail' then
        disable('head','body')
    else
        enable('head','body')
    end
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
		equip({main={name="Buramenk'ah",priority=2}, sub={name=Shield,priority=1}})
	elseif player.equipment.sub == 'empty' then
		equip({main={name="Buramenk'ah",priority=2}, sub={name=Shield,priority=1}})
	end
end
