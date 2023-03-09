-- Firetoplay's NIN Gear_sets
-- Created: 7/13/2014
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
	
-- sets Macros off = 0  on = 1
		automacroset = 1
		if automacroset == 1 then
			if player.sub_job == 'WAR' then
				set_macro_page(1,17)
			elseif player.sub_job == 'DNC' then
				set_macro_page(1,17)
			elseif player.sub_job == 'DRK' then
				set_macro_page(1,17)
			elseif player.sub_job == 'RDM' then 
				set_macro_page(1,17)
			end
		else
			set_macro_page(1,17)
		end
		
	send_command('wait 3;input /lockstyleset 3')	
	
	sets.Chi = { 
	main={ name="Heishi Shorinken", augments={'Path: A',}},
    sub="Kunimitsu"
	}	
		
	sets.SB = { 
	main="Naegling",
    sub={ name="Ternion Dagger +1", augments={'Path: A',}}
	}
	
	sets.Evis = { 
	main="Tauret",
    sub={ name="Gleti's Knife", augments={'Path: A',}}
	}
	
-- Auto Sets
-- Standard/idle
sets.idle.PDT = { 
	ammo="Date Shuriken",
	head="Nyame Helm",
	neck="Rep. Plat. Medal",
	body="Malignance Tabard",
	hands="Nyame Gauntlets",
	left_ring="Defending Ring",
	right_ring="Shneddick Ring",
	lear="Eabani Earring",
	rear="Etiolation Earring",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
	}

sets.idle.MDT = {}

sets.misc.Town = set_combine(sets.idle.PDT, { 
				})
				
sets.idle.Standard = set_combine(sets.idle.PDT, {
				})
-- Full Evasion
sets.idle.Evasion = set_combine(sets.idle.PDT,{})

sets.Enmity = {}

