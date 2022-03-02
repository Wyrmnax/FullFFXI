-- RDM Gearsets
-- Created on: 3/19/2014
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
			if player.sub_job == 'WHM' then
				set_macro_page(3,1)
			elseif player.sub_job =='BLM' then
				set_macro_page(3,2)
			elseif player.sub_job == 'NIN' then
				set_macro_page(3,3)
			elseif player.sub_job == 'DNC' then
				set_macro_page(3,4)
			elseif player.sub_job =='SCH' then 
				set_macro_page(3,5)
			end
		else
			set_macro_page(3,1)
		end

		-- Auto Sets
		-- Standard/idle
		sets.idle.PDT = {ammo={ ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Jhakri Cuffs +2",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Lissome Necklace",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Sherida Earring",
    right_ear="Brutal Earring",
    left_ring="Hetairoi Ring",
    right_ring="Petrov Ring",}
	
		sets.idle.MDT = {ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Jhakri Cuffs +2",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Lissome Necklace",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Sherida Earring",
    right_ear="Brutal Earring",
    left_ring="Hetairoi Ring",
    right_ring="Petrov Ring",}	
	
		sets.Resting = set_combine(sets.idle.PDT, {ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Jhakri Cuffs +2",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Lissome Necklace",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Sherida Earring",
    right_ear="Brutal Earring",
    left_ring="Hetairoi Ring",
    right_ring="Petrov Ring",})
	
		sets.idle.Standard = set_combine(sets.idle.PDT,{ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Jhakri Cuffs +2",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Lissome Necklace",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Sherida Earring",
    right_ear="Brutal Earring",
    left_ring="Hetairoi Ring",
    right_ring="Petrov Ring",})
	
		sets.misc.Town = set_combine(sets.idle.PDT, {ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Jhakri Cuffs +2",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Lissome Necklace",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Sherida Earring",
    right_ear="Brutal Earring",
    left_ring="Hetairoi Ring",
    right_ring="Petrov Ring",})
		-- JA
		sets.precast.JA["Chainspell"] = {body="Vitivation Tabard"}
		sets.precast.JA["Stymie"] = {}
		
		sets.precast.JA["Composure"] = {head="Estq. Chappel +2", body="Estq. Sayon +2", hands="Estq. Ganthrt. +2", legs="Estqr. Fuseau +2", feet="Estq. Houseaux +2"}
		sets.precast.JA["Saboteur"] = {hands="Estq. Ganthrt. +2"}
		sets.precast.JA["Convert"] = {}
		sets.precast.JA["Spontaneity"] = {}
		
		-- Precast
		-- Magic
		sets.precast.Fastcast = {ammo="Sapience Orb",
    head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    body={ name="Merlinic Jubbah", augments={'Mag. Acc.+1 "Mag.Atk.Bns."+1','"Fast Cast"+6','INT+8','Mag. Acc.+7','"Mag.Atk.Bns."+5',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs={ name="Psycloth Lappas", augments={'MP+75','Mag. Acc.+14','"Fast Cast"+7',}},
    feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}},
    neck="Voltsurge Torque",
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear="Mendi. Earring",
    left_ring="Kishar Ring",}
	
		sets.precast.Cure = set_combine(sets.precast.Fastcast, {
                body="Heka's Kalasiris",
                back="Pahtli Cape"})
		sets.precast.Enhancing = set_combine(sets.precast.Fastcast, {
				waist="Siegal Sash"})
		-- Midcast
		sets.midcast.Recast = set_combine(sets.idle.PDT, sets.precast.Fastcast, {ammo="Impatiens", waist="Witful Belt"})
		
		sets.midcast.ConserveMP = {ammo="Clarus Stone",
				lear="Magnetic Earring", rear="Gifted Earring",
                body="Hedera Cotehardie", hands="Serpentes Cuffs",
                waist="Austerity Belt", legs="Nares Trews", feet="Umbani Boots"}
		--Healing Magic
		sets.midcast.Cure = {main="Arka IV", 
				head="Vitivation Chapeau", neck="Colossus's Torque", lear="Novia Earring", rear="Lifestorm Earring",
                body="Heka's Kalasiris", hands="Bokwus Gloves", lring="Aquasoul Ring", rring="Aquasoul Ring",
                back="Ghostfyre Cape", waist="Cascade Belt", legs="Atrophy Tights", feet="Rubeus Boots"}
		
		sets.midcast.Curaga = {main="Arka IV", 
				head="Vitivation Chapeau", neck="Colossus's Torque", lear="Novia Earring", rear="Lifestorm Earring",
                body="Heka's Kalasiris", hands="Bokwus Gloves", lring="Aquasoul Ring", rring="Aquasoul Ring",
                back="Refraction Cape", waist="Cascade Belt", legs="Atrophy Tights", feet="Rubeus Boots"}
	
		-- Enhancing 
		-- Goal 500+
		sets.midcast.Enhancing = {
				head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
    body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +9',}},
    hands="Telchine Gloves",
    legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +9',}},
    feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}},
    neck="Incanter's Torque",
    waist="Embla Sash",}
		sets.midcast.Phalanx = set_combine(sets.midcast.Enhancing, {hands="Vitivation Gloves"})
		sets.midcast.Hastespell = {ammo="Impatiens", waist="Witful Belt"}
		sets.midcast.Stoneskin = {back="Estoqueur's Cape", feet="Estq. Houseaux +2"}
		sets.midcast.Aquaveil = {back="Estoqueur's Cape", waist="Empahatikos Rope", legs="Shedir Seraweels", feet="Estq. Houseaux +2"}
		sets.midcast.Blink = set_combine(sets.midcast.Aquaveil)
		sets.midcast.Reraise = set_combine(sets.midcast.ConserveMP)

		-- Enfeebling
		-- Potency
		sets.midcast.Enfeebling = {main="Mandau", ammo="Kalboron Stone",
				head="Vitivation Chapeau", neck="Eddy Necklace", lear="Lifestorm Earring", rear="Psystorm Earring",
                body="Estq. Sayon +2", hands="Estq. Ganthrt. +2", lring="Perception ring", rring="Sangoma ring",
                back="Refraction Cape", waist="Demonry Sash", legs="Bokwus Slops", feet="Vitivation Boots"}
		sets.midcast.Macc = {main="Mandau", ammo="Kalboron Stone",
				head="Vitivation Chapeau", neck="Eddy Necklace", lear="Lifestorm Earring", rear="Psystorm Earring",
                body="Estq. Sayon +2", hands="Estq. Ganthrt. +2", lring="Perception ring", rring="Sangoma ring",
                back="Refraction Cape", waist="Demonry Sash", legs="Bokwus Slops", feet="Vitivation Boots"}
		sets.midcast.Dia = set_combine(sets.midcast.ConserveMP,{head="Vitivation Chapeau"})
		sets.midcast.Paralyze = set_combine(sets.midcast.Macc, {feet="Vitivation Boots"})
		sets.midcast.Blind = set_combine(sets.midcast.Macc, {legs="Vitivation Tights"})
		sets.midcast.Bio = set_combine(sets.midcast.Macc, {legs="Vitivation Tights"})
		sets.midcast.Slow = set_combine(sets.midcast.Macc, {head="Vitivation Chapeau"})
		
		-- Elemental
		-- High Resist
		sets.midcast.Elemental = {main="Mandau", ammo="Witchstone",
				head="Hagondes Hat", neck="Eddy Necklace", lear="Novio Earring", rear="Friomisi Earring",
                body="Bokwus Robe", hands="Yaoyotl Gloves", lring="Icesoul Ring", rring="Icesoul ring",
                back="Toro Cape", waist="Sekhmet Corset", legs="Hagondes Pants", feet="Vitivation Boots"}
		-- Damage
		sets.midcast.Nuke = {main="Mandau", ammo="Witchstone",
				head="Hagondes Hat", neck="Eddy Necklace", lear="Novio Earring", rear="Friomisi Earring",
                body="Bokwus Robe", hands="Yaoyotl Gloves", lring="Icesoul Ring", rring="Icesoul ring",
                back="Toro Cape", waist="Sekhmet Corset", legs="Hagondes Pants", feet="Umbani Boots"}
		
		-- Dark Magic
		sets.midcast.Dark = set_combine(sets.midcast.Macc, {neck="Aesir Torque"})
		sets.midcast.Aspir = set_combine(sets.midcast.Dark)
		sets.midcast.Stun = set_combine(sets.midcast.Macc)
		
		-- Melee Sets
		sets.TP = set_combine(sets.idle.PDT, {})
		sets.TP.Acc = set_combine(sets.TP, {})
		sets.precast.WS = set_combine(sets.TP, {})
		sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {})
		sets.precast.WS['Mercy Stroke'] = set_combine(sets.precast.WS, {})
		sets.precast.WS['Requeiscat'] = set_combine(sets.precast.WS, {})
		
		-- Misc
		sets.misc.Waltz = {}
		sets.misc.Steps = set_combine(sets.TP.Acc, {})
		sets.misc.flourish = set_combine(sets.midcast.Macc, {})
end