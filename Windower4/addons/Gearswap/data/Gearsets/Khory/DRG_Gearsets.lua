-- DRG Gear_sets
-- Created:
-- Last Modified:
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
			if player.sub_job == 'SAM' then
				set_macro_page(1,16)
			elseif player.sub_job == 'WAR' then 
				set_macro_page(2,16)
			end
		else
			set_macro_page(1,16)
		end		
	
	
	sets.mainweapon = {}
	sets.mainweapon.Trishula = {
	main="Trishula",
	sub="Utu Grip",
	}
	
	sets.mainweapon.Naegling = {
	main="Naegling",
	sub="Regis",
	}
 
	sets.mainweapon.Judge = {
	main="Mafic Cudgel",
	sub="Regis",
	}
		
-- Auto Sets
-- Standard/idle
sets.idle = { 
				ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Nyame Helm",
    body="Gleti's Cuirass",
    hands="Gleti's Gauntlets",
    legs="Gleti's Breeches",
    feet="Nyame Sollerets",
    neck="Rep. Plat. Medal",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Sherida Earring",
    right_ear="Cessance Earring",
    left_ring="Shneddick Ring",
    right_ring="Defending Ring",
    back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},}
	
sets.misc.Town = set_combine(sets.idle, {})
				
sets.idle.Standard = set_combine(sets.idle, {
				})
