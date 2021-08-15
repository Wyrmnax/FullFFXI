-- Feary's PUP LUA
-- Date Created : 4/20/2014
-- Last Update: 5/20/2014
-- To Do List 
--
--

--includes
	include('include/functions.lua')
	
-- Gear Sets 
function get_sets()
--includes
	--include('include/autoexec.lua')
	include('include/binds.lua')
	include('include/utility.lua')
	include('include/macro.lua')
	
	-- Get PUP gearsets
	include('Gearsets/'..player.name..'/PUP_Gearsets.lua')
	
	-- Variables 
	ShadowType = 'None'
	Mode = 0
	PDT = 0
	MDT = 0
	master = 1

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
				equip(sets.idle.Standard)
			end
		end
	elseif command == "m" then
		if master == 1 then 
			master = 0
		else
			master = 1
		end
	end
end

function pet_change(pet,gain)
-- Gain a Pet 
	if gain == true then
	-- When I Summon my Automaton
		--if master == 1 then
			--equip(sets.idle.Standard)
		--else
			--equip(sets.idle.Standard)
		--end
	else
		-- When i have no Automaton
		master = 1
	end
end
	
function status_change(new,old)
-- Auto set
	if pet.isvalid then
		if new == 'Resting' then
			equip(sets.Resting)
		elseif new == 'Idle' then
				slot_lock()
				if PDT == 1 or buffactive['Weakness'] or player.hpp < 30 then
					equip(sets.idle.PDT)
				elseif MDT == 1 then
					equip(sets.idle.MDT)
				else
					if master == 1 then
						equip(sets.idle.Standard)
					else
						pet_sets()
					end
				end
		elseif new == 'Engaged' then
			if pet.status == "Engaged" then
				pet_type()
			else
				pet_sets()
			end
		end
	else
		if areas.Town:contains(world.zone) then
			windower.add_to_chat(121, "Town Gear")
			equip(sets.misc.Town)
		else
			if new == 'Resting' then
				equip(sets.Resting)
			elseif new == 'Idle' then
					slot_lock()
					if PDT == 1 or buffactive['Weakness'] or player.hpp < 30 then
						equip(sets.idle.PDT)
					elseif MDT == 1 then
						equip(sets.idle.MDT)
					else
						equip(sets.idle.Standard)
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
	end
end

function precast(spell,arg)
	if midaction() or pet_midaction() then
        cancel_spell()
        return
    end
-- Job Abilities
	if spell.type == 'JobAbility' then
		if sets.precast.JA[spell.name] then
			if spell.name == "Tactical Switch" then
				if pet.tp < 75 then
					cancel_spell()
					windower.add_to_chat(121,'Canceled - Below 75 TP')
				else
					equip(sets.precast.JA[spell.name])
				end
			else
				equip(sets.precast.JA[spell.name])
			end
		end
	elseif spell.type == 'PetCommand' then
		if pet.isvalid then
			if spell.english:endswith('Maneuver') then
				equip(sets.precast.Maneuvers)
			end
		else
			cancel_spell()
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
		if spell.skill == "HealingMagic" then
			-- Cure casting time
			if spell.english:startswith('Cure') or spell.english:startswith("Curaga") then
				equip(sets.precast.Cure)
			else
				equip(sets.precast.Fastcast)
			end
		elseif spell.skill == "EnhancingMagic" then
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
		equip(sets.precast.Fastcast)
	end
end

function pet_midcast(spell)
	if T{'Slapstick','Knockout','Magic Mortar','Chimera Ripper','String Clipper','Cannibal Blade','Bone Crusher','String Shredder','Arcuballista','Daze','Armor Piercer','Armor Shatterer'}:contains(spell.name) then
		windower.add_to_chat(121,'Automaton WS')
		equip(sets.pet.Attack)
	elseif T{'Shield Bash'}:contains(spell.name) then
		
	elseif T{'Cure','Cure II','Cure III','Cure IV','Cure V','Cure VI'}:contains(spell.name) then
		equip(sets.pet.Cure)
	elseif T{'Sleep'}:contains(spell.name) then
		--equip(sets.pet.Macc)
	elseif spell.english:wcmatch('* V') then
		equip(sets.pet.MAB)
	else
		--equip(sets.pet.Fastcast)
		windower.add_to_chat(121,'Gearless Automaton Spell')
	end
end

function midcast(spell,arg)
-- Magic
	if spell.type:endswith('Magic') then
		equip(sets.midcast.Recast)
-- Ninjutsu
	elseif spell.type == "Ninjutsu" then
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
    else
	
    end
end 

function pet_aftercast(spell)
	if master == 1 then
		previous_set()
	else
		pet_sets()
	end
end

function aftercast(spell,arg)
	if pet_midaction() then
        return
    end
