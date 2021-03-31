-- SCH Gearsets
-- Created: 6/13/2014
-- Last Updated: 6/13/2014
-- To Do:
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
		automacroset = 1
		if automacroset == 1 then
			if player.sub_job == 'RDM' then
				set_macro_page(1,5)
			elseif player.sub_job =='WHM' then
				set_macro_page(1,5)
			elseif player.sub_job == 'SCH' then
				set_macro_page(1,5)
			elseif player.sub_job == 'BRD' then
				set_macro_page(1,5)
			elseif player.sub_job =='NIN' then 
				set_macro_page(1,5)
			end
		else
			set_macro_page(1,5)
		end

		-- Auto Sets
		-- Standard/idle
		sets.idle.PDT = {    
	main="Bolelabunga",
	sub="Genbu's Shield",
    ammo="Staunch Tathlum +1",
    head="Acad. Mortar. +3",
    body="Shamash Robe",
    hands="Arbatel Bracers +1",
    legs="Assid. Pants +1",
    feet="Nyame Sollerets",
    neck="Loricate Torque +1",
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	}
		sets.idle.MDT = { 
	main="Bolelabunga",
	sub="Genbu's Shield",
    ammo="Staunch Tathlum +1",
    head="Acad. Mortar. +3",
    body="Shamash Robe",
    hands="Arbatel Bracers +1",
    legs="Assid. Pants +1",
    feet="Nyame Sollerets",
    neck="Loricate Torque +1",
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	}			
		sets.Resting = set_combine(sets.idle.PDT, {})
		sets.idle.Standard = set_combine(sets.idle.PDT,{})
		sets.misc.Town = set_combine(sets.idle.PDT,{})
		
		-- JA
		sets.precast.JA["Tabula Rasa"] = {legs="Argute Pants +2"}
		sets.precast.JA["Caper Emissarius"] = {}
		
		sets.precast.JA["Sublimation"] = {}
		sets.precast.JA["Enlightenment"] = {}
		sets.precast.JA["Libra"] = {}
		sets.precast.JA["Modus Veritas"] = {}
		sets.precast.JA["Libra"] = {}
		
		-- Strategems 
		sets.precast.JA["Rapture"] = {head="Arbatel Bonnet +1",}
		sets.precast.JA["Ebullience"] = {head="Arbatel Bonnet +1",}
		
		-- Precast
		-- Magic
		sets.precast.Fastcast = {
	ammo="Ghastly Tathlum +1",
    head={ name="Amalric Coif", augments={'INT+10','Mag. Acc.+20','Enmity-5',}},
    body="Merlinic Jubbah",
    legs="Psycloth Lappas",
	hands={ name="Merlinic Dastanas", augments={'Mag. Acc.+9','"Fast Cast"+5','"Mag.Atk.Bns."+5',}},
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+21','"Fast Cast"+6','INT+1',}},
    neck="Voltsurge Torque",
    waist="Embla Sash",
    left_ear="Malignance Earring",
    left_ring="Kishar Ring",
    back={ name="Lugh's Cape", augments={'"Fast Cast"+10',}},
	}
		sets.precast.Cure = set_combine(sets.precast.Fastcast, {
                body="Heka's Kalasiris", 
                back="Pahtli Cape"})  	

		sets.precast.Elemental = set_combine(sets.precast.Fastcast, {})  					
				
		-- Midcast
		sets.midcast.Recast = set_combine(sets.idle.PDT, sets.precast.Fastcast, {waist="Witful Belt"})
		
		sets.midcast.ConserveMP = {ammo="Clarus Stone",
				head="Nares Cap", lear="Magnetic Earring", rear="Gifted Earring",
                body="Hedera's Cotehardie",
				waist="Austerity Belt", feet="Umbani Boots"}
		
		-- Elemental
		-- High Resist
	sets.midcast.Elemental = {
	main="Bunzi's Rod",
	sub="Ammurapi Shield",
    ammo="Ghastly Tathlum +1",
    head="Peda. M.Board +3",
    body="Amalric Doublet +1",
    hands="Amalric Gages +1",
    legs="Agwu's Slops",
    feet="Agwu's Pigaches",
    neck="Argute Stole +2",
    waist="Sacro Cord",
    left_ear="Malignance Earring",
    right_ear="Friomisi Earring",
    left_ring="Jhakri Ring",
    right_ring="Mujin Band",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	}
		-- Damage
	sets.midcast.Nuke = {
    main="Bunzi's Rod",
	sub="Ammurapi Shield",
    ammo="Seeth. Bomblet +1",
    ammo="Ghastly Tathlum +1",
    head="Peda. M.Board +3",
    body="Amalric Doublet +1",
    hands="Amalric Gages +1",
    legs="Agwu's Slops",
    feet="Agwu's Pigaches",
    neck="Argute Stole +2",
    waist="Sacro Cord",
    left_ear="Malignance Earring",
    right_ear="Static Earring",
    left_ring="Freke Ring",
    right_ring="Mujin Band",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	}
	
	sets.midcast.LowNuke = set_combine(sets.midcast.Nuke, {
	ammo="Per. Lucky Egg",
	head="Volte Cap",
	waist="Chaac Belt"
	})
	
	sets.midcast.Helix = set_combine(sets.midcast.Nuke, {
	sub="Culminus",
	})
	
	sets.midcast.Kaustra =set_combine (sets.midcast.Nuke, {	
    head="Pixie Hairpin +1",
	})
		
		--Healing Magic
		sets.midcast.Cure = {
    ammo="Staunch Tathlum +1",
    head={ name="Vanya Hood", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
	body="",
    hands="Telchine Gloves",
    legs={ name="Vanya Slops", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
    feet={ name="Vanya Clogs", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
    neck={ name="Argute Stole +2", augments={'Path: A',}},
    waist="Rumination Sash",
    left_ear="Lempo Earring",
    right_ear="Halasz Earring",
    left_ring="Jhakri Ring",
    right_ring="Lebeche Ring",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	}
		
		sets.midcast.Curaga = {
    ammo="Staunch Tathlum +1",
    head={ name="Vanya Hood", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
	body="",
    hands="Telchine Gloves",
    legs={ name="Vanya Slops", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
    feet={ name="Vanya Clogs", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
    neck={ name="Argute Stole +2", augments={'Path: A',}},
    waist="Rumination Sash",
    left_ear="Lempo Earring",
    right_ear="Halasz Earring",
    left_ring="Jhakri Ring",
    right_ring="Lebeche Ring",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	}
		sets.midcast.Regen = {
	main="Bolelabunga",
	sub="Ammurapi Shield",
	ammo="Staunch Tathlum +1",
    head="Telchine Cap",
	body="Telchine Chas.",
    hands="Telchine Gloves",
    legs="Telchine Braconi",
    feet="Telchine Pigaches",
    neck={ name="Argute Stole +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Lempo Earring",
    right_ear="Halasz Earring",
    left_ring="Jhakri Ring",
    right_ring="Lebeche Ring",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},}
	
		-- Enhancing 
		-- 
		sets.midcast.Enhancing = {		
	main="Bolelabunga",
	sub="Ammurapi Shield",
	ammo="Staunch Tathlum +1",
    head="Telchine Cap",
	body="Telchine Chas.",
    hands="Telchine Gloves",
    legs="Telchine Braconi",
    feet="Telchine Pigaches",
    neck={ name="Argute Stole +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Lempo Earring",
    right_ear="Halasz Earring",
    left_ring="Jhakri Ring",
    right_ring="Lebeche Ring",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	}
		sets.midcast.Embrava = set_combine(sets.midcast.Enhancing, {hands="Svnt. Bracers +2"})
		sets.midcast.Phalanx = set_combine(sets.midcast.Enhancing)
		sets.midcast.Hastespell = {ammo="Impatiens", waist="Witful Belt"}
		sets.midcast.Stoneskin = set_combine(sets.midcast.Enhancing)
		sets.midcast.Aquaveil = set_combine(sets.midcast.Enhancing)
		sets.midcast.Blink = set_combine(sets.midcast.Aquaveil)
		sets.midcast.Reraise = set_combine(sets.midcast.ConserveMP)

		-- Enfeebling
		-- Potency
		sets.midcast.Enfeebling = {}
		sets.midcast.Macc = {}
		sets.midcast.Dia = set_combine(sets.midcast.ConserveMP)
		sets.midcast.Paralyze = set_combine(sets.midcast.Macc)
		sets.midcast.Blind = set_combine(sets.midcast.Macc)
		sets.midcast.Bio = set_combine(sets.midcast.Macc)
		sets.midcast.Slow = set_combine(sets.midcast.Macc)
		
		
		-- Dark Magic
		sets.midcast.Dark = set_combine(sets.midcast.Macc, {})
		sets.midcast.Aspir = set_combine(sets.midcast.Dark, {
			waist="Fucho-no-Obi",
			feet="Agwu's Pigaches",})
			
		-- Stun - Alacrity Down
		sets.midcast.Stun = set_combine(sets.precast.Fastcast, {})
		-- Stun - Alacrity Up
		sets.midcast.Stun.Alacrity = set_combine(sets.midcast.Stun, {})
		
		-- Melee Sets
		sets.TP = set_combine(sets.idle.PDT, {})
		sets.precast.WS = set_combine(sets.TP, {})
		sets.precast.WS['Shattersoul'] = set_combine(sets.precast.WS, {})
		
		-- Misc
		sets.misc.Waltz = {}
		sets.misc.Steps = {}
		sets.misc.flourish = {}
end