-- Melee TP 
sets.TP = {
	ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Hjarrandi Helm",
    body={ name="Gleti's Cuirass", augments={'Path: A',}},
    hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
    legs={ name="Gleti's Breeches", augments={'Path: A',}},
    feet="Flam. Gambieras +2",
    neck={ name="Vim Torque +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Sherida Earring",
    right_ear="Brutal Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Moonlight Ring",
    back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}

-- Pet
sets.precast.HealingBreath = {
				head="Vishap Armet", 
				body="Pteroslaver Mail", hands="Ogier's Gauntlets", lring="Meridian Ring", rring="K'ayres Ring",
				back="Strendu Mantle", waist="Glassblower's Belt", legs="Gorney Brayettes", feet="Gorney Sollerets"}
sets.midcast.HealingBreath = {
				head="Ptero. Armet", neck="Lancer's Torque", lear="Lancer's Earring", rear="",
				body="Wyvern Mail", hands="Buremte Gloves", lring="", rring="",
				back="Updraft Mantle", waist="Glassblower's Belt", legs="Pteroslaver Brais", feet="Ptero. Greaves"}
sets.midcast.Breath = {	
				head="Ptero. Armet", neck="Lancer's Torque", lear="Lancer's Earring", rear="",
				body="Wyvern Mail", hands="Buremte Gloves", lring="", rring="",
				back="Updraft Mantle", waist="Glassblower's Belt", legs="Pteroslaver Brais", feet="Ptero. Greaves"}

sets.precast.JA["Steady Wing"] = {
				head="Ptero. Armet", neck="Lancer's Torque", lear="Lancer's Earring", rear="",
				body="Wyvern Mail", hands="", lring="", rring="",
				back="Updraft Mantle", waist="", legs="Pteroslaver Brais", feet="Ptero. Greaves"}

-- JA
sets.precast.JA["Spirit Surge"] = {body="Pteroslaver Mail"}
sets.precast.JA["Fly High"] = {}

sets.precast.JA["Call Wyvern"] = {body="Pteroslaver Mail"}
sets.precast.JA["Angon"] = {ammo="Angon", hands="Ptero. Fin. Gaunt."}
sets.precast.JA["Deep Breathing"] = {head="Ptero. Armet"}
sets.precast.JA["Strafe"] = {legs="Pteroslaver Brais"}
sets.precast.JA["Empathy"] = {feet="Ptero. Greaves"}
sets.precast.JA["Ancient Circle"] = {legs="Vishap Brais"}
sets.precast.JA["Spirit Link"] = {head="Vishap Armet"}

-- Jumps 
sets.precast.JA["Jump"] = {ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Flam. Zucchetto +2",
    body="Gleti's Cuirass",
    hands="Sulev. Gauntlets +2",
    legs="Sulev. Cuisses +2",
    feet="Flam. Gambieras +2",
    neck={ name="Vim Torque +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Sherida Earring",
    right_ear="Cessance Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Hetairoi Ring",
    back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},}

sets.precast.JA["High Jump"] = {ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Flam. Zucchetto +2",
    body="Gleti's Cuirass",
    hands="Sulev. Gauntlets +2",
    legs="Sulev. Cuisses +2",
    feet="Flam. Gambieras +2",
    neck={ name="Vim Torque +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Sherida Earring",
    right_ear="Cessance Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Hetairoi Ring",
    back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},}

sets.precast.JA["Super Jump"] = {}

sets.precast.JA["Spirit Jump"] = {ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Flam. Zucchetto +2",
    body="Gleti's Cuirass",
    hands="Sulev. Gauntlets +2",
    legs="Sulev. Cuisses +2",
    feet="Flam. Gambieras +2",
    neck={ name="Vim Torque +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Sherida Earring",
    right_ear="Cessance Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Hetairoi Ring",
    back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},}

sets.precast.JA["Soul Jump"] = {ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Flam. Zucchetto +2",
    body="Gleti's Cuirass",
    hands="Sulev. Gauntlets +2",
    legs="Sulev. Cuisses +2",
    feet="Flam. Gambieras +2",
    neck={ name="Vim Torque +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Sherida Earring",
    right_ear="Cessance Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Hetairoi Ring",
    back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},}

-- Weaponskills
sets.precast.WS = { 
	ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Peltast's Mezail +3",
	body="Gleti's Cuirass",
    hands="Pel. Vambraces +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Nyame Sollerets",
    neck="Rep. Plat. Medal",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Thrud Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}
	
sets.precast.WS.WSD = { 
	ammo="Knobkierrie",
    head="Peltast's Mezail +3",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Nyame Sollerets",
    neck="Rep. Plat. Medal",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Thrud Earring",
    right_ear="Ishvara Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Cornelia's Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
	}

sets.precast.WS["Stardiver"] = set_combine(sets.precast.WS, {
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
	neck="Fotia Gorget",
	waist="Fotia Belt",
	lear="Sherida Earring",
	})

sets.precast.WS["Impulse Drive"] = set_combine(sets.precast.WS.WSD, {
	body="Gleti's Cuirass",
    legs="Pelt. Cuissots +3",
	})

sets.precast.WS["Drakesbane"] = set_combine(sets.precast.WS, { 
	head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body={ name="Gleti's Cuirass", augments={'Path: A',}},
    hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
    legs="Pelt. Cuissots +3",
    feet="Gleti's Boots",
    neck="Rep. Plat. Medal",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Thrud Earring",
    right_ear={ name="Pel. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','Crit.hit rate+4',}},
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
	})

sets.precast.WS["Camlann's Torment"] = set_combine(sets.precast.WS.WSD, {
    right_ear="Pel. Earring +1",
})

sets.precast.WS["Sonic Thrust"] = set_combine(sets.precast.WS.WSD, {
    head="Peltast's Mezail +3",
})

sets.precast.WS["Wheeling Thrust"] = set_combine(sets.precast.WS.WSD, {
})
	
sets.precast.WS["Savage Blade"] = set_combine(sets.precast.WS.WSD, {})

-- Midcast Sets

-- Aftercast

-- Misc Sets
sets.precast.Fastcast = set_combine(sets.idle.PDT, {head="Cizin Helm", lear="Loquac. Earring", rring="Prolix Ring",})

sets.precast.Utsusemi = set_combine(sets.precast.Fastcast, {neck="Magoraga Beads"})

sets.misc.Waltz = {hands="Buremte Gloves", waist="Chuq'aba Belt"}
sets.misc.Steps = set_combine(sets.TP.ACC)
sets.misc.flourish = {}

end