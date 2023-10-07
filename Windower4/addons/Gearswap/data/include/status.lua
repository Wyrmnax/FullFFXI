-- Feary's Global Statuses 
-- Created: 6/30/2014
-- Last Updated: 2/18/2017
-- To Do:
--
--

-- Buffs
function buff_change(buff,gain)
	-- Global status 
	
	-- Doom 
	if buff == 'doom' and gain then
		windower.send_command('input /p Doomed')
	elseif buff == 'doom' and not gain then
		--windower.send_command('input /p Doom off Woot -.-')
	end	
	
	-- By Job
	-- WAR
	if player.main_job == "WAR" then
	
	end
	
	-- MNK
	if player.main_job == "MNK" then
	
	end
	
	-- WHM
	if player.main_job == "WHM" then
			
	end
	
	if player.main_job == "BLM" then
		if buff == "Manawall" and not gain then
			enable('feet','back') 
		end
	end
	
	-- THF
	if player.main_job == "THF" then
		-- Sneak Attack
		if buff == 'Sneak Attack' and not gain then
			previous_set()
		end
		-- Trick Attack
		if buff == 'Trick Attack' and not gain then
		   previous_set()
		end

		-- Flee
		if buff == 'Flee' and gain then
			equip(sets.idle.PDT,{feet="Pillager's Poulaines"})
			windower.add_to_chat(121,'Flee Boots')
		end
		
		if buff == 'Flee' and not gain then
			equip(sets.idle.PDT,{feet="Fajin Boots"})
			windower.add_to_chat(121,'Standard Boots')
		end
		
		-- Feint
		if buff == 'Feint' and gain == false then
			equip(sets.precast.JA['Feint'])
			if player.status == 'Engaged' then
				previous_set()
			else	
				if Mode == 4 then
					equip(sets.idle.Standard,sets.idle.Evasion)
				else
					equip(sets.idle.Standard)
				end
			end
		end
	end
	
	-- PLD
	if player.main_job == "PLD" then
	
	end
	
	-- BRD
	if player.main_job == "BRD" then
		
	end
	
	
end

