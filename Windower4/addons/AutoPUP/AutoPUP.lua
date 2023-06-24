_addon.author = 'dtw'
_addon.commands = {'autopup','pup'}
--_addon.commands = {'on','off','help','list','set','saveset','save','show'}
_addon.name = 'AutoPUP'
_addon.version = '2.0.0.0'

require('luau')
require('pack')
require('logger')
require('tables')

packets = require('packets')
texts = require('texts')
config = require('config')

get = require('pup_get')
cast = require('pup_cast')

defaults = {
	-- set the delay
	delay=1,
	-- show active manuevers in display_box
	active=true,
	-- toggle automatic cooldown on overload
	AutoCooldown=false,
	-- toggle actions off on overload
	AutoOff=true,
	-- auto-stop on exit from "content"
	AutoStop=true,
	-- default maneuvers
	maneuver_sets={default={wind=1,light=1,fire=1}},
	-- text size
	box={text={size=10}}
	}

settings = config.load(defaults)

-- set del (some delay) to zero on first run
del = 0
-- a counter?
counter = 0
-- how often to run main_function()
interval = 1
-- set the active maneuvers to the default
maneuvers = table.copy(settings.maneuver_sets.default)
-- turn on the addon
enabled = true

local display_box = function()
	local str
	-- set the status string
	if enabled then
			str = _addon.name..': Actions [On]'
	else
			str = _addon.name..': Actions [Off]'
	end
	if paused then
			str = _addon.name..': Actions [Paused]'
	end
	-- return the string now if show active maneuvers is Off
	if not settings.active then return str end
	-- show active maneuvers
	for k,v in pairs(maneuvers) do
			str = str..'\n %s:[x%d]':format(k:ucfirst(),v)
	end
	-- return the string
	return str
end

pup_status = texts.new(display_box(),settings.box,settings)
pup_status:show()

-- get player
local player = windower.ffxi.get_player()

function enabled_check()
  return enabled
end

function overload_handling()
	-- if AutoCooldown is true and cooldown is off recast then use it
	if settings.AutoCooldown and windower.ffxi.get_ability_recasts()[114] <= 0 then -- Cooldown
		cast.JA("Cooldown")
		-- set a longer delay than usual? Give time for JA to fire?
		del = 1.2
	-- if AutoOff is true then switch off actions
	elseif settings.AutoOff then
		enabled = false
	end
end

function main_function()
	-- update the interval since main_function last run
	counter = counter + interval
	-- if the interval since last main_function is more than some delay (del - 0 by default) then try and run again
	if counter > del then
		-- enough time has elapsed so reset the counter
		counter = 0
		-- del is now interval so need at least two loops to trigger main_function
		del = interval
		-- if can't get player, we're not PUP or status is not equal to 1 or 0 then end
		if not player or player.main_job ~= 'PUP' or (player.status ~= 1 and player.status ~= 0) then return end
		-- check we have a pet?
		if player ~= nil then
			local player_mob = windower.ffxi.get_mob_by_id(player.id)
			if player_mob ~= nil then
				local pet_index = player_mob.pet_index
				if pet_index == nil then return end
			end
		end
		-- get buffs
		local buffs = get.buffs()
		-- are we overloaded?
		if buffs.overload then
			overload_handling()
		end
		-- do nothing if we can't do anything
		if casting or paused or buffs.amnesia or buffs.stun or buffs.sleep or buffs.charm or buffs.terror or buffs.petrification or buffs.overload then return end
		-- check for if there are any inactive maneuvers that should be active
		local maneuver = cast.check_maneuver(maneuvers,buffs)
		-- there could be no inactive maneuvers so check not false
		if maneuver then
			cast.JA(maneuver)
			-- set standard delay
			del = settings.delay
			return
		end
	end
end

function list_maneuver_sets()
    log('Listing maneuver sets:')
    for key,_ in pairs(settings.maneuver_sets) do
        if key ~= 'default' then
            log('\t' .. key)
        end
    end
end

main_function:loop(interval,enabled_check)

windower.register_event('incoming chunk', function(id,original,modified,injected,blocked)
		-- this checks if we're casting
	if id == 0x028 then
		local packet = packets.parse('incoming', original)
		if packet['Actor'] ~= windower.ffxi.get_mob_by_target('me').id then return false end
		if packet['Category'] == 8 then
			if (packet['Param'] == 24931) then
			-- Begin Casting
				casting = true
			elseif (packet['Param'] == 28787) then
			-- Failed Casting
				casting = false
				del = 2.5
			end
		elseif packet['Category'] == 4 then
			-- Finish Casting
			casting = false
			-- set standard delay
			del = settings.delay
		elseif L{3,5}:contains(packet['Category']) then
			casting = false
		elseif L{7,9}:contains(packet['Category']) then
			casting = true
		end
	end
end)

