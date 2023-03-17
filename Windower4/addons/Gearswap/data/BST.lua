-- Feary's BST LUA
-- Created: 7/26/2014
-- Last Update: 7/26/2014
-- To Do List
-- Dual Wield vs single
--
--
--
-- includes
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
	
	-- Get BST Gearsets
	include('Gearsets/'..player.name..'/BST_Gearsets.lua')

-- Define Default Values for Variables
	PetJug = ""
	PetFood = ""
	Tank = 0
	master = 0
	Mode = 0
	PDT = 0
	MDT = 0
	ShadowType = 'None'

	-- Complete list of Ready moves
	Physical_Ready_Moves = S{'Sic','Foot Kick','Whirl Claws','Wild Carrot','Sheep Charge','Lamb Chop','Head Butt',
		'Wild Oats','Leaf Dagger','Claw Cyclone','Razor Fang','Nimble Snap','Cyclotail','Rhino Attack','Power Attack',
		'Mandibular Bite','Big Scissors','Grapple','Spinning Top','Double Claw','Frogkick','Blockhead','Brain Crush',
		'Tail Blow','??? Needles','Needleshot','Scythe Tail','Ripper Fang','Chomp Rush','Recoil Dive','Sudden Lunge',
		'Spiral Spin','Wing Slap','Beak Lunge','Suction','Back Heel','Choke Breath','Fantod','Tortoise Stomp',
		'Harden Shell','Sensilla Blades','Tegmina Buffet','Swooping Frenzy','Pentapeck','Sweeping Gouge',
		'Zealous Snort','Somersault','Tickling Tendrils','Pecking Flurry','Sickle Slash'}
 
	Magical_Ready_Moves = S{'Dust Cloud','Cursed Sphere','Venom','Toxic Spit','Bubble Shower','Drainkiss',
		'Silence Gas','Dark Spore','Fireball','Plague Breath','Snow Cloud','Charged Whisker','Purulent Ooze',
		'Corrosive Ooze','Aqua Breath','Stink Bomb','Nectarous Deluge','Nepenthic Plunge','Pestilent Plume',
		'Foul Waters','Infected Leech','Gloom Spray'}
 
	Macc_Ready_Moves = S{'Sheep Song','Scream','Dream Flower','Roar','Gloeosuccus','Palsy Pollen',
		'Soporific','Geist Wall','Toxic Spit','Numbing Noise','Spoil','Hi-Freq Field','Sandpit','Sandblast',
		'Venom Spray','Filamented Hold','Queasyshroom','Numbshroom','Spore','Shakeshroom','Infrasonics',
		'Chaotic Eye','Blaster','Intimidate','Noisome Powder','Acid Mist','TP Drainkiss','Jettatura',
		'Molting Plumage','Spider Web'}
 
	tp_based_ready_moves = S{'Sic','Foot Kick','Dust Cloud','Snow Cloud','Wild Carrot','Sheep Song','Sheep Charge',
		'Lamb Chop','Rage','Head Butt','Scream','Dream Flower','Wild Oats','Leaf Dagger','Claw Cyclone','Razor Fang',
		'Roar','Gloeosuccus','Palsy Pollen','Soporific','Cursed Sphere','Somersault','Geist Wall','Numbing Noise',
		'Frogkick','Nimble Snap','Cyclotail','Spoil','Rhino Guard','Rhino Attack','Hi-Freq Field','Sandpit','Sandblast',
		'Mandibular Bite','Metallic Body','Bubble Shower','Bubble Curtain','Scissor Guard','Grapple','Spinning Top',
		'Double Claw','Filamented Hold','Spore','Blockhead','Secretion','Fireball','Tail Blow','Plague Breath',
		'Brain Crush','Infrasonics','Needleshot','Chaotic Eye','Blaster','Ripper Fang','Intimidate','Recoil Dive',
		'Water Wall','Sudden Lunge','Noisome Powder','Wing Slap','Beak Lunge','Suction','Drainkiss','Acid Mist',
		'TP Drainkiss','Back Heel','Jettatura','Choke Breath','Fantod','Charged Whisker','Purulent Ooze',
		'Corrosive Ooze','Tortoise Stomp','Harden Shell','Aqua Breath','Sensilla Blades','Tegmina Buffet',
		'Sweeping Gouge','Zealous Snort','Tickling Tendrils','Pecking Flurry','Pestilent Plume','Foul Waters',
		'Spider Web','Gloom Spray'}
	
