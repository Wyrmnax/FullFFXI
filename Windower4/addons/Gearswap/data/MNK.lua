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
	--include('include/macro.lua')

	-- Get MNK Gearsets
	include('Gearsets/'..player.name..'/Mnk_Gearsets.lua')
	
-- Define Default Values for Variables
	nexttime = os.clock()	
	del = 1.3
	castingimpetus = 0
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
    previous_set()
end

windower.register_event('prerender',function ()	
	-------------------------------------------------------
    local curtime = os.clock()
    if nexttime + del <= curtime then
        nexttime = curtime
		castingimpetus = castingimpetus - del
        --del = 1.3
        local play = windower.ffxi.get_player()
        local abil_recasts = windower.ffxi.get_ability_recasts()
		if player.status == 'Engaged' then	
			if not buffactive['Impetus'] and not buffactive['Footwork'] and abil_recasts[31] == 0 then 				
				windower.send_command('Impetus')
				castingimpetus = 10
			end						
			if (not buffactive['Impetus']) and (not buffactive['Footwork']) and (abil_recasts[31] ~= 0) and (abil_recasts[21] == 0) and (castingimpetus < 0) then
				windower.send_command('Footwork')
			end
			if buffactive['Impetus'] and abil_recasts[13] == 0 then
				windower.send_command('Focus')					
			end
        end
		if player.hpp < 50 then
			if abil_recasts[15] == 0 then
				windower.send_command('Chakra')				
			end
		end
    end
end)

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
							equip(sets.precast.WS[spell.name].Impetus)
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
	if player.status == 'Engaged' then
		if spell and spell.name == 'Footwork' then
			equip(sets.TP.Footwork)
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
	if player.status == 'Engaged' then
		if buffactive['Impetus'] then
			equip(sets.TP.Impetus)
		elseif buffactive['Footwork'] then
			equip(sets.TP.Footwork)
		else
			equip(sets.TP)
		end
	else 
		if areas.Town:contains(world.zone) then
			windower.add_to_chat(121, "Town Gear")
			equip(sets.misc.Town)
		else
			equip(sets.idle)
		end
	end
end