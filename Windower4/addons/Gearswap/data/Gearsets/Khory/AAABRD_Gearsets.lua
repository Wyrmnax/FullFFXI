-- BRD Gearsets
-- Created
-- Last Modified
--
--

if player.name == 'Feary' then
		-- includes
		include('include/mappings.lua')
		include('include/equipment.lua')
		--include('include/autoexec.lua')
		include('include/utility.lua')

		-- sets Macros off = 0  on = 1
		automacroset = 0
		if automacroset == 1 then
			if player.sub_job == 'nin' then
				set_macro_page(4,1)
			elseif player.sub_job =='whm' then
				set_macro_page(4,2)
			elseif player.sub_job == 'rdm' then
				set_macro_page(4,3)
			elseif player.sub_job =='sch' then 
				set_macro_page(4,4)
			elseif player.sub_job =='dnc' then 
				set_macro_page(4,5)
			elseif player.sub_job =='blm' then 
				set_macro_page(4,6)
			end
		else
			set_macro_page(4,1)
		end
		
		-- Instruments
		default = {range="Iron Ram Horn"}
		-- Buffs
		ballad = {range="Crooner's Cithara"}
		march = {range="Langeleik"}
		minuet = {range="Apollo's Flute"}
		madrigal = {range="Cantabank's Horn"}
		minne = {range="Syrinx"}
		etude = {range="Langeleik"}
		carol = {range="Crumhorn"}
		mambo  = {range="Vihuela"}
		mazurka = {range="Daurdabla"}
		paeon = {range="Iron Ram Horn"}
		prelude = {range="Cantabank's Horn"}
		scherzo = {range="Iron Ram Horn"}
		hymnus = {range="Daurdabla"}
		--Debuffs
		elegy = {range="Syrinx"}
		threnody = {range="Sorrowful Harp"}
		lullaby = {range="Pan's Horn"}
		horde = {range="Nursemaid Harp"}
		finale = {range="Pan's Horn"}
		requiem = {range="Requiem Flute"}
		virelai = {range="Daurdabla"}
		nocturne = {range="Iron Ram Horn"}

		-- Auto Sets
		-- Standard/idle
		sets.idle.PDT = {main="Mandau", sub="Genbu's Shield",
				head="Bihu Roundlet +1", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
                body="Gendewitha Bliaut", hands="Gende. Gages +1", lring=Aug.Darkring1, rring="Defending Ring",
                back="Umbra Cape", waist="Flume Belt", legs="Bihu Cannions +1", feet="Bihu Slippers"}
		sets.idle.MDT = {
				head="Nahtirah Hat", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
                body="Gendewitha Bliaut", hands="Gende. Gages +1", lring=Aug.Darkring1, rring="Defending Ring",
                back="Engulfer Cape", waist="Flume Belt",  legs="Gendewitha Spats", feet="Gendewitha Galoshes"}			
		sets.Resting = set_combine(sets.idle.PDT, {main="Chatoyant Staff",
				head="", neck="Eidolon Pendant", lear="Magnetic Earring", rear="Moonshade Earring",
                body="Gendewitha Bliaut", hands="Gende. Gages +1", lring="", rring="",
                back="Felicitas Cape", waist="", feet="Chelona Boots"})
		sets.idle.Standard = set_combine(sets.idle.PDT,{
				lear="Merman's Earring", rear="Moonshade Earring",
                feet="Aoidos' Cothrn. +2"})
		sets.misc.Town = set_combine(sets.idle.PDT, {
				feet="Aoidos' Cothrn. +2"})
		sets.misc.MinusHP = {
				head="Zenith Crown", neck="Morgana's Choker", lear="", rear="",
                body="Dalmatica", hands="Zenith Mitts", lring="", rring="",
                back="", waist="Witful Belt", legs="Zenith Slacks", feet="Zenith Pumps"}
		-- JA
		sets.precast.JA["Nightingale"] = {feet="Bihu Slippers"}
		sets.precast.JA["Troubadour"] = {body="Bihu Justaucorps"}
		sets.precast.JA["Soul Voice"] = {legs="Bihu Cannions"}
		
		-- Precast
		-- Magic
		sets.precast.Fastcast = { 
				head="Nahtirah Hat", neck="", lear="Loquac. Earring", rear="",
                body="Anhur Robe", hands="Gende. Gages +1", lring="", rring="Prolix Ring",
                back="Swith Cape", waist="Witful Belt", legs="Orvail Pants +1", feet="Chelona Boots"}
		sets.precast.Fastcast.Song = set_combine(sets.precast.Fastcast, {main="Felibre's Dague",
				head="Aoidos' Calot +2", neck="Aoidos' Matinee", lear="Loquac. Earring", rear="Aoidos' Earring",
                body="Anhur Robe", hands="Gende. Gages +1", lring="Minstrel's Ring", rring="Prolix Ring",
                back="Swith Cape", waist="Witful Belt", legs="Gendewitha Spats", feet="Bihu Slippers"})
		sets.precast.Cure = set_combine(sets.precast.Fastcast, {
				head="", neck="", lear="", rear="",
                body="Heka's Kalasiris", hands="", lring="", rring="",
                back="Pahtli Cape", waist="", legs="", feet=""})
		-- Midcast
		sets.midcast.Recast = set_combine(sets.idle.PDT, {waist="Witful Belt"})
		
		sets.midcast.ConserveMP = {
				head="", neck="", lear="Magnetic Earring", rear="Gifted Earring",
                body="Hedera's Cotehardie", hands="Serpentes Cuffs", lring="", rring="",
                back="Balladeer's Cape", waist="Austerity Belt", legs="", feet="Serpentes Sabots"}
		-- Bard songs
		sets.midcast.Buffsong = {main="Legato Dagger",
				head="Aoidos' Calot +2", neck="Aoidos' matinee", lear="Musical Earring", rear="",
                body="Aoidos' hngrln. +2", hands="Ad. Mnchtte. +2", lring="", rring="",
                back="", waist="", legs="Aoidos' Rhing. +2", feet="Brioso Slippers +1"}
		-- Target Skill + 800
		sets.midcast.Skillsong = {main="Legato Dagger",
				head="Aoidos' Calot +2", neck="Aoidos' matinee", lear="Musical Earring", rear="",
                body="Aoidos' hngrln. +2", hands="Ad. Mnchtte. +2", lring="", rring="",
                back="Rhapsode's Cape", waist="Witful Belt", legs="Aoidos' Rhing. +2", feet="Brioso Slippers +1"}
		sets.midcast.Debuff = {main="Mandau",
				head="Bihu Roundlet +1", neck="Piper's Torque", lear="Lifestorm Earring", rear="Psystorm Earring",
                body="Brioso Just. +1", hands="Bihu Cuffs +1", lring="Perception ring", rring="Sangoma Ring",
                back="Rhapsode's Cape", waist="Demonry Sash", legs="Bihu Cannions +1", feet="Bokwus Boots"}
		--Healing Magic
		sets.midcast.Cure = {main="Arka IV", 
				head="Gendewitha Caubeen", neck="Colossus's Torque", lear="Novia Earring", rear="",
                body="Heka's Kalasiris", hands="Bokwus Gloves", lring="Aquasoul Ring", rring="Aquasoul Ring",
                back="Orison Cape", waist="Cascade Belt", legs="Bokwus Slops", feet="Rubeus Boots"}
		
		sets.midcast.Curaga = {main="Arka IV",
				head="Gendewitha Caubeen", neck="Colossus's Torque", lear="Novia Earring", rear="",
                body="Gendewitha Bliaut", hands="Bokwus Gloves", lring="Aquasoul Ring", rring="Aquasoul Ring",
                back="Pahtli Cape", waist="Cascade Belt", legs="", feet="Rubeus Boots"}
	
		-- Enhancing
		sets.midcast.Phalanx = {}
		sets.midcast.Hastespell = {ammo="Impatiens", waist="Witful Belt"}
		-- 40 MND
		sets.midcast.Stoneskin = set_combine(sets.idle.PDT, {})
		sets.midcast.Aquaveil = {waist="Empahatikos Rope", legs="Shedir Seraweels"}
		sets.midcast.Blink = set_combine(sets.midcast.Aquaveil)
		sets.midcast.Reraise = set_combine(sets.midcast.ConserveMP)

		-- Enfeebling
		-- Potency
		sets.midcast.Enfeebling = {main="Mandau", ammo="Aureole",
				head="Bihu Roundlet +1", neck="Eddy Necklace", lear="Lifestorm Earring", rear="Psystorm Earring",
                body="Brioso Just. +1", hands="Gende. Gages +1", lring="Perception ring", rring="Sangoma Ring",
                back="Rhapsode's Cape", waist="Demonry Sash", legs="Bokwus Slops", feet="Bokwus Boots"}
		sets.midcast.Macc = {main="Mandau", ammo="Aureole",
				head="Bihu Roundlet +1", neck="Eddy Necklace", lear="Lifestorm Earring", rear="Psystorm Earring",
                body="Brioso Just. +1", hands="Gende. Gages +1", lring="Perception ring", rring="Sangoma Ring",
                back="Rhapsode's Cape", waist="Demonry Sash", legs="Bokwus Slops", feet="Bokwus Boots"}

		sets.midcast.Dia = set_combine(sets.midcast.ConserveMP,{})

		-- Melee Sets
		sets.TP = set_combine(sets.idle.PDT, {main="Mandau",
				head="Nahtirah Hat", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Bihu Justaucorps", hands="Bihu Cuffs +1", lring="Rajas Ring", rring="Pyrosoul Ring",
                back="Atheling Mantle", waist="Dynamic Belt +1", legs="Gendewitha Spats", feet="Bihu Slippers"})
		sets.TP.Acc = set_combine(sets.TP, {main="Mandau",
				head="Nahtirah Hat", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Bihu Justaucorps", hands="Bihu Cuffs +1", lring="Rajas Ring", rring="Pyrosoul Ring",
                back="Atheling Mantle", waist="Dynamic Belt +1", legs="Gendewitha Spats", feet="Bihu Slippers"})	
		sets.precast.WS = set_combine(sets.TP, {main="Mandau",
				head="Nahtirah Hat", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Bihu Justaucorps", hands="Bihu Cuffs +1", lring="Rajas Ring", rring="Pyrosoul Ring",
                back="Vespid Mantle", waist="Witful Belt", legs="Gendewitha Spats", feet="Bihu Slippers"})
		sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {main="Mandau",
				head="Nahtirah Hat", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Bihu Justaucorps", hands="Bihu Cuffs +1", lring="Rajas Ring", rring="Pyrosoul Ring",
                back="Vespid Mantle", waist="Witful Belt", legs="Gendewitha Spats", feet="Bihu Slippers"})
		sets.precast.WS['Mercy Stroke'] = set_combine(sets.precast.WS, {main="Mandau",
				head="Nahtirah Hat", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Bihu Justaucorps", hands="Bihu Cuffs +1", lring="Rajas Ring", rring="Pyrosoul Ring",
                back="Vespid Mantle", waist="Witful Belt", legs="Gendewitha Spats", feet="Bihu Slippers"})
		sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS, {main="Mandau",
				head="Nahtirah Hat", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Bihu Justaucorps", hands="Bihu Cuffs +1", lring="Rajas Ring", rring="Pyrosoul Ring",
                back="Vespid Mantle", waist="Witful Belt", legs="Gendewitha Spats", feet="Bihu Slippers"})
		
		sets.misc.Waltz = {}
		sets.misc.Steps = set_combine(sets.TP.Acc,{})
		sets.misc.flourish = set_combine(sets.TP.Macc,{})
		
