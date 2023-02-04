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
				set_macro_page(1,6)
			elseif player.sub_job == 'SAM' then
				set_macro_page(1,6)
			elseif player.sub_job == 'WAR' then
				set_macro_page(1,6)
			elseif player.sub_job == 'DNC' then 
				set_macro_page(2,6)
			elseif player.sub_job == 'DRG' then 
				set_macro_page(1,6)
			elseif player.sub_job == 'MNK' then 
				set_macro_page(1,6)
			elseif player.sub_job == 'WHM' then 
				set_macro_page(1,6)
			elseif player.sub_job == 'RDM' then 
				set_macro_page(1,6)
			elseif player.sub_job == 'SCH' then 
				set_macro_page(1,6)
			end
		else
			set_macro_page(1,6)
		end
		
-- Auto Sets
-- Standard/idle
sets.idle.PDT = { 
	ammo="Staunch Tathlum +1",
    head={ name="Sakpata's Helm", augments={'Path: A',}},
    body="Sacro Breastplate",
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs="Sakpata's Cuisses",
    feet="Sakpata's Leggings",
    neck={ name="Vim Torque +1", augments={'Path: A',}},
    waist="Flume Belt +1",
    left_ear="Eabani Earring",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}},
	}

sets.idle.MDT = {     
	ammo="Staunch Tathlum +1",
    head={ name="Sakpata's Helm", augments={'Path: A',}},
    body="Sacro Breastplate",
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs="Sakpata's Cuisses",
    feet="Sakpata's Leggings",
    neck={ name="Vim Torque +1", augments={'Path: A',}},
    waist="Flume Belt +1",
    left_ear="Eabani Earring",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}},
	}

sets.misc.Town = set_combine(sets.idle.PDT, {})
				
sets.idle.Standard = set_combine(sets.idle.PDT, {
				})

sets.Enmity = {}

-- Scythe TP set
sets.TP = { 
	ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Sakpata's Helm", augments={'Path: A',}},
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs="Sakpata's Cuisses",
    feet="Sakpata's Leggings",
    neck={ name="Vim Torque +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Cessance Earring",
    right_ear="Heath. Earring +1",
    left_ring="Niqmaddu Ring",
    right_ring="Petrov Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}},
	}
sets.TP.Acc = set_combine(sets.TP, {
				})

-- GreatSword
sets.TP.GS = set_combine(sets.TP, {
				})


sets.TP.GS.Acc = set_combine(sets.TP, {
				})

-- JA
sets.precast.JA["Blood Weapon"] = {body="Abyss Cuirass +2"}
sets.precast.JA["Soul Enslavement"] = {}

sets.precast.JA["Souleater"] = {head="Chaos Burgeonet"}
sets.precast.JA["Last Resort"] = {feet="Abyss Sollerets +2"}
sets.precast.JA["Arcane Circle"] = {feet="Chaos Sollerets"}
sets.precast.JA["Arcane Crest"] = {}
sets.precast.JA["Dark Seal"] = {head="Abyss Burgeonet +2"}
sets.precast.JA["Weapon Bash"] = {hands="Chaos Gauntlets"}
sets.precast.JA["Diabolic Eye"] = {hands="Abyss Gauntlets +2"}
sets.precast.JA["Nether Void"] = {}

sets.precast.JA["Provoke"] = {}
sets.precast.JA["Berserk"] = {}
sets.precast.JA["Defender"] = {}
sets.precast.JA["Warcry"] = {}
sets.precast.JA["Aggressor"] = {}

-- Magic 
sets.precast.Fastcast = set_combine(sets.idle.PDT, {
	ammo="Staunch Tathlum +1",
    head={ name="Fallen's Burgeonet", augments={'Enhances "Dark Seal" effect',}},
    body={ name="Found. Breastplate", augments={'Accuracy+14','Mag. Acc.+13','Attack+14','"Mag.Atk.Bns."+14',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs={ name="Founder's Hose", augments={'MND+10','Mag. Acc.+15','Attack+15','Breath dmg. taken -5%',}},
    feet="Sulev. Leggings +2",
    neck="Voltsurge Torque",
    waist="witful belt",
    left_ear="Halasz Earring",
    right_ear="Mache Earring",
    left_ring="Kishar Ring",
    right_ring="Lebeche Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},
	})

sets.midcast.DarkMagic = {
	ammo="Pemphredo Tathlum",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Erra Pendant",
    waist="Skrymir Cord",
    left_ear="Malignance Earring",
    right_ear={ name="Heath. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','Weapon skill damage +2%',}},
    left_ring="Evanescence Ring",
    right_ring="Kishar Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}},
	}
sets.midcast.Aspir = {
	ammo="Pemphredo Tathlum",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Erra Pendant",
    waist="Skrymir Cord",
    left_ear="Malignance Earring",
    right_ear={ name="Heath. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','Weapon skill damage +2%',}},
    left_ring="Evanescence Ring",
    right_ring="Kishar Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}},
	}
sets.midcast.Absorb = {
	ammo="Pemphredo Tathlum",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Erra Pendant",
    waist="Skrymir Cord",
    left_ear="Malignance Earring",
    right_ear={ name="Heath. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','Weapon skill damage +2%',}},
    left_ring="Evanescence Ring",
    right_ring="Kishar Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}},
	}
sets.midcast.Dread = {
	ammo="Pemphredo Tathlum",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Erra Pendant",
    waist="Skrymir Cord",
    left_ear="Malignance Earring",
    right_ear={ name="Heath. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','Weapon skill damage +2%',}},
    left_ring="Evanescence Ring",
    right_ring="Kishar Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}},
	}

sets.midcast.Macc = {}
sets.midcast.INT = set_combine(sets.midcast.Macc,{})

sets.midcast.Elemental = set_combine(sets.midcast.Macc,{})
sets.midcast.MAB = set_combine(sets.midcast.Elemental,{})

-- Weaponskills
sets.precast.WS = {
	ammo="Knobkierrie",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Caro Necklace",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Cessance Earring",
    right_ear="Heath. Earring +1",
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
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Caro Necklace",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Thrud Earring",
    right_ear="Heath. Earring +1",
	--right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back={ name="Ankou's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
	}
-- Scythe
sets.precast.WS["Insurgency"] = set_combine(sets.precast.WS, {
	right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	})
	
sets.precast.WS["Cross Reaper"] = set_combine(sets.precast.WS.WSD, {
	right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	})
	
sets.precast.WS["Guillotine"] = set_combine(sets.precast.WS, {
	})
	
sets.precast.WS["Entropy"] = set_combine(sets.precast.WS, {
    neck="Fotia Gorget",
    waist="Fotia Belt",
	})
	
sets.precast.WS["Catastrophe"] = set_combine(sets.precast.WS.WSD, {
	
	})

-- GreatSword
sets.precast.WS["Resolution"] = set_combine(sets.precast.WS, {	
    neck="Fotia Gorget",
    waist="Fotia Belt",
	right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	})
	
sets.precast.WS["Torcleaver"] = set_combine(sets.precast.WS.WSD, {
	right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	})
	
sets.precast.WS["Scourge"] = set_combine(sets.precast.WS, {
	})
	
sets.precast.WS["Gound Strike"] = set_combine(sets.precast.WS.WSD, {
	right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	})
	
sets.precast.WS["Spinning Slash"] = set_combine(sets.precast.WS.WSD, {
	right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
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