-- List of abilities to reference for applying Treasure Hunter +1 via Chaac Belt.
abilities_to_check = S{'Feral Howl','Quickstep','Box Step','Stutter Step','Desperate Flourish',
    'Violent Flourish','Animated Flourish','Provoke','Dia','Dia II','Flash','Bio','Bio II',
    'Sleep','Sleep II','Drain','Aspir','Dispel','Stun','Steal','Mug'}
end 

function file_unload()
	clear_binds()
end

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
			previous_set()
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
			previous_set()
		else
			if Mode >= 2 then
			-- Reset to 0
				Mode = 0
			else
			-- Increment by 1
				Mode = Mode + 1
			end
			-- Place me in previous set
			previous_set()
		end
	elseif command == 'twilight' then
		-- Twilight Helm/Mail logic
		if player.equipment.head == 'Twilight Helm' and player.equipment.body == 'Twilight Mail' then
			enable('head','body')
			-- equip appropriate set
			previous_set()
			windower.add_to_chat(121, 'Twilight Unequipped')
		else
			equip({head="Twilight Helm",body="Twilight Mail"})
		end
	elseif command == "m" or command == "master" then
		if Master == 1 then
			windower.add_to_chat(121,'Master set to 0')
			Master = 0
		else
			windower.add_to_chat(121,'Master set to 1')
			Master = 1
		end
	end
end

function buff_change(buff,g_or_l)
	-- Global Statuses
	include('include/status.lua')
end

function pet_change(pet,gain)
-- Gain a Pet via Summoning
	if gain then
		previous_set()
	else
		previous_set()
	end
end

function status_change(new,old)
    if T{'Idle'}:contains(new) then
		if areas.Town:contains(world.zone) then
			windower.add_to_chat(121, "Town Gear")
			equip(sets.misc.Town)
		else
			if PDT == 1 then
				equip(sets.idle.PDT)
			elseif MDT == 1 then
				equip(sets.idle.MDT)
			else
			-- Equip appropriate sets
				previous_set()
			end
		end
	elseif new == 'Resting' then
		windower.add_to_chat(121, 'Resting')
		equip(sets.Resting)
	elseif new == 'Engaged' then
		--auto food
		windower.add_to_chat(123,'Auto Food')
        send_command('wait 1; input /item "Grape Daifuku" <me>')
		send_command('wait 1; input /pet "Fight" <t>')
		-- Engaged Sets
		if PDT == 1 then
			equip(sets.idle.PDT)
		elseif MDT == 1 then
			equip(sets.idle.MDT)
		else
			-- Equip appropriate sets
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
	-- Pet Commands 
	elseif spell.type == 'PetCommand' then
		if pet.isvalid == true then
			previous_set()
		else
			cancel_spell()
		end
	-- Weaponskills
	elseif spell.type == 'WeaponSkill' then
		if player.status == 'Engaged' then
			if player.tp >= 100 then
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
				windower.add_to_chat(121, ''..player.tp..' TP is not enough to WS')
			end
		else
			cancel_spell()
			windower.add_to_chat(121, 'You must be Engaged to WS')
		end
	elseif spell.type:endswith('Magic') then
		-- Cancel Sneak
		if spell.name == 'Sneak' and buffactive.Sneak and spell.target.type == 'SELF' then
			windower.ffxi.cancel_buff(71)
			cast_delay(0.3)
		end	
    -- Magic spell gear handling(Precast)
    elseif spell.type == 'Ninjutsu' then
        equip(sets.precast.Fastcast)
        if windower.wc_match(spell.name,'Utsusemi*') then
            equip(sets.precast.Utsusemi)
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

function pet_precast(spell,arg)
	if ready_moves_to_check:contains(spell.name) and pet.status == 'Engaged' then
		equip(sets.midcast.Pet.Recast)
	end
end

function midcast(spell,arg)	
	-- Pet Command
	if spell.type == 'PetCommand' then
		if pet.isvalid == true then

		end
	elseif spell.type:endswith('Magic') then
		
    elseif spell.type == 'Ninjutsu' then
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

