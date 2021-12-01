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
-- Auto Sets
physicalshield = {sub="Priwen"}
magicalshield = {sub="Aegis"}

-- Standard/idle
sets.idle = {
	ammo="Staunch Tathlum +1",
    head="Sakpata's Helm",
    body="Sakpata's Plate",
    hands="Souv. Handsch. +1",
    legs="Sakpata's Cuisses",
    feet="Rev. Leggings +3",
    neck="Unmoving Collar +1",
    waist="Flume Belt +1",
    left_ear="Foresti Earring",
    right_ear="Tuisto Earring",
    left_ring="Moonbeam Ring",
    right_ring="Gelatinous Ring +1", 
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Chance of successful block +5',}},
	}
	
sets.idle.MDT = {
	ammo="Staunch Tathlum +1",
    head="Sakpata's Helm",
    body="Sacro Breastplate",
    hands="Sakpata's Gauntlets",
    legs="Sakpata's Cuisses",
    feet="Sakpata's Leggings",
    neck="Unmoving Collar +1",
    waist="Flume Belt +1",
    left_ear="Odnowa Earring +1",
    right_ear="Tuisto Earring",
    left_ring="Moonbeam Ring",
    right_ring="Gelatinous Ring +1", 
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Chance of successful block +5',}},
	}
				
sets.idle.Standard = set_combine(sets.idle, { lring="Shneddick Ring",
				})
-- TP 
sets.TP = set_combine(sets.idle, { })
				
-- Precast 
-- Enmity Caps at 100 
sets.Enmity = set_combine(sets.idle,{ 
	ammo="Sapience Orb",
    head={ name="Loess Barbuta +1", augments={'Path: A',}},
	body="Souv. Cuirass +1",
    neck="Moonlight Necklace",
    waist="Flume Belt +1",
    left_ear="Odnowa Earring +1",
    right_ear="Tuisto Earring",
    left_ring="Supershear Ring",
    right_ring="Gelatinous Ring +1",
	feet={ name="Odyssean Greaves", augments={'Attack+26','Enmity+6','DEX+7',}},
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Chance of successful block +5',}},
})

sets.HPDown = set_combine(sets.idle,{
})

sets.precast.Fastcast = { 
	ammo="Sapience Orb",
    head="Sakpata's Helm",
    body="Sacro Breastplate",
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}},
    neck="Voltsurge Torque",
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
    legs={ name="Founder's Hose", augments={'MND+6','Mag. Acc.+10','Attack+7','Breath dmg. taken -2%',}},
    feet={ name="Odyssean Greaves", augments={'Attack+26','Enmity+6','DEX+7',}},
    neck="Moonlight Necklace",
	lear="Knightly Earring",
    waist="Audumbla Sash",
})

sets.midcast.Cure = set_combine(sets.midcast.SIRD,{
})

sets.midcast.DivineMagic = set_combine(sets.midcast.SIRD,{body="Reverence Surcoat"})

sets.midcast.EnhancingMagic = set_combine(sets.midcast.SIRD,{
	hands="Regal Gauntlets",})

sets.midcast.EnhancingMagic.Reprisal = set_combine(sets.midcast.SIRD,{
	head="Sakpata's Helm",	
	hands="Regal Gauntlets",
    body="Sacro Breastplate",
	left_ring="Defending Ring",
	back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
	})

sets.midcast.EnhancingMagic.Phalanx = set_combine(sets.midcast.SIRD,{
	head="Odyssean Helm",
	hands="Souv. handsch. +1",
    legs="Sakpata's Cuisses",
	feet="Souveran Schuhs +1"
	})

-- JA
sets.precast.JA["Invincible"] = set_combine(sets.Enmity,{legs="Cab. Breeches"})
sets.precast.JA["Intervene"] = set_combine(sets.precast.JA["Shield Bash"],{
				hands="Cab. Gauntlets",lear="Knightly Earring"})
				
sets.FullEnmity = set_combine(sets.Enmity,{
})
-- MND			
sets.precast.JA["Chivalry"] = set_combine(sets.idle,{hands="Cab. Gauntlets"},{
				head="Yaoyotl Helm", neck="Phalaina Locket",
				body="Cab. Surcoat", lring="Aquasoul Ring", rring="Aquasoul Ring",
				legs="Cab. Breeches", feet="Whirlpool Greaves"})
-- VIT
sets.precast.JA["Rampart"] = set_combine(sets.Enmity,{
				head="Cab. Coronet", 
				body="Cab. Surcoat", hands="Cab. Gauntlets",
				waist="Chuq'aba Belt", legs="Cab. Breeches", feet="Whirlpool Greaves"})
sets.precast.JA["Sentinel"] = set_combine(sets.Enmity,{feet="Cab. Leggings"})
sets.precast.JA["Holy Circle"] = set_combine(sets.Enmity,{feet="Rev. Leggings +1"})
sets.precast.JA["Fealty"] = set_combine(sets.Enmity,{body="Cab. Surcoat"})
sets.precast.JA["Shield Bash"] = set_combine(sets.Enmity,{
				hands="Cab. Gauntlets",lear="Knightly Earring"})

-- WS
sets.precast.WS = set_combine(sets.TP, {
	ammo="Coiste Bodhar",
	head="Flam. Zucchetto +2",
	neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},    
    left_ring={ name="Beithir Ring", augments={'Path: A',}},
    feet="Sulev. Leggings +2",
	})

sets.precast.WS.WSD = set_combine(sets.TP, { 
	neck="Loricate Torque+1",
	head="Nyame Helm",
    body="Nyame Mail",
    hands={ name="Valorous Mitts", augments={'Accuracy+7','STR+4','Weapon skill damage +9%','Accuracy+19 Attack+19','Mag. Acc.+15 "Mag.Atk.Bns."+15',}},
    legs="Nyame Flanchard",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Thrud Earring",
    left_ring="Regal Ring",
    right_ring={ name="Beithir Ring", augments={'Path: A',}}, 
    feet="Sulev. Leggings +2", 
	
	})
	
sets.precast.WS.MAB = { 
	ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands={ name="Valorous Mitts", augments={'Accuracy+7','STR+4','Weapon skill damage +9%','Accuracy+19 Attack+19','Mag. Acc.+15 "Mag.Atk.Bns."+15',}},
    legs="Nyame Flanchard",
    feet="Sulev. Leggings +2",
    neck="Moonlight Necklace",
    waist="Orpheus's Sash",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Friomisi Earring",
    left_ring={ name="Beithir Ring", augments={'Path: A',}},
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Chance of successful block +5',}},   
	}
				
sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {
	})
	
sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {
	body="Hjarrandi Breast.",
	})
	
sets.precast.WS['Atonement'] = set_combine(sets.precast.WS, sets.Enmity,{
				
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