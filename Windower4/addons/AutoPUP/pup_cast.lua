local cast = {}

-- Takes a JA name as a string and sends the command
function cast.JA(ja_name_string_en)
	windower.send_command('input /ja "%s" <me>':format(ja_name_string_en))
end

-- Loops through the current buffs looking for "short_name maneuver"
-- if found, it returns the count of how many are active
function cast.check_maneuver_count(man, buffs)
	-- cycle through all current buffs
	for k,v in pairs(buffs) do
		-- match maneuver short name e.g. thunder
		if (k == "%s maneuver":format(man)) then
			-- return number of active maneuver buffs
			return v
		end
	end
	-- return 0 if no maneuver buffs
	return 0
end

-- Finds the first maneuver in settings.maneuvers that is not active
-- and returns the long_name.
function cast.check_maneuver(maneuver_list,buffs)
	-- for each maneuver
	for maneuver_short_name,num in pairs(maneuver_list) do
		-- check how many of maneuver are active
		local count = cast.check_maneuver_count(maneuver_short_name, buffs)
		-- check how many there are against how many are required
		if count < num then
			-- get the long name
			local maneuver_long_name = get.maneuvers[maneuver_short_name][1]
			-- why do we check this is set if we just set it?
			if maneuver_long_name and windower.ffxi.get_ability_recasts()[210] <= 0 then -- 210 is Maneuvers JA
				return maneuver_long_name
			end
		end
	end
	return false
end

return cast
