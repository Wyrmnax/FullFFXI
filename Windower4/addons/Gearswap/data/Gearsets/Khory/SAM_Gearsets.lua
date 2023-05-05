-- SAM Gearsets
-- To Do:
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
				set_macro_page(1,13)				
			elseif player.sub_job == 'DRG' then 
				set_macro_page(2,13)
			elseif player.sub_job == 'NIN' then
				set_macro_page(2,13)
			elseif player.sub_job == 'DNC' then
				set_macro_page(3,13)
			elseif player.sub_job == 'RNG' then 
				set_macro_page(5,13)
			elseif player.sub_job == 'RUN' then 
				set_macro_page(6,13)
			end
		else
			set_macro_page(1,13)
		end
		
	send_command('wait 3;input /lockstyleset 7')
	
	sets.mainweapon = {}
	sets.mainweapon.Masamune = {
	main="Masamune",
	sub="Utu Grip",
	}
	
	sets.mainweapon.Doji = {
	main="Dojikiri Yasutsuna",
	sub="Utu Grip",
	}
 
	sets.mainweapon.ShiningOne = {
	main="Shining One",
	sub="Utu Grip",
	}

-- Auto Sets
-- Standard/idle
sets.idle.PDT = { 
    ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Sacro Breastplate",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Rep. Plat. Medal",
    waist="Ioskeha Belt +1",
    left_ear="Telos Earring",
    right_ear="Eabani Earring",
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}

sets.idle.MDT = { 
    ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Sacro Breastplate",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Rep. Plat. Medal",
    waist="Ioskeha Belt +1",
    left_ear="Telos Earring",
    right_ear="Eabani Earring",
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}

sets.idle.Evasion = {}

sets.misc.Town = set_combine(sets.idle.PDT, {
				})
				
sets.idle.Standard = set_combine(sets.idle.PDT, {
				})
