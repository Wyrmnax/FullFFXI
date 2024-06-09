-- DNC Gear_sets
-- Created: 5/15/2014
-- Last Modified: 6/6/2014
-- To Do
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
				set_macro_page(4,14)
			elseif player.sub_job == 'WAR' then
				set_macro_page(1,14)
			elseif player.sub_job == 'SAM' then
				set_macro_page(2,14)
			elseif player.sub_job == 'DRG' then
				set_macro_page(3,14)
			end
		else
			set_macro_page(18,1)
		end
		
		
		send_command('wait 3;input /lockstyleset 21')
		
-- Auto Sets
-- Standard/idle
sets.idle = { 
	ammo="Staunch Tathlum +1",
    head={ name="Gleti's Mask", augments={'Path: A',}},
    body={ name="Gleti's Cuirass", augments={'Path: A',}},
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Macu. Toe Sh. +3",
    neck="Rep. Plat. Medal",
    waist="Flume Belt +1",
    left_ear="Eabani Earring",
    right_ear="Etiolation Earring",
    left_ring="Chirich Ring +1",
    right_ring="Shneddick Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}
			
-- TP Sets 
sets.TP = { 
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Maculele Tiara +3",
    body={ name="Gleti's Cuirass", augments={'Path: A',}},
    hands="Malignance Gloves",
    legs={ name="Gleti's Breeches", augments={'Path: A',}},
    feet="Macu. Toe Sh. +3",
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Sherida Earring",
    right_ear="Telos Earring",
    left_ring="Epona's Ring",
    right_ring="Gere Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}

-- RA Sets
sets.precast.Snapshot = {legs=""}

sets.RA = {}
				
-- JA
sets.precast.JA["Trance"] = {head=""}
sets.precast.JA["Grand Pas"] = {}

sets.precast.JA["Fan Dance"] = {hands=""}
sets.precast.JA["Saber Dance"] = {legs=""}
sets.precast.JA["No Foot Rise"] = {body=""}
sets.precast.JA["Presto"] = {}

sets.precast.JA["Sambas"] = {head=""}
sets.precast.JA["Jigs"] = {legs="",feet=""}
-- Waltz - CHR for others Vit for self, Waltz+ Only 
sets.precast.JA["Waltz"] = {neck="Etoile Gorget+2",body="Gleti's cuirass", ammo="Yamarang"}
-- Steps - Accuracy
sets.precast.JA["Step"] = set_combine(sets.TP,{head="",hands="",feet=""})
sets.precast.JA["Feather Step"] = set_combine(sets.precast.JA["Step"],{feet="Macu. Toe Sh. +3"})
-- Flourish - Macc? 
sets.precast.JA["Flourish"] = set_combine(sets.precast.Macc,{})
sets.precast.JA["Striking Flourish"] = set_combine(sets.precast.JA["Flourish"],{body=""})
sets.precast.JA["Violent Flourish"] = set_combine(sets.precast.JA["Flourish"],{body=""})
sets.precast.JA["Reverse Flourish"] = set_combine(sets.precast.JA["Flourish"],{hands="Macu. Bangles +2"})
sets.precast.JA["Climactic Flourish"] = set_combine(sets.precast.JA["Flourish"],{head="Maculele Tiara +3"})

-- Weaponskills
sets.precast.WS = {
	ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Maculele Tiara +3",
    body={ name="Gleti's Cuirass", augments={'Path: A',}},
    hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
    legs={ name="Gleti's Breeches", augments={'Path: A',}},
    feet={ name="Herculean Boots", augments={'Enmity-3','"Mag.Atk.Bns."+17','Quadruple Attack +2','Accuracy+13 Attack+13','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Sherida Earring",
    right_ear="Telos Earring",
    left_ring="Epona's Ring",
    right_ring="Gere Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}
				
sets.precast.WS.WSD = {				
    ammo="Oshasha's Treatise",
    head="Maculele Tiara +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Telos Earring",
    right_ear="Ishvara Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Cornelia's Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
	}
				
sets.precast.WS.Crit = {
	ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body={ name="Gleti's Cuirass", augments={'Path: A',}},
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs={ name="Gleti's Breeches", augments={'Path: A',}},
    feet="Gleti's Boots",
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Sherida Earring",
    right_ear="Odr Earring",
    left_ring="Epona's Ring",
    right_ring="Gere Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Crit.hit rate+5',}},}
				
				

-- Rudra's Storm
sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS.WSD, {
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},}
)

-- Exenterator
sets.precast.WS["Exenterator"] = set_combine(sets.precast.WS, {
	neck="Fotia Gorget",
    waist="Fotia Belt",
	}
)

-- Evisceration
sets.precast.WS["Evisceration"] = set_combine(sets.precast.WS.Crit, {
	neck="Fotia Gorget",
    waist="Fotia Belt",
	}
)

-- Pyrrhic Kleos
sets.precast.WS["Pyrrhic Kleos"] = set_combine(sets.precast.WS, {
	neck="Fotia Gorget",
    waist="Fotia Belt",
	}
)


-- Shark Bite
sets.precast.WS["Shark Bite"] = set_combine(sets.precast.WS.WSD, {
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},}
)
				
-- Midcast Sets

-- Aftercast

-- Misc Sets
sets.precast.Fastcast = set_combine(sets.idle.PDT, {head="Athos's Chapeau", lear="Loquac. Earring", rring="Prolix Ring",})

sets.precast.Utsusemi = set_combine(sets.precast.Fastcast, {neck="Magoraga Beads"})

elseif player.name == 'Derion' then

elseif player.name == 'Aniyah' then

elseif player.name == 'Firetoplay' then

elseif player.name == 'Fugiwara' then

end