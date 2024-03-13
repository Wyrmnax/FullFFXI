-- Feary's DRG LUA
-- Created: 3/15/2014
-- Last Update: 5/26/2014
-- To Do List
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
	
	-- Get DRG Gearsets
	include('Gearsets/'..player.name..'/DRG_Gearsets.lua')

-- Define Default Values for Variables
	Mode = 'Trishula'
	Seigan = 0
	nexttime = os.clock()			
	ModeWeapon = sets.mainweapon.Trishula
	windower.send_command('autows use Stardiver')
	del = 0
	ShadowType = 'None'
end 

function file_unload()
	clear_binds()
end

function self_command(command)	
	if command == 'Seigan' then
		if Seigan == 1 then
			windower.add_to_chat(121,'Seigan OFF')
			Seigan = 0
		else 
			windower.add_to_chat(121,'Seigan ON')
			Seigan = 1
		end	
	elseif command == 'Mode' then
		if Mode == 'Trishula' then
			Mode = 'Savage'
			windower.send_command('autows use Savage Blade')
			ModeWeapon = sets.mainweapon.Naegling			
				previous_set()		
			windower.add_to_chat(121,'Mode Savage Blade')
		elseif Mode == 'Savage' then
			Mode = 'Blunt'
			windower.send_command('autows use Judgment')
			ModeWeapon = sets.mainweapon.Judge			
				previous_set()		
			windower.add_to_chat(121,'Mode Judgment')
		elseif Mode == 'Blunt' then
			Mode = 'Trishula'
			windower.send_command('autows use Stardiver')
			ModeWeapon = sets.mainweapon.Trishula
				previous_set()
			windower.add_to_chat(121,'Mode Stardiver')
		end	
	elseif command == 'ModeX' then
		if Mode == 'Trishula' then
			Mode = 'Blunt'
			windower.send_command('autows use Judgment')
			ModeWeapon = sets.mainweapon.Judge			
				previous_set()		
			windower.add_to_chat(121,'Mode Judgment')
		elseif Mode == 'Blunt' then
			Mode = 'Savage'
			windower.send_command('autows use Savage Blade')
			ModeWeapon = sets.mainweapon.Naegling			
				previous_set()		
			windower.add_to_chat(121,'Mode Savage Blade')
		elseif Mode == 'Savage' then
			Mode = 'Trishula'
			windower.send_command('autows use Stardiver')
			ModeWeapon = sets.mainweapon.Trishula
				previous_set()
			windower.add_to_chat(121,'Mode Stardiver')
		end	
	end
end

windower.register_event('prerender',function ()	
	-------------------------------------------------------
    local curtime = os.clock()
    if nexttime + del <= curtime then
        nexttime = curtime
        del = 1.3
        local play = windower.ffxi.get_player()
        local abil_recasts = windower.ffxi.get_ability_recasts()
		if player.sub_job == "SAM" and Mode == 'Trishula' then
			if player.status == 'Engaged' then
				if not buffactive['Hasso'] and Seigan == 0 then 
					if abil_recasts[138] == 0 then
						windower.send_command('Hasso')		
					end	
				elseif not buffactive['Seigan'] and Seigan == 1 then 
					if abil_recasts[139] == 0 then
						windower.send_command('Seigan')
					end
				end
				if buffactive['Seigan'] and abil_recasts[133] == 0 then
					windower.send_command('Third Eye')
				end
			end
		end
    end
end)

function status_change(new,old)
    previous_set()
end

function precast(spell,arg)
    -- Job Abilities
	if spell.type == 'JobAbility' then
		if spell.name == 'Convert' then
			cancel_spell()
		elseif sets.precast.JA[spell.name] then
			equip(sets.precast.JA[spell.name])
		end
	-- Pet Commands 
	elseif spell.type == 'PetCommand' then
		if pet.isvalid == true then
			-- midcast delay
			if spell.name == "Smiting Breath" then
				equip(sets.precast.HealingBreath)
			elseif spell.name == 'Restoring Breath' then
				equip(sets.precast.HealingBreath)
			elseif spell.name == 'Steady Wing' then
				equip(sets.precast.JA["Steady Wing"])
			end
		else
			cancel_spell()
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
	elseif spell.type:endswith('Magic') then
		-- Healing Breath Triggers
		if spell.english:wcmatch("Bar*") and player.hpp <= 51 then
			equip(sets.precast.HealingBreath)
		end
		-- Cure casting time
		if spell.english:wcmatch('Cure*') or spell.english:wcmatch("Curaga*") then
			equip(sets.precast.Fastcast)
		end
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
	if spell.english:startswith('Healing Breath') or spell.english:startswith('Restoring Breath') then
		equip(sets.precast.HealingBreath)
	else 
		equip(sets.precast.HealingBreath)
	end
end

function midcast(spell,arg)	
	-- Pet Command
	if spell.type == 'PetCommand' then
		if pet.isvalid == true then
			if spell.name == "Smiting Breath" then
				equip(sets.midcast.Breath)
			elseif spell.name == 'Restoring Breath' then
				equip(sets.midcast.HealingBreath)
			elseif spell.name == 'Steady Wing' then
				equip(sets.precast.JA["Steady Wing"])
			end
		end
	elseif spell.type:endswith('Magic') then
		-- Healing Breath Triggers
		if spell.english:wcmatch("Stone|Bar*") and player.hpp < 51 then
			equip(sets.midcast.HealingBreath)
		end
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

function pet_midcast(spell,arg)
	if spell.english:wcmatch('Healing Breath*') then
		equip(sets.midcast.HealingBreath)
	elseif spell.english:wcmatch('*Breath') then
		equip(sets.midcast.Breath)
	end
end

function aftercast(spell,arg)
	if areas.Town:contains(world.zone) then
		windower.add_to_chat(121, "Town Gear")
		equip(sets.misc.Town)
	else
		-- Leaving Healing Breath Gear on and use pet aftercast
		if spell.english:wcmatch("Bar*") and player.hpp < 51 or pet_midaction() == true then
				equip(sets.midcast.HealingBreath)
		else
		-- Engaged
			previous_set()
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
	previous_set()
end

function previous_set()
	slot_lock()
	if player.status == 'Engaged' then
		equip(ModeWeapon, sets.TP)
	else
		equip(ModeWeapon, sets.idle)
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

