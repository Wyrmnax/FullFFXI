-- PLD Gearsets
-- Created:4/1/2014
-- Last Modified: 7/19/2014
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

	-- sets Macros: 0ff = 0  On = 1
		automacroset = 2
		if automacroset == 1 then
			if player.sub_job == 'NIN' then
				set_macro_page(4,3)
			elseif player.sub_job == 'DNC' then
				set_macro_page(2,3)
			elseif player.sub_job == 'WAR' then
				set_macro_page(3,3)
			elseif player.sub_job == 'BLU' then 
				set_macro_page(1,3)
			elseif player.sub_job == 'whm' then 
				set_macro_page(5,3)
			elseif player.sub_job == 'run' then 
				set_macro_page(6,3)
			end
		elseif automacroset == 2 then
			set_macro_page(1,3)
		else
			windower.send_command('input /macro book 16')
		end
		
		send_command('wait 3;input /lockstyleset 18')
-- Auto Sets
sets.Duban = { 
	main="Burtgang",
    sub="Duban",
	}
sets.Aegis = { 
	main="Burtgang",
    sub="Aegis",
	}

-- Standard/idle
sets.idle = {
	ammo="Homiliary",
    head="Chev. Armet +3",
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands="Regal Gauntlets",
    legs="Chev. Cuisses +3",
    feet="Chev. Sabatons +3",
    --neck={ name="Unmoving Collar +1", augments={'Path: A',}},
	neck="Rep. Plat. Medal",
    waist="Flume Belt +1",
    left_ear="Tuisto Earring",
    right_ear={ name="Chev. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','Damage taken-3%',}},
    left_ring="Shneddick Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Damage taken-5%',}},
	}
	
sets.idle.MDT = {
	ammo="Staunch Tathlum +1",
    head="Sakpata's Helm",
    body="Sakpata's Plate",
    hands="Sakpata's Gauntlets",
    legs="Sakpata's Cuisses",
    feet="Sakpata's Leggings",
    neck="Unmoving Collar +1",
    waist="Flume Belt +1",
    right_ear="Odnowa Earring +1",
    left_ear="Tuisto Earring",
    left_ring="Moonbeam Ring",
    right_ring="Gelatinous Ring +1", 
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Damage taken-5%',}},
	}
				
sets.Sleep = set_combine(sets.idle, { sub="Duban",
				})
				
sets.idle.Standard = set_combine(sets.idle, { lring="Shneddick Ring",
				})
-- TP 
--sets.TP = set_combine(sets.idle, { })

sets.TP= {
	ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Flam. Zucchetto +2",
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs="Sakpata's Cuisses",
    feet="Sakpata's Leggings",
    neck="Vim Torque +1",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Telos Earring",
    right_ear="Cessance Earring",
    left_ring="Chirich Ring +1",
    right_ring="Flamma Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Damage taken-5%',}},
	
	--ammo="Homiliary",
    --head="Chev. Armet +3",
    --body={ name="Sakpata's Plate", augments={'Path: A',}},
    --hands="Regal Gauntlets",
    --legs="Chev. Cuisses +3",
    --feet="Chev. Sabatons +3",
	--neck="Rep. Plat. Medal",
    --waist="Flume Belt +1",
    --left_ear="Tuisto Earring",
    --right_ear={ name="Chev. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','Damage taken-3%',}},
    --left_ring="Shneddick Ring",
    --right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    --back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Damage taken-5%',}},
	}
				
-- Precast 
-- Enmity Caps at 100 
sets.Enmity = set_combine(sets.idle,{ 
	ammo="Sapience Orb",
    head={ name="Loess Barbuta +1", augments={'Path: A',}},
	body="Souv. Cuirass +1",
    neck="Moonlight Necklace",
    waist="Flume Belt +1",
    right_ear="Odnowa Earring +1",
    left_ear="Tuisto Earring",
    left_ring="Supershear Ring",
    right_ring="Gelatinous Ring +1",
	feet="Chev.Sabatons +3",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Damage taken-5%',}},
})

sets.HPDown = set_combine(sets.idle,{
})

sets.precast.Fastcast = { 
	ammo="Sapience Orb",
    head="Chev. Armet +3",
    body="Sacro Breastplate",
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    feet="Carmine Greaves +1",
    neck="Voltsurge Torque",
	lear="Enchntr. Earring +1",
	right_ear="Odnowa Earring +1",
    left_ring="Kishar Ring",
	back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
}

sets.precast.Utsusemi = set_combine(sets.precast.Fastcast,{
})

sets.precast.Cure = set_combine(sets.precast.Fastcast,{
})

-- Midcast

sets.midcast.SIRD = set_combine(sets.Enmity,{
	ammo="Staunch Tathlum +1",
    hands="Regal Gauntlets",
	body="Sakpata's Plate",
    legs={ name="Founder's Hose", augments={'MND+6','Mag. Acc.+10','Attack+7','Breath dmg. taken -2%',}},
    feet={ name="Odyssean Greaves", augments={'Attack+26','Enmity+6','DEX+7',}},
    neck="Moonlight Necklace",
	left_ear="Tuisto Earring",
	lring="Supershear Ring",
    waist="Audumbla Sash",
})

sets.midcast.Cure = {
    ammo="Staunch Tathlum +1",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands="Regal Gauntlets",
    legs={ name="Founder's Hose", augments={'MND+6','Mag. Acc.+10','Attack+7','Breath dmg. taken -2%',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Moonlight Necklace",
    waist="Audumbla Sash",
    left_ear="Mendi. Earring",
    right_ear={ name="Chev. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','Damage taken-3%',}},
    left_ring="Defending Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Damage taken-5%',}},
}

sets.midcast.Macc = {
	ammo="Pemphredo Tathlum",
    head="Chev. Armet +3",
    body="Chev. Cuirass +2",
    hands="Chev. Gauntlets +2",
    legs="Chev. Cuisses +3",
    feet="Chev. Sabatons +3",
    neck="Sanctity Necklace",
    waist="Acuity Belt +1",
    left_ear="Crep. Earring",
    right_ear="Digni. Earring",
    left_ring="Defending Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Damage taken-5%',}},
	}
	

sets.midcast.DivineMagic = set_combine(sets.midcast.SIRD,{body="Reverence Surcoat"})

sets.midcast.EnhancingMagic = set_combine(sets.midcast.SIRD,{
	hands="Regal Gauntlets",})

sets.midcast.EnhancingMagic.Reprisal = set_combine(sets.midcast.SIRD,{
	head="Sakpata's Helm",	
	hands="Regal Gauntlets",
	left_ring="Defending Ring",
	back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
	})

sets.midcast.EnhancingMagic.Phalanx ={
	main="Sakpata's Sword",
    sub={ name="Priwen", augments={'HP+50','Mag. Evasion+50','Damage Taken -3%',}},
    ammo="Staunch Tathlum +1",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    body={ name="Yorium Cuirass", augments={'Spell interruption rate down -10%','Phalanx +3',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+65','Shield skill +15','Phys. dmg. taken -4',}},
    legs="Sakpata's Cuisses",
    feet={ name="Odyssean Greaves", augments={'Enmity+5','Crit.hit rate+1','Phalanx +3','Accuracy+8 Attack+8','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},
    neck="Moonlight Necklace",
    waist="Audumbla Sash",
    left_ear="Knightly Earring",
    right_ear="Mimir Earring",
    left_ring="Defending Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back={ name="Weard Mantle", augments={'VIT+2','DEX+1','Enmity+2','Phalanx +5',}},
	}

-- JA
sets.precast.JA["Invincible"] = set_combine(sets.Enmity,{legs="Cab. Breeches"})
sets.precast.JA["Intervene"] = set_combine(sets.precast.JA["Shield Bash"],{
				hands="Cab. Gauntlets +2",lear="Knightly Earring"})
				
sets.FullEnmity = set_combine(sets.Enmity,{
})
-- MND			
sets.precast.JA["Chivalry"] = set_combine(sets.idle,{hands="Cab. Gauntlets +2"},{
				head="Yaoyotl Helm", neck="Phalaina Locket",
				body="Cab. Surcoat", lring="Aquasoul Ring", rring="Aquasoul Ring",
				legs="Cab. Breeches", feet="Whirlpool Greaves"})
-- VIT
sets.precast.JA["Rampart"] = set_combine(sets.Enmity,{
				head="Cab. Coronet", 
				body="Cab. Surcoat", hands="Cab. Gauntlets +2",
				waist="Chuq'aba Belt", legs="Cab. Breeches", feet="Whirlpool Greaves"})
sets.precast.JA["Sentinel"] = set_combine(sets.Enmity,{feet="Cab. Leggings"})
sets.precast.JA["Holy Circle"] = set_combine(sets.Enmity,{feet="Rev. Leggings +1"})
sets.precast.JA["Fealty"] = set_combine(sets.Enmity,{body="Cab. Surcoat"})
sets.precast.JA["Shield Bash"] = set_combine(sets.Enmity,{
				hands="Cab. Gauntlets +2",lear="Knightly Earring"})

-- WS
sets.precast.WS = set_combine(sets.TP, {
	ammo="Coiste Bodhar",
	head="Flam. Zucchetto +2",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
	feet="Nyame Sollerets",
	neck="Fotia Gorget",
    waist="Fotia Belt",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}}, 
    left_ring="Epaminondas's Ring",
    right_ring="Cornelia's Ring", 	
	})

sets.precast.WS.WSD = set_combine(sets.TP, { 	
	ammo="Oshasha's Treatise",
	neck="Rep. Plat. Medal",
	head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
	feet="Nyame Sollerets",
	waist="Sailfi Belt +1",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ear="Thrud Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Cornelia's Ring", 	
	})
	
sets.precast.WS.MAB = { 
	ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
	feet="Nyame Sollerets",
    neck="Moonlight Necklace",
    waist="Orpheus's Sash",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ear="Friomisi Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Cornelia's Ring", 	
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Damage taken-5%',}},   
	}
				
sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {
	})
	
sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {
	body="Hjarrandi Breast.",
	})
				
sets.precast.WS['Atonement'] = set_combine(sets.precast.WS.WSD, {
	})

sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS.WSD, {
	})
	
sets.precast.WS['Red Lotus Blade'] = set_combine(sets.precast.WS.MAB, {
	})

sets.precast.WS['Shining Blade'] = set_combine(sets.precast.WS.MAB, {
	})
	
sets.precast.WS['Seraph Blade'] = set_combine(sets.precast.WS.MAB, {
	})
	
sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast.WS.MAB, {
	head="Pixie Hairpin +1",    
    left_ring="Archon Ring",
	})


-- Misc Sets

sets.misc.Waltz = set_combine(sets.precast.JA["Chivalry"],{})
sets.misc.Steps = set_combine(sets.TP.Acc,{})
sets.misc.flourish = {}

else

end