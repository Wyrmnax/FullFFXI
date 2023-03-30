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
    hands="Gleti's Gauntlets",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Gleti's Boots",
    neck="Rep. Plat. Medal",
    waist="Flume Belt +1",
    left_ear="Eabani Earring",
    right_ear={ name="Nukumi Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','Pet: "Dbl. Atk."+7',}},
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back={ name="Artio's Mantle", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Mag. Acc.+10','Pet: "Regen"+10','Pet: Damage taken -5%',}},
	}

sets.idle.MDT = {
	main="Agwu's Axe",
    sub="Sacro Bulwark",
    ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Sacro Breastplate",
    hands="Gleti's Gauntlets",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Gleti's Boots",
    neck="Rep. Plat. Medal",
    waist="Flume Belt +1",
    left_ear="Eabani Earring",
    right_ear={ name="Nukumi Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','Pet: "Dbl. Atk."+7',}},
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back={ name="Artio's Mantle", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Mag. Acc.+10','Pet: "Regen"+10','Pet: Damage taken -5%',}},
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
sets.precast.JA["Spur"] = {back={ name="Artio's Mantle", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Mag. Acc.+10','Pet: "Regen"+10','Pet: Damage taken -5%',}},}

-- Reward + MND
sets.precast.JA["Reward"] = {ammo = "Pet Food Theta", back={ name="Artio's Mantle", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Mag. Acc.+10','Pet: "Regen"+10','Pet: Damage taken -5%',}},}
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
    feet="Gleti's Boots",
    neck="Shulmanu Collar",
    waist="Klouskap Sash",
    left_ear="Crep. Earring",
    right_ear={ name="Nukumi Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','Pet: "Dbl. Atk."+7',}},
    left_ring="Varar Ring",
    right_ring="C. Palug Ring",
    back={ name="Artio's Mantle", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Mag. Acc.+10','Pet: "Regen"+10','Pet: Damage taken -5%',}},
	}
 
sets.midcast.Pet.WS.MAB = {
	main="Agwu's Axe",
    sub="Sacro Bulwark",
    ammo={ name="Hesperiidae", augments={'Path: A',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Gleti's Gauntlets",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Gleti's Boots",
    neck="Adad Amulet",
    waist="Klouskap Sash",
    left_ear="Crep. Earring",
    right_ear={ name="Nukumi Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','Pet: "Dbl. Atk."+7',}},
    left_ring="Varar Ring",
    right_ring="C. Palug Ring",
    back={ name="Artio's Mantle", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Mag. Acc.+10','Pet: "Regen"+10','Pet: Damage taken -5%',}},
	}
 
sets.midcast.Pet.WS.Macc = {main="Agwu's Axe",
    sub="Sacro Bulwark",
    ammo={ name="Hesperiidae", augments={'Path: A',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Gleti's Gauntlets",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Gleti's Boots",
    neck="Adad Amulet",
    waist="Klouskap Sash",
    left_ear="Crep. Earring",
    right_ear={ name="Nukumi Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','Pet: "Dbl. Atk."+7',}},
    left_ring="Varar Ring",
    right_ring="C. Palug Ring",
    back={ name="Artio's Mantle", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Mag. Acc.+10','Pet: "Regen"+10','Pet: Damage taken -5%',}},
	}
 

sets.midcast.Pet.TPBonus = {hands="Nukumi Manoplas"}

-- Master Priority - TP set - Pet Idle
sets.TP = {	
	main="Agwu's Axe",
    sub="Sacro Bulwark",
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands={ name="Emi. Gauntlets +1", augments={'Pet: Accuracy+20','Pet: Attack+20','Pet: "Dbl. Atk."+4',}},
    legs="Gleti's Breeches",
    feet="Malignance Boots",
    neck="Shulmanu Collar",
    waist="Reiki Yotai",
    left_ear="Sherida Earring",
    right_ear="Suppanomimi",
    left_ring="Epona's Ring",
    right_ring="Hetairoi Ring",
    back="Sacro Mantle",
	}

-- Master Priority - Acc TP set - Pet Not Engaged
sets.TP.Acc = {	
	main="Agwu's Axe",
    sub="Sacro Bulwark",
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands={ name="Emi. Gauntlets +1", augments={'Pet: Accuracy+20','Pet: Attack+20','Pet: "Dbl. Atk."+4',}},
    legs="Gleti's Breeches",
    feet="Malignance Boots",
    neck="Shulmanu Collar",
    waist="Reiki Yotai",
    left_ear="Sherida Earring",
    right_ear="Suppanomimi",
    left_ring="Epona's Ring",
    right_ring="Hetairoi Ring",
    back="Sacro Mantle",
	}

-- Master Priority - Acc TP set - Pet Not Engaged
sets.TP.Buffed = {
	main="Agwu's Axe",
    sub="Sacro Bulwark",
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands={ name="Emi. Gauntlets +1", augments={'Pet: Accuracy+20','Pet: Attack+20','Pet: "Dbl. Atk."+4',}},
    legs="Gleti's Breeches",
    feet="Malignance Boots",
    neck="Shulmanu Collar",
    waist="Reiki Yotai",
    left_ear="Sherida Earring",
    right_ear="Suppanomimi",
    left_ring="Epona's Ring",
    right_ring="Hetairoi Ring",
    back="Sacro Mantle",
	}

-- Pet Priority - Master Engaged - Pet Engaged - TP set
sets.TP.Pet = {	
	main="Agwu's Axe",
    sub="Sacro Bulwark",
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands={ name="Emi. Gauntlets +1", augments={'Pet: Accuracy+20','Pet: Attack+20','Pet: "Dbl. Atk."+4',}},
    legs="Gleti's Breeches",
    feet="Malignance Boots",
    neck="Shulmanu Collar",
    waist="Reiki Yotai",
    left_ear="Sherida Earring",
    right_ear="Nukumi Earring +1",
    left_ring="Epona's Ring",
    right_ring="Hetairoi Ring",
    back={ name="Artio's Mantle", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Mag. Acc.+10','Pet: "Regen"+10','Pet: Damage taken -5%',}},
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
    feet="Gleti's Boots",
    neck="Shulmanu Collar",
    waist="Klouskap Sash",
    left_ear="Enmerkar Earring",
    right_ear={ name="Nukumi Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','Pet: "Dbl. Atk."+7',}},
    left_ring="Varar Ring",
    right_ring="C. Palug Ring",
    back={ name="Artio's Mantle", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Mag. Acc.+10','Pet: "Regen"+10','Pet: Damage taken -5%',}},
}

-- Pet Priority - Master Idle - Pet Idle
sets.idle.Pet = set_combine(sets.TP.Pet.Tank, {})		


-- Weaponskills
sets.precast.WS = {
	ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Sherida Earring",
    right_ear="Thrud Earring",
    left_ring="Epona's Ring",
    right_ring="Regal Ring",
    back="Sacro Mantle",
	}
	
sets.precast.WS.Acc = {
	ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Sherida Earring",
    right_ear="Thrud Earring",
    left_ring="Epona's Ring",
    right_ring="Regal Ring",
    back="Sacro Mantle",
	}

-- Ruinator
sets.precast.WS["Ruinator"] = set_combine(sets.precast.WS, {})
sets.precast.WS.Acc["Ruinator"] = set_combine(sets.precast.WS, {})

-- Rampage 
sets.precast.WS["Rampage"] = set_combine(sets.precast.WS, {})
sets.precast.WS.Acc["Rampage"] = set_combine(sets.precast.WS, {})

-- Onslaught
sets.precast.WS["Onslaught"] = set_combine(sets.precast.WS,{})

sets.precast.WS.Acc["Onslaught"] = set_combine(sets.precast.WS, {})

-- Primal Rend - Magic WS
sets.precast.WS["Primal Rend"] = set_combine(sets.precast.WS, {})

-- Cloudslitter - Magic WS
sets.precast.WS["Cloudsplitter"] = set_combine(sets.precast.WS, {})
end