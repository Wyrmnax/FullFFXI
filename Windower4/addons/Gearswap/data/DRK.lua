-- Feary's DRK LUA
-- Created: 6/13/2014
-- Last Update: 6/13/2014
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
	
	-- Get DRK Gearsets
	include('Gearsets/'..player.name..'/DRK_Gearsets.lua')

-- Define Default Values for Variables
	Mode = 0
	Offense = 1
	PDT = 0
	MDT = 0
	ShadowType = 'None'	
	Seigan = 0	
	nexttime = os.clock()		
	del = 0
	
	degrade_array = {
        ['Fire'] = {'Fire','Fire II','Fire III','Fire IV','Fire V','Fire VI','Firaja'},
		['Thunder'] = {'Thunder','Thunder II','Thunder III','Thunder IV','Thunder V','Thunder VI','Thundaja'},
		['Aero'] = {'Aero','Aero II','Aero III','Aero IV','Aero V','Aero VI','Aeroja'},
		['Blizzard'] = {'Blizzard','Blizzard II','Blizzard III','Blizzard IV','Blizzard V','Blizzard VI','Blizzaja'},
		['Water'] = {'Water','Water II','Water III','Water IV','Water V','Water VI','Waterja'},
		['Stone'] = {'Stone','Stone II','Stone III','Stone IV','Stone V','Stone VI','Stoneja'},
		['Drain'] = {'Drain','Drain II','Drain III'},
		['Aspir'] = {'Aspir','Aspir II'},
        }
	
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
	elseif command == 'Offense' then
		if Offense == 1 then
			windower.add_to_chat(121,'Offense OFF')
			Offense = 0
		else 
			windower.add_to_chat(121,'Offense ON')
			Offense = 1
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
		-- SAM Buffs
		if player.sub_job == 'SAM' then
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
		-- DRK Buffs
		if player.status == 'Engaged' then
			if abil_recasts[44] == 0 then
				windower.send_command('Scarlet Delirium')
			end
			if Offense == 1 and abil_recasts[87] == 0 then
				windower.send_command('Last Resort')
			end
		end
    end
end)

function status_change(new,old)
    previous_set()
end

function refine_various_spells(spell, action, spellMap, eventArgs)

    local newSpell = spell.english
    local spell_recasts = windower.ffxi.get_spell_recasts()
    local cancelling = 'All '..spell.english..' are on cooldown. Cancelling.'

    local spell_index

    if spell_recasts[spell.recast_id] > 0 then
        if spell.name:startswith('Fir') then
            spell_index = table.find(degrade_array['Fire'],spell.name)
            if spell_index > 1 then
                newSpell = degrade_array['Fire'][spell_index - 1]
				Degraded = 1
                send_command('@input /ma '..newSpell..' '..tostring(spell.target.raw))
            end
		elseif spell.name:startswith('Thund') then
            spell_index = table.find(degrade_array['Thunder'],spell.name)
            if spell_index > 1 then
                newSpell = degrade_array['Thunder'][spell_index - 1]
				Degraded = 1
                send_command('@input /ma '..newSpell..' '..tostring(spell.target.raw))
			end
		elseif spell.name:startswith('Blizza') then
            spell_index = table.find(degrade_array['Blizzard'],spell.name)
            if spell_index > 1 then
                newSpell = degrade_array['Blizzard'][spell_index - 1]
				Degraded = 1
                send_command('@input /ma '..newSpell..' '..tostring(spell.target.raw))
			end
		elseif spell.name:startswith('Aero') then
            spell_index = table.find(degrade_array['Aero'],spell.name)
            if spell_index > 1 then
                newSpell = degrade_array['Aero'][spell_index - 1]
				Degraded = 1
                send_command('@input /ma '..newSpell..' '..tostring(spell.target.raw))
			end
		elseif spell.name:startswith('Stone') then
            spell_index = table.find(degrade_array['Stone'],spell.name)
            if spell_index > 1 then
                newSpell = degrade_array['Stone'][spell_index - 1]
				Degraded = 1
                send_command('@input /ma '..newSpell..' '..tostring(spell.target.raw))
        end
		elseif spell.name:startswith('Water') then
            spell_index = table.find(degrade_array['Water'],spell.name)
            if spell_index > 1 then
                newSpell = degrade_array['Water'][spell_index - 1]
				Degraded = 1
                send_command('@input /ma '..newSpell..' '..tostring(spell.target.raw))
			end
		elseif spell.name:startswith('Drain') then
            spell_index = table.find(degrade_array['Drain'],spell.name)
            if spell_index > 1 then
                newSpell = degrade_array['Drain'][spell_index - 1]
				Degraded = 1
                send_command('@input /ma '..newSpell..' '..tostring(spell.target.raw))
			end
		elseif spell.name:startswith('Aspir') then
            spell_index = table.find(degrade_array['Aspir'],spell.name)
            if spell_index > 1 then
                newSpell = degrade_array['Aspir'][spell_index - 1]
				Degraded = 1
                send_command('@input /ma '..newSpell..' '..tostring(spell.target.raw))
			end
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
		if spell.skill == 'Dark Magic' then
			refine_various_spells(spell, action, spellMap, eventArgs)
		end
		 equip(sets.precast.Fastcast)
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
		if spell.name == 'Monomi: Ichi' and buffactive.Sneak and spell.target.type == 'SELF' then
			windower.ffxi.cancel_buff(71)
			cast_delay(0.3)
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
	if spell.skill == 'Enhancing Magic' then	
	-- Enfeebling Magic
	elseif spell.skill == 'Enfeebling Magic' then
		equip(sets.midcast.Macc)
	-- Dark Magic
	elseif spell.skill == 'Dark Magic' then
		if windower.wc_match(spell.name,'Drain*') then		
			if buffactive['Nether Void'] then
				equip(sets.midcast.Aspir, {head="Fall. Burgeonet +3", legs="Heath. Flanchard +3" }) 
			else
				equip(sets.midcast.Aspir)
			end
		elseif windower.wc_match(spell.name,'Aspir*') then		
			equip(sets.midcast.Aspir)
		elseif spell.name == "Stun" then
			equip(sets.midcast.Macc)
		elseif spell.english:wcmatch('Absorb*') then
			if spell.name == "Absorb-TP" then
				equip(sets.midcast.Absorb,{hands="Heath. Gauntlets +1"})
			else
				equip(sets.midcast.Absorb)
			end
		elseif spell.name == "Dread Spikes" then
			equip(sets.midcast.Dread)
		elseif spell.name == "Bind" then
			equip(sets.midcast.INT)
		elseif spell.name == "Endark" or spell.name == "Endark II" then
			equip(sets.midcast.DarkMagic)
		else
			equip(sets.midcast.Macc)
		end
	-- Elemental Magic
	elseif spell.skill == 'Elemental Magic' then
		if spell.name == "Impact" or player.equipment.body == "Twilight Cloak" then
			equip(sets.midcast.Macc, {head="", body="Twilight Cloak"})
		elseif spell.english:wcmatch('Frost|Drown|Rasp|Burn|Shock|Choke') then
			equip(sets.midcast.Elemental)
		else
			equip(sets.midcast.MAB)
		end
	-- Ninjutsu
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

function aftercast(spell,arg)
-- Engaged
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
	if player.equipment.head == "Reraise Hairpin" then
		disable('head')
	else
		enable('head')
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