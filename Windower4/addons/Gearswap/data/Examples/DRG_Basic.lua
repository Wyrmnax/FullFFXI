-- Get Sets: Everything in this section is run as soon as you change jobs.
function get_sets()
	sets = {}
	petcast = false
	-- Regular Sets --
	sets.Idle = { ammo="Staunch Tathlum +1",
			  head="Sulevia's Mask +1",neck="Twilight Torque",ear1="Etiolation Earring",ear2="Ethereal Earring",
			  body="Tartarus Platemail",hands="Founder's Gauntlets",ring1="Warp Ring",ring2="Defending Ring",
			  back="Shadow Mantle",waist="Flume Belt",legs="Carmine Cuisses +1",feet="Amm Greaves"}
	sets.TP = {	ammo="Ginsen",
			  head="Sulevia's Mask +1",neck="Combatant's Torque",ear1="Telos Earring",ear2="Cessance Earring",
			  body="Pelt. Plackart +1",hands="Emi. Gauntlets +1",ring1="Rajas Ring",ring2="Petrov Ring",
			  back="Brigantia's Mantle",waist="Ioskeha Belt +1",legs="Valor. Hose",feet="Valorous Greaves"}
	sets.WS = {	ammo="Amar Cluster",
			  head="Sulevia's Mask +1",neck="Fotia Gorget",ear1="Telos Earring",ear2="Moonshade Earring",
			  body="Sulevia's Plate. +1",hands="Valorous Mitts",ring1="Ifrit Ring +1",ring2="Rufescent Ring",
			  back="Brigantia's Mantle",waist="Fotia Belt",legs="Sulevi. Cuisses +1",feet="Emi. Gambieras +1"}

    -- Job Ability Sets --
	sets.JA = {}
	sets.JA.Jump = { ammo="Ginsen",
			  head="Sulevia's Mask +1",neck="Combatant's Torque",ear1="Telos Earring",ear2="Cessance Earring",
			  body="Pelt. Plackart +1",hands="Emi. Gauntlets +1",ring1="Rajas Ring",ring2="Petrov Ring",
			  back="Brigantia's Mantle",waist="Ioskeha Belt +1",legs="Valor. Hose",feet="Valorous Greaves"}
	
	sets.JA.Angon = {ammo="Angon",ear1="Dragoon's Earring",hands="Ptero. Fin. G. +1"} -- Angon, Relic Hands, and that dumb earring in Mamook if you feel like it
	sets.JA.AncientCircle = {legs="Vishap Brais +1"} -- Artifact Legs
	
	sets.JA.SpiritLink = {head="Vishap Armet +1",ear1="Pratik Earring",hands="Pel. Vambraces +1",feet="Ptero. Greaves +1"} -- Spirit Link/Empathy gear go here
	sets.JA.SpiritSurge = {neck="Chanoix's Gorget",ear1="Anastasi Earring",ear2="Lancer's Earring",
					body="Ptero. Mail +1",hands="Despair Fin. Gaunt.", 
					back="Updraft Mantle",legs="Vishap Brais +1",feet="Ptero. Greaves +1"} -- Relic Body and Wyvern HP go here
	sets.JA.SteadyWing = sets.JA.SpiritSurge -- Wyvern HP
	sets.JA.SteadyWing['Body'] = "Emicho Haubert" -- Path D Emicho Haubert
	
	-- Casting Sets --
	sets.FastCast = {ammo="Impatiens", -- Can add more FC and Quick Magic here for spells; AF1 head recommended in case of GearSwap error
					 head="Vishap Armet +1",neck="Baetyl Pendant",ear1="Etiolation Earring",ear2="Loquac. Earring",
					 body="Jumalik Mail",hands="Leyline Gloves",	ring1="Lebeche Ring",ring2="Weather. Ring",
																							feet="Carmine Greaves +1"}
	sets.Midcast = {ammo="Staunch Tathlum +1", -- HP or defensive stuff for Healing Breath; can use magic-y stuff too
					head="Vishap Armet +1",neck="Twilight Torque",ear1="Etiolation Earring",ear2="Ethereal Earring",
					body="Jumalik Mail",hands="Founder's Gauntlets",ring1="Meridian Ring",ring2="Weather. Ring",
					back="Xucau Mantle",waist="Glassblower's Belt",legs="Founder's Hose",feet="Amm Greaves"}
	sets.Breath = {ammo="Staunch Tathlum +1",
				   head="Ptero. Armet +1",neck="Lancer's Torque",ear1="Anastasi Earring",ear2="Lancer's Earring",
				   body="Emicho Haubert",hands="Despair Fin. Gaunt.",
				   back="Updraft Mantle",waist="Glassblower's Belt",legs="Vishap Brais +1",feet="Ptero. Greaves +1"}
