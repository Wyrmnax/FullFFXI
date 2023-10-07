-- MNK Gear_sets
-- Created: 1/25/2014
-- Last Modified: 6/14/2014
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
	--include('../include/autoexec.lua')
	
-- sets Macros off = 0  on = 1
		automacroset = 1
		if automacroset == 1 then
			if player.sub_job == 'war' then
				set_macro_page(1,14)
			elseif player.sub_job == 'nin' then
				set_macro_page(2,14)
			elseif player.sub_job == 'dnc' then
				set_macro_page(3,14)
			elseif player.sub_job == 'drg' then 
				set_macro_page(4,14)
			elseif player.sub_job == 'whm' then 
				set_macro_page(5,14)
			elseif player.sub_job == 'run' then 
				set_macro_page(6,14)
			end
		else
			set_macro_page(1,14)
		end

-- Auto Sets
-- Standard/idle
sets.idle.DT = { 
	ammo="Staunch Tathlum +1",
    head="Malignance Chapeau",
    body="Mpaca's Doublet",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Rep. Plat. Medal",
    waist="Fotia Belt",
    left_ear="Etiolation Earring",
    right_ear="Eabani Earring",
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
                }


sets.misc.Town = set_combine(sets.idle.PDT, {})
				
sets.idle.Standard = set_combine(sets.idle.PDT, {
				})
-- TP 
sets.TP = {     
	ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Mpaca's Cap",
    body={ name="Mpaca's Doublet", augments={'Path: A',}},
    hands="Malignance Gloves",
    legs="Bhikku Hose +3",
    feet="Anch. Gaiters +3",
    neck={ name="Monk's Nodowa", augments={'Path: A',}},
    waist="Reiki Yotai",
    left_ear="Sherida Earring",
    right_ear="Bhikku Earring +1",
    left_ring="Niqmaddu Ring",
    right_ring="Epona's Ring",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}
-- Impetus
sets.TP.Impetus = { 
	ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Mpaca's Cap",
    body="Bhikky Cyclas +3",
    hands="Malignance Gloves",
    legs="Bhikku Hose +3",
    feet="Anch. Gaiters +3",
    neck={ name="Monk's Nodowa", augments={'Path: A',}},
    waist="Reiki Yotai",
    left_ear="Sherida Earring",
    right_ear="Bhikku Earring +1",
    left_ring="Niqmaddu Ring",
    right_ring="Epona's Ring",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}
-- Footwork
sets.TP.Footwork = { 
	ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Mpaca's Cap",
    body="Nyame Mail",
    hands="Malignance Gloves",
    legs="Bhikku Hose +3",
    feet="Anch. Gaiters +3",
    neck={ name="Monk's Nodowa", augments={'Path: A',}},
    waist="Reiki Yotai",
    left_ear="Sherida Earring",
    right_ear="Bhikku Earring +1",
    left_ring="Niqmaddu Ring",
    right_ring="Epona's Ring",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}

-- JA
sets.precast.JA["Formless Strikes"] = {body="Hes. Cyclas"}
sets.precast.JA["Chakra"] = set_combine(sets.idle.PDT, { })
sets.precast.JA["Chi Blast"] = set_combine(sets.idle.PDT, {})
sets.precast.JA["Impetus"] = {body="Tantra Cyclas +3"}
sets.precast.JA["Hundred Fists"] = {legs="Hes. Hose"}
sets.precast.JA["Focus"] = {head="Anchorite's Crown"}
sets.precast.JA["Dodge"] = {feet="Anch. Gaiters"}
sets.precast.JA["Boost"] = {hands="Anchorite's Gloves"}
sets.precast.JA["Counterstance"] = {feet="Hes. Gaiters"}
sets.precast.JA["Mantra"] = {feet="Hes. Gaiters"}

