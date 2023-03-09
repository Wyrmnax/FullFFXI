-- BST Gear_sets
-- Created: 7/26/2014
-- Last Modified: 8/12/2015
-- To Do:
-- Dual Wield vs Single
--
--
--
--

if player.name == 'Khory' then
-- includes
	
	include('include/mappings.lua')
	include('include/equipment.lua')
	-- include('../include/autoexec.lua')
	
	send_command('wait 3;input /lockstyleset 4')
	
	set_macro_page(1,19)
	
	
-- Auto Sets
-- Standard/idle
sets.idle.PDT = { 
	main="Agwu's Axe",
    sub="Sacro Bulwark",
    ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Sacro Breastplate",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Rep. Plat. Medal",
    waist="Flume Belt +1",
    left_ear="Eabani Earring",
    right_ear={ name="Nukumi Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','Pet: "Dbl. Atk."+7',}},
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back="Sacro Mantle",
	}

sets.idle.MDT = {
				main="Agwu's Axe",
    sub="Sacro Bulwark",
    ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Sacro Breastplate",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Rep. Plat. Medal",
    waist="Flume Belt +1",
    left_ear="Eabani Earring",
    right_ear={ name="Nukumi Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','Pet: "Dbl. Atk."+7',}},
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back="Sacro Mantle",
	}

sets.idle.Standard = set_combine(sets.idle.PDT, {
				})

sets.Resting = set_combine(sets.idle.PDT,{
				})
				
sets.misc.Town = set_combine(sets.idle.PDT, {})
	
sets.lockstyle = set_combine(sets.misc.Town)

-- Precast Sets
sets.precast.Fastcast = set_combine(sets.idle.PDT, {})
				
sets.precast.Utsusemi = set_combine(sets.precast.Fastcast, {neck="Magoraga Beads"})

sets.misc.Waltz = set_combine(sets.idle.PDT,{})
sets.misc.Steps = set_combine({})

sets.misc.flourish = {}

-- JA
sets.precast.JA["Familiar"] = {}
sets.precast.JA["Unleash"] = {}

sets.precast.JA["Killer Instinct"] = {}
sets.precast.JA["Feral Howl"] = {}
sets.precast.JA["Call Beast"] = {}
sets.precast.JA["Beast Loyality"] = set_combine(sets.precast.JA["Call Beast"])
sets.precast.JA["Tame"] = {}
sets.precast.JA["Spur"] = {}

-- Reward + MND
sets.precast.JA["Reward"] = {}
-- Charm + CHR 
sets.precast.JA["Charm"] = {}
				
-- Ready/Sic Moves
sets.midcast.Pet = {}
sets.midcast.Pet.Recast = {legs="Desultor Tassets"}

sets.midcast.Pet.WS = {
	main="Agwu's Axe",
    sub="Sacro Bulwark",
    ammo={ name="Hesperiidae", augments={'Path: A',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Emi. Gauntlets +1", augments={'Pet: Accuracy+20','Pet: Attack+20','Pet: "Dbl. Atk."+4',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Shulmanu Collar",
    waist="Klouskap Sash",
    left_ear="Crep. Earring",
    right_ear={ name="Nukumi Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','Pet: "Dbl. Atk."+7',}},
    left_ring="Varar Ring",
    right_ring="C. Palug Ring",
    back="Sacro Mantle",
	}
 
sets.midcast.Pet.WS.MAB = {
	main="Agwu's Axe",
    sub="Sacro Bulwark",
    ammo={ name="Hesperiidae", augments={'Path: A',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Nyame Gauntlets",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Shulmanu Collar",
    waist="Klouskap Sash",
    left_ear="Crep. Earring",
    right_ear={ name="Nukumi Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','Pet: "Dbl. Atk."+7',}},
    left_ring="Varar Ring",
    right_ring="C. Palug Ring",
    back="Sacro Mantle",
	}
 
sets.midcast.Pet.WS.Macc = {main="Agwu's Axe",
    sub="Sacro Bulwark",
    ammo={ name="Hesperiidae", augments={'Path: A',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Nyame Gauntlets",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Shulmanu Collar",
    waist="Klouskap Sash",
    left_ear="Crep. Earring",
    right_ear={ name="Nukumi Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','Pet: "Dbl. Atk."+7',}},
    left_ring="Varar Ring",
    right_ring="C. Palug Ring",
    back="Sacro Mantle",
	}
 

sets.midcast.Pet.TPBonus = {hands="Nukumi Manoplas"}

-- Master Priority - TP set - Pet Idle
sets.TP = {	ammo="Paeapua",
			head=Aug.Skirmish.Taeon.Head.TA, neck="Asperity Necklace", lear="Brutal Earring", rear="Suppanomimi",
			body=Aug.Skirmish.Taeon.Body.TA, hands=Aug.Skirmish.Taeon.Hands.TA, lring="Rajas ring", rring="Epona's Ring",
			back="Atheling Mantle", waist="Patentia Sash", legs=Aug.Skirmish.Taeon.Legs.DW, feet=Aug.Skirmish.Taeon.Feet.TA}

-- Master Priority - Acc TP set - Pet Not Engaged
sets.TP.Acc = {	ammo="Ginsen",
			head=Aug.Skirmish.Taeon.Head.DW, neck="Iqabi Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
			body=Aug.Skirmish.Taeon.Body.DW, hands=Aug.Skirmish.Taeon.Hands.DW, lring="Rajas ring", rring="Ramuh Ring +1",
			back="Atheling Mantle", waist="Patentia Sash", legs=Aug.Skirmish.Taeon.Legs.DW,feet=Aug.Skirmish.Taeon.Feet.DW}

-- Master Priority - Acc TP set - Pet Not Engaged
sets.TP.Buffed = {ammo="Ginsen",
			head=Aug.Skirmish.Taeon.Head.TA, neck="Asperity Necklace", lear="Brutal Earring", rear="Suppanomimi",
			body=Aug.Skirmish.Taeon.Body.TA, hands=Aug.Skirmish.Taeon.Hands.TA, lring="Rajas ring", rring="Epona's Ring",
			back="Atheling Mantle", waist="Windbuffet Belt +1", legs=Aug.Skirmish.Taeon.Legs.TA,feet=Aug.Skirmish.Taeon.Feet.TA}

-- Pet Priority - Master Engaged - Pet Engaged - TP set
sets.TP.Pet = {	main="Agwu's Axe",
    sub="Sacro Bulwark",
    ammo={ name="Hesperiidae", augments={'Path: A',}},
    head="Tali'ah Turban +2",
    body={ name="Gleti's Cuirass", augments={'Path: A',}},
    hands="Gleti's Gauntlets",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Shulmanu Collar",
    waist="Klouskap Sash",
    left_ear="Enmerkar Earring",
    right_ear={ name="Nukumi Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','Pet: "Dbl. Atk."+7',}},
    left_ring="Varar Ring",
    right_ring="C. Palug Ring",
    back="Sacro Mantle",
	}
				
-- Pet Priority - Master Idle - Pet Engaged
sets.TP.Pet.Tank = {			
			main="Agwu's Axe",
    sub="Sacro Bulwark",
    ammo={ name="Hesperiidae", augments={'Path: A',}},
    head="Tali'ah Turban +2",
    body={ name="Gleti's Cuirass", augments={'Path: A',}},
    hands="Gleti's Gauntlets",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Shulmanu Collar",
    waist="Klouskap Sash",
    left_ear="Enmerkar Earring",
    right_ear={ name="Nukumi Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','Pet: "Dbl. Atk."+7',}},
    left_ring="Varar Ring",
    right_ring="C. Palug Ring",
    back="Sacro Mantle",
	}

-- Pet Priority - Master Idle - Pet Idle
sets.idle.Pet = set_combine(sets.TP.Pet.Tank, {})		


-- Weaponskills
sets.precast.WS = {ammo="Ginsen",
			head="Otomi Helm", neck="Fotia Gorget", lear="Brutal earring", rear="Vulcan's Pearl",
			body=Aug.Skirmish.Acro.Body.TP, hands=Aug.Skirmish.Acro.Hands.TP, lring="Ifrit Ring +1", rring="Epona's Ring",
			back="Buquwik Cape", waist="Fotia Belt", legs=Aug.Skirmish.Acro.Legs.TP, feet=Aug.Skirmish.Acro.Feet.TP}
sets.precast.WS.Acc = set_combine(sets.precast.WS, {ammo="Hasty Pinion +1",
			head="Otomi Helm", neck="Fotia Gorget", lear="Bladeborn Earring", rear="SteelFlash Earring",
			body=Aug.Skirmish.Acro.Body.TP, hands=Aug.Skirmish.Acro.Hands.TP, lring="Ifrit Ring +1", rring="Epona's Ring",
			back="Buquwik Cape", waist="Fotia Belt", legs=Aug.Skirmish.Acro.Legs.TP, feet=Aug.Skirmish.Acro.Feet.TP})

-- Ruinator
sets.precast.WS["Ruinator"] = set_combine(sets.precast.WS, {ammo="Ginsen",
			head="Otomi Helm", neck="Fotia Gorget", lear="Brutal earring", rear="Vulcan's Pearl",
			body=Aug.Skirmish.Acro.Body.TP, hands=Aug.Skirmish.Acro.Hands.TP, lring="Ifrit Ring +1", rring="Epona's Ring",
			back="Buquwik Cape", waist="Fotia Belt", legs=Aug.Skirmish.Acro.Legs.TP, feet=Aug.Skirmish.Acro.Feet.TP})
sets.precast.WS.Acc["Ruinator"] = set_combine(sets.precast.WS, {ammo="Hasty Pinion +1",
			head=Aug.Skirmish.Acro.Head.TP, neck="Fotia Gorget", lear="Bladeborn Earring", rear="SteelFlash Earring",
			body=Aug.Skirmish.Acro.Body.TP, hands=Aug.Skirmish.Acro.Hands.TP, lring="Ifrit Ring +1", rring="Epona's Ring",
			back="Buquwik Cape", waist="Fotia Belt", legs=Aug.Skirmish.Acro.Legs.TP, feet=Aug.Skirmish.Acro.Feet.TP})

-- Rampage 
sets.precast.WS["Rampage"] = set_combine(sets.precast.WS, {ammo="Ginsen",
			head=Aug.Skirmish.Acro.Head.TP, neck="Fotia Gorget", lear="Brutal earring", rear="Moonshade Earring",
			body=Aug.Skirmish.Acro.Body.TP, hands=Aug.Skirmish.Acro.Hands.TP, lring="Ifrit Ring +1", rring="Epona's Ring",
			back="Buquwik Cape", waist="Fotia Belt", legs=Aug.Skirmish.Acro.Legs.TP, feet=Aug.Skirmish.Acro.Feet.TP})
sets.precast.WS.Acc["Rampage"] = set_combine(sets.precast.WS, {ammo="Hasty Pinion +1",
			head=Aug.Skirmish.Acro.Head.TP, neck="Fotia Gorget", lear="Bladeborn Earring", rear="SteelFlash Earring",
			body=Aug.Skirmish.Acro.Body.TP, hands=Aug.Skirmish.Acro.Hands.TP, lring="Ifrit Ring +1", rring="Epona's Ring",
			back="Buquwik Cape", waist="Fotia Belt", legs=Aug.Skirmish.Acro.Legs.TP, feet=Aug.Skirmish.Acro.Feet.TP})

-- Onslaught
sets.precast.WS["Onslaught"] = set_combine(sets.precast.WS,{ammo="Ginsen",
			head=Aug.Skirmish.Taeon.Head.TA, neck="Asperity Necklace", lear="Brutal Earring", rear="Moonshade Earring",
			body=Aug.Skirmish.Taeon.Body.TA, hands=Aug.Skirmish.Taeon.Hands.TA, lring="Ifrit Ring +1", rring="Epona's Ring",
			back="Vespid Mantle", waist="Windbuffet Belt +1", legs=Aug.Skirmish.Taeon.Legs.TA, feet=Aug.Skirmish.Taeon.Feet.TA})

sets.precast.WS.Acc["Onslaught"] = set_combine(sets.precast.WS, {ammo="Ginsen",
			head=Aug.Skirmish.Taeon.Head.TA, neck="Asperity Necklace", lear="Brutal Earring", rear="Moonshade Earring",
			body=Aug.Skirmish.Taeon.Body.TA, hands=Aug.Skirmish.Taeon.Hands.TA, lring="Ramuh Ring +1", rring="Epona's Ring",
			back="Vespid Mantle", waist="Windbuffet Belt +1", legs=Aug.Skirmish.Taeon.Legs.TA, feet=Aug.Skirmish.Taeon.Feet.TA})

-- Primal Rend - Magic WS
sets.precast.WS["Primal Rend"] = set_combine(sets.precast.WS, {ammo="Ginsen",
			head=Aug.Skirmish.Acro.Head.WS, neck="Asperity Necklace", lear="Brutal Earring", rear="Moonshade Earring",
			body=Aug.Skirmish.Acro.Body.WS, hands=Aug.Skirmish.Taeon.Hands.TA, lring="Ifrit Ring +1", rring="Epona's Ring",
			back="Vespid Mantle", waist="Windbuffet Belt +1", legs=Aug.Skirmish.Acro.Legs.WS, feet=Aug.Skirmish.Acro.Feet.WS})

-- Cloudslitter - Magic WS
sets.precast.WS["Cloudsplitter"] = set_combine(sets.precast.WS['Primal Rend'], {})
end