windower.register_event('addon command', function(...)
	local commandArgs = {...}
	-- convert any autotrans in Args and overwrite Arg
	for x=1,#commandArgs do commandArgs[x] = windower.convert_auto_trans(commandArgs[x]) end
	-- handle toggle with addon name and on/off
	if not commandArgs[1] or S{'on','off'}:contains(commandArgs[1]) then
		-- no args at all - toggle actions
		if not commandArgs[1] then
			enabled = not enabled
			-- if "on"
			if enabled then
				main_function:loop(interval,enabled_check)
			end
		-- if "on"
		elseif commandArgs[1] == 'on' then
			enabled = true
			main_function:loop(interval,enabled_check)
		-- if "off"
		elseif commandArgs[1] == 'off' then
			enabled = false
		end
		log('Actions %s':format(enabled and 'On' or 'Off'))
	elseif commandArgs[1] == 'list' then
		list_maneuver_sets()
	elseif commandArgs[1] == 'help' then
		log('Auto maneuvers command list:')
		log('  1. help - Brings up this menu.')
		log('  2. on/off - enables/disables auto maneuvers.')
		log('  3. list - list all maneuver sets.')
		log('  4. set <setname> - set pre-defined list of maneuvers.')
		log('  5. saveset <setname> - save current manuever config as a pre-defined set.')
		log('  6. save - save ALL settings for current user.')
	else
		-- save settings
		if commandArgs[1] == 'save' then
			-- this must be a built-in
			settings:save()
			log('settings Saved.')
		-- update active maneuvers
		-- get.maneuvers from pup_get.lua - check commandArgs[1] is a valid short maneuver name
		elseif get.maneuvers[commandArgs[1]] and commandArgs[2] then
			-- store this int to n so we can validate
			local n = tonumber(commandArgs[2])
			-- check n is between 1 and 3
			if n > 0 and n <= 3 then -- surely we just set n so why check?
				-- count how many maneuvers are currently set
				local total_man = 0
				for k,v in pairs(maneuvers) do
					-- if manuevers already set for this element, ignore that count and use the new count
					if k == commandArgs[1] then
						total_man = total_man + n
						-- since n is accounted for in total_man
						n = 0
					else
						total_man = total_man + v
					end
				end
				-- store or error if too many
				if total_man + n > 3 then
					error('Total maneuvers count (%d) exceeds 3':format(total_man + n))
				else
					maneuvers[commandArgs[1]] = tonumber(commandArgs[2])
					log('%s x%d':format(commandArgs[1],commandArgs[2]))
				end
			-- remove all commandArgs[1] maneuvers
			elseif commandArgs[2] == '0' or commandArgs[2]:lower() == 'off' then
				maneuvers[commandArgs[1]] = nil
				log('%s Off':format(commandArgs[1]))
			-- throw an error
			-- elseif n then  -- we set n so why check?
			else
				error('%d exceeds the min/max value for %s.':format(commandArgs[2],commandArgs[1]))
			end
		-- handle saving sets
		elseif commandArgs[1]:lower() == 'saveset' then
			if not commandArgs[2] then
				error('set name required!')
			elseif commandArgs[2]:lower() == 'default' then
        error('please choose a name other than default.')
			else
				settings.maneuver_sets[commandArgs[2]] = maneuvers
				config.save(settings, 'all')
				notice('set '..commandArgs[2]..' saved.')
			end
		-- handle setting sets (sets, sets, sets!)
		elseif commandArgs[1]:lower() == 'set' then
			if not commandArgs[2] then
				error('set name required!')
			else
				maneuvers = table.copy(settings.maneuver_sets[commandArgs[2]])
				notice('maneuvers set to '..commandArgs[2]..'.')
			end
		-- update settings with number values e.g. delay
		elseif type(settings[commandArgs[1]]) == 'number' and commandArgs[2] and tonumber(commandArgs[2]) then
			settings[commandArgs[1]] = tonumber(commandArgs[2])
			log('%s is now set to %d':format(commandArgs[1],settings[commandArgs[1]]))
		-- toggle settings with boolean values e.g. AutoOff
		elseif type(settings[commandArgs[1]]) == 'boolean' then
			if (not commandArgs[2] and settings[commandArgs[1]] == true) or (commandArgs[2] and commandArgs[2] == 'off') then
				settings[commandArgs[1]] = false
			elseif (not commandArgs[2] and settings[commandArgs[1]] == false) or (commandArgs[2] and commandArgs[2] == 'on') then
				settings[commandArgs[1]] = true
			end
			log('%s %s':format(commandArgs[1],settings[commandArgs[1]] and 'On' or 'Off'))
			-- save these settings for the current character
			settings:save()
		-- some debug option!
		elseif commandArgs[1]:lower() == 'eval' then
			assert(loadstring(table.concat(commandArgs, ' ',2)))()
		else
			error('Unknown command: '..commandArgs[1])
		end
	end
	pup_status:text(display_box())
end)

function event_change()
	settings.actions = false
	casting = false
	paused = false
	pup_status:text(display_box())
end

function status_change(new,old)
	casting = false
	if new == 2 or new == 3 then
		event_change()
		return
	elseif new == 33 then
		paused = true
		warning('Actions Paused')
	elseif old == 33 then
		paused = false
		log('Actions Resumed')
	end
	pup_status:text(display_box())
end

windower.register_event('status change', status_change)
windower.register_event('zone change','job change','logout','unload', event_change)

windower.register_event('lose buff', function(buff_id)
	-- check buff_ids - leave battlefield (lvl restriction), Reive, Campaign, Besieged, Battlefield, Confrontation, Visitant, Voidwatcher, Pennant, Elvorseal
	if settings.AutoStop and S{143,511,267,257,254,276,285,475,292,603}:contains(tonumber(buff_id)) then
		-- stop everything
		event_change()
	end
end)

windower.register_event('gain buff', function(buff_id)
	-- check buff_ids - Invisible
	if settings.AutoStop and S{69}:contains(tonumber(buff_id)) then
		-- stop everything
		event_change()
	end
end)
