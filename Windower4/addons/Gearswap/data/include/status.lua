-- Feary's Global Statuses 
-- Created: 6/30/2014
-- Last Updated: 2/18/2017
-- To Do:
--
--

-- Buffs
function buff_change(buff,gain)
	-- Global status 
	if buff == 'charm' and gain then
		windower.send_command('input /p Charmed, Sleep me')
	elseif buff == 'charm' and not gain then
		windower.send_command('input /p Uncharmed')
	end
	-- Encumbrance
	if buff == 'encumbrance' and gain then 
		--windower.add_to_chat('Encumbrance')
	elseif buff == 'encumbrance' and not gain then
		previous_set()
	end
	
	-- Bind
	if buff == 'bind' and gain then
		--windower.send_command('input /p Bound')
	end
	
	-- Haste
	if buff == "Haste" and not gain and S{"MNK","SAM","THF","DRK","WAR","COR","DRG","PUP","PLD"}:contains(player.main_job) then
		--windower.send_command('wait 1;input /p Lost Haste')
		--windower.add_to_chat(121,"Haste")
	end
	
	-- Doom 
	if buff == 'doom' and gain then
		windower.send_command('input /p Doomed')
	elseif buff == 'doom' and not gain then
		--windower.send_command('input /p Doom off Woot -.-')
	end
	
	-- Defense Down
	if buff == 'Defense Down' and gain then
		--windower.send_command('input /p Defense Down')
	end
	
	-- Accuracy Down
	if buff == 'Accuracy Down' and gain then
		if Mode == 0 then
			--windower.send_command('input gs c TP')
		end
		--windower.send_command('input /p Accuracy Down')
	elseif buff == 'Accuracy Down' and not gain then
		--windower.add_to_chat(121. 'input /p Accuracy Down Off')
	end
	
	-- Gravity
	if buff == 'weight' and gain then
		--windower.send_command('input /p Gravity\'d')
	end	
	
	-- Gradual Petrification	
	if buff == 'gradual petrification' and gain then
		--windower.send_command('input /p gradual petrification will need Stona in 15;wait 10;input /p Stona in 5;wait 5;input /p Petrified Stona Please')
	end
	
	-- Slow
	if buff == 'slow' and gain then
		--windower.send_command('input /p Slowed')
	end
	
	-- Phalanx
	if buff == "Phalanx" and gain == true and (S{"RDM","RUN","PLD"}:contains(player.main_job) or player.sub_job == "RDM") then
		--windower.add_to_chat(121,"Phalanx ON")
	elseif buff == "Phalanx" and not gain and (S{"RDM","RUN","PLD"}:contains(player.main_job) or player.sub_job == "RDM") then
		--windower.add_to_chat(121,"Phalanx OFF")
	end 	
	
	-- Crusade
	if buff == "Enmity Boost" and gain == true and S{"RUN","PLD"}:contains(player.main_job) then
		--windower.add_to_chat(121,"Crusade ON")
	elseif buff == "Enmity Boost" and not gain and S{"RUN","PLD"}:contains(player.main_job) then
		--windower.add_to_chat(121,"Crusade OFF")
	end 	
	
	-- By Job
	-- WAR
	if player.main_job == "WAR" then
	
	end
	
	-- MNK
	if player.main_job == "MNK" then
		if buff == 'Boost' and gain == false then
			boostCount = 0
		end
		if buff == 'Max HP Boost' and gain == false then
			windower.send_command('input /p ===== Mantra/HP Boost Off =====')
		end
		if buff == 'Formless Strikes' and gain == false then
			windower.send_command('input /p ===== Formless Strikes Off =====')
		end
		if buff == 'Hundred Fists' and gain == true then
			windower.send_command('input /p ===== Hundred Fists Off =====')
		end
		-- Gain Buffs
		if buff == 'Max HP Boost' and gain == true then
			windower.send_command('input /p ===== Mantra/HP Boost On =====')
		end
		if buff == 'Formless Strikes' and gain == true then
			windower.send_command('input /p ===== Formless Strikes On =====')
		end
		if buff == 'Hundred Fists' and gain == true then
			windower.send_command('input /p ===== Hundred Fists On =====')
		end
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