function pet_midcast(spell)
	if Physical_Ready_Moves:contains(spell.name) then
		windower.add_to_chat(121,'Pet WS')
		equip(sets.midcast.Pet.WS)
		 if tp_based_ready_moves:contains(spell.name) and PetJob == 'Warrior' and pet.tp < 190 then
            equip(sets.midcast.Pet.TPBonus)
        elseif tp_based_ready_moves:contains(spell.name) and PetJob ~= 'Warrior' and pet.tp < 240 then
            equip(sets.midcast.Pet.TPBonus)
        end
	elseif Magical_Ready_Moves:contains(spell.name)then
		if Mode >= 1 then
			windower.add_to_chat(121,'Pet Macc ')
			equip(sets.midcast.Pet.WS.Macc)
		else
			windower.add_to_chat(121,'Pet Macc')
			equip(sets.midcast.Pet.WS.MAB)
		end
	elseif Macc_Ready_Moves:contains(spell.name) then
		windower.add_to_chat(121,'Pet Macc')
		equip(sets.midcast.Pet.WS.Macc)
	else
		windower.add_to_chat(121,'Generic Ready Recast')
		equip(sets.midcast.Pet.Recast)
	end
end

function aftercast(spell,arg)
	-- Leaving Pet Gear on and using Pet Aftercast
	if pet_midaction() == true then
		-- Do Nothing
	else
	-- Engaged
		if player.status == 'Engaged' then
			if PDT == 1 then
				equip(sets.idle.PDT)
			elseif MDT == 1 then
				equip(sets.idle.MDT)
			else
				previous_set()
			end
		else
			if PDT == 1 then
				equip(sets.idle.PDT)
			elseif MDT == 1 then
				equip(sets.idle.MDT)
			else
				previous_set()
			end
		end
		-- Changes shadow type variable to allow cancel Copy Image if last cast was Utsusemi: Ni
		if spell and spell.name == 'Utsusemi: Ni' then
			ShadowType = 'Ni'
		elseif spell and spell.name == 'Utsusemi: Ichi' then
			ShadowType = 'Ichi'
		end
	end
end

function pet_aftercast(spell,arg)
-- Engaged
	if player.status == 'Engaged' then
		if PDT == 1 then
			equip(sets.idle.PDT)
		elseif MDT == 1 then
			equip(sets.idle.MDT)
		else
			previous_set()
		end
	else
		if PDT == 1 then
			equip(sets.idle.PDT)
		elseif MDT == 1 then
			equip(sets.idle.MDT)
		else
			previous_set()
		end
	end
end

function previous_set()
	if pet.isvalid == true then
		if master == 1 then
			if player.status == "Engaged" then
				if Mode == 1 then
					-- Master Priority - Acc TP set
					windower.add_to_chat(121,'Master Priority - Acc TP set')
					equip(sets.TP.Acc)
				else
					-- Master Priority - TP set
					windower.add_to_chat(121,'Master Priority - TP set')
					equip(sets.TP)
				end
			else
			 -- Standard
				windower.add_to_chat(121, 'Standard')
				equip(sets.idle.Standard)
			end
		else
			if pet.status == "Engaged" then
				if player.status == "Engaged" then
					if Tank == 1 then
						windower.add_to_chat(121, 'Pet Priority - Tank')
						equip(sets.TP.Pet.Tank)
					else
						-- Pet Priority - Master Engaged - Pet Engaged - TP set
						windower.add_to_chat(121, 'Pet Priority - Master Engaged - Pet Engaged - TP set')
						equip(sets.TP.Pet)
					end
				else
					if Tank == 1 then
						windower.add_to_chat(121, 'Pet Priority - Tank')
						equip(sets.TP.Pet.Tank)
					else
					-- Pet Priority - Master Idle - Pet Engaged
						windower.add_to_chat(121, ' Pet Priority - Master Idle - Pet Engaged')
						equip(sets.TP.Pet.Tank)
					end
				end
			elseif pet.status == "Idle" then
				if player.status == "Engaged" then
					if Mode == 1 then
						-- Master Priority - Acc TP set
						windower.add_to_chat(121, 'Acc TP set')
						equip(sets.TP.Acc)
					else
						-- Master Priority - TP set
						windower.add_to_chat(121, 'TP set')
						equip(sets.TP)
					end
				else
					-- Pet Priority - Master Idle - Pet Idle
					windower.add_to_chat(121, 'Master Idle - Pet Idle')
					equip(sets.idle.Pet)
				end
			end
		end
	else
		if player.status == "Engaged" then
			if Mode == 1 then
				-- Master Priority - Acc TP set
				windower.add_to_chat(121,'Master Priority - Acc TP set')
				equip(sets.TP.Acc)
			else
				-- Master Priority - TP set
				windower.add_to_chat(121,'Master Priority - TP set')
				equip(sets.TP)
			end
		else
		 -- Standard
			windower.add_to_chat(121, 'Standard')
			equip(sets.idle.Standard)
		end
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