elseif player.name == "Aniyah" then
	-- includes
		include('include/mappings.lua')
		include('include/equipment.lua')
		--include('include/autoexec.lua')
		include('include/utility.lua')

		-- sets Macros off = 0  on = 1
		automacroset = 0
		if automacroset == 1 then
			if player.sub_job == 'nin' then
				set_macro_page(4,1)
			elseif player.sub_job =='whm' then
				set_macro_page(4,2)
			elseif player.sub_job == 'rdm' then
				set_macro_page(4,3)
			elseif player.sub_job =='sch' then 
				set_macro_page(4,4)
			elseif player.sub_job =='dnc' then 
				set_macro_page(4,5)
			elseif player.sub_job =='BLM' then 
				set_macro_page(4,6)
			end
		else
			set_macro_page(4,1)
		end
		
		-- Instruments
		default = {range="Pan's Horn"}
		-- Buffs
		ballad = {range="Langeleik"}
		march = {range="Langeleik"}
		minuet = {range="Cornette +2"}
		madrigal = {range="Cantabank's Horn"}
		minne = {range="Syrinx"}
		etude = {range="Langeleik"}
		carol = {range="Crumhorn"}
		mambo  = {range="Vihuela"}
		mazurka = {range="Vihuela"}
		paeon = {range="Langeleik"}
		prelude = {range="Cantabank's Horn"}
		scherzo = {range="Pan's Horn"}
		hymnus = {range="Langeleik"}
		--Debuffs
		elegy = {range="Syrinx"}
		threnody = {range="Piccolo +1"}
		lullaby = {range="Pan's Horn"}
		horde = {range="Nursemaid Harp"}
		finale = {range="Pan's Horn"}
		requiem = {range="Hamelin Flute"}
		virelai = {range="Langeleik"}
		nocturne = {range="Iron Ram Horn"}

		-- Auto Sets
		-- Standard/idle
		sets.idle.PDT = {main="Mandau", sub="Genbu's Shield",
				head="Bihu Roundlet +1", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
                body="Gendewitha Bliaut", hands="Gendewitha Gages", lring=Aug.Darkring1.Aniyah, rring="Defending Ring".Aniyah,
                back="Umbra Cape", waist="Flume Belt", legs="Gendewitha Spats", feet="Bihu Slippers"}
		sets.idle.MDT = {
				head="Nahtirah Hat", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
                body="Gendewitha Bliaut", hands="Gendewitha Gages", lring=Aug.Darkring1.Aniyah, rring="Defending Ring".Aniyah,
                back="Engulfer Cape", waist="Flume Belt",  legs="Gendewitha Spats", feet="Gendewitha Galoshes"}			
		sets.Resting = set_combine(sets.idle.PDT, {main="Chatoyant Staff",
				head="", neck="Eidolon Pendant", lear="Magnetic Earring", rear="Moonshade Earring",
                body="Gendewitha Bliaut", hands="Gendewitha Gages", lring="", rring="",
                back="Felicitas Cape", waist="Austerity Belt", legs="Gendewitha Spats", feet="Chelona Boots"})
		sets.idle.Standard = set_combine(sets.idle.PDT,{main="Mandau", sub="Genbu's Shield",
				lear="Merman's Earring", rear="Moonshade Earring",
                body="Gendewitha Bliaut", hands="Gendewitha Gages",
                legs="Gendewitha Spats", feet="Aoidos' Cothrn. +2"})
		sets.misc.Town = set_combine(sets.idle.PDT, {
				feet="Aoidos' Cothrn. +2"})
		sets.misc.MinusHP = {
				head="Zenith Crown", neck="Morgana's Choker", lear="", rear="",
                body="Dalmatica", hands="Zenith Mitts", lring="", rring="",
                back="", waist="Witful Belt", legs="Zenith Slacks", feet="Zenith Pumps"}
		-- JA
		sets.precast.JA["Nightingale"] = {feet="Bihu Slippers"}
		sets.precast.JA["Troubadour"] = {body="Bihu Justaucorps"}
		sets.precast.JA["Soul Voice"] = {legs="Bihu Cannions"}
		
		-- Precast
		-- Magic
		sets.precast.Fastcast = { 
				head="Nahtirah Hat", neck="", lear="Loquac. Earring", rear="",
                body="Anhur Robe", hands="Gendewitha Gages", lring="", rring="Prolix Ring",
                back="Swith Cape", waist="Witful Belt", legs="Orvail Pants +1", feet="Chelona Boots"}
		sets.precast.Fastcast.Song = set_combine(sets.precast.Fastcast, {main="Felibre's Dague",
				head="Aoidos' Calot +2", neck="Aoidos' Matinee", lear="Loquac. Earring", rear="Aoidos' Earring",
                body="Praeco Doublet", hands="Gendewitha Gages", lring="Minstrel's Ring", rring="Prolix Ring",
                back="Swith Cape", waist="Witful Belt", legs="Gendewitha Spats", feet="Bihu Slippers"})
		sets.precast.Cure = set_combine(sets.precast.Fastcast, {
				head="", neck="", lear="", rear="",
                body="Heka's Kalasiris", hands="", lring="", rring="",
                back="Pahtli Cape", waist="", legs="", feet=""})
		-- Midcast
		sets.midcast.Recast = set_combine(sets.idle.PDT, {waist="Witful Belt"})
		
		sets.midcast.ConserveMP = {
				head="", neck="", lear="Magnetic Earring", rear="Gifted Earring",
                body="Hedera's Cotehardie", hands="Serpentes Cuffs", lring="", rring="",
                back="Balladeer's Cape", waist="Austerity Belt", legs="", feet="Serpentes Sabots"}
		-- Bard songs
		sets.midcast.Buffsong = {main="Legato Dagger",
				head="Aoidos' Calot +2", neck="Aoidos' matinee", lear="Musical Earring", rear="",
                body="Aoidos' hngrln. +2", hands="Ad. Mnchtte. +2", lring="", rring="",
                back="", waist="", legs="Aoidos' Rhing. +2", feet="Aoidos' cothurnes +2"}
		-- Target Skill + 800
		sets.midcast.Skillsong = {main="Legato Dagger",
				head="Aoidos' Calot +2", neck="Aoidos' matinee", lear="Musical Earring", rear="",
                body="Aoidos' hngrln. +2", hands="Ad. Mnchtte. +2", lring="", rring="",
                back="Rhapsode's Cape", waist="Witful Belt", legs="Aoidos' Rhing. +2", feet="Brioso Slippers"}
		sets.midcast.Debuff = {main="Mandau",
				head="Bihu Roundlet +1", neck="Piper's Torque", lear="Musical Earring", rear="Gwati Earring",
                body="Brioso Just. +1", hands="Bihu Cuffs +1", lring="Perception ring", rring="Sangoma Ring",
                back="Rhapsode's Cape", waist="Demonry Sash", legs="Bihu Cannions +1", feet="Bokwus Boots"}
		-- Goal 
		sets.midcast.Debuff2 = {main="Mandau", range="Gjallarhorn",
				head="Bihu Roundlet +1", neck="Piper's Torque", lear="Musical Earring", rear="Gwati Earring",
                body="Brioso Just. +1", hands="Bihu Cuffs +1", lring="Perception ring", rring="Sangoma Ring",
                back="Rhapsode's Cape", waist="Demonry Sash", legs="Brioso Cannions", feet="Bokwus Boots"}

		--Healing Magic
		sets.midcast.Cure = {main="Arka IV", 
				head="Gendewitha Caubeen", neck="Colossus's Torque", lear="Novia Earring", rear="",
                body="Heka's Kalasiris", hands="Bokwus Gloves", lring="Aquasoul Ring", rring="Aquasoul Ring",
                back="Orison Cape", waist="Cascade Belt", legs="Bokwus Slops", feet="Rubeus Boots"}
		
		sets.midcast.Curaga = {main="Arka IV",
				head="Gendewitha Caubeen", neck="Colossus's Torque", lear="Novia Earring", rear="",
                body="Gendewitha Bliaut", hands="Bokwus Gloves", lring="Aquasoul Ring", rring="Aquasoul Ring",
                back="Pahtli Cape", waist="Cascade Belt", legs="", feet="Rubeus Boots"}
	
		-- Enhancing
		sets.midcast.Phalanx = {}
		sets.midcast.Hastespell = {ammo="Impatiens", waist="Witful Belt"}
		-- 40 MND
		sets.midcast.Stoneskin = set_combine(sets.idle.PDT, {})
		sets.midcast.Aquaveil = {waist="Empahatikos Rope", legs="Shedir Seraweels"}
		sets.midcast.Blink = set_combine(sets.midcast.Aquaveil)
		sets.midcast.Reraise = set_combine(sets.midcast.ConserveMP)

		-- Enfeebling
		-- Potency
		sets.midcast.Enfeebling = {main="Mandau", ammo="Aureole",
				head="Bihu Roundlet +1", neck="Eddy Necklace", lear="Lifestorm Earring", rear="Psystorm Earring",
                body="Brioso Just. +1", hands="Gende. Gages +1", lring="Perception ring", rring="Sangoma Ring",
                back="Rhapsode's Cape", waist="Demonry Sash", legs="Bokwus Slops", feet="Bokwus Boots"}
		sets.midcast.Macc = {main="", ammo="Aureole",
				head="", neck="Enfeebling Torque", lear="Lifestorm Earring", rear="Psystorm Earring",
                body="Brioso Just. +1", hands="Gende. Gages +1", lring="Perception ring", rring="Sangoma Ring",
                back="Rhapsode's Cape", waist="Demonry Sash", legs="Bihu Cannions +1", feet="Bokwus Boots"}

		sets.midcast.Dia = set_combine(sets.midcast.ConserveMP,{})

		-- Melee Sets
		sets.TP = set_combine(sets.idle.PDT, {})
		sets.TP.Acc = set_combine(sets.TP, {})	
		sets.precast.WS = set_combine(sets.TP, {})
		sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {})
		sets.precast.WS['Mercy Stroke'] = set_combine(sets.precast.WS, {})
		sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS, {})
		
		sets.misc.Waltz = {}
		sets.misc.Steps = set_combine(sets.TP.Acc,{})
		sets.misc.flourish = set_combine(sets.TP.Macc,{})
		