-- Autoset
	if pet.isvalid then
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
				if master == 1 then
					previous_set()
				else
					pet_sets()
				end
			end
		else
			slot_lock()
			if PDT == 1 or buffactive['Weakness'] or player.hpp < 30 then
				equip(sets.idle.PDT)
			elseif MDT == 1 then
				equip(sets.idle.MDT)
			else
				-- Equip previous TP set 
				if master == 1 then
					equip(sets.idle.Standard)
				else
					pet_sets()
				end
			end
		end
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
	 -- Changes shadow type variable to allow cancel Copy Image if last cast was Utsusemi: Ni
    if spell and spell.name == 'Utsusemi: Ni' then
        ShadowType = 'Ni'
    elseif spell and spell.name == 'Utsusemi: Ichi' then
        ShadowType = 'Ichi'
	end
end

function pet_sets()
	if pet.isvalid then
	-- Ranger/Melee Pet
		if pet.head == "Sharpshot Head" and pet.frame == "Sharpshot Frame" then
			-- equip pet Engaged
			if pet.status == "Engaged" then
				equip(sets.TP.Pet.Range)
			else
				equip(sets.TP.Pet.Idle)
			end
	-- Tank Pet
		elseif pet.head == "Valoredge Head" and pet.frame == "Valoredge Frame" then
			if pet.status == "Engaged" then
				equip(sets.TP.Pet.Tank)
			else
				equip(sets.TP.Pet.Idle)
			end
	-- Melee Pet 
		elseif pet.head == "Valoredge Head" and pet.frame == "Valoredge Frame" then
			if pet.status == "Engaged" then
				equip(sets.TP.Pet)
			else
				equip(sets.TP.Pet.Idle)
			end
	-- Whitemage pet
		elseif pet.head == "Soulsoother Head" and pet.frame == "Stormwaker Frame" then
			if pet.status == "Engaged" then
				equip(sets.TP.Pet.Mage)
			else
				equip(sets.TP.Pet.Idle)
			end
	-- Blackmage pet 
		elseif pet.head == "Spiritreaver Head" and pet.frame == "Stormwaker Frame" then
			if pet.status == "Engaged" then
				equip(sets.TP.Pet.Mage)
			else
				equip(sets.TP.Pet.Idle)
			end
	-- Redmage pet?
		elseif pet.head == "Stormwaker Head" and pet.frame == "Stormwaker Frame" then
			if pet.status == "Engaged" then
				equip(sets.TP.Pet.Mage)
			else
				equip(sets.TP.Pet.Idle)
			end
		else
			windower.add_to_chat(121,"Hybrid Frames")
		end
	else
		master = 1
		previous_set()
	end
end

function previous_set()
	slot_lock()
	if Mode == 0 then	
		windower.add_to_chat(121,'TP')
		equip(sets.TP)
	elseif Mode == 1 then
		windower.add_to_chat(121,'MidAcc TP')
		equip(sets.TP.MidAcc)
	elseif Mode == 2 then
		windower.add_to_chat(121,'HighAcc TP')
		equip(sets.TP.HighAcc)
	elseif Mode == 3 then
		windower.add_to_chat(121,'Hybrid TP')
		equip(sets.TP.Hybrid)
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

function pet_type() 
	if pet.isvalid then
	-- Ranger/Melee Pet
		if pet.head == "Sharpshot Head" and pet.frame == "Sharpshot Frame" then
			-- equip pet Engaged
			if pet.status == "Engaged" then
				equip(sets.TP.Pet.Range)
			else
				equip(sets.TP.Pet.Idle)
			end
	-- Tank Pet
		elseif pet.head == "Valoredge Head" and pet.frame == "Valoredge Frame" then
			if pet.status == "Engaged" then
				equip(sets.TP.Pet.Tank)
			else
				equip(sets.TP.Pet.Idle)
			end
	-- Melee Pet 
		elseif pet.head == "Valoredge Head" and pet.frame == "Valoredge Frame" then
			if pet.status == "Engaged" then
				equip(sets.TP.Pet)
			else
				equip(sets.TP.Pet.Idle)
			end
	-- Whitemage pet
		elseif pet.head == "Soulsoother Head" and pet.frame == "Stormwaker Frame" then
			if pet.status == "Engaged" then
				equip(sets.TP.Pet.Mage)
			else
				equip(sets.TP.Pet.Idle)
			end
	-- Blackmage pet 
		elseif pet.head == "Spiritreaver Head" and pet.frame == "Stormwaker Frame" then
			if pet.status == "Engaged" then
				equip(sets.TP.Pet.Mage)
			else
				equip(sets.TP.Pet.Idle)
			end
	-- Redmage pet?
		elseif pet.head == "Stormwaker Head" and pet.frame == "Stormwaker Frame" then
			if pet.status == "Engaged" then
				equip(sets.TP.Pet.Mage)
			else
				equip(sets.TP.Pet.Idle)
			end
		else
			windower.add_to_chat(121,"Hybrid Frames")
		end
	else
		master = 1
		previous_set()
	end
end

