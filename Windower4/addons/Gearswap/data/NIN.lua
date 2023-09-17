-- Feary's NIN LUA
-- Created: 7/18/2014
-- Last Modified: 7/18/2014
-- To Do:
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
	
	-- Get NIN Gearsets
	include('Gearsets/'..player.name..'/NIN_Gearsets.lua')
	
-- Define Default Values for Variables
	Mode = 'Chi'
	PDT = 0
	MDT = 0
	ShadowType = 'None'
	ModeWeapon = sets.Chi
	windower.send_command('autows use Blade: Chi')
end -- End gear sets

-- Called when this job file is unloaded (eg: job change)
function file_unload()
	clear_binds()
end

-- Rules
function self_command(command)
	if command == 'Mode' then
		if Mode == 'ChiAcc' then
			Mode = 'SBAcc'
			windower.send_command('autows use Savage Blade')
			ModeWeapon = sets.SBAcc			
				previous_set()		
			windower.add_to_chat(121,'Mode SB ACC')
		elseif Mode == 'SBAcc' then
			Mode = 'Evis'
			windower.send_command('autows use Evisceration')
			ModeWeapon = sets.Evis			
				previous_set()		
			windower.add_to_chat(121,'Mode Evisceration')
		elseif Mode == 'Evis' then
			Mode = 'Chi'
			windower.send_command('autows use Blade: Chi')
			ModeWeapon = sets.Chi
				previous_set()
			windower.add_to_chat(121,'Mode Blade: Chi')
		elseif Mode == 'Chi' then
			Mode = 'SB'
			windower.send_command('autows use Savage Blade')
			ModeWeapon = sets.SB
				previous_set()
			windower.add_to_chat(121,'Mode SB')
		elseif Mode == 'SB' then
			Mode = 'Raging'
			windower.send_command('autows use Asuran Fists')
			ModeWeapon = sets.Raging
				previous_set()
			windower.add_to_chat(121,'Mode Asuran Fists')
		elseif Mode == 'Raging' then
			Mode = 'ChiAcc'
			windower.send_command('autows use Blade: Chi')
			ModeWeapon = sets.ChiAcc
				previous_set()
			windower.add_to_chat(121,'Mode Blade: Chi Acc')		
		end
	elseif command == 'ModeX' then
		if Mode == 'ChiAcc' then
			Mode = 'Raging'
			windower.send_command('autows use Asuran Fists')
			ModeWeapon = sets.Raging			
				previous_set()		
			windower.add_to_chat(121,'Mode Asuran Fists')
		elseif Mode == 'SBAcc' then
			Mode = 'ChiAcc'
			windower.send_command('autows use Blade: Chi')
			ModeWeapon = sets.ChiAcc			
				previous_set()		
			windower.add_to_chat(121,'Mode Blade: Chi Acc')
		elseif Mode == 'Evis' then
			Mode = 'SBAcc'
			windower.send_command('autows use Savage Blade')
			ModeWeapon = sets.SBAcc
				previous_set()
			windower.add_to_chat(121,'Mode SB Acc')
		elseif Mode == 'Chi' then
			Mode = 'Evis'
			windower.send_command('autows use Evisceration')
			ModeWeapon = sets.Evis
				previous_set()
			windower.add_to_chat(121,'Mode Evisceration')
		elseif Mode == 'SB' then
			Mode = 'Chi'
			windower.send_command('autows use Blade: Chi')
			ModeWeapon = sets.Chi
				previous_set()
			windower.add_to_chat(121,'Mode Blade: Chi')
		elseif Mode == 'Raging' then
			Mode = 'SB'
			windower.send_command('autows use Savage Blade')
			ModeWeapon = sets.SB
				previous_set()
			windower.add_to_chat(121,'Mode SB')
		end
	end
end
	
function status_change(new,old)
-- Autoset
    previous_set()
	if player.status == 'Engaged' then
	end
end

function precast(spell,arg)
 -- Generic equip command for all Job Abilities and Weaponskills
	if spell.type == "JobAbility" then
		if sets.precast.JA[spell.name] then
			equip(sets.precast.JA[spell.name])
		end
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
				windower.add_to_chat(121, ''..player.tp..'tp is Not enough to WS')
			end
		else
			cancel_spell()
			windower.add_to_chat(121, 'You must be Engaged to WS')
		end
 -- Ninjutsu spell gear handling(Precast)
    elseif spell.skill == 'Ninjutsu' then
        equip(sets.precast.FastCast)
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
			equip(ModeWeapon, sets.TP.Acc)
		end
	end
end

function midcast(spell,arg)
	if spell.type == "Ninjutsu" then
		-- Utsusemi
		if windower.wc_match(spell.name,'Utsusemi*') then
			-- Equip PDT then Utsusemi Gear sets
			equip(sets.idle.PDT, sets.midcast.Utsusemi)
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
		elseif spell.name == "Migawara: Ichi" then
			equip(sets.midcast.Skill)		
		elseif windower.wc_match(spell.name,'Katon*|Doton*|Suiton*|Huton*|Hyoton*|Raiton')then	
			if buffactive['Futae'] then		
				equip(sets.midcast.Futae)
			else
				equip(sets.midcast.Wheel)
			end			
		else
			equip(sets.midcast.Enfeeb)
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
		if buffactive.innin then
			equip({head="Hattori Zukin +3"})
		end
	else
		equip(ModeWeapon, sets.idle.PDT)
	end
end
