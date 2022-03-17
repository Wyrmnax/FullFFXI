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
	
	send_command('lua reload autocor')
	
-- sets Macros off = 0  on = 1
		automacroset = 1
		if automacroset == 1 then
			if player.sub_job == 'DNC' then
				set_macro_page(1,4)
			elseif player.sub_job == 'NIN' then
				set_macro_page(1,4)
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
		
	sets.MeleeEvis = { 
	main="Tauret",
    sub={ name="Demers. Degen +1", augments={'Path: A',}},
    range={ name="Anarchy +3", augments={'Delay:+60','TP Bonus +1000',}},
	}
		
	sets.MeleeSB = { 
	main="Naegling",
    sub={ name="Demers. Degen +1", augments={'Path: A',}},
    range={ name="Anarchy +3", augments={'Delay:+60','TP Bonus +1000',}},
	}
	
	sets.MeleeLeaden = { 
	main={ name="Rostam", augments={'Path: A',}},
    sub={ name="Demers. Degen +1", augments={'Path: A',}},
    range={ name="Death Penalty", augments={'Path: A',}},
	}
	
	sets.RangedLastStand = { 
	main="Kustawi +1",
    sub="Nusku Shield",
    range="Fomalhaut",
	}
	
	sets.RangedLeaden = { 
	main={ name="Rostam", augments={'Path: A',}},
    sub="Kustawi +1",
    range={ name="Death Penalty", augments={'Path: A',}},
	}
	
	send_command('wait 3;input /lockstyleset 8')
		
