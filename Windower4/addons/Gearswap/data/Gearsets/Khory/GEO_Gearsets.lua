-- BLM Gearsets
-- Created: 4/11/2014
-- Last Updated:
-- To Do List
--
--
--
--

if player.Name == 'Khory' then
		-- includes
		include('include/mappings.lua')
		include('include/equipment.lua')
		include('include/utility.lua')

		-- sets Macros off = 0  on = 1
		automacroset = 0
		if automacroset == 1 then
			if player.sub_job == 'RDM' then
				set_macro_page(1,1)
			elseif player.sub_job =='BLM' then
				set_macro_page(1,1)
			elseif player.sub_job == 'WHM' then
				set_macro_page(1,1)
			elseif player.sub_job == 'SCH' then
				set_macro_page(1,1)
			elseif player.sub_job =='DNC' then 
				set_macro_page(1,1)
			elseif player.sub_job =='DRK' then 
				set_macro_page(1,1)
			elseif player.sub_job =='NIN' then 
				set_macro_page(1,1)
			end
		else
			set_macro_page(1,1)
		end
		
		send_command('wait 3;input /lockstyleset 13')

		-- Auto Sets
		-- Standard/idle
		sets.idle.PDT = {
    main="Daybreak",
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
	head={ name="Nyame Helm", augments={'Path: B',}},
    body="Shamash Robe",
	hands={ name="Nyame Gauntlets", augments={'Path: B',}},    
    legs="Assid. Pants +1",
	feet={ name="Nyame Sollerets", augments={'Path: B',}},
	waist="Fucho-no-Obi",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    left_ear="Eabani Earring",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",	
    back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}},
	}	
		sets.idle.MDT = set_combine(sets.idle.PDT, {})
		sets.Resting = set_combine(sets.idle.PDT, {})
		sets.idle.Standard = set_combine(sets.idle.PDT, {})
		sets.idle.Standard.Pet = set_combine(sets.idle.PDT, {
		main="Idris",
		head="Azimuth Hood +1",
		hands="Geo. Mitaines +3",
		legs="Nyame Flanchard",
		waist="Isa Belt",
		feet="Bagua Sandals +1",
		back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}},
		})
						
		sets.misc.Town = set_combine(sets.idle.PDT, {})
		-- JA
		sets.precast.JA["Bolster"] = {body="Bagua Tunic +1"}
		sets.precast.JA["Widened Compass"] = {}
		
		sets.precast.JA["Life Circle"] = {body="Geomancy Tunic +1"}
		sets.precast.JA["Full Circle"] = {hands="Bagua Mitianes +1"}
		sets.precast.JA["Mending Halation"] = {legs="Bagua Pants +1"}
		sets.precast.JA["Radial Arcana"] = {feet="Bagua Sandals +1"}
		sets.precast.JA["Cardinal Chant"] = {head="Geomancy Galero +1"}
		sets.precast.JA["Collimated Fervor"] = {head="Geomancy Galero +1"}
		
		-- Precast
		-- Magic
		sets.precast.Fastcast = {
		main={ name="Malevolence", augments={'INT+10','Mag. Acc.+10','"Mag.Atk.Bns."+10','"Fast Cast"+5',}},
		sub="Sors Shield",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		body={ name="Merlinic Jubbah", augments={'Mag. Acc.+1 "Mag.Atk.Bns."+1','"Fast Cast"+6','INT+8','Mag. Acc.+7','"Mag.Atk.Bns."+5',}},
		hands={ name="Merlinic Dastanas", augments={'Mag. Acc.+9','"Fast Cast"+5','"Mag.Atk.Bns."+5',}},
		legs={ name="Agwu's Slops", augments={'Path: A',}},
		feet={ name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+20','"Fast Cast"+5','INT+2','Mag. Acc.+9',}},
		neck="Voltsurge Torque",
		waist="Embla Sash",
		left_ear="Malignance Earring",
		right_ear="Enchntr. Earring +1",
		left_ring="Kishar Ring",
		right_ring="Jhakri Ring",
		back={ name="Lifestream Cape", augments={'Geomancy Skill +10','Indi. eff. dur. +15','Pet: Damage taken -3%',}},
		}
		sets.precast.Cure = set_combine(sets.precast.Fastcast, {
				})
				
		sets.precast.Dispelga = set_combine(sets.precast.Fastcast, {
			main="Daybreak",
				})
				
		sets.precast.Elemental = set_combine(sets.precast.Fastcast, {
				})
				
		sets.precast.Stun = set_combine(sets.precast.Fastcast, {
				})
		-- Midcast
		sets.midcast.Recast = set_combine(sets.idle.PDT,{} )
		
		sets.midcast.ConserveMP = {
				sub="Genmei Shield",
				range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
				body="Gyve Doublet",
				head={ name="Vanya Hood", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
				legs={ name="Vanya Slops", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
				feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
				neck="Incanter's Torque",
				waist="Sacro Cord",
				left_ear="Lempo Earring",
				right_ear="Mendi. Earring",}
		-- Geomancy
		sets.midcast.Geomancy = set_combine(sets.midcast.ConserveMP,{
				main="Idris",
				body="Bagua Tunic +1",
				hands="Geo. Mitaines +3",
				back="Lifestream Cape",
				legs="Bagua Pants +1",
				back={ name="Lifestream Cape", augments={'Geomancy Skill +10','Indi. eff. dur. +15','Pet: Damage taken -3%',}},
				})
				
		sets.midcast.Geomancy.Indi= set_combine(sets.midcast.ConserveMP,{
				main="Idris",
				body="Bagua Tunic +1",
				hands="Geo. Mitaines +3",
				back="Lifestream Cape",
				legs="Bagua Pants +1",
				back={ name="Lifestream Cape", augments={'Geomancy Skill +10','Indi. eff. dur. +15','Pet: Damage taken -3%',}},
				})
		
		-- Elemental
		-- High Resist
		sets.midcast.Elemental = {
	main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck="Sanctity Necklace",
    waist="Sacro Cord",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Freke Ring",
    right_ring="Metamor. Ring +1",
    back={ name="Lifestream Cape", augments={'Geomancy Skill +10','Indi. eff. dur. +15','Pet: Damage taken -3%',}},
	}
		-- Damage
		sets.midcast.Nuke = {
	main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck="Sanctity Necklace",
    waist="Sacro Cord",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Freke Ring",
    right_ring="Metamor. Ring +1",
    back={ name="Lifestream Cape", augments={'Geomancy Skill +10','Indi. eff. dur. +15','Pet: Damage taken -3%',}},
	}		
		
		--Healing Magic
		sets.midcast.Cure = set_combine(sets.midcast.ConserveMP,{
		main="Daybreak",
		sub="Sors Shield",
		head={name="Vanya Hood", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
		})
		
		sets.midcast.Curaga = set_combine(sets.midcast.ConserveMP,{
		main="Daybreak",
		sub="Sors Shield",
		head={ name="Vanya Hood", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
		})
	
		-- Enhancing 
		sets.midcast.Enhancing = {
		main="Bolelabunga",
		sub="Ammurapi Shield",
		head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
		body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +9',}},
		legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +9',}},
		feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}},
		neck="Incanter's Torque",
		waist="Embla Sash",
		}
		sets.midcast.Phalanx = set_combine(sets.midcast.Enhancing)
		sets.midcast.Refresh = set_combine(sets.midcast.Enhancing, {head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},})
		sets.midcast.Hastespell = set_combine(sets.midcast.Enhancing, {head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},})
		sets.midcast.Stoneskin = set_combine(sets.midcast.Enhancing, {head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},})
		sets.midcast.Aquaveil = set_combine(sets.midcast.Enhancing, {head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},})
		sets.midcast.Blink = set_combine(sets.midcast.Enhancing, {head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},})
		sets.midcast.Reraise = set_combine(sets.midcast.ConserveMP)

		-- Enfeebling
		-- Potency
		sets.midcast.Enfeebling = {
	main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Geo. Galero +2",
    body="Geo. Tunic +2",
    hands="Geo. Mitaines +3",
    legs="Geo. Pants +2",
    feet="Geo. Sandals +2",
    neck="Erra Pendant",
    waist="Sacro Cord",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Kishar Ring",
    right_ring="Metamor. Ring +1",
    back={ name="Lifestream Cape", augments={'Geomancy Skill +10','Indi. eff. dur. +15','Pet: Damage taken -3%',}},
	}
		sets.midcast.Macc = {
	main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Geo. Galero +2",
    body="Geo. Tunic +2",
    hands="Geo. Mitaines +3",
    legs="Geo. Pants +2",
    feet="Geo. Sandals +2",
    neck="Erra Pendant",
    waist="Sacro Cord",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Kishar Ring",
    right_ring="Metamor. Ring +1",
    back={ name="Lifestream Cape", augments={'Geomancy Skill +10','Indi. eff. dur. +15','Pet: Damage taken -3%',}},
	}
		sets.midcast.Dia = set_combine(sets.midcast.ConserveMP)
		sets.midcast.Paralyze = set_combine(sets.midcast.Macc)
		sets.midcast.Blind = set_combine(sets.midcast.Macc)
		sets.midcast.Bio = set_combine(sets.midcast.Macc)
		sets.midcast.Slow = set_combine(sets.midcast.Macc)
		sets.midcast.Dispelga = set_combine(sets.midcast.Macc,
		{
		main="Daybreak",
		})
		
		
		-- Dark Magic
		sets.midcast.Dark =  {
	main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Geo. Galero +2",
    body="Geo. Tunic +2",
    hands="Geo. Mitaines +3",
    legs="Geo. Pants +2",
    feet="Geo. Sandals +2",
    neck="Erra Pendant",
    waist="Sacro Cord",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Kishar Ring",
    right_ring="Metamor. Ring +1",
    back={ name="Lifestream Cape", augments={'Geomancy Skill +10','Indi. eff. dur. +15','Pet: Damage taken -3%',}},
	}
		sets.midcast.Aspir = set_combine(sets.midcast.Dark,{waist="Fucho-no-Obi"})
		sets.midcast.Stun = set_combine(sets.midcast.Macc)
		
		-- Melee Sets
		sets.TP = {
		main = "Maxentius",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
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
		right_ring="Hetairoi Ring",
		back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}},
		}
		sets.TP.Acc = set_combine(sets.TP, {waist="Witful Belt",})
		sets.precast.WS = set_combine(sets.TP, {
				head="", neck="", lear="", rear="",
                body="", hands="", lring="", rring="",
                back="", waist="", legs="", feet=""})
		sets.precast.WS['Hexa Strike'] = set_combine(sets.precast.WS, {})
		sets.precast.WS['Realmrazer'] = set_combine(sets.precast.WS, {})
		sets.precast.WS['Shattersoul'] = set_combine(sets.precast.WS, {})
		
		-- Misc
		sets.misc.Waltz = set_combine(sets.idle.PDT,{})
		sets.misc.Steps = set_combine(sets.TP.Acc,{})
		sets.misc.flourish = set_combine(sets.midcast.Macc,{ammo="Empty"})
end