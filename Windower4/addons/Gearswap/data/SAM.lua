-- Feary's SAM LUA
-- Created On: 4/8/2014
-- Last Update: 6/13/2014
-- To Do:
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
	
	-- Get SAM Gearsets
	include('Gearsets/'..player.name..'/SAM_Gearsets.lua')
	
-- Define Default Values for Variables
	-- STP Bow does not go here, only bows for Namas/Apex that us sets.TP.Bow, have to test the other bow.
	Bow = T{"Yoichinoyumi", "Speleogen Bow"}
	Ammo = {ammo="Tulfaire Arrow"}
	PDT = 0
	MDT = 0
	Seigan = 0
	nexttime = os.clock()	
	del = 0
	Mode = 'Masamune'
	ModeWeapon = sets.mainweapon.Masamune
	windower.send_command('autows use Tachi: Fudo')
	ShadowType = 'None'
end -- End gear sets

-- Called when this job file is unloaded (eg: job change)
function file_unload()
	clear_binds()
end

-- Rules
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
		if Mode == 'Masamune' then
			Mode = 'Doji'
			windower.send_command('autows use Tachi: Kagero')
			ModeWeapon = sets.mainweapon.Doji			
				previous_set()		
			windower.add_to_chat(121,'Mode Doji - Kagero')
		elseif Mode == 'Doji' then
			Mode = 'Polearm'
			windower.send_command('autows use Impulse Drive')
			ModeWeapon = sets.mainweapon.ShiningOne			
				previous_set()		
			windower.add_to_chat(121,'Mode Polearm')
		elseif Mode == 'Polearm' then
			Mode = 'Masamune'
			windower.send_command('autows use Tachi: Fudo')
			ModeWeapon = sets.mainweapon.Masamune
				previous_set()
			windower.add_to_chat(121,'Mode Masamune - Fudo')
		end	
	elseif command == 'ModeX' then
		if Mode == 'Masamune' then
			Mode = 'Polearm'
			windower.send_command('autows use Impulse Drive')
			ModeWeapon = sets.mainweapon.ShiningOne			
				previous_set()		
			windower.add_to_chat(121,'Mode Polearm')
		elseif Mode == 'Polearm' then
			Mode = 'Doji'
			windower.send_command('autows use Tachi: Kagero')
			ModeWeapon = sets.mainweapon.Doji			
				previous_set()		
			windower.add_to_chat(121,'Mode Doji - Kagero')
		elseif Mode == 'Doji' then
			Mode = 'Masamune'
			windower.send_command('autows use Tachi: Fudo')
			ModeWeapon = sets.mainweapon.Masamune
				previous_set()
			windower.add_to_chat(121,'Mode Masamune - Fudo')
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
end)
	
function status_change(new,old)
-- Autoset
		--auto food
		--windower.add_to_chat(123,'Auto Food')
        --send_command('wait 1; input /item "Grape Daifuku" <me>')	
	previous_set()
end

function precast(spell,arg)
	if spell.type == "JobAbility" then
		if sets.precast.JA[spell.name] then
			equip(sets.precast.JA[spell.name])
		end
	elseif spell.type == "WeaponSkill" then
		if player.status == 'Engaged' then
			if player.tp >= 100 then
				-- Situational spell logic for Warrior sub job
				if (spell.name == 'Namas Arrow' or spell.name == 'Requiescat' or spell.name == 'Tachi: Fudo' or spell.name == 'Tachi: Kaiten' or spell.name == 'Tachi: Shoha') and not buffactive.Berserk and not buffactive.Amnesia and not buffactive.Obliviscence and not buffactive.Paralysis and player.sub_job == 'WAR' and windower.ffxi.get_ability_recasts()[1] < 1 then
					--windower.send_command('berserk; wait 1; warcry; wait 1; '..spell.name..' '..spell.target.raw)
					--cancel_spell()
					return
				end
				-- Ranged WS
				if ranged_weaponskills:contains(spell.name) then
					-- Check Ranged WS Distance
					if spell.target.distance <= ranged_weaponskills_Distance[spell.name] then
						if sets.precast.RAWS[spell.name] then
							equip(sets.precast.RAWS[spell.name],Ammo)
						else
							equip(sets.precast.RAWS,Ammo)
						end
						-- Layered this way to allow for proper equiping of gear when any combo of the below buffs are in effect
						if buffactive.Sekkanoki then
							equip(sets.precast.JA["Sekkanoki"])
							if buffactive.Sengikori then
								equip(sets.precast.JA["Sengikori"])
							end
						end
						if buffactive['Meikyo Shisui'] then
							equip(sets.precast.JA['Meikyo Shisui'])
						end	
					else
						cancel_spell()
						windower.add_to_chat(121, 'Canceled '..spell.name..'.'..spell.target.name..' is Too Far')
					end
				-- Check WS Distance
				else
					if spell.target.distance <= 6 then
						if sets.precast.WS[spell.name] then
							equip(sets.precast.WS[spell.name])
						else
							equip(sets.precast.WS)
						end
						-- Layered this way to allow for proper equiping of gear when any combo of the below buffs are in effect
						if buffactive.Sekkanoki then
							equip(sets.precast.JA["Sekkanoki"])
							if buffactive.Sengikori then
								equip(sets.precast.JA["Sengikori"])
							end
						end
						if buffactive['Meikyo Shisui'] then
							equip(sets.precast.JA['Meikyo Shisui'])
						end	
					else
						cancel_spell()
						windower.add_to_chat(121,''..spell.target..'is too far to ws')
					end
				end					
			else 
				cancel_spell()
				windower.add_to_chat(121, ''..player.tp..' TP is Not enough to WS')
			end
		else
			cancel_spell()
			windower.add_to_chat(121, 'You must be Engaged to WS')
		end
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
		end
	end
end

function midcast(spell,arg)
	if spell.type == 'Ninjutsu' then	
		-- Utsusemi
		if windower.wc_match(spell.name,'Utsusemi*') then
			-- Equip PDT then Utsusemi Gear sets
			equip(sets.idle, sets.precast.Utsusemi)
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
-- Autoset
	previous_set()
-- Utsusemi Variable Sets
	if spell and spell.name == 'Utsusemi: Ni' then
        ShadowType = 'Ni'
    elseif spell and spell.name == 'Utsusemi: Ichi' then
        ShadowType = 'Ichi'
	end
end

function previous_set(spell)
	if player.status == 'Engaged' then
		equip(ModeWeapon, sets.TP)
	else
		equip(ModeWeapon, sets.idle)
	end
end

function slot_lock()
    if player.equipment.left_ear == 'Reraise Earring' then
        disable('left_ear')
        windower.add_to_chat(121,'Reraise Earring equiped on left ear')
    elseif player.equipment.right_ear == 'Reraise Earring' then
        disable('right_ear')
        windower.add_to_chat(121,'Reraise Earring equiped on right ear')
    else
        enable('left_ear','right_ear')
    end
end