-- Precast	
sets.precast.Fastcast = set_combine(sets.idle.PDT, {
	 ammo="Sapience Orb",
    head={ name="Herculean Helm", augments={'"Fast Cast"+5',}},
    body={ name="Adhemar Jacket +1", augments={'HP+105','"Fast Cast"+10','Magic dmg. taken -4',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs={ name="Herculean Trousers", augments={'"Mag.Atk.Bns."+16','"Fast Cast"+5','Mag. Acc.+7',}},
    feet={ name="Herculean Boots", augments={'Mag. Acc.+1','"Fast Cast"+5',}},
    neck="Voltsurge Torque",
    waist="Reiki Yotai",
    left_ear="Enchntr. Earring +1",
    right_ear="Telos Earring",
    left_ring="Kishar Ring",
    right_ring="Shneddick Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
			})

sets.precast.Utsusemi = set_combine(sets.precast.Fastcast, {
	neck="Magoraga Beads",
			})

sets.precast.Recast = set_combine(sets.idle.PDT,{
			
			})
-- Midcast
sets.midcast.Wheel = {
	ammo="Seeth. Bomblet +1",
    head="Mochi. Hatsuburi +3",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Sanctity Necklace",
    waist="Orpheus's sash",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Friomisi Earring",
    left_ring="Metamor. Ring +1",
    right_ring="Dingir Ring",
    back={ name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10','Damage taken-5%',}},
			}
			
sets.midcast.Futae = set_combine(sets.midcast.Wheel,{
    hands="Hattori Tekko +2"
	})
			
sets.midcast.Skill = {
	ammo="Seeth. Bomblet +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Friomisi Earring",
    left_ring="Ilabrat Ring",
    right_ring="Dingir Ring",
    back={ name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10','Damage taken-5%',}}
			}
sets.midcast.Enfeeb = set_combine(sets.midcast.Skill,{
			})
sets.midcast.Utsusemi = set_combine(sets.precast.Utsusemi,{
			feet="Hattori Kyahan +1",})
			
-- TP Sets 
sets.TP = { 
	ammo="Date Shuriken",
    head="Malignance Chapeau",
    body={ name="Mpaca's Doublet", augments={'Path: A',}},
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Ninja Nodowa +2",
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Hattori Earring +1",
    left_ring="Hetairoi Ring",
    right_ring="Epona's Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}

-- Accuracy TP Set
sets.TP.Acc = {}

-- Alliance Buffed
sets.TP.Buffed = {}

-- Hybrid Evasion
sets.TP.Hybrid = set_combine(sets.idle.PDT,{})

-- RA Sets
sets.precast.Snapshot = {}

sets.RA = {}
				
-- JA
sets.precast.JA["Mijin Gakure"] = {legs="Koga Hakama +2"}
sets.precast.JA["Mikage"] = {}

sets.precast.JA["Sange"] = {body="Koga Chainmail +2"}
sets.precast.JA["Yonin"] = {legs="Iga Hakama +2"}
sets.precast.JA["Innin"] = {head="Iga Zukin +2"}
sets.precast.JA["Futae"] = {hands="Hattori Tekko +2"}

-- Weaponskills
sets.precast.WS = { 
	ammo="Seeth. Bomblet +1",
    head="Mpaca's Cap",
    body="Nyame Mail", 
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Ninja Nodowa +2",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Brutal Earring",
    left_ring="Ilabrat Ring",
    right_ring="Epona's Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}
	
sets.precast.WS.WSD = { 
	ammo="Seeth. Bomblet +1",
	head="Nyame Helm",
    body="Nyame Mail", 
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Rep. Plat. Medal",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Cessance Earring",
    right_ear="Ishvara Earring",
    left_ring="Ilabrat Ring",
    right_ring={ name="Beithir Ring", augments={'Path: A',}},
    back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
	}
	
sets.precast.WS.MAB = { 
	ammo="Seeth. Bomblet +1",
	head="Mochi. Hatsuburi +3",
    body="Nyame Mail", 
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
	waist="Orpheus's sash",
    left_ear="Crepuscular Earring",
    right_ear="Friomosi Earring",
    left_ring="Ilabrat Ring",
    right_ring="Dingir Ring",
    back={ name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10','Damage taken-5%',}}
	}
-- Mercy Stroke 
sets.precast.WS["Blade: Jin"] = set_combine(sets.precast.WS, { 
	left_ear= "Telos Earring",
})

sets.precast.WS["Blade: Shun"] = set_combine(sets.precast.WS, { 
})

sets.precast.WS["Blade: Hi"] = set_combine(sets.precast.WS.WSD, { 
	body="Abnoba Kaftan",
    neck="Lissome Necklace",
    waist="Svelt. Gouriz +1",
})

sets.precast.WS["Blade: Ten"] = set_combine(sets.precast.WS.WSD, { 
	head="Mpaca's Cap",	
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
})
				
sets.precast.WS["Blade: Metsu"] = set_combine(sets.precast.WS.WSD, { 
	left_ear= "Telos Earring",
})

sets.precast.WS["Blade: Kamu"] = set_combine(sets.precast.WS, { 
	left_ear= "Telos Earring",
})

sets.precast.WS["Blade: Ku"] = set_combine(sets.precast.WS, { 
	head="Nyame Helm",
	left_ear= "Telos Earring",
})

sets.precast.WS["Blade: Teki"] = set_combine(sets.precast.WS.MAB, { 
})

sets.precast.WS["Blade: To"] = set_combine(sets.precast.WS.MAB, { 
})

sets.precast.WS["Blade: Chi"] = set_combine(sets.precast.WS.MAB, { 
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
})

sets.precast.WS["Blade: Ei"] = set_combine(sets.precast.WS.MAB, { 
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
})

sets.precast.WS["Blade: Yu"] = set_combine(sets.precast.WS.MAB, { 
})

sets.precast.WS["Savage Blade"] = set_combine(sets.precast.WS.WSD, { 
	head="Mpaca's Cap",	
	neck="Rep. Plat. Medal",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
})

sets.precast.WS["Aeolian Edge"] = set_combine(sets.precast.WS.MAB, { 
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
})

sets.precast.WS["Evisceration"] = set_combine(sets.precast.WS, { 
	ammo="Seeth. Bomblet +1",
	head={ name="Mpaca's Cap", augments={'Path: A',}},
    body="Abnoba Kaftan",
    hands="Mpaca's Gloves",
    legs="Mpaca's Hose",
    feet="Mummu Gamash. +2",
    neck="Fotia Gorget",
	waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Friomosi Earring",
    left_ring="Hetairoi Ring",
    right_ring="Regal Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
})

sets.misc.Waltz = {}
sets.misc.Steps = set_combine(sets.TP.Acc)
sets.misc.flourish = {}


elseif player.name == 'Derion' then

elseif player.name == 'Aniyah' then

elseif player.name == 'Firetoplay' then

end