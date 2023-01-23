-- WHM Gearsets
-- Date Created: 1/29/2014
-- Last Updated: 6/6/2014
-- To Do List:
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
			if player.sub_job == 'rdm' then
				set_macro_page(5,1)
			elseif player.sub_job =='sch' then
				set_macro_page(5,2)
			elseif player.sub_job == 'smn' then
				set_macro_page(5,3)
			elseif player.sub_job =='blm' then 
				set_macro_page(5,4)
			end
		else
			set_macro_page(5,1)
		end
		
	send_command('wait 3;input /lockstyleset 14')
		
		-- Auto Sets
		-- Standard/idle
		sets.idle.PDT = {    
	main="Daybreak",
    sub="Genmei Shield",
    ammo="Staunch Tathlum +1",
    head="Inyanga Tiara +2",    
    body="Shamash Robe",
    hands="Inyan. Dastanas +2",
    legs="Assid. Pants +1",
    feet="Inyan. Crackows +2",
    neck="Loricate Torque +1",
    waist="Embla Sash",
    left_ear="Halasz Earring",
    right_ear="Eabani Earring",
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back="Alaunus's Cape",
	}
	
		sets.idle.MDT = {    
	main="Daybreak",
    sub="Genmei Shield",
    ammo="Staunch Tathlum +1",
    head="Inyanga Tiara +2",    
    body="Shamash Robe",
    hands="Inyan. Dastanas +2",
    legs="Assid. Pants +1",
    feet="Inyan. Crackows +2",
    neck="Loricate Torque +1",
    waist="Embla Sash",
    left_ear="Halasz Earring",
    right_ear="Hermetic Earring",
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back="Alaunus's Cape",
	}
	
		sets.Resting = set_combine(sets.idle.PDT, {
		})
		
		sets.idle.Standard = set_combine(sets.idle.PDT,{
		})

		sets.misc.Town = set_combine(sets.idle.PDT, {
				})
		-- Precast
		-- Magic
		sets.precast.Fastcast = {
	main="C. Palug Hammer",
    sub="Sors Shield",
    ammo="Impatiens",
    head={ name="Bunzi's Hat", augments={'Path: A',}},
    body="Inyanga Jubbah +2",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Ebers Pant. +2",
    feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    neck="Voltsurge Torque",
    waist="Embla Sash",
    left_ear="Enchntr. Earring +1",
    right_ear="Mendi. Earring",
    left_ring="Lebeche Ring",
    right_ring="Kishar Ring",
    back={ name="Alaunus's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Phys. dmg. taken-10%',}},
	}
		sets.precast.Cure = set_combine(sets.precast.Fastcast, {		   
		body="Shamash Robe",
		waist="Witful Belt",
		})
		
		-- JA
		sets.precast.JA['Benediction'] = {body="Cleric's Briault +2"}
		sets.precast.JA['Asylum'] = {}
		
		sets.precast.JA['Divine Caress'] = {head="Orison Cap +2", hands="Orison Mitts +2", back="Mending Cape"}
		sets.precast.JA['Devotion'] = {head="Cleric's Cap +2"}
		sets.precast.JA['Martyr'] = {hands="Cleric's Mitts +2"}
		
		-- Midcast
		sets.midcast.Recast = set_combine(sets.idle.PDT, sets.precast.Fastcast, {
				head="Nahtirah Hat",
                body="Hedera Cotehardie",
                waist="Witful Belt",feet="Umbani Boots"})
		sets.midcast.ConserveMP = {ammo="Clarus Stone",
				lear="Magnetic Earring", rear="Gifted Earring",
                body="Hedera Cotehardie", hands="Serpentes Cuffs",
                waist="Austerity Belt", legs="Nares Trews", feet="Umbani Boots"}

		--Healing Magic
		-- Cures
		sets.midcast.Cure = {
	main="Daybreak",
    sub="Sors Shield",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Ebers Pant. +2",
    feet={ name="Vanya Clogs", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
    neck="Incanter's Torque",
    left_ear="Lempo Earring",
    right_ear="Mendi. Earring",
    left_ring="Defending Ring",
    right_ring="Kishar Ring",
    back={ name="Alaunus's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Phys. dmg. taken-10%',}},
	}
		sets.midcast.EnmityCure = set_combine(sets.midcast.Cure, {
		})

		sets.midcast.Curaga = {
	main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
    sub="Sors Shield",
    ammo="Impatiens",
    head={ name="Vanya Hood", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
    body="Theo. Bliaut +2",
    hands="Theophany Mitts +2",
    legs="Ebers Pant. +2",
    feet={ name="Vanya Clogs", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
    neck="Incanter's Torque",
    waist="Embla Sash",
    left_ear="Lempo Earring",
    right_ear="Mendi. Earring",
    left_ring="Lebeche Ring",
    right_ring="Kishar Ring",
    back={ name="Alaunus's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Phys. dmg. taken-10%',}},
	}
		sets.midcast.EnmityCuraga = set_combine(sets.midcast.Curaga, {})

		sets.midcast.Cura = set_combine(sets.midcast.Cure, {
		})

		-- Status Ailments
		sets.midcast.NaSpells = set_combine(sets.midcast.Recast, {})
		
		sets.midcast.Erase = set_combine(sets.midcast.NaSpells, {neck="Cleric's Torque"})

		sets.midcast.Cursna = set_combine(sets.midcast.Recast, {
				body="Ebers Bliaud +2",
				legs="Th. Pantaloons +2",
				})
				
		sets.midcast.Esuna = set_combine(sets.midcast.Recast)
		sets.midcast.Sacrifice = set_combine(sets.midcast.Recast)

		-- Enhancing
		sets.midcast.Regen = set_combine(sets.midcast.ConserveMP,{
    main="Bolelabunga",
    sub="Culminus",
    ammo="Impatiens",
    head="Inyanga Tiara +2",
    legs="Th. Pantaloons +2",
    feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}},
    neck="Incanter's Torque",
    waist="Embla Sash",
	})
		sets.midcast.BarElement = {		
		head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
		body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +9',}},
		waist="Embla Sash",		
		legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +9',}},
		feet="Theo. Duckbills +2",
	}
		sets.midcast.BarStatus = {		
		head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
		body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +9',}},
		waist="Embla Sash",		
		legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +9',}},
		feet="Theo. Duckbills +2",
	}
		sets.midcast.Boost = {
		head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
		body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +9',}},
		waist="Embla Sash",
		legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +9',}},
		feet="Theo. Duckbills +2",
	}
		sets.midcast.Phalanx = set_combine(sets.midcast.Boost)
		sets.midcast.Hastespell = {ammo="Impatiens", waist="Witful Belt"}
		sets.midcast.Stoneskin = {waist="Siegal Sash"}
		sets.midcast.Aquaveil = {waist="Empahatikos Rope", legs="Shedir Seraweels"}
		sets.midcast.Blink = set_combine(sets.midcast.Aquaveil)
		sets.midcast.Reraise = set_combine(sets.midcast.ConserveMP)
		sets.precast.Protectra = set_combine(sets.midcast.BarElement)
		sets.precast.Shellra = set_combine(sets.midcast.BarElement)

		--Divine Magic
		sets.midcast.Repose = set_combine(sets.midcast.Recast)
		sets.midcast.Flash = set_combine(sets.midcast.Macc)
		sets.midcast.Banish = {main="Soothsayer Staff",
				head="Nahtirah Hat", neck="Eddy Necklace", lear="Friomisi Earring", rear="Novio Earring",
                body="Bokwus Robe", hands="Yaoyotl Gloves", lring="Aquasoul Ring", rring="Aquasoul Ring",
                back="Alaunus's Cape", waist="Sekhmet Corset", legs="Gendewitha Spats", feet="Gendewitha Galoshes"}
		sets.midcast.Holy = set_combine(sets.midcast.Banish)

		-- Enfeebling
		-- Potency
		sets.midcast.Enfeebling = {main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Theophany Cap +2",
    body="Theo. Bliaut +2",
    hands="Theophany Mitts +2",
    legs="Th. Pantaloons +2",
    feet="Theo. Duckbills +2",
    neck="Incanter's Torque",
    waist="Sacro Cord",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Inyanga Ring",
    right_ring="Kishar Ring",
    back={ name="Alaunus's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Phys. dmg. taken-10%',}},
	}
		sets.midcast.Macc = {main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Theophany Cap +2",
    body="Theo. Bliaut +2",
    hands="Theophany Mitts +2",
    legs="Th. Pantaloons +2",
    feet="Theo. Duckbills +2",
    neck="Incanter's Torque",
    waist="Sacro Cord",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Inyanga Ring",
    right_ring="Kishar Ring",
    back={ name="Alaunus's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Phys. dmg. taken-10%',}},
	}

		sets.midcast.Dia = set_combine(sets.midcast.ConserveMP,{})

		-- Dark Magic
		sets.midcast.DarkMagic = set_combine(sets.midcast.Macc, {	
				head="Appetence Crown", neck="Aesir Torque",
				body="Hedera Cotehardie",
				back="Alaunus's Cape"})
		sets.midcast.Drain = set_combine(sets.midcast.Macc, {
				head="Appetence Crown", neck="Aesir Torque",
				waist="Fucho-no-Obi"})
		sets.midcast.Aspir = set_combine(sets.midcast.Macc, {
				head="Appetence Crown", neck="Aesir Torque",
				waist="Fucho-no-Obi"})
		
		-- Elemental Magic
		sets.midcast.Nuke = set_combine(sets.midcast.Banish)
		sets.midcast.DOT = set_combine(sets.midcast.Macc,{})

		-- Melee Sets
		sets.TP = {}
		sets.precast.WS = set_combine(sets.TP, {})
		sets.precast.WS['Hexa Strike'] = set_combine(sets.precast.WS, {})

end