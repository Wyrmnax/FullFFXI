-- MNK Gear_sets
-- Created: 1/25/2014
-- Last Modified: 6/14/2014
-- To Do List
--
--
--
--

-- includes
	include('include/utility.lua')
	include('include/mappings.lua')
	include('include/equipment.lua')
	--include('../include/autoexec.lua')
	
-- sets Macros off = 0  on = 1
		automacroset = 1
		if automacroset == 1 then
			if player.sub_job == 'WAR' then
				set_macro_page(1,11)
			elseif player.sub_job == 'DRG' then
				set_macro_page(2,11)
			elseif player.sub_job == 'DNC' then
				set_macro_page(3,11)
			elseif player.sub_job == 'NIN' then 
				set_macro_page(4,11)
			elseif player.sub_job == 'WHM' then 
				set_macro_page(5,11)
			elseif player.sub_job == 'RUN' then 
				set_macro_page(6,11)
			else
				set_macro_page(1,11)
			end
		else
			set_macro_page(1,11)
		end
	
	send_command('wait 3;input /lockstyleset 17')

-- Auto Sets
-- Standard/idle
sets.idle = { 
	main="Verethragna",
	ammo="Staunch Tathlum +1",
    head="Malignance Chapeau",
    body="Mpaca's Doublet",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Rep. Plat. Medal",
    waist="Moonbow Belt +1",
    left_ear="Etiolation Earring",
    right_ear="Eabani Earring",
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
                }


sets.misc.Town = set_combine(sets.idle, {})

-- TP 
sets.TP = {     
	main="Verethragna",
	ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Mpaca's Cap",
    body={ name="Mpaca's Doublet", augments={'Path: A',}},
    hands="Malignance Gloves",
    legs="Bhikku Hose +3",
    feet={ name="Herculean Boots", augments={'Enmity-3','"Mag.Atk.Bns."+17','Quadruple Attack +2','Accuracy+13 Attack+13','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},
    neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear="Schere Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Epona's Ring",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}
-- Impetus
sets.TP.Impetus = set_combine(sets.TP, {
    body="Bhikku Cyclas +3",
	})
-- Footwork
sets.TP.Footwork = set_combine(sets.TP, {
    feet="Anch. Gaiters +3",
	})

-- JA
sets.precast.JA["Formless Strikes"] = {body="Hes. Cyclas"}
sets.precast.JA["Chakra"] = set_combine(sets.idle.PDT, { })
sets.precast.JA["Chi Blast"] = set_combine(sets.idle.PDT, {})
sets.precast.JA["Impetus"] = {body="Tantra Cyclas +3"}
sets.precast.JA["Hundred Fists"] = {legs="Hes. Hose +1"}
sets.precast.JA["Focus"] = {head="Anchorite's Crown"}
sets.precast.JA["Dodge"] = {feet="Anch. Gaiters +3"}
sets.precast.JA["Boost"] = {hands="Anchorite's Gloves"}
sets.precast.JA["Counterstance"] = {feet="Hes. Gaiters"}
sets.precast.JA["Mantra"] = {feet="Hes. Gaiters"}
sets.precast.JA["Footwork"] = {feet="Bhikku Gaiters +3"}

-- Weaponskills
sets.precast.WS = {     
	ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Mpaca's Cap",
    body={ name="Mpaca's Doublet", augments={'Path: A',}},
    hands="Mpaca's Gloves",
    legs="Mpaca's Hose",
    feet={ name="Herculean Boots", augments={'Enmity-3','"Mag.Atk.Bns."+17','Quadruple Attack +2','Accuracy+13 Attack+13','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},
    neck="Fotia Gorget",
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear="Schere Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Epona's Ring",
    back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}
	
sets.precast.WS['Victory Smite'] = set_combine(sets.precast.WS, {
	head="Adhemar Bonnet +1",
	hands="Ryuo Tekko +1",
	feet="Mpaca's Boots",
    right_ear="Odr Earring",
	})

sets.precast.WS['Victory Smite'].Impetus = set_combine(sets.precast.WS, {
	head="Adhemar Bonnet +1",
    body="Bhikku Cyclas +3",
	hands="Ryuo Tekko +1",
	feet="Mpaca's Boots"
	})

sets.precast.WS['Raging Fists'] = set_combine(sets.precast.WS, {
	left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	})

sets.precast.WS['Howling Fist'] = set_combine(sets.precast.WS, {
	left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	})
	
sets.precast.WS['Tornado Kick'] = set_combine(sets.precast.WS, {
	left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},		
    neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
    feet="Anch. Gaiters +3",
	})

sets.precast.WS["Asuran Fists"] = set_combine(sets.precast.WS, {
	ammo="Knobkierrie",
    head={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}},
    legs={ name="Adhemar Kecks", augments={'DEX+10','AGI+10','Accuracy+15',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Digni. Earring",
    right_ear="Telos Earring",
    left_ring="Ilabrat Ring",
    right_ring="Moonlight Ring",
	})

sets.precast.WS['Final Heaven'] = set_combine(sets.precast.WS), {
	ammo="Knobkierrie",
    head={ name="Herculean Helm", augments={'Weapon skill damage +5%','STR+9','Accuracy+7','Attack+8',}},	
    legs="Hiza. Hizayoroi +2",
}

sets.precast.WS['Shijin Spiral'] = set_combine(sets.precast.WS, {})


-- Misc Sets
sets.precast.Fastcast = set_combine(sets.idle.PDT, {
				head="Athos's Chapeau", neck="Magoraga Beads", lear="Loquac. Earring", rear="Novia Earring",
                body="Manibozho Jerkin", hands="Otronif Gloves +1", lring="", rring="Prolix Ring",
                back="Repulse Mantle", waist="Black Belt", legs="", feet=""})
sets.precast.Utsusemi = set_combine(sets.precast.Fastcast, {neck="Magoraga Beads"})

sets.misc.Waltz = {}
sets.misc.Steps = set_combine(sets.TP.MidAcc,{})
sets.misc.flourish = {}