end


-- Precast: JA and WS should be defined here, Fast Cast and such for magic. 
function precast(spell)
	if spell.type == "WeaponSkill" then
		equip(sets.WS)
	elseif spell.action_type == 'Magic' then 
		equip(sets.FastCast)
	elseif spell.name == 'Dismiss' and pet.hpp < 100 then		
		cancel_spell()
		windower.add_to_chat(50,'  '..pet.name..' is below full HP (<pethpp>), cancelling Dismiss!')
	elseif spell.name == 'Call Wyvern' then
		if pet.isvalid then
		cancel_spell()
		send_command('input /ja "Spirit Link" <me>')
		else
		equip(sets.JA.SpiritSurge) -- Relic Body goes here; can just use Spirit Surge set if you have it augmented
		end
	elseif spell.name == 'Spirit Surge' then
		equip(sets.JA.SpiritSurge)
	elseif spell.name == 'Steady Wing' then
		equip(sets.JA.SteadyWing)
	elseif spell.name == 'Angon' then
		equip(sets.JA.Angon)
	elseif spell.name == 'Ancient Circle' then
		equip(sets.JA.AncientCircle)
	elseif spell.name == 'Spirit Link' then
		if pet.isvalid then
			equip(sets.JA.SpiritLink)
		else
			cancel_spell()
			send_command('input /ja "Call Wyvern" <me>')
		end
	elseif string.find(spell.name,"Jump") then == 'Jump' then
		if not pet.isvalid then 
			if spell.name == "Spirit Jump" then
				cancel_spell()
				send_command('input /ja "Jump" <t>')
				return
			elseif spell.name == "Soul Jump" then
				cancel_spell()
				send_command('input /ja "High Jump" <t>')
				return
			end
		end
		equip(sets.JA.Jump)
	end
end            
 
-- Midcast: For magic, this section affects your spell's potency, accuracy, etc. Unnecessary for JA/WS.
function midcast(spell)
	if spell.action_type == 'Magic' then 
        equip(sets.Midcast)
	end
end

-- Pet Change: Occurs when your Pet is summoned or killed.
function pet_change(pet,gain)
	if gain == false and pet.name then
		-- General announcement for when your Wyvern is killed, Dimissed, or eaten by Spirit Surge
		windower.add_to_chat(50,' *** '..string.upper(pet.name)..' IS DEAD YO ***') 
	end
end

-- Pet Midcast: If GearSwap sees your pet readying a WS, this occurs
function pet_midcast(spell)
	if string.find(spell.name,' Breath') then
		equip_current()		
		windower.send_command('wait 1.2;gs c petcast')
		-- Wyvern Breath Delay: 1.25s http://forum.square-enix.com/ffxi/threads/47481
	end
end
 
-- Aftercast: Occurs following the use of any WS, JA, or Spell
function aftercast(spell)
	equip_current()
end

-- Status Change: When Engaging, Disengaging, Resting, Standing Up, etc.
function status_change()
	equip_current()
end

-- A custom function that equips a set based on whether you're engaged or not
function equip_current()
	if player.status == 'Engaged' then
		equip(sets.TP)
	else
		equip(sets.Idle)
	end
	if petcast == true then
		equip(sets.Breath)
	end
end
 
-- Manual commands sent in-game with //gs c <command>
function self_command(command)
	if command == 'petcast' then -- This command reverts to your regular gear 1.2 seconds after a Breath by default
		petcast = false
		equip_current() 
	end
end