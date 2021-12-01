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
		--include('include/macro.lua')
		
		-- Get PLD Gearsets
		include('Gearsets/'..player.name..'/PLD_Gearsets.lua')
		
	-- Define Default Values for Variables
		Mode = 0
		PDT = 0
		MDT = 0
		ShadowType = 'None'
		-- Sword 
		Sword = "Brilliance"		
		-- Magical Shield
		mshield = "Aegis"
		-- Physical Shield
		pshield = "Priwen"
		-- Default Shield
		Shield = "Priwen"
end 

function file_unload()
	clear_binds()
end

function self_command(command)
	if command == 'Mode' then
		if Mode == 0 then
			-- make sure other values are set to default
			-- Unlock PDT/MDT Variables
			Mode = 1
			-- Place Me in my previous set.			
			previous_set()			
			windower.add_to_chat(121,'MDT Set Locked')
		else
		-- Make sure other values are set to default
			-- Set PDT set and equip it
			Mode = 0
			previous_set()
			windower.add_to_chat(121,'PDT Set Locked')
		end
	end
end

function status_change(new,old)
-- Autoset
	if T{'Idle','Resting'}:contains(new) then
		previous_set()
	elseif new == 'Engaged' then
		previous_set()
	end
end

function precast(spell,arg)
	if spell.type == 'JobAbility' and not buffactive['amnesia'] then	
		if spell.name == 'Chivalry' and player.tp <= 700 then
			cancel_spell()
			windower.add_to_chat(121,'Not Enough TP to Chivalry')
		elseif sets.precast.JA[spell.name] then
			equip(sets.precast.JA[spell.name])
		else
			equip(sets.FullEnmity)
		end
	elseif spell.type == 'WeaponSkill' and not buffactive['amnesia'] then
		if player.status == 'Engaged' then
			if player.tp >= 1000 then
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
				windower.add_to_chat(121, ''..player.tp..'Not enough TP to WS')
			end
		else
			cancel_spell()
			windower.add_to_chat(121, 'You must be Engaged to WS')
		end
	elseif spell.type:endswith('Magic') then
		if spell.skill == 'Healing Magic' then
			if spell.english:wcmatch("Cure*") then
				equip(sets.precast.Cure)
			else
				equip(sets.precast.Fastcast)
			end
		elseif spell.skill == 'Enhancing Magic' then
			equip(sets.precast.Fastcast)
			if spell.name == 'Sneak' and buffactive.Sneak and spell.target.type == 'SELF' then
				windower.ffxi.cancel_buff(71)
			end
		elseif spell.skill == 'Divine Magic' then
			equip(sets.precast.Fastcast)
		elseif spell.skill == 'Blue Magic' then
			equip(sets.precast.Fastcast)
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
			equip(sets.TP)
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
			equip(sets.midcast.Cure)
		elseif spell.english:wcmatch("Cure*") then
			equip(sets.midcast.Cure)
		else
			equip(sets.midcast.SIRD)
		end
	elseif spell.skill == 'Enhancing Magic' then
		if spell.name == "Reprisal" then			
			equip(sets.midcast.EnhancingMagic.Reprisal)
		elseif spell.name == "Phalanx" then		
			equip(sets.midcast.EnhancingMagic.Phalanx)
		elseif spell.name == "Crusade" then		
			equip(sets.midcast.EnhancingMagic)
		else		
			equip(sets.midcast.EnhancingMagic)
		end
	elseif spell.skill == 'Divine Magic' then
		if spell.name == "Flash" then
			equip(sets.midcast.SIRD)
		elseif spell.english:wcmatch('Banish*') then
			equip(sets.midcast.SIRD)
		elseif spell.english:wcmatch('Holy*') then
			equip(sets.midcast.SIRD)
		elseif spell.english:wcmatch('Enlight') then
			equip(sets.midcast.SIRD)	
		else
			equip(sets.midcast.SIRD)
		end
	elseif spell.skill == 'Blue Magic' then
		equip(sets.midcast.SIRD)
	elseif spell.skill == 'Elemental Magic' then
		equip(sets.midcast.SIRD)
	elseif spell.type == 'Ninjutsu' and not (buffactive['silence'] or  buffactive['mute']) then
	-- Utsusemi
		if windower.wc_match(spell.name,'Utsusemi*') then
			-- Equip PDT then Utsusemi Gear sets
			equip(sets.midcast.SIRD)
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
	previous_set()
-- Utsusemi Variable Sets
	if spell and spell.name == 'Utsusemi: Ni' then
        ShadowType = 'Ni'
    elseif spell and spell.name == 'Utsusemi: Ichi' then
        ShadowType = 'Ichi'
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

function previous_set()
	slot_lock()
	weapon_check()
	if Mode == 0 then
		if areas.Town:contains(world.zone) then
			equip(sets.idle.Standard)
		elseif player.status == 'Engaged' then
			equip(sets.TP)
		else 
			equip(sets.idle.Standard)
		end
	elseif Mode == 1 then
		if areas.Town:contains(world.zone) then
			equip(sets.idle.Standard)
		elseif player.status == 'Engaged' then
			equip(sets.idle.MDT)
		else 
			equip(sets.idle.MDT)
		end
	end
end
	

function weapon_check()
	if player.equipment.main == 'empty' then
		equip({main={name=Sword,priority=2}, sub={name=Shield,priority=1}})
	elseif player.equipment.sub == 'empty' then
		equip({main={name=Sword,priority=2}, sub={name=Shield,priority=1}})
	end
end
