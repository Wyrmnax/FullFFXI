-- SMN Gearsets
-- Created:
-- Last Updated: 
-- To Do:
--
--
--

if player.name == 'Feary' then
		-- includes
		include('include/utility.lua')
		include('include/mappings.lua')
		include('include/equipment.lua')
		-- include('../include/autoexec.lua')
			
		-- Auto Sets
		-- Standard/idle
		sets.idle.PDT = {main="Patriarch Cane", sub="Genmei Shield",
				head="Hagondes Hat", neck="Twilight Torque", lear="", rear="",
                body="Hagondes Coat", hands="Hagondes Cuffs", lring=Aug.Darkring1, rring="Defending Ring",
                back="Umbra Cape", waist="Fucho-no-obi", legs="Hagondes Pants", feet="Hagondes Sabots"}
		sets.idle.MDT = {
				head="Hagondes Hat", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
                body="Hagondes Coat", hands="Hagondes Cuffs", lring=Aug.Darkring1, rring="Defending Ring",
                back="", waist="",  legs="Hagondes Pants", feet="Hagondes Sabots"}			
		sets.Resting = set_combine(sets.idle.PDT, {main="Chatoyant Staff", ammo="Clarus Stone",
				head="Caller's Horn +2", neck="Eidolon Pendant", lear="Magnetic Earring", rear="Moonshade Earring",
                body="Hagondes Coat", hands="Serpentes Cuffs", lring="", rring="",
                back="Felicitas Cape", waist="Austerity Belt", legs="Nares Trews", feet="Chelona Boots"})
		sets.misc.Town = set_combine(sets.idle.PDT, {
				feet="Herald's Gaiters"})
		sets.idle.Standard = set_combine(sets.idle.PDT,{
				head="Caller's Horn +2",lear="Merman's Earring", rear="Moonshade Earring",
                body="Hagondes Coat", hands="Serpentes Cuffs",
                waist="Fucho-no-obi",legs="Nares Trews", feet="Herald's Gaiters"})
		
		-- Prep Sets
		sets.idle.Avatar = {
		sub="Elan Strap",
    ammo="Sancus Sachet",
    head="Beckoner's Horn +1",
    body="Shomonjijoe +1",
    hands="Asteria Mitts",
    legs="Assid. Pants +1",
    feet="Convo. Pigaches +2",
    neck="Caller's Pendant",
    waist="Klouskap Sash",    
	lear="Evans earring",
    right_ear="Enmerkar Earring",
    left_ring="Varar Ring",
    right_ring="Varar Ring",
	back="Campestre's cape",}
		sets.idle.Avatar["Carbuncle"] = set_combine(sets.idle.Avatar,{hands="Carbuncle Mitts"})
		sets.idle.Avatar["Diabolos"] = set_combine(sets.idle.Avatar,{waist="Diabolos's Rope"})
		sets.idle.Avatar["Alexander"] = set_combine(sets.midcast.SummoningMagic)
		
		sets.idle.Avatar.Favor = {head="Caller's Horn +2"}
		sets.idle.Avatar.Melee = {sub="Elan Strap",
    ammo="Sancus Sachet",
    head="Tali'ah Turban +1",
    body="Shomonjijoe +1",
    hands="Tali'ah Gages +1",
    legs="Assid. Pants +1",
    feet="Convo. Pigaches +2",
    neck="Caller's Pendant",
    waist="Klouskap Sash", 
    left_ear="Sortiarius Earring",
    right_ear="Enmerkar Earring",
    left_ring="Varar Ring",
    right_ring="Varar Ring",
	back="Campestre's cape",}
		sets.idle.Avatar.Spirit = {main="Bolelabunga",sub="Genmei Shield",ammo="Sancus Sachet",
				head="Caller's Horn +2",neck="Caller's Pendant",lear="Loquacious Earring",rear="Moonshade Earring",
				body="Hagondes Coat",hands="Serpentes Cuffs",ring1="Evoker's Ring",ring2="Sangoma Ring",
				back="Tiresias' Cape",waist="Fucho-no-obi",legs="Summoner's Spats",feet="Caller's Pgch +2"}
				
		sets.perp = {}
		sets.perp.Day = {hands="Caller's Bracers +2"}
		sets.perp.Weather = {neck="Caller's Pendant",hands="Caller's Bracers +2"}
		-- Blood Pacts 
		-- Precast
		-- Pact delay reduction gear
		sets.precast.BloodPactWard = {
		head="Beckoner's Horn +1",
		body="Con. Doublet +2",
		lear="Evans earring",
		hands="Apogee Mitts",}
		sets.precast.BloodPactRage = sets.precast.BloodPactWard
		-- Midcast
		-- Skill Gear
		sets.midcast.SummoningMagic = {main="Soulscourge",ammo="Sancus Sachet",
				head="Caller's Horn +2",neck="Caller's Pendant", lear="Andoaa Earring", rear="Gifted Earring",
				body="Anhur Robe",hands="Summoner's Bracers",ring1="Evoker's Ring",rring="Fervor Ring",
				back="Conveyance Cape",waist="Cimmerian Sash",legs="Caller's Spats +2",feet="Rubeus Boots"}
		-- BloodPactWard
		sets.midcast.Pet.BloodPactWard = set_combine(sets.midcast.SummoningMagic,{})
				
		sets.midcast.Pet.BloodPactWard.Macc = set_combine(sets.midcast.SummoningMagic,{})
		-- BloodPactRage
		-- Physical 
		sets.midcast.Pet.PhysicalBloodPactRage = {
		main = "Was",        
    sub="Elan Strap",
    ammo="Sancus Sachet",
    head={ name="Apogee Crown", augments={'MP+60','Pet: Attack+30','Blood Pact Dmg.+7',}},
    body="Con. Doublet +2",
    hands={ name="Merlinic Dastanas", augments={'Pet: Attack+30 Pet: Rng.Atk.+30','Blood Pact Dmg.+6','Pet: DEX+4','Pet: Mag. Acc.+6',}},
    legs={ name="Enticer's Pants", augments={'MP+50','Pet: Accuracy+15 Pet: Rng. Acc.+15','Pet: Mag. Acc.+15','Pet: Damage taken -5%',}},
    feet="Convo. Pigaches +2",
    neck="Empath Necklace",
    waist="Klouskap Sash", 
    left_ear="Enmerkar Earring",
    right_ear="Gelos Earring",
    left_ring="Varar Ring",
    right_ring="Varar Ring",
	back="Campestre's cape",}
	
		-- Magical
		-- 'Nether Blast','Aerial Blast','Searing Light','Diamond Dust','Earthen Fury','Zantetsuken','Tidal Wave','Judgment Bolt','Inferno','Howling Moon','Ruinous Omen','Flaming Crush'
		sets.midcast.Pet.MagicalBloodPactRage = {
		main = "Espiritus",
    sub="Elan Strap",
    ammo="Sancus Sachet",
    head={ name="Apogee Crown", augments={'MP+60','Pet: "Mag.Atk.Bns."+30','Blood Pact Dmg.+7',}},
    body="Con. Doublet +2",
    hands={ name="Merlinic Dastanas", augments={'Pet: Mag. Acc.+17 Pet: "Mag.Atk.Bns."+17','Blood Pact Dmg.+10','Pet: INT+9','Pet: Mag. Acc.+8',}},
    legs={ name="Enticer's Pants", augments={'MP+50','Pet: Accuracy+15 Pet: Rng. Acc.+15','Pet: Mag. Acc.+15','Pet: Damage taken -5%',}},
    feet={ name="Apogee Pumps", augments={'MP+60','Pet: "Mag.Atk.Bns."+30','Blood Pact Dmg.+7',}},
    neck="Adad Amulet",
    waist="Klouskap Sash", 
	lear="Enmerkar earring",
    right_ear="Gelos Earring",
    left_ring="Varar Ring",
    right_ring="Varar Ring",
	back="Campestre's cape",
	}
		-- Heavenly Strike','Wind Blade','Holy Mist','Night Terror','Thunderstorm','Geocrush','Meteor Strike','Grand Fall','Lunar Bay','Thunderspark'		
		sets.midcast.Pet.MagicalBloodPactRage.TP = {main = "Espiritus",
    sub="Elan Strap",
    ammo="Sancus Sachet",
    head={ name="Apogee Crown", augments={'MP+60','Pet: "Mag.Atk.Bns."+30','Blood Pact Dmg.+7',}},
    body="Con. Doublet +2",
    hands={ name="Merlinic Dastanas", augments={'Pet: Mag. Acc.+17 Pet: "Mag.Atk.Bns."+17','Blood Pact Dmg.+10','Pet: INT+9','Pet: Mag. Acc.+8',}},
    legs={ name="Enticer's Pants", augments={'MP+50','Pet: Accuracy+15 Pet: Rng. Acc.+15','Pet: Mag. Acc.+15','Pet: Damage taken -5%',}},
    feet={ name="Apogee Pumps", augments={'MP+60','Pet: "Mag.Atk.Bns."+30','Blood Pact Dmg.+7',}},
    neck="Adad Amulet",
    waist="Klouskap Sash", 
	lear="Enmerkar earring",
    right_ear="Gelos Earring",
    left_ring="Varar Ring",
    right_ring="Varar Ring",
	back="Campestre's cape",
	}
		--	Additional Effect BPs
		sets.midcast.Pet.MagicalBloodPactRage.Macc = {main = "Espiritus",
    sub="Elan Strap",
    ammo="Sancus Sachet",
    head={ name="Apogee Crown", augments={'MP+60','Pet: "Mag.Atk.Bns."+30','Blood Pact Dmg.+7',}},
    body="Con. Doublet +2",
    hands={ name="Merlinic Dastanas", augments={'Pet: Mag. Acc.+17 Pet: "Mag.Atk.Bns."+17','Blood Pact Dmg.+10','Pet: INT+9','Pet: Mag. Acc.+8',}},
    legs={ name="Enticer's Pants", augments={'MP+50','Pet: Accuracy+15 Pet: Rng. Acc.+15','Pet: Mag. Acc.+15','Pet: Damage taken -5%',}},
    feet={ name="Apogee Pumps", augments={'MP+60','Pet: "Mag.Atk.Bns."+30','Blood Pact Dmg.+7',}},
    neck="Adad Amulet",
    waist="Klouskap Sash", 
	lear="Enmerkar earring",
    right_ear="Gelos Earring",
    left_ring="Varar Ring",
    right_ring="Varar Ring",
	back="Campestre's cape",
	}
		-- Avatar Nukes 
		sets.midcast.Pet.MagicalBloodPactRage.MAB = {main = "Espiritus",
    sub="Elan Strap",
    ammo="Sancus Sachet",
    head={ name="Apogee Crown", augments={'MP+60','Pet: "Mag.Atk.Bns."+30','Blood Pact Dmg.+7',}},
    body="Con. Doublet +2",
    hands={ name="Merlinic Dastanas", augments={'Pet: Mag. Acc.+17 Pet: "Mag.Atk.Bns."+17','Blood Pact Dmg.+10','Pet: INT+9','Pet: Mag. Acc.+8',}},
    legs={ name="Enticer's Pants", augments={'MP+50','Pet: Accuracy+15 Pet: Rng. Acc.+15','Pet: Mag. Acc.+15','Pet: Damage taken -5%',}},
    feet={ name="Apogee Pumps", augments={'MP+60','Pet: "Mag.Atk.Bns."+30','Blood Pact Dmg.+7',}},
    neck="Adad Amulet",
    waist="Klouskap Sash", 
	lear="Enmerkar earring",
    right_ear="Gelos Earring",
    left_ring="Varar Ring",
    right_ring="Varar Ring",
	back="Campestre's cape",
	}
		
		sets.midcast.Pet.Spirit = set_combine(sets.midcast.Pet.BloodPactRage, {legs="Summoner's Spats"})		
		-- Precast
		-- Magic
		sets.precast.Fastcast = { ammo="Impatiens",
				head="Nahtirah Hat", neck="", lear="Loquac. Earring", rear="",
				body="Anhur Robe", hands="", lring="Prolix Ring", rring="",
                back="Swith Cape", waist="Witful Belt", legs="Orvail Pants +1", feet="Chelona Boots"}
		sets.precast.Cure = set_combine(sets.precast.Fastcast, {
				head="", neck="", lear="", rear="",
                body="Heka's Kalairis", hands="", lring="", rring="",
                back="Pahtli Cape", waist="", legs="", feet=""})
		-- JA
		sets.precast.JA['Astral Conduit'] = {}
		sets.precast.JA['Astral Flow'] = {head="Summoner's Horn +2"}
		sets.precast.JA['Elemental Siphon'] = set_combine(sets.midcast.SummoningSkill,{feet="Caller's Pigaches +2",back="Conveyance Cape"})
		sets.precast.JA['Mana Cede'] = {hands="Caller's Bracers +2"}
		
		-- Midcast
		sets.midcast.Recast = set_combine(sets.idle.PDT,{main="Plenitas Virga", waist="Witful Belt"})
		sets.midcast.ConserveMP = {ammo="Clarus Stone",
				head="", neck="", lear="Magnetic Earring", rear="Gifted Earring",
                body="Hedera's Cotehardie", hands="Serpentes Cuffs", lring="", rring="",
                back="", waist="Austerity Belt", legs="Nares Trews", feet="Serpentes Sabots"}

		--Healing Magic
		sets.midcast.Cure = {main="Arka IV", 
				head="", neck="Colossus's Torque", lear="", rear="",
                body="Heka's Kalasiris", hands="Bokwus Gloves", lring="Aquasoul Ring", rring="Aquasoul Ring",
                back="", waist="Cascade Belt", legs="", feet="Rubeus Boots"}
		sets.midcast.EnmityCure = set_combine(sets.midcast.Cure, {})
		
		sets.midcast.Curaga = {main="Arka IV", 
				head="", neck="Colossus's Torque", lear="", rear="",
                body="Heka's Kalasiris", hands="Bokwus Gloves", lring="Aquasoul Ring", rring="Aquasoul Ring",
                back="", waist="Cascade Belt", legs="", feet="Rubeus Boots"}
		sets.midcast.EnmityCuraga = set_combine(sets.midcast.Curaga, {})

		sets.midcast.NaSpells = set_combine(sets.midcast.Recast)
		sets.midcast.Erase = set_combine(sets.midcast.NaSpells)

		sets.midcast.Cursna = set_combine(sets.midcast.Recast, {})
		
		sets.midcast.Esuna = set_combine(sets.midcast.Recast)
		sets.midcast.Sacrifice = set_combine(sets.midcast.Recast)

		-- Enhancing
		sets.midcast.Regen = set_combine(sets.midcast.ConserveMP,{})
		sets.midcast.BarElement = {}
		sets.midcast.BarStatus = {}
		sets.midcast.Phalanx = set_combine(sets.Boost)
		sets.midcast.Hastespell = {ammo="Impatiens", waist="Witful Belt"}
		sets.midcast.Stoneskin = {waist="Siegal Sash"}
		sets.midcast.Aquaveil = {waist="Empahatikos Rope", legs="Shedir Seraweels"}
		sets.midcast.Blink = set_combine(sets.midcast.Aquaveil)
		sets.midcast.Reraise = set_combine(sets.midcast.ConserveMP)

		--Divine Magic
		sets.midcast.Repose = set_combine(sets.midcast.Recast)
		sets.midcast.Flash = set_combine(sets.midcast.Macc)
		sets.midcast.Banish = set_combine(sets.midcast.Macc)
		sets.midcast.Holy = set_combine(sets.midcast.Banish)

		-- Enfeebling
		-- Potency
		sets.midcast.Enfeebling = {main="Eminent Pole", sub="Mephitis Grip", ammo="Aureole",
				head="Nahtirah Hat", neck="Eddy Necklace", lear="Lifestorm Earring", rear="Psystorm Earring",
                body="Bokwus Robe", hands="Hagondes Cuffs", lring="Aquasoul ring", rring="Aquasoul ring",
                back="Refraction Cape", waist="Demonry Sash", legs="Bokwus Slops", feet="Bokwus Boots"}
		sets.midcast.Macc = {main="Eminent Pole", sub="Mephitis Grip", ammo="Aureole",
				head="Nahtirah Hat", neck="Eddy Necklace", lear="Lifestorm Earring", rear="Psystorm Earring",
                body="Bokwus Robe", hands="Hagondes Cuffs", lring="Perception ring", rring="Sangoma Ring",
                back="Refraction Cape", waist="Demonry Sash", legs="Bokwus Slops", feet="Bokwus Boots"}

		sets.midcast.Dia = set_combine(sets.midcast.ConserveMP,{})

		-- Dark Magic
		sets.midcast.DarkMagic = set_combine(sets.midcast.Macc, {})
		sets.midcast.Drain = set_combine(sets.midcast.Macc, {})
		sets.midcast.Aspir = set_combine(sets.midcast.Macc, {})
		
		-- Elemental Magic
		sets.midcast.Nuke = set_combine(sets.midcast.Banish)
		sets.midcast.Dot = {}

		-- Melee Sets
		sets.TP = set_combine(sets.idle.PDT, {waist="Witful Belt"})
		sets.precast.WS = set_combine(sets.TP, {})
		-- MP Gear
		sets.precast.WS['Myrkr'] = set_combine(sets.precast.WS, {})
		sets.precast.WS['Shattersoul'] = set_combine(sets.precast.WS, {})

	elseif player.name == 'Derion' then
		
	elseif player.name == 'Aniyah' then
			
	elseif player.name =='Firetoplay' then
		
	end