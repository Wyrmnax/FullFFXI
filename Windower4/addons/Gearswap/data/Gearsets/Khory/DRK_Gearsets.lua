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
    head={ name="Jumalik Helm", augments={'MND+10','"Mag.Atk.Bns."+15','Magic burst dmg.+10%','"Refresh"+1',}},
    body={ name="Jumalik Mail", augments={'HP+50','Attack+15','Enmity+9','"Refresh"+2',}},
    hands="Sulev. Gauntlets +2",
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet="Sulev. Leggings +2",
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Odnowa Earring +1",
    right_ear="Mache Earring",
    left_ring="Defending Ring",
    right_ring="Karieyh Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}},
	}

sets.idle.MDT = {     ammo="Staunch Tathlum +1",
    head={ name="Jumalik Helm", augments={'MND+10','"Mag.Atk.Bns."+15','Magic burst dmg.+10%','"Refresh"+1',}},
    body={ name="Jumalik Mail", augments={'HP+50','Attack+15','Enmity+9','"Refresh"+2',}},
    hands="Sulev. Gauntlets +2",
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet="Sulev. Leggings +2",
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Odnowa Earring +1",
    right_ear="Mache Earring",
    left_ring="Defending Ring",
    right_ring="Karieyh Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}},
	}

sets.misc.Town = set_combine(sets.idle.PDT, {})
				
sets.idle.Standard = set_combine(sets.idle.PDT, {
				})

sets.Enmity = {}