elseif player.name == "Carrisa" then
-- includes
		include('include/mappings.lua')
		include('include/equipment.lua')
		--include('include/autoexec.lua')
		include('include/utility.lua')

		-- sets Macros off = 0  on = 1
		automacroset = 0
		if automacroset == 1 then
			if player.sub_job == 'nin' then
				set_macro_page(20,1)
			elseif player.sub_job =='whm' then
				set_macro_page(20,2)
			elseif player.sub_job == 'rdm' then
				set_macro_page(20,3)
			elseif player.sub_job =='sch' then 
				set_macro_page(20,4)
			elseif player.sub_job =='dnc' then 
				set_macro_page(20,5)
			elseif player.sub_job =='BLM' then 
				set_macro_page(20,6)
			end
		else
			set_macro_page(20,1)
		end
		
		-- Instruments
		default = {range="Pan's Horn"}
		-- Buffs
		ballad = {range="Langeleik"}
		march = {range="Langeleik"}
		minuet = {range="Cornette +2"}
		madrigal = {range="Cantabank's Horn"}
		minne = {range="Syrinx"}
		etude = {range="Langeleik"}
		carol = {range="Crumhorn"}
		mambo  = {range="Vihuela"}
		mazurka = {range="Vihuela"}
		paeon = {range="Langeleik"}
		prelude = {range="Cantabank's Horn"}
		scherzo = {range="Pan's Horn"}
		hymnus = {range="Langeleik"}
		--Debuffs
		elegy = {range="Syrinx"}
		threnody = {range="Piccolo +1"}
		lullaby = {range="Pan's Horn"}
		horde = {range="Nursemaid Harp"}
		finale = {range="Pan's Horn"}
		requiem = {range="Hamelin Flute"}
		virelai = {range="Langeleik"}
		nocturne = {range="Iron Ram Horn"}

		-- Auto Sets
		-- Standard/idle
		sets.idle.PDT = {main="Earth Staff", sub="Vivid Strap",
				head="Nahtirah Hat", neck="Twilight Torque", lear="Loquac. Earring", rear="Musical Earring",
                body="Gendewitha Bliaut", hands="Gendewitha Gages", lring=Aug.Darkring1.Carrisa, rring=Aug.Darkring2.Carrisa,
                back="Umbra Cape", waist="Flume Belt", legs="Gendewitha Spats", feet="Bihu Slippers"}
		sets.idle.MDT = {
				head="Nahtirah Hat", neck="Twilight Torque", lear="Loquac. Earring", rear="Musical Earring",
                body="Gendewitha Bliaut", hands="Gendewitha Gages", lring=Aug.Darkring1.Carrisa, rring=Aug.Darkring2.Carrisa,
                back="Engulfer Cape", waist="Flume Belt",  legs="Gendewitha Spats", feet="Gendewitha Galoshes"}			
		sets.Resting = set_combine(sets.idle.PDT, {main="Chatoyant Staff",
				head="Nefer Khat", neck="Eidolon Pendant", lear="Loquac. Earring", rear="Antivenom Earring",
                body="Heka's kalasiris", hands="Serpentes Cuffs", rring="Angha Ring",
                back="Felicitas Cape", legs="Nares Trews", feet="Chelona Boots"})
		sets.idle.Standard = set_combine(sets.idle.PDT,{
				lear="Loquac. Earring", rear="Musical Earring",
                body="Gendewitha Bliaut", hands="Gendewitha Gages",
                legs="Gendewitha Spats", feet="Aoidos' Cothrn. +2"})
		sets.misc.Town = set_combine(sets.idle.PDT, {
				head="Lilac Corsage", feet="Aoidos' Cothrn. +2"})
		sets.misc.MinusHP = {
				head="Zenith Crown", neck="Morgana's Choker", 
                body="Dalmatica", hands="Zenith Mitts", 
                waist="Witful Belt", legs="Zenith Slacks", feet="Zenith Pumps"}
		-- JA
		sets.precast.JA["Soul Voice"] = {legs="Bihu Cannions"}
		
		sets.precast.JA["Nightingale"] = {feet="Bihu Slippers"}
		sets.precast.JA["Troubadour"] = {body="Bihu Justaucorps"}
		
		-- Precast
		-- Magic
		sets.precast.Fastcast = {
				head="Nahtirah Hat", neck="Jeweled Collar", lear="Loquac. Earring", rear="Musical Earring",
                body="Anhur Robe", hands="Gendewitha Gages", lring="", rring="Prolix Ring",
                back="Swith Cape", waist="Witful Belt", legs="Orvail Pants +1", feet="Chelona Boots"}
		sets.precast.Fastcast.Song = set_combine(sets.precast.Fastcast, {main="Felibre's Dague",
				head="Aoidos' Calot +2", neck="Aoidos' Matinee", lear="Loquac. Earring", rear="Aoidos' Earring",
                body="Sha'ir Manteel", hands="Schellenband", lring="Minstrel's Ring", rring="Prolix Ring",
                back="Swith Cape", waist="Witful Belt", legs="Gendewitha Spats", feet="Bihu Slippers"})
		sets.precast.Cure = set_combine(sets.precast.Fastcast, {
                body="Heka's Kalasiris",
                back="Pahtli Cape"})
		-- Midcast
		sets.midcast.Recast = set_combine(sets.idle.PDT, {waist="Witful Belt"})
		
		sets.midcast.ConserveMP = {
				head="", neck="", lear="Magnetic Earring", rear="Gifted Earring",
                body="Hedera's Cotehardie", hands="Serpentes Cuffs", lring="", rring="",
                back="Balladeer's Cape", waist="Austerity Belt", legs="", feet="Serpentes Sabots"}
		-- Bard songs
		-- Duration > Skill 
		sets.midcast.Buffsong = {main="Legato Dagger",
				head="Aoidos' Calot +2", neck="Aoidos' matinee", lear="Musical Earring", rear="Singing Earring",
                body="Aoidos' hngrln. +2", hands="Ad. Mnchtte. +2", lring="", rring="",
                back="Balladeer's Cape", waist="", legs="Aoidos' Rhing. +2", feet="Aoidos' cothurnes +2"}
		-- Target Skill + 800 Combined Singing + Instrument - Not really necessary anymore.
		sets.midcast.Skillsong = {main="Legato Dagger",
				head="Aoidos' Calot +2", neck="Aoidos' matinee", lear="Musical Earring", rear="Singing Earring",
                body="Aoidos' hngrln. +2", hands="Ad. Mnchtte. +2", lring="", rring="",
                back="Balladeer's Cape", waist="Witful Belt", legs="Aoidos' Rhing. +2", feet="Aoidos' cothurnes +2"}
		sets.midcast.Debuff = {main="Soothsayer Staff", sub="Mephitis Grip",
				head="Nahtirah Hat", neck="Piper's Torque", lear="Lifestorm Earring", rear="Psystorm Earring",
                body="Aoidos' hngrln. +2", hands="Ad. Mnchtte. +2", lring="Mediator's ring", rring="Sangoma Ring",
                back="Balladeer's Cape", waist="Demonry Sash", legs="Bokwus Slops", feet="Bokwus Boots"}
		
		--Healing Magic
		sets.midcast.Cure = {main="Arka IV", 
				head="Gendewitha Caubeen", neck="Colossus's Torque", lear="Healing Earring", rear="Novia Earring",
                body="Heka's Kalasiris", hands="Bokwus Gloves", lring="Haoma's Ring", rring="Sirona's Ring",
                back="Tempered Cape", waist="Cascade Belt", legs="Bokwus Slops", feet="Rubeus Boots"}	
		sets.midcast.Curaga = {main="Arka IV",
				head="Gendewitha Caubeen", neck="Colossus's Torque", lear="Healing Earring", rear="Novia Earring",
                body="Gendewitha Bliaut", hands="Bokwus Gloves", lring="Haoma's Ring", rring="Sirona's Ring",
                back="Tempered Cape", waist="Cascade Belt", legs="Bokwus Slops", feet="Rubeus Boots"}
	
		-- Enhancing
		sets.midcast.Phalanx = {}
		sets.midcast.Hastespell = {ammo="Impatiens", waist="Witful Belt"}
		-- 40 MND
		sets.midcast.Stoneskin = set_combine(sets.idle.PDT, {
				neck="Stone Gorget", rear="Earthcry Earring",
                body="Gendewitha Bliaut", hands="Carapacho Cuffs", lring="Aquasoul Ring", rring="Aquasoul Ring",
                waist="Siegel Sash", legs="Haven Hose", feet="Rubeus Boots"})				
		sets.midcast.Aquaveil = {waist="Empahatikos Rope", legs="Shedir Seraweels"}
		sets.midcast.Blink = set_combine(sets.midcast.Aquaveil)
		sets.midcast.Reraise = set_combine(sets.midcast.ConserveMP)

		-- Enfeebling
		-- Potency
		sets.midcast.Enfeebling = {main="Soothsayer Staff", sub="Mephitis Grip",
				head="Nahtirah Hat", neck="", lear="Lifestorm Earring", rear="Psystorm Earring",
                body="Aoidos' hngrln. +2", hands="Ad. Mnchtte. +2", lring="Mediator's ring", rring="Sangoma Ring",
                back="Rhapsode's Cape", waist="Demonry Sash", legs="Bokwus Slops", feet="Bokwus Boots"}
		sets.midcast.Macc = {main="Soothsayer Staff", sub="Mephitis Grip",
				head="", neck="Enfeebling Torque", lear="Lifestorm Earring", rear="Psystorm Earring",
                body="Aoidos' hngrln. +2", hands="Ad. Mnchtte. +2", lring="Mediator's ring", rring="Sangoma Ring",
                back="Rhapsode's Cape", waist="Demonry Sash", legs="Bokwus Slops", feet="Bokwus Boots"}

		sets.midcast.Dia = set_combine(sets.midcast.ConserveMP,{})

		-- Melee Sets
		sets.TP = set_combine(sets.idle.PDT, {})
		sets.TP.Acc = set_combine(sets.TP, {})	
		sets.precast.WS = set_combine(sets.TP, {})
		sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {})
		sets.precast.WS['Mercy Stroke'] = set_combine(sets.precast.WS, {})
		sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS, {})
		
		sets.misc.Waltz = {}
		sets.misc.Steps = set_combine(sets.TP.Acc,{})
		sets.misc.flourish = set_combine(sets.TP.Macc,{})
end