-- TP - 49 52
sets.TP = { 	
     ammo="Ginsen",
    head="Kasuga Kabuto +3",
    body="Kasuga Domaru +3",
    hands={ name="Tatena. Gote +1", augments={'Path: A',}},
    legs="Kasuga Haidate +3",
    feet={ name="Ryuo Sune-Ate +1", augments={'HP+65','"Store TP"+5','"Subtle Blow"+8',}},
    neck="Moonlight Nodowa",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Crep. Earring",
    right_ear={ name="Kasuga Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+14','Mag. Acc.+14','Weapon skill damage +3%',}},
    left_ring="Niqmaddu Ring",
    right_ring="Chirich Ring +1",
    back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}

-- Bow TP
sets.TP.Bow = { 	
	ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Kasuga Kabuto +3",
    body="Kasuga Domaru +3",
    hands="Wakido Kote +3",
    legs="Mpaca's Hose",
    feet="Mpaca's Boots",
    neck={ name="Sam. Nodowa +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Schere Earring", augments={'Path: A',}},
    right_ear="Cessance Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Flamma Ring",
    back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}
	
-- JA
sets.precast.JA["Meikyo Shisui"] = {feet="Sakonji Sune-ate"}
sets.precast.JA["Yaegasumi"] = {}

sets.precast.JA["Meditate"] = set_combine(sets.idle.PDT, {
				head="Wakido Kabuto +2",
				hands="Sakonji Kote +2",})
sets.precast.JA["Hasso"] = {hands="Wakido Kote +3",legs="Unkai Haidate +2"}
sets.precast.JA["Third Eye"] = {legs="Saotome Haidate"}
sets.precast.JA["Seigan"] = {head="Unkai Kabuto +2"}
sets.precast.JA["Blade Bash"] = {hands="Sakonji Kote +2"}
sets.precast.JA["Sekkanoki"] = {hands="Unkai Kote +2"}
sets.precast.JA["Sengikori"] = {feet="Unkai Sune-ate +2"}
sets.precast.JA["Hagakore"] = {feet="Hes. Gaiters"}
sets.precast.JA["Konzen-ittai"] = {}
sets.precast.JA["Warding Circle"] = {head="Wakido Kabuto +2"}

-- Weaponskills
sets.precast.WS = { 	
	 ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Sam. Nodowa +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Schere Earring", augments={'Path: A',}},
    right_ear="Kasuga Earring +1",
    left_ring="Niqmaddu Ring",
    right_ring="Flamma Ring",
    back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}
	
sets.precast.WS.WSD = {
	ammo="Knobkierrie",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Sam. Nodowa +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Thrud Earring",
    right_ear="Kasuga Earring +1",
    left_ring="Epaminondas's Ring",
    right_ring={ name="Beithir Ring", augments={'Path: A',}},
    back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
}	

sets.precast.WS.MAB = {
	ammo="Knobkierrie",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Sam. Nodowa +2", augments={'Path: A',}},
    waist="Orpheus's sash",
    left_ear="Friomisi Earring",
    right_ear="Kasuga Earring +1",
    left_ring="Epaminondas's Ring",
    right_ring={ name="Beithir Ring", augments={'Path: A',}},
    back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
}


------------------- Polearm -------------------------

sets.precast.WS["Leg Sweep"] = set_combine(sets.precast.WS.MAB, { 
	})
	
sets.precast.WS['Thunder Thrust'] = set_combine(sets.precast.WS.MAB, {    
	})
	
sets.precast.WS['Raiden Thrust'] = set_combine(sets.precast.WS.MAB, {    
	})
	
sets.precast.WS['Impulse Drive'] = set_combine(sets.precast.WS.WSD, {   
	head="Mpaca's Cap",
	right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	})
	
------------------- Great Katana -------------------------
	
sets.precast.WS['Tachi: Jinpu'] = set_combine(sets.precast.WS.MAB, {    
	--head="Mpaca's Cap",
	left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	})

sets.precast.WS['Tachi: Kagero'] = set_combine(sets.precast.WS.MAB, {    
	--head="Mpaca's Cap",
	left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	})
	
sets.precast.WS['Tachi: Goten'] = set_combine(sets.precast.WS.MAB, {   
	--head="Mpaca's Cap",
	left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	})
	
sets.precast.WS['Tachi: Koki'] = set_combine(sets.precast.WS.MAB, {  
	--head="Mpaca's Cap",
	left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	})
	
sets.precast.WS['Tachi: Ageha'] = set_combine(sets.precast.WS.MAB, {    
	})
	
sets.precast.WS['Tachi: Fudo'] = set_combine(sets.precast.WS.WSD, {    
	head="Mpaca's Cap",
	left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	})
	
sets.precast.WS['Tachi: Shoha'] = set_combine(sets.precast.WS.WSD, {    
	head="Mpaca's Cap",
	left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	})
	
sets.precast.WS['Tachi: Gekko'] = set_combine(sets.precast.WS.WSD, {    
	head="Mpaca's Cap",
	left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	})
	
sets.precast.WS['Tachi: Rana'] = set_combine(sets.precast.WS, {    	
	})
	
sets.precast.WS['Tachi: Kaiten'] = set_combine(sets.precast.WS.WSD, {    
	})
	
sets.precast.WS['Tachi: Kasha'] = set_combine(sets.precast.WS.WSD, {    
	head="Mpaca's Cap",
	left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	})

------------------- Sword -------------------------

sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {    	
	})	
	
------------------- Ranged -------------------------
sets.precast.RAWS = { 
	}
sets.precast.RAWS['Apex Arrow'] = { 
	}
sets.precast.RAWS['Namas Arrow'] = { 
	}
sets.precast.RAWS.Acc = {}
sets.precast.RAWS.Acc['Namas Arrow'] = {
	}

-- Misc Sets
sets.precast.Fastcast = set_combine(sets.idle.PDT, {
				lear="Loquac. Earring",
                rring="Prolix Ring",
               })
sets.precast.Utsusemi = set_combine(sets.precast.Fastcast, {neck="Magoraga Beads"})

sets.misc.Waltz = {}
sets.misc.Steps = set_combine(sets.TP.Acc,{})
sets.misc.flourish = {}

else

end