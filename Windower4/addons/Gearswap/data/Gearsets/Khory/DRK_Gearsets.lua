-- DRK Gear_sets
-- Created: 7/13/2014
-- Last Modified: 7/13/2014
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
			if player.sub_job == 'NIN' then
				set_macro_page(1,9)
			elseif player.sub_job == 'SAM' then
				set_macro_page(1,9)
			elseif player.sub_job == 'WAR' then
				set_macro_page(1,9)
			elseif player.sub_job == 'DNC' then 
				set_macro_page(3,9)
			elseif player.sub_job == 'DRG' then 
				set_macro_page(2,9)
			elseif player.sub_job == 'MNK' then 
				set_macro_page(1,9)
			elseif player.sub_job == 'WHM' then 
				set_macro_page(1,9)
			elseif player.sub_job == 'RDM' then 
				set_macro_page(1,9)
			elseif player.sub_job == 'SCH' then 
				set_macro_page(1,9)
			end
		else
			set_macro_page(1,9)
		end
		
	send_command('wait 3;input /lockstyleset 11')
		
-- Auto Sets
-- Standard/idle
sets.idle = { 
	ammo="Staunch Tathlum +1",
    head={ name="Sakpata's Helm", augments={'Path: A',}},
    body="Sacro Breastplate",
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs="Sakpata's Cuisses",
    feet="Sakpata's Leggings",
    neck="Coatl Gorget +1",
    waist="Flume Belt +1",
    left_ear="Eabani Earring",
    right_ear="Etiolation Earring",
    left_ring="Stikini Ring +1",
    right_ring="Shneddick Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}


sets.Enmity = {}

-- TP set
sets.TP = { 
	ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Flam. Zucchetto +2",
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs="Sakpata's Cuisses",
    feet="Flam. Gambieras +2",
    neck="Abyssal Beads +2",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Cessance Earring",
    right_ear="Schere Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Moonlight Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}

-- JA
sets.precast.JA["Blood Weapon"] = {body="Abyss Cuirass +2"}
sets.precast.JA["Soul Enslavement"] = {}

sets.precast.JA["Souleater"] = {head="Chaos Burgeonet"}
sets.precast.JA["Last Resort"] = {feet="Abyss Sollerets +2"}
sets.precast.JA["Arcane Circle"] = {feet="Chaos Sollerets"}
sets.precast.JA["Arcane Crest"] = {}
sets.precast.JA["Dark Seal"] = {head="Fall. Burgeonet +3"}
sets.precast.JA["Weapon Bash"] = {hands="Chaos Gauntlets"}
sets.precast.JA["Diabolic Eye"] = {hands="Abyss Gauntlets +2"}
sets.precast.JA["Nether Void"] = {legs = "Heath. Flanchard +3"}

sets.precast.JA["Provoke"] = {}
sets.precast.JA["Berserk"] = {}
sets.precast.JA["Defender"] = {}
sets.precast.JA["Warcry"] = {}
sets.precast.JA["Aggressor"] = {}

-- Magic 
sets.precast.Fastcast = {
	ammo="Sapience Orb",
    head={ name="Fall. Burgeonet +3", augments={'Enhances "Dark Seal" effect',}},
    body="Sacro Breastplate",
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs="Heath. Flanchard +3",
    feet={ name="Odyssean Greaves", augments={'Enmity+5','Crit.hit rate+1','Phalanx +3','Accuracy+8 Attack+8','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},
    neck="Voltsurge Torque",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Enchntr. Earring +1",
    right_ear="Malignance Earring",
    left_ring="Kishar Ring",
    right_ring="Lebeche Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}

sets.midcast.DarkMagic = {
	ammo="Pemphredo Tathlum",
    head="Ig. Burgeonet +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Fall. Fin. Gaunt +3",
    legs="Heath. Flanchar +3",
    feet="Rat. Sollerets +1",
    neck="Erra Pendant",
    waist="Skrymir Cord",
    left_ear="Malignance Earring",
    right_ear="Heath. Earring +2",
    left_ring="Evanescence Ring",
    right_ring="Kishar Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}
sets.midcast.Aspir = {
	ammo="Pemphredo Tathlum",
    head="Fall. Burgeonet +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Fall. Fin. Gaunt. +3",
    legs="Heath. Flanchard +3",
    feet="Heath. Sollerets +3",
    neck="Erra Pendant",
    waist="Orpheus Sash",
    left_ear="Hirudinea Earring",
    right_ear="Heath. Earring +2",
    left_ring="Evanescence Ring",
    right_ring="Archon Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}
sets.midcast.Absorb = {
	ammo="Pemphredo Tathlum",
    head="Ig. Burgeonet +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Fall. Fin. Gaunt. +3",
    legs="Heath. Flanchard +3",
    feet="Rat. Sollerets +1",
    neck="Erra Pendant",
    waist="Skrymir Cord",
    left_ear="Malignance Earring",
    right_ear="Heath. Earring +2",
    left_ring="Stikini Ring +1",
    right_ring="Kishar Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}
sets.midcast.Dread = {
	ammo="Pemphredo Tathlum",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Heath. Cuirass +2",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Rat. Sollerets +1",
    neck="Unmoving collar +1",
    waist="Skrymir Cord",
    left_ear="Tuisto Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Moonlight Ring",
    right_ring="Gelatinous Ring +1",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}

sets.midcast.Macc = {}
sets.midcast.INT = set_combine(sets.midcast.Macc,{})

sets.midcast.Elemental = set_combine(sets.midcast.Macc,{})
sets.midcast.MAB = set_combine(sets.midcast.Elemental,{})

-- Weaponskills
sets.precast.WS = {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Heath. Burgeon. +2",
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs="Sulev. Cuisses +2",
    feet="Flam. Gambieras +2",
    neck="Abyssal Beads +2",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Cessance Earring",
    right_ear={ name="Schere Earring", augments={'Path: A',}},
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back={ name="Ankou's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
	}
	
sets.precast.WS.WSD = {
	ammo="Knobkierrie",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Heath. Sollerets +3",
    neck="Abyssal Beads +2",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Thrud Earring",
    right_ear="Heath. Earring +2",
    left_ring="Epaminondas's Ring",
    right_ring="Cornelia's Ring", 
    back={ name="Ankou's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
	}
-- Scythe
sets.precast.WS["Insurgency"] = set_combine(sets.precast.WS, { 
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	})
	
sets.precast.WS["Cross Reaper"] = set_combine(sets.precast.WS.WSD, {
	left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	})
	
sets.precast.WS["Guillotine"] = set_combine(sets.precast.WS, {
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	})
	
sets.precast.WS["Entropy"] = set_combine(sets.precast.WS, {    
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	})
	
sets.precast.WS["Catastrophe"] = set_combine(sets.precast.WS.WSD, {
	
	})

-- GreatSword
sets.precast.WS["Resolution"] = set_combine(sets.precast.WS, {	
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	})
	
sets.precast.WS["Torcleaver"] = set_combine(sets.precast.WS.WSD, {
	left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	})
	
sets.precast.WS["Scourge"] = set_combine(sets.precast.WS, {
	})
	
sets.precast.WS["Gound Strike"] = set_combine(sets.precast.WS.WSD, {
	left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	})
	
sets.precast.WS["Spinning Slash"] = set_combine(sets.precast.WS.WSD, {
	left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	})
	
sets.precast.WS["Fell Cleave"] = set_combine(sets.precast.WS.WSD, {
	})

			
-- Misc Sets
sets.precast.Utsusemi = set_combine(sets.precast.Fastcast, {})

sets.misc.Waltz = set_combine(sets.idle.PDT,{})
sets.misc.Steps = set_combine(sets.TP.ACC)
sets.misc.flourish = {}


elseif player.name == 'Derion' then

elseif player.name == 'Aniyah' then

elseif player.name == 'Firetoplay' then

end