-- Weaponskills
sets.precast.WS = {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Mpaca's Cap",
    body={ name="Mpaca's Doublet", augments={'Path: A',}},
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Monk's Nodowa", augments={'Path: A',}},
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Epona's Ring",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}
	
sets.precast.WS['Victory Smite'] = set_combine(sets.precast.WS, {})

sets.precast.WS['Raging Fists'] = set_combine(sets.precast.WS, {})

sets.precast.WS['Howling Fist'] = set_combine(sets.precast.WS, {
	neck="Monk's Nodowa",
    waist="Moonbow Belt",})
	
sets.precast.WS['Tornado Kick'] = set_combine(sets.precast.WS, {
	neck="Monk's Nodowa",
    waist="Moonbow Belt",
	legs="Bhikku Hose +3",
    feet="Anch. Gaiters +3",})

sets.precast.WS["Asuran Fists"] = set_combine(sets.precast.WS, {
	ammo="Knobkierrie",
    head={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}},
    legs={ name="Adhemar Kecks", augments={'DEX+10','AGI+10','Accuracy+15',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Digni. Earring",
    right_ear="Telos Earring",
    left_ring="Ilabrat Ring",
    right_ring="Moonbeam Ring",
	})

sets.precast.WS.Impetus = set_combine(sets.precast.WS, {
	neck="Monk's Nodowa",
    waist="Moonbow Belt",})

sets.precast.WS['Final Heaven'] = set_combine(sets.precast.WS), {
	ammo="Knobkierrie",
    head={ name="Herculean Helm", augments={'Weapon skill damage +5%','STR+9','Accuracy+7','Attack+8',}},	
    legs="Hiza. Hizayoroi +2",
}

sets.precast.WS['Shijin Spiral'] = set_combine(sets.precast.WS, {ammo="Potestas Bomblet",
				head="Uk'uxkaj Cap", neck="Justiciar's Torque", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Manibozho Jerkin", hands="Otronif Gloves +1", lring="Thundersoul Ring", rring="Epona's Ring",
                back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}, waist="Wanion Belt",  legs="Manibozho Brais", feet="Manibozho Boots"})

sets.precast.WS.MidAcc = {}
sets.precast.WS.HighAcc = {}
sets.precast.WS.MidAcc['Shijin Spiral'] = set_combine(sets.precast.WS['Shijin Spiral'], {
				head="Uk'uxkaj Cap", neck="Justiciar's Torque", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Manibozho Jerkin", hands="Otronif Gloves +1", lring="Thundersoul Ring", rring="Epona's Ring",
                back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}, waist="Anguinus Belt", legs="Manibozho Brais", feet="Manibozho Boots"})
sets.precast.WS.HighAcc['Shijin Spiral'] = set_combine(sets.precast.WS['Shijin Spiral'], {ammo="Potestas Bomblet",
				head="Whirlpool Mask", neck="Light Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Manibozho Jerkin", hands="Otronif Gloves +1", lring="Mars's Ring", rring="Epona's Ring",
                back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}, waist="Anguinus Belt",  legs="Manibozho Brais", feet="Manibozho Boots"})

sets.precast.WS["Ascetic's Fury"] = set_combine(sets.precast.WS, {
				head="Uk'uxkaj Cap", neck="Light Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Manibozho Jerkin", hands="Manibozho Gloves", lring="Rajas Ring", rring="Pyrosoul Ring",
                back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}, waist="Wanion Belt",  legs="Manibozho Brais", feet="Manibozho Boots"})


-- Misc Sets
sets.precast.Fastcast = set_combine(sets.idle.PDT, {
				head="Athos's Chapeau", neck="Magoraga Beads", lear="Loquac. Earring", rear="Novia Earring",
                body="Manibozho Jerkin", hands="Otronif Gloves +1", lring="", rring="Prolix Ring",
                back="Repulse Mantle", waist="Black Belt", legs="", feet=""})
sets.precast.Utsusemi = set_combine(sets.precast.Fastcast, {neck="Magoraga Beads"})

sets.misc.Waltz = {}
sets.misc.Steps = set_combine(sets.TP.MidAcc,{})
sets.misc.flourish = {}


elseif player.name == 'Derion' then

elseif player.name == 'Aniyah' then

elseif player.name == 'Firetoplay' then

end