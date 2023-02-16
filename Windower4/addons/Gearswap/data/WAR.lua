-- Feary's WAR LUA
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
	--include('include/macro.lua')
	
	-- Get WAR Gearsets
	include('Gearsets/'..player.name..'/WAR_Gearsets.lua')

-- Define Default Values for Variables
	DW = 0
	DT = 1
	ShadowType = 'None'
	FighterRoll = false
	
	GreatAxes = T{'Chango'}
	GreatSwords = T{'Montante +1'}
	
end 

function file_unload()
	clear_binds()
end

windower.register_event('gain buff', function(buff)
    if buff == 310 then
		FighterRoll = true
    end
end)

windower.register_event('lose buff', function(buff)
    if buff == 310 then
		FighterRoll = false
    end
end)

function self_command(command)
   -- Lock DT
	if command == 'DT' then
		if DT == 1 then
			windower.add_to_chat(121,'DT Unlocked')
			-- make sure other values are set to default
			DT = 0
			-- Place Me in my previous set.
			--if player.status == 'Engaged' then
				previous_set()
			--else
			--	equip(sets.idle.Standard)
			--end
		else		
		-- Set DT set and equip it
			DT = 1
			--if player.status == 'Engaged' then
				previous_set()
			--else
			--	equip(sets.idle.Standard)
			--end
			windower.add_to_chat(121,'DT Set Locked')
		end
--  Lock DW
	elseif command == 'DW' then
		if DW == 1 then		
		-- unlock DW set and equip it
			DW = 0		
			windower.add_to_chat(121,'DW Unlocked')
		-- Place Me in my previous set.
			if player.status == 'Engaged' then
				previous_set()
			else
				equip(sets.idle.Standard)
			end
		else		
		-- lock DW set and equip it
			DW = 1
			if player.status == 'Engaged' then
				previous_set()
			else
				equip(sets.idle.Standard)
			end
			windower.add_to_chat(121,'DW Set Locked')
		end
	elseif command == 'ATK' then
		if ATK == 1 then		
		-- unlock DW set and equip it
			ATK = 0		
			windower.add_to_chat(121,'ATK Unlocked')
		-- Place Me in my previous set.
			if player.status == 'Engaged' then
				previous_set()
			else
				equip(sets.idle.Standard)
			end
		else		
		-- lock DW set and equip it
			ATK = 1
			if player.status == 'Engaged' then
				previous_set()
			else
				equip(sets.idle.Standard)
			end
			windower.add_to_chat(121,'ATK Set Locked')
		end
	end
end

function status_change(new,old)
    if T{'Idle','Resting'}:contains(new) then
		if areas.Town:contains(world.zone) then
			windower.add_to_chat(121, "Town Gear")
			equip(sets.misc.Town)
		else	
			if DT == 1 then
				if buffactive['Weakness'] or player.hpp < 30 then
					equip(sets.idle.DT,{head="Twilight Helm",body="Twilight Mail"})
				else
					equip(sets.idle.DT)
				end
			elseif MDT == 1 then
				equip(sets.idle.MDT)
			elseif new == "Resting" then
				equip(sets.Resting)
			else
				equip(sets.idle.Standard)
			end
		end
	elseif new == 'Engaged' then
		--auto food
		--windower.add_to_chat(123,'Auto Food')
        --send_command('wait 1; input /item "Grape Daifuku" <me>')
 		-- Automatically activate Hasso when engaging
		if player.sub_job == 'SAM' and not buffactive['Hasso'] and not buffactive.Amnesia and not buffactive.Obliviscence and	not buffactive.Paralysis and windower.ffxi.get_ability_recasts()[138] < 1 then
			windower.send_command('Hasso')
        end
		-- Engaged Sets
		if DT == 1 then
			if buffactive['Weakness'] or player.hpp < 30 then
				equip(sets.idle.DT,{head="Twilight Helm",body="Twilight Mail"})
			else
				equip(sets.idle.DT)
			end
		elseif MDT == 1 then
			equip(sets.idle.MDT)
		else
			-- Equip apporiate sets
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

function midcast(spell,arg)	
	if spell.type == 'Ninjutsu' then
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
		if player.status == 'Engaged' then
			previous_set()
		else
			if DT == 1 then
				equip(sets.idle.DT)
			else
				equip(sets.idle.Standard)
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
	local meleeSet = sets.TP
		if DW == 1 and meleeSet.DW then
			meleeSet = meleeSet.DW
		end
		if DT == 1 and meleeSet.DT then
			meleeSet = meleeSet.DT
		end
		--if ATK == 1 and meleeSet.ATK then
			--meleeSet = meleeSet.ATK
		--end
	equip(meleeSet)
end