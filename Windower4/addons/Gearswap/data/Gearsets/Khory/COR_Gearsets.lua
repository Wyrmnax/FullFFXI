-- Firetoplay's COR Gear Sets
-- Created:
-- Last Modified: 9/1/2014
-- To Do List
--
--
--
--

if player.name == 'Khory' then
-- includes
	include('include/utility.lua')
	include('include/mappings.lua')
	include('include/equipment.lua')
	-- include('../include/autoexec.lua')
	
-- sets Macros off = 0  on = 1
		automacroset = 1
		if automacroset == 1 then
			if player.sub_job == 'DNC' then
				set_macro_page(1,4)
			elseif player.sub_job == 'NIN' then
				set_macro_page(2,4)
			elseif player.sub_job == 'RNG' then
				set_macro_page(3,4)
			elseif player.sub_job == 'WHM' then 
				set_macro_page(4,4)
			elseif player.sub_job == 'SCH' then 
				set_macro_page(5,4)
			elseif player.sub_job == 'BRD' then 
				set_macro_page(6,4)	
			end
		else
			set_macro_page(1,4)
		end
		
-- Auto Sets
-- Standard/idle
sets.idle.PDT = {    
    ammo="Chrono Bullet",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Meg. Gloves +2",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Telos Earring",
    right_ear="Suppanomimi",
    left_ring="Defending Ring",
    right_ring="Apate Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}

sets.idle.MDT = { 
				ammo="Chrono Bullet",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Meg. Gloves +2",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Telos Earring",
    right_ear="Suppanomimi",
    left_ring="Defending Ring",
    right_ring="Apate Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}

sets.misc.Town = set_combine(sets.idle.PDT, {
				right_ring="Shneddick Ring"
				})
				
sets.idle.Standard = set_combine(sets.idle.PDT, {
				right_ring="Shneddick Ring"
				})
-- Melee TP 
sets.TP = { 
	ammo="Chrono Bullet",
    head={ name="Dampening Tam", augments={'DEX+10','Accuracy+15','Mag. Acc.+15','Quadruple Attack +3',}},
    body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
    hands="Meg. Gloves +2",
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet={ name="Herculean Boots", augments={'Accuracy+30','"Triple Atk."+3','DEX+1',}},
    neck="Lissome Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Brutal Earring",
    right_ear="Cessance Earring",
    left_ring="Ilabrat Ring",
    right_ring="Epona's Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}

-- Melee Accuracy TP
sets.TP.Acc = {	
				 ammo="TPBullet",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Meg. Gloves +2",
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet="Malignance Boots",
    neck="Vim Torque +1",
    waist="Windbuffet Belt +1",
    left_ear="Telos Earring",
    right_ear="Digni. Earring",
    left_ring="Ilabrat Ring",
    right_ring="Epona's Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}

-- RA Sets
sets.precast.Snapshot = {ammo="TPBullet",
	body="Laksa. Frac +2",
	hands="Carmine Fin. Ga. +1",
	wasit="Yemaya Belt",
	legs="Adhemar Kecks",
    feet="Meg. Jam. +2",}
	
-- Eminent Gun
sets.RA = { ammo="TPBullet",
			head="Malignance Chapeau",
    body="Laksa. Frac +2",
    hands="Ikenga's Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist="Yemaya Belt",
    left_ear="Telos Earring",
    right_ear="Neritic Earring",
    left_ring="Dingir Ring",
    right_ring="Ilabrat Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Weapon skill damage +10%',}},
	}
				
sets.RA.Acc = { ammo="TPBullet",
			head="Malignance Chapeau",
    body="Laksa. Frac +2",
    hands="Meg. Gloves +2",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist="Yemaya Belt",
    left_ear="Telos Earring",
    right_ear="Neritic Earring",
    left_ring="Dingir Ring",
    right_ring="Ilabrat Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Weapon skill damage +10%',}},
	}

-- Armageddon 
sets.RA.Armageddon = { ammo="TPBullet",
			head="Malignance Chapeau",
    body="Laksa. Frac +2",
    hands="Meg. Gloves +2",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist="Yemaya Belt",
    left_ear="Telos Earring",
    right_ear="Neritic Earring",
    left_ring="Dingir Ring",
    right_ring="Ilabrat Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Weapon skill damage +10%',}},
	}

sets.RA.Armageddon.Acc = { ammo="TPBullet",
			head="Malignance Chapeau",
    body="Laksa. Frac +2",
    hands="Meg. Gloves +2",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist="Yemaya Belt",
    left_ear="Telos Earring",
    right_ear="Neritic Earring",
    left_ring="Dingir Ring",
    right_ring="Ilabrat Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Weapon skill damage +10%',}},
	}



-- JA
sets.precast.JA["Wild Card"] = {feet="Lanun Bottes"}
sets.precast.JA["Cutting Cards"] = {}

sets.precast.JA["Fold"] = {hands="Lanun Gants"}
sets.precast.JA["Random Deal"] = {body="Lanun Frac +3"}
sets.precast.JA["Snake Eye"] = {legs="Lanun Culottes"}
sets.precast.JA["Triple Shot"] = {body="Nvrch. Frac +2"}
sets.precast.JA["Double-Up"] = set_combine(sets.precast.JA["Phantom Roll"])

-- Corsair Rolls
sets.precast.JA["Phantom Roll"] = {head="Lanun Tricorne", neck="Regal Necklace", hands="Chasseur's Gants +1", rring="Luzaf's Ring"}
sets.precast.JA["Caster's Roll"] = set_combine(sets.precast.JA["Phantom Roll"], {legs="Nvrch. Culottes +2"})
sets.precast.JA["Courser's Roll"] = set_combine(sets.precast.JA["Phantom Roll"], {feet="Navarch's Bottes +2"})
sets.precast.JA["Blitzer's Roll"] = set_combine(sets.precast.JA["Phantom Roll"], {head="Navarch's Tricorne +2"})
sets.precast.JA["Tactician's Roll"] = set_combine(sets.precast.JA["Phantom Roll"], {body="Navarch's Frac +2"})
sets.precast.JA["Allies' Roll"] = set_combine(sets.precast.JA["Phantom Roll"], {hands="Navarch's Gants +2"})

-- Quick Draw 
sets.precast.QD = {}
--Light/Dark Shot
sets.precast.QD.ACC = {
    ammo="QDBullet",
	head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Ikenga's Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Comm. Charm +1",
    waist="Eschan Stone",
    left_ear="Lempo Earring",
    right_ear="Hermetic Earring",
    left_ring="Dingir Ring",
    right_ring="Apate Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
	}
-- Elemental Shots
sets.precast.QD.MAB = {
    ammo="QDBullet",
	head={ name="Herculean Helm", augments={'INT+3','"Mag.Atk.Bns."+20','Magic Damage +23','Mag. Acc.+16 "Mag.Atk.Bns."+16',}},
    body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
    hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    legs={ name="Herculean Trousers", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','Weapon skill damage +3%','INT+4','Mag. Acc.+9','"Mag.Atk.Bns."+6',}},
    feet={ name="Lanun Bottes +2", augments={'Enhances "Wild Card" effect',}},
    neck="Comm. Charm +1",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Hermetic Earring",
    left_ring="Dingir Ring",
    right_ring="Apate Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
	}

sets.precast.JA["Barrage"] =  set_combine(sets.RA.Acc)

-- Weaponskills
-- Melee WS
sets.precast.WS = {
	ammo="TPBullet",
    head={ name="Herculean Helm", augments={'Weapon skill damage +5%','STR+9','Accuracy+7','Attack+8',}},
    body={ name="Herculean Vest", augments={'Accuracy+15','Weapon skill damage +5%',}},
    hands="Meg. Gloves +2",
    legs="Malignance Tights",
    feet={ name="Lanun Bottes +2", augments={'Enhances "Wild Card" effect',}},
    neck="Fotia Gorget",
    waist="Sailfi Belt +1",
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Ilabrat Ring",
    right_ring="Apate Ring",
    back={ name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}

sets.precast.WS["Savage Blade"] = {
	ammo="WSBullet",
    head={ name="Herculean Helm", augments={'Weapon skill damage +5%','STR+9','Accuracy+7','Attack+8',}},
    body={ name="Herculean Vest", augments={'Accuracy+15','Weapon skill damage +5%',}},
    hands="Meg. Gloves +2",
    legs={ name="Herculean Trousers", augments={'Accuracy+20 Attack+20','Weapon skill damage +5%','STR+6','Attack+2',}},
    feet={ name="Lanun Bottes +2", augments={'Enhances "Wild Card" effect',}},
    neck="Comm. Charm +1",
    waist="Sailfi Belt +1",
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Ilabrat Ring",
    right_ring="Apate Ring",
    back={ name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}

-- RA WS
sets.precast.RAWS = {
	ammo="TPBullet",
	head="Malignance Chapeau",
    body="Laksa. Frac +2",
    hands="Meg. Gloves +2",
    legs={ name="Herculean Trousers", augments={'Rng.Acc.+30','Weapon skill damage +4%',}},
    feet="Lanun Bottes +2",
    neck="Iskur Gorget",
    waist="Yemaya Belt",
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Dingir Ring",
    right_ring="Ilabrat Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Weapon skill damage +10%',}},
	}
	
sets.precast.RAWS['Wildfire'] = {    
	ammo="WSBullet",
	head="Malignance Chapeau",
	body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
    hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    legs={ name="Herculean Trousers", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','Weapon skill damage +3%','INT+4','Mag. Acc.+9','"Mag.Atk.Bns."+6',}},
    feet={ name="Lanun Bottes +2", augments={'Enhances "Wild Card" effect',}},
    neck="Comm. Charm +1",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Moldavite Earring",
    left_ring="Dingir Ring",
    right_ring="Apate Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
	}
	
sets.precast.RAWS['Leaden Salute'] = set_combine(sets.precast.RAWS["Wildfire"], {
	head="Pixie Hairpin +1", 
	right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	})


sets.precast.RAWS['Last Stand'] = set_combine(sets.precast.RAWS, {
	waist="Fotia Belt",
	})
					
-- Midcast Sets

-- Aftercast

-- Misc Sets
sets.precast.Fastcast = set_combine(sets.idle.PDT, {head="Athos's Chapeau", lear="Loquac. Earring", rring="Prolix Ring",})

sets.precast.Utsusemi = set_combine(sets.precast.Fastcast, {neck="Magoraga Beads"})

sets.misc.Waltz = {}
sets.misc.Steps = set_combine(sets.TP.ACC)
sets.misc.flourish = {}

end