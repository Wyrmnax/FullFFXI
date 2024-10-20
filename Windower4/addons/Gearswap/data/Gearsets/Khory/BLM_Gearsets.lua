-- BLM Gearsets
-- Date: 4/11/2014
--
---

if player.Name == 'Khory' then
		-- includes
		include('include/mappings.lua')
		include('include/equipment.lua')
		include('include/utility.lua')

		-- sets Macros off = 0  on = 1
		automacroset = 0
		if automacroset == 1 then
			if player.sub_job == 'RDM' then
				set_macro_page(1,8)
			elseif player.sub_job =='WHM' then
				set_macro_page(1,8)
			elseif player.sub_job == 'SCH' then
				set_macro_page(1,8)
			elseif player.sub_job == 'BRD' then
				set_macro_page(1,8)
			elseif player.sub_job =='NIN' then 
				set_macro_page(1,8)
			end
		else
			set_macro_page(1,8)
		end
		
	send_command('wait 3;input /lockstyleset 16')

		-- Auto Sets
		-- Standard/idle
		sets.idle.PDT = { 
	main="Mpaca's Staff",
    sub="Khonsu",
    ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Shamash Robe",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Assid. Pants +1",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Rep. Plat. Medal",
    waist="Fucho-no-Obi",
    left_ear="Etiolation Earring",
    right_ear="Eabani Earring",
    left_ring="Stikini Ring +1",
    right_ring="Shneddick Ring",
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
	}
	
		sets.idle.MDT = {
	main="Mpaca's Staff",
    sub="Khonsu",
    ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Shamash Robe",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Assid. Pants +1",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Sanctity Necklace",
    waist="Fucho-no-Obi",
    left_ear="Etiolation Earring",
    right_ear="Eabani Earring",
    left_ring="Stikini Ring +1",
    right_ring="Shneddick Ring",
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
	}			
	
		sets.Resting = set_combine(sets.idle.PDT, {})
		sets.idle.Standard = set_combine(sets.idle.PDT,{})
		sets.misc.Town = set_combine(sets.idle.PDT, {})
		
		-- JA
		sets.precast.JA["Manafont"] = {}
		sets.precast.JA["Subtle Sorcery"] = {}
		sets.precast.JA["Elemental Seal"] = {}
		sets.precast.JA["Emnity Douse"] = {}
		sets.precast.JA["Manawell"] = {}
		
		-- Precast
		-- Magic
		sets.precast.MinusHP = {}
		sets.precast.Fastcast = {
	main="Mpaca's Staff",
    sub="Khonsu",
    ammo="Impatiens",
    head={ name="Merlinic Hood", augments={'"Fast Cast"+7','CHR+10','"Mag.Atk.Bns."+6',}},
    body={ name="Merlinic Jubbah", augments={'Mag. Acc.+1 "Mag.Atk.Bns."+1','"Fast Cast"+6','INT+8','Mag. Acc.+7','"Mag.Atk.Bns."+5',}},
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet={ name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+20','"Fast Cast"+5','INT+2','Mag. Acc.+9',}},
    neck="Voltsurge Torque",
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Kishar Ring",
    right_ring="Lebeche Ring",
    back="Fi Follet Cape +1",
	}
	
		sets.precast.Elemental = set_combine(sets.precast.Fastcast,{})
		sets.precast.Cure = set_combine(sets.precast.Fastcast, {})
		sets.precast.Death = set_combine(sets.precast.Fastcast, {})
		-- Midcast
		
		sets.midcast.Stun = set_combine(sets.precast.Fastcast, {})
		sets.midcast.Recast = set_combine(sets.idle.PDT, {waist="Witful Belt"})
		
		sets.midcast.ConserveMP = {}
		
		-- Elemental
		-- High Resist
		sets.midcast.Elemental = {
	main="Mpaca's Staff",
    sub="Khonsu",
    ammo="Ghastly Tathlum +1",
    body="Cohort Cloak +1",
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs="Wicce Chausses +3",
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck="Sanctity Necklace",
    waist="Skrymir Cord",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Metamor. Ring +1",
    right_ring="Freke Ring",
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
	}
		-- Damage
	sets.midcast.Nuke = {
	main="Mpaca's Staff",
    sub="Khonsu",
    ammo="Ghastly Tathlum +1",
    head="Ea Hat +1",
    body="Wicce Coat +3",
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs="Wicce Chausses +3",
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck="Src. Stole +2",
    waist="Skrymir Cord",
    left_ear="Malignance Earring",
    right_ear="Wicce Earring +1",
    left_ring="Metamor. Ring +1",
    right_ring="Freke Ring",
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
	}
	
	sets.midcast.Nuke.MB = {
	main="Mpaca's Staff",
    sub="Khonsu",
    ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head="Ea Hat +1",
    body="Wicce Coat +3",
    hands="Agwu's gages",
    legs="Wicce Chausses +3",
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck="Src. Stole +2",
    --waist="Orpheus's Sash",
    waist="Skrymir Cord",
    left_ear="Malignance Earring",
    right_ear="Wicce Earring +1",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Freke Ring",
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
	}
		
		--Healing Magic
		sets.midcast.Cure = {
	head={ name="Vanya Hood", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
    body="Shamash Robe",
    hands="Telchine Gloves",
    legs={ name="Vanya Slops", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
    feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    neck="Rep. Plat. Medal",
    waist="Fucho-no-Obi",
    left_ear="Lempo Earring",
    right_ear="Mendi. Earring",
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
	}
		
		sets.midcast.Curaga = {
	head={ name="Vanya Hood", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
    body="Shamash Robe",
    hands="Telchine Gloves",
    legs={ name="Vanya Slops", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
    feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    neck="Rep. Plat. Medal",
    waist="Fucho-no-Obi",
    left_ear="Lempo Earring",
    right_ear="Mendi. Earring",
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},}
	
		-- Enhancing 
		-- 
		sets.midcast.Enhancing = {sub="Fulcio Grip",neck="Colossus's Torque",body="Anhur Robe",hands="Ayao's Gloves",legs="Portant Pants",feet="Rubeus Boots",waist="Cascade Belt",back="Merciful Cape"}
		sets.midcast.Phalanx = set_combine(sets.midcast.Enhancing)
		sets.midcast.Hastespell = {ammo="Impatiens", waist="Witful Belt"}
		sets.midcast.Stoneskin = {}
		sets.midcast.Aquaveil = {}
		sets.midcast.Blink = set_combine(sets.midcast.Aquaveil)
		sets.midcast.Reraise = set_combine(sets.midcast.ConserveMP)

		-- Enfeebling
		-- Potency
		sets.midcast.Enfeebling = {
		main="Mpaca's Staff",
		sub="Khonsu",
		ammo="Ghastly Tathlum +1",
		head="Ea Hat +1",
		body="Wicce Coat +3",
		hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		legs="Wicce Chausses +3",
		feet={ name="Agwu's Pigaches", augments={'Path: A',}},
		neck="Src. Stole +2",
		waist="Skrymir Cord",
		left_ear="Malignance Earring",
		right_ear="Regal Earring",
		left_ring="Metamor. Ring +1",
		right_ring="Freke Ring",
		back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
	}
		sets.midcast.Macc = {
		main="Mpaca's Staff",
		sub="Khonsu",
		ammo="Ghastly Tathlum +1",
		head="Ea Hat +1",
		body="Wicce Coat +3",
		hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		legs="Wicce Chausses +3",
		feet={ name="Agwu's Pigaches", augments={'Path: A',}},
		neck="Src. Stole +2",
		waist="Skrymir Cord",
		left_ear="Malignance Earring",
		right_ear="Regal Earring",
		left_ring="Metamor. Ring +1",
		right_ring="Freke Ring",
		back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
	}
		sets.midcast.Dia = set_combine(sets.midcast.ConserveMP)
		sets.midcast.Paralyze = set_combine(sets.midcast.Macc)
		sets.midcast.Blind = set_combine(sets.midcast.Macc)
		sets.midcast.Bio = set_combine(sets.midcast.Macc)
		sets.midcast.Slow = set_combine(sets.midcast.Macc)
		
		
		-- Dark Magic
		sets.midcast.Dark = set_combine(sets.midcast.Macc, {
			main="Mpaca's Staff",
			sub="Khonsu",
			ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
			head="Amalric Coif +1",
			body="Agwu's Robe",
			hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},			
			legs="Wicce Chausses +3",
			feet={ name="Agwu's Pigaches", augments={'Path: A',}},
			neck="Erra Pendant",
			waist="Fucho-no-Obi",
			left_ear="Malignance Earring",
			right_ear="Regal Earring",
			left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
			right_ring="Evanescence Ring",
			back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
				})
		sets.midcast.Aspir = set_combine(sets.midcast.Dark, {
			main="Mpaca's Staff",
			sub="Khonsu",
			ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
			head="Amalric Coif +1",
			body="Agwu's Robe",
			hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},			
			legs="Wicce Chausses +3",
			feet={ name="Agwu's Pigaches", augments={'Path: A',}},
			neck="Erra Pendant",
			waist="Fucho-no-Obi",
			left_ear="Malignance Earring",
			right_ear="Regal Earring",
			left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
			right_ring="Evanescence Ring",
			back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
	})
		sets.midcast.Stun = set_combine(sets.midcast.Macc)
		
		-- Melee Sets
		sets.TP = set_combine(sets.idle.PDT, {
				ammo="Amar Cluster",
				head={ name="Nyame Helm", augments={'Path: B',}},
				body={ name="Nyame Mail", augments={'Path: B',}},
				hands={ name="Nyame Gauntlets", augments={'Path: B',}},
				legs={ name="Nyame Flanchard", augments={'Path: B',}},
				feet={ name="Nyame Sollerets", augments={'Path: B',}},
				neck="Lissome Necklace",
				waist="Eschan Stone",
				left_ear="Crep. Earring",
				right_ear="Telos Earring",
				left_ring="Petrov Ring",
				right_ring="Jhakri Ring",
				back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
	})
		sets.precast.WS = {
				ammo="Amar Cluster",
				head={ name="Nyame Helm", augments={'Path: B',}},
				body={ name="Nyame Mail", augments={'Path: B',}},
				hands={ name="Nyame Gauntlets", augments={'Path: B',}},
				legs={ name="Nyame Flanchard", augments={'Path: B',}},
				feet={ name="Nyame Sollerets", augments={'Path: B',}},
				neck="Caro Necklace",
				waist="Eschan Stone",
				left_ear="Crep. Earring",
				right_ear="Telos Earring",
				left_ring="Petrov Ring",
				right_ring="Jhakri Ring",
				back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
				}
		sets.precast.WS.WSD = {
				ammo="Amar Cluster",
				head={ name="Nyame Helm", augments={'Path: B',}},
				body={ name="Nyame Mail", augments={'Path: B',}},
				hands={ name="Nyame Gauntlets", augments={'Path: B',}},
				legs={ name="Nyame Flanchard", augments={'Path: B',}},
				feet={ name="Nyame Sollerets", augments={'Path: B',}},
				neck="Caro Necklace",
				waist="Eschan Stone",
				left_ear="Crep. Earring",
				right_ear="Telos Earring",
				left_ring="Petrov Ring",
				right_ring="Jhakri Ring",
				back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
				}
		sets.precast.WS.MAB = {
				ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
				body={ name="Cohort Cloak +1", augments={'Path: A',}},
				hands={ name="Agwu's Gages", augments={'Path: A',}},
				legs={ name="Agwu's Slops", augments={'Path: A',}},
				feet={ name="Agwu's Pigaches", augments={'Path: A',}},
				neck="Sanctity Necklace",
				waist="Orpheus's Sash",
				left_ear="Malignance Earring",
				right_ear={ name="Wicce Earring +1", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+11','Enmity-1',}},
				left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
				right_ring="Freke Ring",
				back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
				}
		sets.precast.WS['Shattersoul'] = set_combine(sets.precast.WS, {})
		sets.precast.WS['Retribution'] = set_combine(sets.precast.WS.WSD, {})
		sets.precast.WS['Rock Crusher'] = set_combine(sets.precast.WS.MAB, {})
		sets.precast.WS['Earth Crusher'] = set_combine(sets.precast.WS.MAB, {})
		sets.precast.WS['Cataclysm'] = set_combine(sets.precast.WS.MAB, {})
		
		-- Misc
		sets.misc.Waltz = {}
		sets.misc.Steps = {}
		sets.misc.flourish = {}
end