-- Auto Sets
-- Standard/idle
sets.idle.PDT = {    	
	ammo="Chrono Bullet",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Lissome Necklace",
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Suppanomimi",
    left_ring="Defending Ring",
    right_ring="Epona's Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
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
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Lissome Necklace",
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Suppanomimi",
    left_ring="Petrov Ring",
    right_ring="Epona's Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}

-- RA Sets
sets.precast.Snapshot = {ammo="TPBullet",
	body="Laksa. Frac +3",
	hands="Carmine Fin. Ga. +1",
	wasit="K. Kachina Belt +1",
	legs="Adhemar Kecks",
    feet="Meg. Jam. +2",}
	
-- Shooting
sets.RA = { ammo="TPBullet",
			head="Malignance Chapeau",
    body="Laksa. Frac +3",
    hands="Ikenga's Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist="K. Kachina Belt +1",
    left_ear="Telos Earring",
    right_ear="Beyla Earring",
    left_ring="Dingir Ring",
    right_ring="Regal Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}},
	}
				
sets.RA.Acc = { ammo="TPBullet",
			head="Malignance Chapeau",
    body="Laksa. Frac +3",
    hands="Meg. Gloves +2",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist="K. Kachina Belt +1",
    left_ear="Telos Earring",
    right_ear="Beyla Earring",
    left_ring="Dingir Ring",
    right_ring="Regal Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}},
	}


-- JA
sets.precast.JA["Wild Card"] = {feet="Lanun Bottes +3"}
sets.precast.JA["Cutting Cards"] = {}

sets.precast.JA["Fold"] = {hands="Lanun Gants"}
sets.precast.JA["Random Deal"] = {body="Lanun Frac +3"}
sets.precast.JA["Snake Eye"] = {legs="Lanun Culottes"}
sets.precast.JA["Triple Shot"] = {body="Nvrch. Frac +2"}
sets.precast.JA["Double-Up"] = set_combine(sets.precast.JA["Phantom Roll"])

-- Corsair Rolls
sets.precast.JA["Phantom Roll"] = {main={ name="Rostam", augments={'Path: C',}}, ranged="Compensator", head="Lanun Tricorne", neck="Regal Necklace", hands="Chasseur's Gants +1", rring="Luzaf's Ring"}
sets.precast.JA["Caster's Roll"] = set_combine(sets.precast.JA["Phantom Roll"], {legs="Nvrch. Culottes +2"})
sets.precast.JA["Courser's Roll"] = set_combine(sets.precast.JA["Phantom Roll"], {feet="Navarch's Bottes +2"})
sets.precast.JA["Blitzer's Roll"] = set_combine(sets.precast.JA["Phantom Roll"], {head="Navarch's Tricorne +2"})
sets.precast.JA["Tactician's Roll"] = set_combine(sets.precast.JA["Phantom Roll"], {body="Navarch's Frac +2"})
sets.precast.JA["Allies' Roll"] = set_combine(sets.precast.JA["Phantom Roll"], {hands="Navarch's Gants +2"})

sets.MaxDuration = {sub={ name="Rostam", augments={'Path: C',}}, reanged="Compensator"}

-- Quick Draw 
sets.precast.QD = {}
--Light/Dark Shot
sets.precast.QD.ACC = {
    ammo="Living Bullet",
	head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Nyame Gauntlets",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Comm. Charm +2",
    waist="Eschan Stone",
    left_ear="Lempo Earring",
    right_ear="Hermetic Earring",
    left_ring="Dingir Ring",
    right_ring="Regal Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
	}
-- Elemental Shots
sets.precast.QD.MAB = {
    ammo="Living Bullet",
	head="Nyame Helm",
    body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
    neck={ name="Comm. Charm +2", augments={'Path: A',}},    
	waist="Orpheus's Sash",
    left_ear="Friomisi Earring",
    right_ear="Hermetic Earring",
    left_ring="Dingir Ring",
    right_ring="Regal Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
	}

sets.precast.JA["Barrage"] =  set_combine(sets.RA.Acc)

-- Weaponskills
-- Melee WS
sets.precast.WS = {
	ammo="TPBullet",
	head="Nyame Helm",
    body="Nyame Mail",
    hands="Meg. Gloves +2",
    legs="Nyame Flanchard",
    feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
    neck="Fotia Gorget",
    waist="Sailfi Belt +1",
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Ilabrat Ring",
    right_ring="Regal Ring",
    back={ name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}

sets.precast.WS["Savage Blade"] = {
	ammo="WSBullet",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Meg. Gloves +2",
    legs="Nyame Flanchard",
    feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
    neck="Comm. Charm +2",
    waist="Sailfi Belt +1",
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Ilabrat Ring",
    right_ring="Regal Ring",
    back={ name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},}


-- RA WS
sets.precast.RAWS = {
	ammo="TPBullet",
	head="Nyame helm",
    body="Laksa. Frac +3",
    hands="Meg. Gloves +2",
    legs="Nyame Flanchard",
    feet="Lanun Bottes +3",
    neck="Comm. Charm +2",
    waist="K. Kachina Belt +1",
    left_ear="Beyla Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Dingir Ring",
    right_ring="Regal Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}},
	}
	
sets.precast.RAWS['Wildfire'] = {    
	ammo="Living Bullet",
	head="Nyame helm",
	body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
    neck="Comm. Charm +2",
    waist="Orpheus's Sash",
    left_ear="Friomisi Earring",
    right_ear="Sortiarius Earring",
    left_ring="Dingir Ring",
    right_ring="Ilabrat Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
	}
	
sets.precast.RAWS['Leaden Salute'] = set_combine(sets.precast.RAWS["Wildfire"], {
	head="Pixie Hairpin +1", 	
    right_ring="Archon Ring",
	right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	})


sets.precast.RAWS['Last Stand'] = set_combine(sets.precast.RAWS, {
	wait="Fotia Belt",
	})

sets.precast.RAWS['Hot Shot'] = set_combine(sets.precast.RAWS, {	
	ammo="Living Bullet",
	head="Nyame helm",
	body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
    neck="Comm. Charm +2",
    waist="Orpheus's Sash",
    left_ear="Friomisi Earring",
    right_ear="Sortiarius Earring",
    left_ring="Dingir Ring",
    right_ring="Ilabrat Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
	})
	
	
sets.precast.WS["Aeolian Edge"] = set_combine(sets.precast.RAWS["Wildfire"], {
	})
					
-- Midcast Sets

-- Aftercast

-- Misc Sets
sets.precast.Fastcast = set_combine(sets.idle.PDT, {head="Athos's Chapeau", lear="Enchntr. Earring +1", rring="Prolix Ring",})

sets.precast.Utsusemi = set_combine(sets.precast.Fastcast, {neck="Magoraga Beads"})

sets.misc.Waltz = {}
sets.misc.Steps = set_combine(sets.TP.ACC)
sets.misc.flourish = {}

end