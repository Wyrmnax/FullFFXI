-- Feary's MNK LUA
-- Created: 1/18/2014
-- Last Updated: 4/20/2014
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
--includes
	--include('include/autoexec.lua')
	include('include/binds.lua')
	include('include/utility.lua')
	include('include/macro.lua')

	-- Get MNK Gearsets
	include('Gearsets/'..player.name..'/Mnk_Gearsets.lua')
	
-- Define Default Values for Variables
	boostCount = 0
	Mode = 0
	PDT = 0
	MDT = 0
	ShadowType = 'None'
end -- End gear sets

-- Called when this job file is unloaded (eg: job change)
function file_unload()
	clear_binds()
end

-- Rules
function self_command(command)
-- Lock PDT
end
	
function status_change(new,old)
-- Autoset
    previous_set()
end

function self_command(cmd)
    if cmd == 'ws' then
		--if player.tp == 3000 and not buffactive.Aftermath then
		--	windower.send_command('input /ws "Final Heaven" <t>')
		--elseif buffactive.Footwork then
		if buffactive.Footwork then
			windower.send_command('input /ws "Tornado Kick" <t>')	
        elseif player.tp < 1500 then
            windower.send_command('input /ws "Victory Smite" <t>')
        else
            windower.send_command('input /ws "Raging Fists" <t>')
        end
    end
end

function precast(spell,arg)
 -- Generic equip command for all Job Abilities and Weaponskills
    if sets.precast.JA[spell.name] then
        equip(sets.precast.JA[spell.name])
   elseif sets.precast.WS[spell.name] then
		if player.status == 'Engaged' then
			if player.tp >= 100 then
				if spell.target.distance <= 5 then
					if sets.precast.WS[spell.name] then
						if buffactive['Impetus'] then
							equip(sets.precast.WS[spell.name],{body="Bhikku Cyclas +3"})
						else
							equip(sets.precast.WS[spell.name])
						end						
					else
						windower.add_to_chat(121,'Default WS Gear')
						equip(sets.precast.WS)
					end
				else
					cancel_spell()
					windower.add_to_chat(121, 'Canceled '..spell.name..'.'..spell.target.name..' is Too Far')
				end
			else 
				cancel_spell()
				windower.add_to_chat(121, ''..player.tp..'tp is not enough to WS')
			end
		else
			cancel_spell()
			windower.add_to_chat(121, 'You must be Engaged to WS')
		end
    end

 -- Ninjutsu spell gear handling(Precast)
    if spell.skill == 'Ninjutsu' then
        equip(sets.precast.Fastcast)
        if windower.wc_match(spell.name,'Utsusemi*') then
            equip(sets.precast.Utsusemi)
        end
    end


 -- Special handling to remove Dancer sub job Sneak effect
    if spell.name == 'Spectral Jig' and buffactive.Sneak then
        windower.ffxi.cancel_buff(71)
        cast_delay(0.3)
    elseif windower.wc_match(spell.name,'Curing*') then
        equip(sets.misc.Waltz)
    elseif windower.wc_match(spell.name,'*Step') then
        equip(sets.TP.HighAcc)
    end
end

function midcast(spell,arg)
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

function previous_set()
	windower.add_to_chat(121, "Previous set")
	if player.status == 'Engaged' then
		windower.add_to_chat(121, "Engaged")
		--windower.add_to_chat(121, "buffactive['Impetus']" ..buffactive['Impetus'])
		windower.add_to_chat(121, "buffactive['Footwork']" ..buffactive['Footwork'])
		if buffactive['Impetus'] then
			windower.add_to_chat(121, "Impetus Up")
			equip(sets.TP.Impetus)
		elseif buffactive['Footwork'] then
			windower.add_to_chat(121, "Footwork Up")
			equip(sets.TP.Footwork)
		else
			equip(sets.TP)
		end
	else 
		if areas.Town:contains(world.zone) then
			windower.add_to_chat(121, "Town Gear")
			equip(sets.misc.Town)
		else
			equip(sets.idle.DT)
		end
	end
end