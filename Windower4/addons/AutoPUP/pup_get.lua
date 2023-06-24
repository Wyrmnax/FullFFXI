local get = {}

get.maneuvers = {
	fire = {'Fire Maneuver'},
	ice = {'Ice Maneuver'},
	wind = {'Wind Maneuver'},
	earth = {'Earth Maneuver'},
	thunder = {'Thunder Maneuver'},
	water = {'Water Maneuver'},
	light = {'Light Maneuver'},
	dark = {'Dark Maneuver'},
	}

-- Index buffs by lowercase name and store a count as value
function get.buffs()
  local set_buff = {}
  for _, buff_id in ipairs(windower.ffxi.get_player().buffs) do
    local buff_en = res.buffs[buff_id].en:lower()
		-- sets the value for index buff_en to the value of buff_en if it already exists OR 0, then adds 1
		-- effectively increments existing indexes and sets new indexes to 1
    set_buff[buff_en] = (set_buff[buff_en] or 0) + 1
  end
  return set_buff
end

return get