-- Scythe TP set
sets.TP = { ammo="Seeth. Bomblet +1",
    head="Flam. Zucchetto +2",
    body={ name="Valorous Mail", augments={'Accuracy+25','STR+6','Chance of successful block +5','Accuracy+10 Attack+10','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},
    hands="Meg. Gloves +2",
    legs="Ig. Flanchard +3",
    feet="Flam. Gambieras +2",
    neck="Vim Torque +1",
    waist="Ioskeha Belt +1",
    left_ear="Cessance Earring",
    right_ear="Brutal Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Flamma Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},
	}
sets.TP.Acc = { ammo="Seeth. Bomblet +1",
    head="Flam. Zucchetto +2",
    body={ name="Valorous Mail", augments={'Accuracy+25','STR+6','Chance of successful block +5','Accuracy+10 Attack+10','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},
    hands="Meg. Gloves +2",
    legs="Ig. Flanchard +3",
    feet="Flam. Gambieras +2",
    neck="Vim Torque +1",
    waist="Ioskeha Belt +1",
    left_ear="Cessance Earring",
    right_ear="Mache Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Flamma Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},
	}

-- GreatSword
sets.TP.GS = {
	ammo="Seeth. Bomblet +1",
    head="Flam. Zucchetto +2",
    body={ name="Valorous Mail", augments={'Accuracy+25','STR+6','Chance of successful block +5','Accuracy+10 Attack+10','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},
    hands="Meg. Gloves +2",
    legs="Ig. Flanchard +3",
    feet="Flam. Gambieras +2",
    neck="Vim Torque +1",
    waist="Ioskeha Belt +1",
    left_ear="Cessance Earring",
    right_ear="Brutal Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Flamma Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},
	}


sets.TP.GS.Acc = set_combine(sets.TP.GS,{
	ammo="Seeth. Bomblet +1",
    head="Flam. Zucchetto +2",
    body={ name="Valorous Mail", augments={'Accuracy+25','STR+6','Chance of successful block +5','Accuracy+10 Attack+10','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},
    hands="Meg. Gloves +2",
    legs="Ig. Flanchard +3",
    feet="Flam. Gambieras +2",
    neck="Vim Torque +1",
    waist="Ioskeha Belt +1",
    left_ear="Cessance Earring",
    right_ear="Mache Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Flamma Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},
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

sets.midcast.DarkMagic = {ammo="Ghastly Tathlum +1",
    head="Flam. Zucchetto +2",
    body="Ratri Plate",
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs="Ratri Cuisses",
    feet="Flam. Gambieras +2",
    neck="Erra Pendant",
    waist="Eschan Stone",
    left_ear="Lempo Earring",
    right_ear="Hermetic Earring",
    left_ring="Kishar Ring",
    right_ring="Evanescence Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},
	}
sets.midcast.Aspir = {
	ammo="Ghastly Tathlum +1",
    head="Flam. Zucchetto +2",
    body="Ratri Plate",
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs="Ratri Cuisses",
    feet="Flam. Gambieras +2",
    neck="Erra Pendant",
    waist="Eschan Stone",
    left_ear="Lempo Earring",
    right_ear="Hermetic Earring",
    left_ring="Kishar Ring",
    right_ring="Evanescence Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},
	}
sets.midcast.Absorb = {
	ammo="Ghastly Tathlum +1",
    head="Flam. Zucchetto +2",
    body="Ratri Plate",
    hands="Heath. Gauntlets +1",
    legs="Ratri Cuisses",
    feet="Flam. Gambieras +2",
    neck="Erra Pendant",
    waist="Eschan Stone",
    left_ear="Lempo Earring",
    right_ear="Hermetic Earring",
    left_ring="Kishar Ring",
    right_ring="Evanescence Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},
	}
sets.midcast.Dread = {
	ammo="Ghastly Tathlum +1",
    head="Flam. Zucchetto +2",
    body="Heathen`s Cuirass",
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs="Ratri Cuisses",
    feet="Flam. Gambieras +2",
    neck="Erra Pendant",
    waist="Eschan Stone",
    left_ear="Lempo Earring",
    right_ear="Hermetic Earring",
    left_ring="Kishar Ring",
    right_ring="Evanescence Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},
	}

sets.midcast.Macc = {}
sets.midcast.INT = set_combine(sets.midcast.Macc,{})

sets.midcast.Elemental = set_combine(sets.midcast.Macc,{})
sets.midcast.MAB = set_combine(sets.midcast.Elemental,{})

-- Weaponskills
sets.precast.WS = {
	ammo="Knobkierrie",
    head="Flam. Zucchetto +2",
    body="Ignominy Cuirass +2",
    hands="Sulev. Gauntlets +2",
    legs="Ig. Flanchard +3",
    feet="Sulev. Leggings +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Odnowa Earring +1",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    left_ring="Niqmaddu Ring",
    right_ring="Karieyh Ring",
    back={ name="Ankou's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
	}
-- Scythe
sets.precast.WS["Insurgency"] = set_combine(sets.precast.WS, {
	ammo="Knobkierrie",
    head="Flam. Zucchetto +2",
    body="Ratri Plate",
    hands="Sulev. Gauntlets +2",
    legs="Ratri Cuisses",
    feet="Sulev. Leggings +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Odnowa Earring +1",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    left_ring="Niqmaddu Ring",
    right_ring="Karieyh Ring",
    back={ name="Ankou's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
	})
sets.precast.WS["Cross Reaper"] = set_combine(sets.precast.WS, {
	ammo="Knobkierrie",
    head="Flam. Zucchetto +2",
    body="Ratri Plate",
    hands="Sulev. Gauntlets +2",
    legs="Ratri Cuisses",
    feet="Sulev. Leggings +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Odnowa Earring +1",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    left_ring="Niqmaddu Ring",
    right_ring="Karieyh Ring",
    back={ name="Ankou's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
	})
sets.precast.WS["Guillotine"] = set_combine(sets.precast.WS, {
	ammo="Knobkierrie",
    head="Flam. Zucchetto +2",
    body="Ratri Plate",
    hands="Sulev. Gauntlets +2",
    legs="Ratri Cuisses",
    feet="Sulev. Leggings +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Odnowa Earring +1",
    right_ear="Brutal Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Karieyh Ring",
    back={ name="Ankou's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
	})
sets.precast.WS["Entropy"] = set_combine(sets.precast.WS, {
	ammo="Knobkierrie",
    head="Flam. Zucchetto +2",
    body="Ratri Plate",
    hands="Sulev. Gauntlets +2",
    legs="Ratri Cuisses",
    feet="Sulev. Leggings +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    left_ring="Niqmaddu Ring",
    right_ring="Karieyh Ring",
    back={ name="Ankou's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
	})
sets.precast.WS["Catastrophe"] = set_combine(sets.precast.WS, {
	ammo="Knobkierrie",
    head="Flam. Zucchetto +2",
    body="Ratri Plate",
    hands="Sulev. Gauntlets +2",
    legs="Ratri Cuisses",
    feet="Sulev. Leggings +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    left_ring="Niqmaddu Ring",
    right_ring="Karieyh Ring",
    back={ name="Ankou's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
	})

-- GreatSword
sets.precast.WS["Resolution"] = set_combine(sets.precast.WS, {
    ammo="Knobkierrie",
    head="Flam. Zucchetto +2",
    body="Ignominy Cuirass +2",
    hands={ name="Argosy Mufflers", augments={'STR+10','DEX+10','Attack+15',}},
    legs="Ig. Flanchard +3",
    feet="Flam. Gambieras +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Odnowa Earring +1",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    left_ring="Niqmaddu Ring",
    right_ring="Flamma Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}},
	})
sets.precast.WS["Torcleaver"] = set_combine(sets.precast.WS, {
    ammo="Knobkierrie",
    head={ name="Odyssean Helm", augments={'Weapon skill damage +2%','DEX+10','Accuracy+14','Attack+10',}},
    body="Ignominy Cuirass +2",
    hands={ name="Odyssean Gauntlets", augments={'Accuracy+28','Weapon skill damage +4%','AGI+1',}},
    legs={ name="Odyssean Cuisses", augments={'Weapon skill damage +3%','VIT+10','Accuracy+14',}},
    feet="Sulev. Leggings +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    left_ring="Niqmaddu Ring",
    right_ring="Karieyh Ring",
    back={ name="Ankou's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
	})
sets.precast.WS["Scourge"] = set_combine(sets.precast.WS, {
    ammo="Knobkierrie",
    head={ name="Odyssean Helm", augments={'Weapon skill damage +2%','DEX+10','Accuracy+14','Attack+10',}},
    body="Ignominy Cuirass +2",
    hands={ name="Odyssean Gauntlets", augments={'Accuracy+28','Weapon skill damage +4%','AGI+1',}},
    legs={ name="Odyssean Cuisses", augments={'Weapon skill damage +3%','VIT+10','Accuracy+14',}},
    feet="Sulev. Leggings +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    left_ring="Niqmaddu Ring",
    right_ring="Karieyh Ring",
    back={ name="Ankou's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
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