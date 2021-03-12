-- Feary's Autoexec.lua - Include to Replaces AutoExec Plugin
-- Created on: 2/11/2014
-- Last Updated; 7/25/2014
-- TO Do List
--
--
--
--

	-- Day Change
	windower.register_event('day_change', function(day)
		day = world.day
		windower.add_to_chat(121, '=='..world.day..'==')
	end)
	
	-- Light Luggage
	windower.register_event('zone_change', function()
	-- Delve and Skirmish
		if world.zone == "Cirdas Caverns [U]" then
			windower.add_to_chat(121, "Light Luggage - "..player.name.."'s Delve Profile")
			windower.send_command('ll profile'..player.name..'_Delve')
		elseif world.zone == "Yorcia* [U]" then
		windower.add_to_chat(121, "Light Luggage - "..player.name.."'s Delve Profile")
			windower.send_command('ll profile '..player.name..'_Delve')
		-- Abyssea
		elseif world.zone:wcmatch('Abyssea*') then
			windower.add_to_chat(121, "Light Luggage - "..player.name.."'s Abyssea Profile")
			windower.send_command('ll profile '..player.name..'_Abyssea')
		-- Dynamis
		elseif world.zone:wcmatch('Dynamis*') then
			windower.add_to_chat(121, "Light Luggage - "..player.name.."'s Dynamis Profile")
			windower.send_command('ll profile '..player.name..'_Dynamis')
		-- HNM
		elseif world.zone:wcmatch('Valley*') then
			windower.add_to_chat(121, "Light Luggage - "..player.name.."'s HNM Profile")
			windower.send_command('ll profile '..player.name..'_HNM')
		elseif world.zone:wcmatch('Dragon*') then
			windower.add_to_chat(121, "Light Luggage - "..player.name.."'s HNM Profile")
			windower.send_command('ll profile '..player.name..'_HNM')
		elseif world.zone:wcmatch('*Behemoth*') then
			windower.add_to_chat(121, "Light Luggage - "..player.name.."'s HNM Profile")
			windower.send_command('ll profile '..player.name..'_HNM')
		-- Sky
		elseif world.zone:wcmatch("Ru'Aun*") then
			windower.add_to_chat(121, "Light Luggage - "..player.name.."'s Sky Profile")
			windower.send_command('ll profile '..player.name..'_Sky')
		elseif world.zone:wcmatch("The Shrine of*") then
			windower.add_to_chat(121, "Light Luggage - "..player.name.."'s Sky Profile")
			windower.send_command('ll profile '..player.name..'_Sky')
		-- Sea
		elseif world.zone:wcmatch("Al'Taieu*") then
			windower.add_to_chat(121, "Light Luggage - "..player.name.."'s Sea Profile")
			windower.send_command('ll profile '..player.name..'_Sea')
		elseif world.zone:wcmatch("The Garden of Ru*") then
			windower.add_to_chat(121, "Light Luggage - "..player.name.."'s Sea Profile")
			windower.send_command('ll profile '..player.name..'_Sea')
		elseif world.zone:wcmatch("The Garden of Hu'X*") then
			windower.add_to_chat(121, "Light Luggage - "..player.name.."'s Sea Profile")
			windower.send_command('ll profile '..player.name..'_Sea')
		-- Limbus
		elseif world.zone:wcmatch("Apollyon") then
			windower.add_to_chat(121, "Light Luggage - "..player.name.."'s Limbus Profile")
			windower.send_command('ll profile '..player.name..'_Limbus')
		elseif world.zone:wcmatch("Temenos") then
			windower.add_to_chat(121, "Light Luggage - "..player.name.."'s Limbus Profile")
			windower.send_command('ll profile '..player.name..'_Limbus')
		-- Neo Nyzul
		elseif world.zone:wcmatch("Nyzul*") then
			windower.add_to_chat(121, "Light Luggage - "..player.name.."'s Nyzul Profile")
			windower.send_command('ll profile '..player.name..'_Nyzul')
		-- Salvage
		elseif world.zone:wcmatch("*Remenants") then
			windower.add_to_chat(121, "Light Luggage - "..player.name.."'s Salvage Profile")
			windower.send_command('ll profile '..player.name..'_Salvage')
		-- Einherjar
		elseif world.zone:wcmatch("Hazhalm Testing Grounds") then
			windower.add_to_chat(121, "Light Luggage - "..player.name.."'s Einherjar Profile")
			windower.send_command('ll profile '..player.name..'_Einherjar')
		-- WalkofEchoes
		elseif world.zone:wcmatch("Walk of Echoes") then
			windower.add_to_chat(121, "Light Luggage - "..player.name.."'s Walk of Echoes Profile")
			windower.send_command('ll profile '..player.name..'_WalkofEchoes')
		-- Provenance
		elseif world.zone:wcmatch("Provenance") then
			windower.add_to_chat(121, "Light Luggage - "..player.name.."'s Provenance Profile")
			windower.send_command('ll profile '..player.name..'_Provenance')
		-- Legion
		elseif world.zone:wcmatch("*Legion") then
			windower.add_to_chat(121, "Light Luggage - "..player.name.."'s Legion Profile")
			windower.send_command('ll profile '..player.name..'_Legion')
		-- Meebles
		elseif world.zone:wcmatch("Ghoyu's Reverie") then
			windower.add_to_chat(121, "Light Luggage - "..player.name.."'s Meebles Profile")
			windower.send_command('ll profile '..player.name..'_Meebles')
		elseif world.zone:wcmatch("Ruhotz Silvermines") then
			windower.add_to_chat(121, "Light Luggage - "..player.name.."'s Meebles Profile")
			windower.send_command('ll profile '..player.name..'_Meebles')
		elseif world.zone:wcmatch("Everbloom Hollow") then
			windower.add_to_chat(121, "Light Luggage - "..player.name.."'s Meebles Profile")
			windower.send_command('ll profile '..player.name..'_Meebles')
		else
			windower.add_to_chat(121, "Light Luggage - "..player.name.."'s Default Profile")
			windower.send_command('ll profile default')
		end
	end)