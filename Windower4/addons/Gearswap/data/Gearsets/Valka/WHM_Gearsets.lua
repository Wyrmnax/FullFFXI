-- WHM Gearsets
-- Date Created: 1/29/2014
-- Last Updated: 6/6/2014
-- To Do List:
--
--
--
--

if player.name == 'Valka' then
		-- includes
		include('include/utility.lua')
		include('include/mappings.lua')
		include('include/equipment.lua')
		-- include('../include/autoexec.lua')
			
		-- sets Macros off = 0  on = 1
		automacroset = 1
		if automacroset == 1 then
			if player.sub_job == 'rdm' then
				set_macro_page(1,1)
			elseif player.sub_job =='sch' then
				set_macro_page(1,2)
			elseif player.sub_job == 'smn' then
				set_macro_page(1,3)
			elseif player.sub_job =='blm' then 
				set_macro_page(1,4)
			end
		else
			set_macro_page(1,1)
		end
		
		-- Auto Sets
		-- Standard/idle
		sets.idle.PDT = {
				main="Bolelabunga",
				sub="Sors Shield",
				ammo="Amar Cluster",
				head="Inyanga Tiara +2",
				body={ name="Vanya Robe", augments={'HP+50','MP+50','"Refresh"+2',}},
				hands="Inyan. Dastanas +2",
				legs="Assid. Pants +1",
				feet="Inyan. Crackows +1",
				neck="Henic Torque",
				waist="Porous Rope",
				left_ear="Mendi. Earring",
				right_ear="Nourish. Earring",
				left_ring="Ayanmo Ring",
				right_ring="Warden's  Ring",
				back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity-10','Phys. dmg. taken-10%',}},
				}
		sets.idle.MDT = {
				}		
		sets.Resting = set_combine(sets.idle.PDT, {
				})
		sets.idle.Standard = set_combine(sets.idle.PDT,{
				})

		sets.misc.Town = set_combine(sets.idle.PDT, {
				feet="Herald's Gaiters"})
		-- Precast
		-- Magic
		sets.precast.Fastcast = {
			sub="Sors Shield",			
			head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
			body={ name="Vanya Robe", augments={'HP+50','MP+50','"Refresh"+2',}},
			hands={ name="Kaykaus Cuffs", augments={'MP+60','"Cure" spellcasting time -5%','Enmity-5',}},
			legs="Aya. Cosciales +1",
			feet="Regal Pumps +1",
			waist="Porous Rope",
			left_ear="Mendi. Earring",
			right_ear="Nourish. Earring",
			left_ring="Ayanmo Ring",
			back={ name="Alaunus's Cape", augments={'"Fast Cast"+10',}},
		}
		sets.precast.Cure = set_combine(sets.precast.Fastcast, {
			left_ear="Mendi. Earring",
			legs="Ebers Pantaloons",
			feet="Vanya Clogs"})
		-- JA
		sets.precast.JA['Benediction'] = {body="Cleric's Briault +2"}
		sets.precast.JA['Asylum'] = {}
		
		sets.precast.JA['Divine Caress'] = {head="Orison Cap +2", hands="Orison Mitts +2", back="Mending Cape"}
		sets.precast.JA['Devotion'] = {head="Cleric's Cap +2"}
		sets.precast.JA['Martyr'] = {hands="Cleric's Mitts +2"}
		
		-- Midcast
		sets.midcast.Recast = set_combine(sets.idle.PDT, sets.precast.Fastcast, {
				})
		sets.midcast.ConserveMP = {}

		--Healing Magic
		-- Cures
		sets.midcast.Cure = {
			main="Queller Rod",
			sub="Sors Shield",
			head={ name="Vanya Hood", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
			body={ name="Vanya Robe", augments={'HP+50','MP+50','"Refresh"+2',}},
			hands={ name="Kaykaus Cuffs", augments={'MP+60','"Cure" spellcasting time -5%','Enmity-5',}},
			legs="Ebers Pantaloons",
			feet={ name="Kaykaus Boots", augments={'MP+60','"Cure" spellcasting time -5%','Enmity-5',}},
			waist="Porous Rope",
			left_ear="Mendi. Earring",
			right_ear="Nourish. Earring",
			left_ring="Ayanmo Ring",
			right_ring="Sangoma Ring"
			}
		sets.midcast.EnmityCure = set_combine(sets.midcast.Cure, {
			})

		sets.midcast.Curaga = set_combine(sets.midcast.Cure, {
			})
			
		sets.midcast.EnmityCuraga = set_combine(sets.midcast.Curaga, {})

		sets.midcast.Cura = {}

		-- Status Ailments
		sets.midcast.NaSpells = set_combine(sets.midcast.Recast, {})
		
		sets.midcast.Erase = set_combine(sets.midcast.NaSpells)

		sets.midcast.Cursna = set_combine(sets.midcast.Recast, {
				neck="Debilis Medallion",
                rring="Haoma's Ring",
                back="Mending Cape", legs="Theophany Pantaloons", feet="Gende. Galoshes"})
				
		sets.midcast.Esuna = set_combine(sets.midcast.Recast)
		sets.midcast.Sacrifice = set_combine(sets.midcast.Recast)

		-- Enhancing
		sets.midcast.Regen = set_combine(sets.midcast.ConserveMP,{
                body="Cleric's Briault", hands="Orison Mitts +2",
                legs="Theo. Pantaloons"})
		sets.midcast.BarElement = {main="Beneficus",
				head="Orison Cap +2", neck="Colossus's Torque", lear="Andoaa Earring", rear="",
                body="Orison Bliaut +2", hands="Orison Mitts +2", lring="", rring="",
                back="Merciful Cape", waist="Cascade Belt", legs="Orsn. Pantaln. +2", feet="Orsn. Duckbills +2"}
		sets.midcast.BarStatus = {main="Beneficus",
				head="", neck="Colossus's Torque", lear="Andoaa Earring", rear="",
                body="Anhur Robe", hands="Ayao's Gages", lring="", rring="",
                back="Merciful Cape", waist="Cascade Belt", legs="Clr. Pantaln. +2", feet="Orsn. Duckbills +2"}
		sets.midcast.Boost = {main="Beneficus", sub="Fulcio Grip",
				head="", neck="Colossus's Torque", lear="Andoaa Earring", rear="",
                body="Anhur Robe", hands="Ayao's Gages", lring="", rring="",
                back="Merciful Cape", waist="Cascade Belt", legs="Clr. Pantaln. +2", feet="Orsn. Duckbills +2"}
		sets.midcast.Phalanx = set_combine(sets.midcast.Boost)
		sets.midcast.Hastespell = {ammo="Impatiens", waist="Witful Belt"}
		sets.midcast.Stoneskin = {waist="Siegal Sash"}
		sets.midcast.Aquaveil = {waist="Empahatikos Rope", legs="Shedir Seraweels"}
		sets.midcast.Blink = set_combine(sets.midcast.Aquaveil)
		sets.midcast.Reraise = set_combine(sets.midcast.ConserveMP)

		--Divine Magic
		sets.midcast.Repose = set_combine(sets.midcast.Recast)
		sets.midcast.Flash = set_combine(sets.midcast.Macc)
		sets.midcast.Banish = {main="Soothsayer Staff",
				head="Nahtirah Hat", neck="Eddy Necklace", lear="Friomisi Earring", rear="Novio Earring",
                body="Bokwus Robe", hands="Yaoyotl Gloves", lring="Aquasoul Ring", rring="Aquasoul Ring",
                back="Toro Cape", waist="Sekhmet Corset", legs="Gendewitha Spats", feet="Gendewitha Galoshes"}
		sets.midcast.Holy = set_combine(sets.midcast.Banish)

		-- Enfeebling
		-- Potency
		sets.midcast.Enfeebling = {main="Soothsayer Staff", sub="Mephitis Grip", ammo="Aureole",
				head="Nahtirah Hat", neck="Eddy Necklace", lear="Lifestorm Earring", rear="Psystorm Earring",
                body="Bokwus Robe", hands="Gende. Gages +1", lring="Aquasoul ring", rring="Aquasoul ring",
                back="Refraction Cape", waist="Demonry Sash", legs="Bokwus Slops", feet="Bokwus Boots"}
		sets.midcast.Macc = {main="Soothsayer Staff", sub="Mephitis Grip", ammo="Aureole",
				head="Nahtirah Hat", neck="Eddy Necklace", lear="Lifestorm Earring", rear="Psystorm Earring",
                body="Bokwus Robe", hands="Gende. Gages +1", lring="Perception ring", rring="Sangoma Ring",
                back="Refraction Cape", waist="Demonry Sash", legs="Bokwus Slops", feet="Bokwus Boots"}

		sets.midcast.Dia = set_combine(sets.midcast.ConserveMP,{})

		-- Dark Magic
		sets.midcast.DarkMagic = set_combine(sets.midcast.Macc, {	
				head="Appetence Crown", neck="Aesir Torque",
				body="Hedera Cotehardie",
				back="Merciful Cape"})
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

elseif player.name == 'Derion' then
		-- includes
		include('include/utility.lua')
		include('include/mappings.lua')
		include('include/equipment.lua')
		-- include('../include/autoexec.lua')
			
		-- sets Macros off = 0  on = 1
		automacroset = 1
		if automacroset == 1 then
			if player.sub_job == 'rdm' then
				set_macro_page(1,1)
			elseif player.sub_job =='sch' then
				set_macro_page(1,2)
			elseif player.sub_job == 'smn' then
				set_macro_page(1,3)
			elseif player.sub_job =='blm' then 
				set_macro_page(1,4)
			end
		else
			set_macro_page(1,1)
		end
	
		-- Auto Sets
		-- Standard/idle
		
		sets.idle.PDT = { main="Earth Staff",
				head="", neck="Twilight Torque", lear="", rear="",
                body="Gendewitha bliaut", hands="Gendewitha Gages", lring=Aug.Darkring1.Derion, rring="Shadow Ring",
                back="Cheviot Cape", waist="Austerity Belt", legs="Gendewitha spats", feet="Gende. Galoshes"}
		sets.idle.MDT = {
				head="", neck="Twilight Torque", lear="", rear="",
                body="Gendewitha bliaut", hands="Gendewitha Gages", lring=Aug.Darkring1.Aniyah, rring="Shadow Ring",
                back="Cheviot Cape", waist="Austerity Belt", legs="Gendewitha spats", feet="Gende. Galoshes"}
		sets.Resting = set_combine(sets.idle.PDT, {main="Iridal Staff", ammo="Clarus Stone",
				head="Orvail Corona +1", neck="Eidolon Pendant", lear="Relaxing Earring", rear="Magnetic Earring",
                body="Orison Bliaud +2", hands="Serpentes Cuffs", lring="", rring="",
                back="Felicitas Cape", waist="Austerity Belt", legs="", feet="Chelona Boots"})
		sets.idle.Standard = set_combine(sets.idle.PDT,{hands="Serpentes Cuffs"})
		sets.misc.Town = set_combine(sets.idle.PDT, {feet="Herald's Gaiters"})
		
		-- Precast
		-- Magic
		sets.precast.Fastcast = { ammo="Incantor stone",
				head="Nahtirah Hat", neck="Orison Locket", lear="Loquac. Earring", rear="",
                body="Anhur Robe", hands="Gendewitha Gages", lring="", rring="Prolix Ring",
                back="Swith Cape", waist="Witful Belt", legs="Orvail Pants +1", feet="Chelona boots"}
		sets.precast.Cure = set_combine(sets.precast.Fastcast, {
				head="Clr Cap +2", neck="", lear="", rear="",
                body="Heka's Kalasiris", hands="", lring="", rring="",
                back="Pahtli Cape", waist="", legs="Orsn. Pantaln. +2", feet="Cure Clogs"})
		-- JA
		sets.precast.JA['Benediction'] = {body="Cleric's Briault +2"}
		sets.precast.JA['Asylum'] = {}
		
		sets.precast.JA['Divine Caress'] = {head="Orison Cap +2", hands="Orison Mitts +2", back="Mending Cape"}
		sets.precast.JA['Divine Seal'] = {}
		
		-- Midcast
		sets.midcast.Recast = set_combine(sets.idle.PDT,{main="Plenitas Virga",waist="witful belt"})
		sets.midcast.ConserveMP = {ammo="Clarus Stone",
				head="", neck="", lear="", rear="Gifted Earring",
                body="Hedera's Cotehardie", hands="Serpentes Cuffs", lring="", rring="Magnetic Earring",
                back="", waist="Austerity Belt", legs="", feet="Umbani Boots"}

		--Healing Magic
		sets.midcast.Cure = {main="Arka IV", sub="Pax Grip",
				head="Orison cap +2", neck="Colossus's Torque", lear="Loquac. Earring", rear="Orison Earring<",
                body="Heka's Kalasiris", hands="Augur's Gloves", lring="Solemn ring", rring="Sirona's ring",
                back="Oretania's Cape", waist="Cleric's Belt", legs="Orsn. pantaln. +2", feet="Rubeus Boots"}
				
		sets.midcast.EnmityCure = set_combine(sets.midcast.Cure, {main="Arka IV", sub="Pax Grip",})

		sets.midcast.Curaga = {main="Arka IV", sub="Pax Grip",
				head="Orison cap +2", neck="Colossus's Torque", lear="Loquac. Earring", rear="Orison Earring<",
                body="Heka's Kalasiris", hands="Augur's Gloves", lring="Solemn ring", rring="Sirona's ring",
                back="Oretania's Cape", waist="Cleric's Belt", legs="Orsn. pantaln. +2", feet="Rubeus Boots"}
				
		sets.midcast.EnmityCuraga = set_combine(sets.midcast.Curaga, {})

		sets.midcast.Cura = set_combine(sets.midcast.Recast,{})

		sets.midcast.NaSpells = set_combine(sets.midcast.Recast, {ammo="Incantor Stone",
				head="orison cap +2", neck="Orison Locket",
                body="Orison Bliaud +2", lring="", rring="Sirona's Ring",
                back="Altruistic Cape",legs="Orsn. pantaln. +2"})
		sets.midcast.Erase = set_combine(sets.midcast.NaSpells)

		sets.midcast.Cursna = set_combine(sets.midcast.Recast, {
				neck="Debilis Medallion",
                body="Orison Bliaud +2", lring="Haoma's Ring",
                back="Mending Cape", legs="Orsn. Pantaln. +2", feet="Gende. Galoshes"})
				
		sets.midcast.Esuna = set_combine(sets.midcast.Recast)
		sets.midcast.Sacrifice = set_combine(sets.midcast.Recast)

		-- Enhancing
		sets.midcast.Regen = set_combine(sets.midcast.ConserveMP,{
				body="Cleric's Briault", hands="Orison Mitts +2",
                })
		sets.midcast.BarElement = {main="Beneficus",
				head="Orison Cap +2", neck="Colossus's Torque",
                body="Orison Bliaut +2", hands="Orison Mitts +2",
                back="Merciful Cape", waist="Cascade Belt", legs="Orsn. Pantaln. +2", feet="Orsn. Duckbills +2"}
		sets.midcast.BarStatus = {main="Beneficus",
				neck="Colossus's Torque",
                body="Anhur Robe",
                legs="Clr. Pantaln. +2", feet="Orsn. Duckbills +2"}
		sets.midcast.Boost = {main="Kirin's Pole", sub="Fulcio Grip",
				neck="Colossus's Torque",
                body="Anhur Robe", hands="Augur's Gloves", lring="", rring="",
                back="Merciful Cape", waist="Cascade Belt", legs="Clr. Pantaln. +2", feet="Orsn. Duckbills +2"}
		sets.midcast.Phalanx = set_combine(sets.Boost)
		sets.midcast.Hastespell = {ammo="Impatiens", waist="Witful Ring"}
		sets.midcast.Stoneskin = {waist="Siegal Sash"}
		sets.midcast.Aquaveil = {waist="Empahatikos Rope", legs="Shedir Seraweels"}
		sets.midcast.Blink = set_combine(sets.midcast.Aquaveil)
		sets.midcast.Reraise = set_combine(sets.midcast.ConserveMP)

		--Divine Magic
		sets.midcast.Repose = set_combine(sets.midcast.Recast)
		sets.midcast.Flash = set_combine(sets.midcast.Macc)
		sets.midcast.Banish = {main="Soothsayer Staff",
				head="Nahtirah Hat", neck="Eddy Necklace", lear="Hecate's Earring", rear="Novio Earring",
                body="Bokwus Robe", hands="Yaoyotl Gloves", lring="Aquasoul Ring", rring="Aquasoul Ring",
                back="Searing Cape", waist="", legs="Gendewitha Spats", feet="Gendewitha Galoshes"}
		sets.midcast.Holy = set_combine(sets.midcast.Banish)

		-- Enfeebling
		-- Potency
		sets.midcast.Enfeebling = {main="Soothsayer Staff", sub="Mephitis Grip", ammo="Aureole",
				head="Nahtirah Hat", neck="Enfeebling Torque", lear="Lifestorm Earring", rear="Psystorm Earring",
                body="Bokwus Robe", hands="Yaoyotl Gloves", lring="Sangoma Ring", rring="Perception Ring",
                back="Refraction Cape", waist="Demonry Sash", legs="Bokwus Slops", feet="Bokwus Boots"}
		sets.midcast.Macc = {main="Soothsayer Staff", sub="Mephitis Grip", ammo="Aureole",
				head="Nahtirah Hat", neck="Enfeebling Torque", lear="Lifestorm Earring", rear="Psystorm Earring",
                body="Bokwus Robe", hands="Yaoyotl Gloves", lring="Sangoma Ring", rring="Perception Ring",
                back="Refraction Cape", waist="Demonry Sash", legs="Bokwus Slops", feet="Bokwus Boots"}
		sets.midcast.Dia = set_combine(sets.midcast.ConserveMP,{})

		-- Dark Magic
		sets.midcast.DarkMagic = set_combine(sets.midcast.Macc, {})
		sets.midcast.Drain = set_combine(sets.midcast.Macc, {})
		sets.midcast.Aspir = set_combine(sets.midcast.Macc, {})
		
		-- Elemental Magic
		sets.midcast.Nuke = set_combine(sets.midcast.Banish)
		sets.midcast.Dot = set_combine(sets.midcast.Macc)

		-- Melee Sets
		sets.TP = set_combine(sets.idle.PDT,{})
		sets.TP.Acc = set_combine(sets.TP,{})
		
		sets.precast.WS = set_combine(sets.TP, {})
		sets.precast.WS['Hexa Strike'] = set_combine(sets.precast.WS, {})

elseif player.name == 'Aniyah' then
		-- includes
		include('include/utility.lua')
		include('include/mappings.lua')
		include('include/equipment.lua')
		-- include('../include/autoexec.lua')
			
		-- sets Macros off = 0  on = 1
		automacroset = 1
		if automacroset == 1 then
			if player.sub_job == 'rdm' then
				set_macro_page(1,1)
			elseif player.sub_job =='sch' then
				set_macro_page(1,2)
			elseif player.sub_job == 'smn' then
				set_macro_page(1,3)
			elseif player.sub_job =='blm' then 
				set_macro_page(1,4)
			end
		else
			set_macro_page(1,1)
		end
	
		-- Auto Sets
		-- Standard/idle
		
		sets.idle.PDT = { main="Earth Staff",
				head="", neck="Twilight Torque", lear="", rear="",
                body="Gendewitha bliaut", hands="Gendewitha Gages", lring=Aug.Darkring1.Aniyah, rring=Aug.Darkring2.Aniyah,
                back="Cheviot Cape", waist="Austerity Belt", legs="Gendewitha spats", feet="Gende. Galoshes"}
		sets.idle.MDT = {
				head="", neck="Twilight Torque", lear="", rear="",
                body="Gendewitha bliaut", hands="Gendewitha Gages", lring=Aug.Darkring1.Aniyah, rring="Shadow Ring",
                back="Cheviot Cape", waist="Austerity Belt", legs="Gendewitha spats", feet="Gende. Galoshes"}
		sets.Resting = set_combine(sets.idle.PDT, {main="Iridal Staff", ammo="Clarus Stone",
				head="Orvail Corona +1", neck="Eidolon Pendant", lear="Relaxing Earring", rear="Antivenom Earring",
                body="Gendewitha bliaut", hands="Serpentes Cuffs", lring="", rring="",
                back="Felicitas Cape", waist="Austerity Belt", legs="", feet="Chelona Boots"})
		sets.idle.Standard = set_combine(sets.idle.PDT,{hands="Serpentes Cuffs"})
		sets.misc.Town = set_combine(sets.idle.PDT, {feet="Herald's Gaiters"})
		
		-- Precast
		-- Magic
		sets.precast.Fastcast = { ammo="Incantor stone",
				head="Nahtirah Hat", neck="Orison Locket", lear="Loquac. Earring", rear="",
                body="Anhur Robe", hands="Gendewitha Gages", lring="", rring="Prolix Ring",
                back="Swith Cape", waist="Witful Belt", legs="Orvail Pants +1", feet="Chelona boots"}
		sets.precast.Cure = set_combine(sets.precast.Fastcast, {
				head="Clr Cap +2", neck="", lear="", rear="",
                body="Heka's Kalasiris", hands="", lring="", rring="",
                back="Pahtli Cape", waist="", legs="Orsn. Pantaln. +2", feet="Cure Clogs"})
		-- JA
		sets.precast.JA['Benediction'] = {body="Cleric's Briault +2"}
		sets.precast.JA['Asylum'] = {}
		
		sets.precast.JA['Divine Caress'] = {head="Orison Cap +2", hands="Orison Mitts +2", back="Mending Cape"}
		sets.precast.JA['Divine Seal'] = {}
		
		-- Midcast
		sets.midcast.Recast = set_combine(sets.idle.PDT,{main="Plenitas Virga",waist="witful belt"})
		sets.midcast.ConserveMP = {ammo="Clarus Stone",
				head="", neck="", lear="", rear="Gifted Earring",
                body="Hedera's Cotehardie", hands="Serpentes Cuffs", lring="", rring="Magnetic Earring",
                back="", waist="Austerity Belt", legs="", feet="Umbani Boots"}

		--Healing Magic
		sets.midcast.Cure = {main="Arka IV", sub="Pax Grip",
				head="Orison cap +2", neck="Colossus's Torque", lear="Loquac. Earring", rear="Orison Earring<",
                body="Heka's Kalasiris", hands="Augur's Gloves", lring="Solemn ring", rring="Sirona's ring",
                back="Oretania's Cape", waist="Cleric's Belt", legs="Orsn. pantaln. +2", feet="Rubeus Boots"}
				
		sets.midcast.EnmityCure = set_combine(sets.midcast.Cure, {main="Arka IV", sub="Pax Grip",})

		sets.midcast.Curaga = {main="Arka IV", sub="Pax Grip",
				head="Orison cap +2", neck="Colossus's Torque", lear="Loquac. Earring", rear="Orison Earring<",
                body="Heka's Kalasiris", hands="Augur's Gloves", lring="Solemn ring", rring="Sirona's ring",
                back="Oretania's Cape", waist="Cleric's Belt", legs="Orsn. pantaln. +2", feet="Rubeus Boots"}
				
		sets.midcast.EnmityCuraga = set_combine(sets.midcast.Curaga, {})

		sets.midcast.Cura = set_combine(sets.midcast.Recast,{})

		sets.midcast.NaSpells = set_combine(sets.midcast.Recast, {ammo="Incantor Stone",
				head="orison cap +2", neck="Orison Locket",
                body="Orison Bliaud +2", lring="", rring="Sirona's Ring",
                back="Altruistic Cape",legs="Orsn. pantaln. +2"})
		sets.midcast.Erase = set_combine(sets.midcast.NaSpells)

		sets.midcast.Cursna = set_combine(sets.midcast.Recast, {
				neck="Debilis Medallion",
                body="Orison Bliaud +2", lring="Haoma's Ring",
                back="Mending Cape", legs="Orsn. Pantaln. +2", feet="Gende. Galoshes"})
				
		sets.midcast.Esuna = set_combine(sets.midcast.Recast)
		sets.midcast.Sacrifice = set_combine(sets.midcast.Recast)

		-- Enhancing
		sets.midcast.Regen = set_combine(sets.midcast.ConserveMP,{
				body="Cleric's Briault", hands="Orison Mitts +2",
                })
		sets.midcast.BarElement = {main="Beneficus",
				head="Orison Cap +2", neck="Colossus's Torque",
                body="Orison Bliaut +2", hands="Orison Mitts +2",
                back="Merciful Cape", waist="Cascade Belt", legs="Orsn. Pantaln. +2", feet="Orsn. Duckbills +2"}
		sets.midcast.BarStatus = {main="Beneficus",
				neck="Colossus's Torque",
                body="Anhur Robe",
                legs="Clr. Pantaln. +2", feet="Orsn. Duckbills +2"}
		sets.midcast.Boost = {main="Kirin's Pole", sub="Fulcio Grip",
				neck="Colossus's Torque",
                body="Anhur Robe", hands="Augur's Gloves", lring="", rring="",
                back="Merciful Cape", waist="Cascade Belt", legs="Clr. Pantaln. +2", feet="Orsn. Duckbills +2"}
		sets.midcast.Phalanx = set_combine(sets.Boost)
		sets.midcast.Hastespell = {ammo="Impatiens", waist="Witful Ring"}
		sets.midcast.Stoneskin = {waist="Siegal Sash"}
		sets.midcast.Aquaveil = {waist="Empahatikos Rope", legs="Shedir Seraweels"}
		sets.midcast.Blink = set_combine(sets.midcast.Aquaveil)
		sets.midcast.Reraise = set_combine(sets.midcast.ConserveMP)

		--Divine Magic
		sets.midcast.Repose = set_combine(sets.midcast.Recast)
		sets.midcast.Flash = set_combine(sets.midcast.Macc)
		sets.midcast.Banish = {main="Soothsayer Staff",
				head="Nahtirah Hat", neck="Eddy Necklace", lear="Hecate's Earring", rear="Novio Earring",
                body="Bokwus Robe", hands="Yaoyotl Gloves", lring="Aquasoul Ring", rring="Aquasoul Ring",
                back="Searing Cape", waist="", legs="Gendewitha Spats", feet="Gendewitha Galoshes"}
		sets.midcast.Holy = set_combine(sets.midcast.Banish)

		-- Enfeebling
		-- Potency
		sets.midcast.Enfeebling = {main="Soothsayer Staff", sub="Mephitis Grip", ammo="Aureole",
				head="Nahtirah Hat", neck="Enfeebling Torque", lear="Lifestorm Earring", rear="Psystorm Earring",
                body="Bokwus Robe", hands="Yaoyotl Gloves", lring="Sangoma Ring", rring="Perception Ring",
                back="Refraction Cape", waist="Demonry Sash", legs="Bokwus Slops", feet="Bokwus Boots"}
		sets.midcast.Macc = {main="Soothsayer Staff", sub="Mephitis Grip", ammo="Aureole",
				head="Nahtirah Hat", neck="Enfeebling Torque", lear="Lifestorm Earring", rear="Psystorm Earring",
                body="Bokwus Robe", hands="Yaoyotl Gloves", lring="Sangoma Ring", rring="Perception Ring",
                back="Refraction Cape", waist="Demonry Sash", legs="Bokwus Slops", feet="Bokwus Boots"}
		sets.midcast.Dia = set_combine(sets.midcast.ConserveMP,{})

		-- Dark Magic
		sets.midcast.DarkMagic = set_combine(sets.midcast.Macc, {})
		sets.midcast.Drain = set_combine(sets.midcast.Macc, {})
		sets.midcast.Aspir = set_combine(sets.midcast.Macc, {})
		
		-- Elemental Magic
		sets.midcast.Nuke = set_combine(sets.midcast.Banish)
		sets.midcast.Dot = set_combine(sets.midcast.Macc)

		-- Melee Sets
		sets.TP = set_combine(sets.idle.PDT,{})
		sets.TP.Acc = set_combine(sets.TP,{})
		
		sets.precast.WS = set_combine(sets.TP, {})
		sets.precast.WS['Hexa Strike'] = set_combine(sets.precast.WS, {})

elseif player.name =='Firetoplay' then
		-- includes
		include('include/utility.lua')
		include('include/mappings.lua')
		include('include/equipment.lua')
		-- include('../include/autoexec.lua')
			
		-- sets Macros off = 0  on = 1
		automacroset = 1
		if automacroset == 1 then
			if player.sub_job == 'rdm' then
				set_macro_page(1,1)
			elseif player.sub_job =='sch' then
				set_macro_page(1,2)
			elseif player.sub_job == 'smn' then
				set_macro_page(1,3)
			elseif player.sub_job =='blm' then 
				set_macro_page(1,4)
			end
		else
			set_macro_page(1,1)
		end
	
		-- Auto Sets
		-- Standard/idle
		
		sets.idle.PDT = { main="Earth Staff",
				head="", neck="Twilight Torque", lear="", rear="",
                body="Gendewitha bliaut", hands="Gendewitha Gages", lring=Aug.Darkring1.Firetoplay, rring=Aug.Darkring2.Firetoplay,
                back="Cheviot Cape", waist="Austerity Belt", legs="Gendewitha spats", feet="Gende. Galoshes"}
		sets.idle.MDT = {
				head="", neck="Twilight Torque", lear="", rear="",
                body="Gendewitha bliaut", hands="Gendewitha Gages", lring=Aug.Darkring1.Aniyah, rring="Shadow Ring",
                back="Cheviot Cape", waist="Austerity Belt", legs="Gendewitha spats", feet="Gende. Galoshes"}
		sets.Resting = set_combine(sets.idle.PDT, {main="Iridal Staff", ammo="Clarus Stone",
				head="Orvail Corona +1", neck="Eidolon Pendant", lear="Relaxing Earring", rear="Magnetic Earring",
                body="Orison Bliaud +2", hands="Serpentes Cuffs", lring="", rring="",
                back="Felicitas Cape", waist="Austerity Belt", legs="", feet="Chelona Boots"})
		sets.idle.Standard = set_combine(sets.idle.PDT,{hands="Serpentes Cuffs"})
		sets.misc.Town = set_combine(sets.idle.PDT, {feet="Herald's Gaiters"})
		
		-- Precast
		-- Magic
		sets.precast.Fastcast = { ammo="Incantor stone",
				head="Nahtirah Hat", neck="Orison Locket", lear="Loquac. Earring", rear="",
                body="Anhur Robe", hands="Gendewitha Gages", lring="", rring="Prolix Ring",
                back="Swith Cape", waist="Witful Belt", legs="Orvail Pants +1", feet="Chelona boots"}
		sets.precast.Cure = set_combine(sets.precast.Fastcast, {
				head="Clr Cap +2", neck="", lear="", rear="",
                body="Heka's Kalasiris", hands="", lring="", rring="",
                back="Pahtli Cape", waist="", legs="Orsn. Pantaln. +2", feet="Cure Clogs"})
		-- JA
		sets.precast.JA['Benediction'] = {body="Cleric's Briault +2"}
		sets.precast.JA['Asylum'] = {}
		
		sets.precast.JA['Divine Caress'] = {head="Orison Cap +2", hands="Orison Mitts +2", back="Mending Cape"}
		sets.precast.JA['Divine Seal'] = {}
		
		-- Midcast
		sets.midcast.Recast = set_combine(sets.idle.PDT,{main="Plenitas Virga",waist="Witful belt"})
		sets.midcast.ConserveMP = {ammo="Clarus Stone",
				head="", neck="", lear="", rear="Gifted Earring",
                body="Hedera's Cotehardie", hands="Serpentes Cuffs", lring="", rring="Magnetic Earring",
                back="", waist="Austerity Belt", legs="", feet="Umbani Boots"}

		--Healing Magic
		sets.midcast.Cure = {main="Arka IV", sub="Pax Grip",
				head="Orison cap +2", neck="Colossus's Torque", lear="Loquac. Earring", rear="Orison Earring<",
                body="Heka's Kalasiris", hands="Augur's Gloves", lring="Solemn ring", rring="Sirona's ring",
                back="Oretania's Cape", waist="Cleric's Belt", legs="Orsn. pantaln. +2", feet="Rubeus Boots"}
				
		sets.midcast.EnmityCure = set_combine(sets.midcast.Cure, {main="Arka IV", sub="Pax Grip"})

		sets.midcast.Curaga = {main="Arka IV", sub="Pax Grip",
				head="Orison cap +2", neck="Colossus's Torque", lear="Loquac. Earring", rear="Orison Earring",
                body="Heka's Kalasiris", hands="Augur's Gloves", lring="Solemn ring", rring="Sirona's ring",
                back="Oretania's Cape", waist="Cleric's Belt", legs="Orsn. pantaln. +2", feet="Rubeus Boots"}
				
		sets.midcast.EnmityCuraga = set_combine(sets.midcast.Curaga, {})

		sets.midcast.Cura = set_combine(sets.midcast.Recast,{})

		sets.midcast.NaSpells = set_combine(sets.midcast.Recast, {ammo="Incantor Stone",
				head="orison cap +2", neck="Orison Locket",
                body="Orison Bliaud +2", lring="", rring="Sirona's Ring",
                back="Altruistic Cape",legs="Orsn. pantaln. +2"})
		sets.midcast.Erase = set_combine(sets.midcast.NaSpells)

		sets.midcast.Cursna = set_combine(sets.midcast.Recast, {
				neck="Debilis Medallion",
                body="Orison Bliaud +2", lring="Haoma's Ring",
                back="Mending Cape", legs="Orsn. Pantaln. +2", feet="Gende. Galoshes"})
				
		sets.midcast.Esuna = set_combine(sets.midcast.Recast)
		sets.midcast.Sacrifice = set_combine(sets.midcast.Recast)

		-- Enhancing
		sets.midcast.Regen = set_combine(sets.midcast.ConserveMP,{
				body="Cleric's Briault", hands="Orison Mitts +2",
                })
		sets.midcast.BarElement = {main="Beneficus",
				head="Orison Cap +2", neck="Colossus's Torque",
                body="Orison Bliaut +2", hands="Orison Mitts +2",
                back="Merciful Cape", waist="Cascade Belt", legs="Orsn. Pantaln. +2", feet="Orsn. Duckbills +2"}
		sets.midcast.BarStatus = {main="Beneficus",
				neck="Colossus's Torque",
                body="Anhur Robe",
                legs="Clr. Pantaln. +2", feet="Orsn. Duckbills +2"}
		sets.midcast.Boost = {main="Kirin's Pole", sub="Fulcio Grip",
				neck="Colossus's Torque",
                body="Anhur Robe", hands="Augur's Gloves", lring="", rring="",
                back="Merciful Cape", waist="Cascade Belt", legs="Clr. Pantaln. +2", feet="Orsn. Duckbills +2"}
		sets.midcast.Phalanx = set_combine(sets.Boost)
		sets.midcast.Hastespell = {ammo="Impatiens", waist="Witful Ring"}
		sets.midcast.Stoneskin = {waist="Siegal Sash"}
		sets.midcast.Aquaveil = {waist="Empahatikos Rope", legs="Shedir Seraweels"}
		sets.midcast.Blink = set_combine(sets.midcast.Aquaveil)
		sets.midcast.Reraise = set_combine(sets.midcast.ConserveMP)

		--Divine Magic
		sets.midcast.Repose = set_combine(sets.midcast.Recast)
		sets.midcast.Flash = set_combine(sets.midcast.Macc)
		sets.midcast.Banish = {main="Soothsayer Staff",
				head="Nahtirah Hat", neck="Eddy Necklace", lear="Hecate's Earring", rear="Novio Earring",
                body="Bokwus Robe", hands="Yaoyotl Gloves", lring="Aquasoul Ring", rring="Aquasoul Ring",
                back="Searing Cape", waist="", legs="Gendewitha Spats", feet="Gendewitha Galoshes"}
		sets.midcast.Holy = set_combine(sets.midcast.Banish)

		-- Enfeebling
		-- Potency
		sets.midcast.Enfeebling = {main="Soothsayer Staff", sub="Mephitis Grip", ammo="Aureole",
				head="Nahtirah Hat", neck="Enfeebling Torque", lear="Lifestorm Earring", rear="Psystorm Earring",
                body="Bokwus Robe", hands="Yaoyotl Gloves", lring="Sangoma Ring", rring="Perception Ring",
                back="Refraction Cape", waist="Demonry Sash", legs="Bokwus Slops", feet="Bokwus Boots"}
		sets.midcast.Macc = {main="Soothsayer Staff", sub="Mephitis Grip", ammo="Aureole",
				head="Nahtirah Hat", neck="Enfeebling Torque", lear="Lifestorm Earring", rear="Psystorm Earring",
                body="Bokwus Robe", hands="Yaoyotl Gloves", lring="Sangoma Ring", rring="Perception Ring",
                back="Refraction Cape", waist="Demonry Sash", legs="Bokwus Slops", feet="Bokwus Boots"}
		sets.midcast.Dia = set_combine(sets.midcast.ConserveMP,{})

		-- Dark Magic
		sets.midcast.DarkMagic = set_combine(sets.midcast.Macc, {})
		sets.midcast.Drain = set_combine(sets.midcast.Macc, {})
		sets.midcast.Aspir = set_combine(sets.midcast.Macc, {})
		
		-- Elemental Magic
		sets.midcast.Nuke = set_combine(sets.midcast.Banish)
		sets.midcast.Dot = set_combine(sets.midcast.Macc)

		-- Melee Sets
		sets.TP = set_combine(sets.idle.PDT,{})
		sets.TP.Acc = set_combine(sets.TP,{})
		
		sets.precast.WS = set_combine(sets.TP, {})
		sets.precast.WS['Hexa Strike'] = set_combine(sets.precast.WS, {})

elseif player.name == 'Carrisa' then
		-- includes
		include('include/utility.lua')
		include('include/mappings.lua')
		include('include/equipment.lua')
		-- include('../include/autoexec.lua')
			
		-- sets Macros off = 0  on = 1
		automacroset = 0
		if automacroset == 1 then
			if player.sub_job == 'rdm' then
				set_macro_page(4,1)
			elseif player.sub_job =='sch' then
				set_macro_page(4,2)
			elseif player.sub_job == 'smn' then
				set_macro_page(4,3)
			elseif player.sub_job =='blm' then 
				set_macro_page(4,4)
			end
		else
			set_macro_page(4,1)
		end
		
		-- Auto Sets
		-- Standard/idle
		sets.idle.PDT = {main="Earth Staff", sub="Pax Grip", ammo="Incantor Stone",
				head="Nahtirah Hat", neck="Twilight Torque", lear="Novia Earring", rear="Orison Earring",
                body="Gendewitha Bliaut", hands="Gendewitha Gages", lring=Aug.Darkring1.Carrisa, rring="Mediator's Ring",
                back="Umbra Cape", waist="", legs="Gendewitha Spats", feet="Gendewitha Galoshes"}
		sets.idle.MDT = {	
				head="Gendewitha Caubeen", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
                body="Gendewitha Bliaut", hands="Gendewitha Gages", lring=Aug.Darkring1.Carrisa, rring="Mediator's Ring",
                back="", waist="",  legs="Gendewitha Spats", feet="Gendewitha Galoshes"}			
		sets.Resting = set_combine(sets.idle.PDT, {main="Chatoyant Staff", ammo="Clarus Stone",
				head="Nefer Khat", neck="Eidolon Pendant", lear="Novia Earring", rear="Antivenom Earring",
                body="Heka's Kalasiris", hands="Serpentes Cuffs", lring="", rring="Angha Ring",
                back="Felicitas Cape", waist="Austerity Belt", legs="Nares Trews", feet="Chelona Boots"})
		sets.idle.Standard = set_combine(sets.idle.PDT,{
				head="Nefer Khat", lear="Merman's Earring", rear="Moonshade Earring",
                body="Heka's Kalasiris", hands="Serpentes Cuffs", lring="Sangoma Ring", rring="Mediator's Ring",
                legs="Nares Trews", feet="Herald's Gaiters"})

		sets.misc.Town = set_combine(sets.idle.PDT, {
				feet="Herald's Gaiters"})
		-- Precast
		-- Magic
		sets.precast.Fastcast = {ammo="Impatiens", sub="Vivid Strap",
				head="Nahtirah Hat", neck="Orison Locket", lear="Loquac. Earring", rear="Orison Earring",
                body="Anhur Robe", hands="Repartie Gloves", lring="Prolix Ring", rring="",
                back="Swith Cape", waist="Witful Belt", legs="Orvail Pants +1", feet="Chelona Boots"}
		sets.precast.Cure = set_combine(sets.precast.Fastcast, {
				head="", neck="Aceso's Choker", lear="", rear="",
                body="Heka's Kalairis", hands="", lring="", rring="",
                back="Pahtli Cape", waist="", legs="Orsn. Pantaln. +2", feet="Cure Clogs"})
		-- JA
		sets.precast.JA = {}
		sets.precast.JA['Divine Caress'] = {head="Orison Cap +2", hands="Orison Mitts +2", back="Mending Cape"}
		sets.precast.JA['Benediction'] = {body="Cleric's Briault +2"}
		
		-- Midcast
		sets.midcast = {}
		sets.midcast.Recast = set_combine(sets.idle.PDT,{main="Plenitas Virga",
				head="Nahtirah hat", neck="", lear="", rear="",
                body="Hedera Cotehardie", hands="Bokwus Gloves", lring="", rring="",
                back="Swith Cape", waist="Witful Belt", legs="", feet="Gende. Galoshes"})
		sets.midcast.ConserveMP = {ammo="Clarus Stone",
				head="", neck="", lear="", rear="Gifted Earring",
                body="Hedera's Cotehardie", hands="Serpentes Cuffs", lring="", rring="",
                back="", waist="Austerity Belt", legs="Nares Trews", feet="Serpentes Sabots"}

		--Healing Magic
		sets.midcast.Cure = {main="Arka IV", sub="Curatio Grip",
				head="Orison Cap +2", neck="Colossus's Torque", lear="Roundel Earring", rear="Orison Earring",
                body="Orison Bliaud +2", hands="Bokwus Gloves", lring="Sirona's Ring", rring="Haoma's Ring",
                back="Tempered Cape", waist="Cascade Belt", legs="Orsn. Pantaln. +2", feet="Rubeus Boots"}
		sets.midcast.EnmityCure = set_combine(sets.midcast.Cure, {main="Arka IV", 
				head="Orison Cap +2", neck="Colossus's Torque", lear="Roundel Earring", rear="Orison Earring",
                body="Orison Bliaud +2", hands="Bokwus Gloves", lring="Sirona's Ring", rring="Haoma's Ring",
                back="Tempered Cape", waist="Cascade Belt", legs="Orsn. Pantaln. +2", feet="Rubeus Boots"})

		sets.midcast.Curaga = {main="Arka IV", sub="Pax Grip",
				head="Orison Cap +2", neck="Colossus's Torque", lear="Novia Earring", rear="Orison Earring",
                body="Gendewitha Bliaut", hands="Bokwus Gloves", lring="Sirona's Ring", rring="Haoma's Ring",
                back="Refraction Cape", waist="Cascade Belt", legs="Orsn. Pantaln. +2", feet="Rubeus Boots"}
		sets.midcast.EnmityCuraga = set_combine(sets.midcast.Curaga, {})

		sets.midcast.Cura = {}

		sets.midcast.NaSpells = set_combine(sets.midcast.Recast, {ammo="Incantor Stone",
				head="Nahtirah Hat", neck="Orison Locket", lear="Loquac. Earring", rear="",
                body="Hedera Cotehardie", hands="", lring="Prolix Ring", rring="",
                back="", waist="Witful Belt", legs="", feet=""})
		sets.midcast.Erase = set_combine(sets.midcast.NaSpells)

		sets.midcast.Cursna = set_combine(sets.midcast.Recast, {
				head="", neck="Malison Medallion", lear="Loquac. Earring", rear="",
                body="Orison Bliaud +2", hands="", lring="Prolix Ring", rring="Haoma's Ring",
                back="Mending Cape", waist="Witful Belt", legs="Orsn. Pantaln. +2", feet="Gende. Galoshes"})
				
		sets.midcast.Esuna = set_combine(sets.midcast.Recast)
		sets.midcast.Sacrifice = set_combine(sets.midcast.Recast)

		-- Enhancing
		sets.midcast.Regen = set_combine(sets.midcast.ConserveMP,{
				head="", neck="", lear="", rear="",
                body="Cleric's Briault", hands="Orison Mitts +2", lring="", rring="",
                back="", waist="", legs="", feet=""})
		sets.midcast.BarElement = {main="Beneficus",
				head="Orison Cap +2", neck="Colossus's Torque", lear="", rear="",
                body="Orison Bliaut +2", hands="Orison Mitts +2", lring="", rring="",
                back="Merciful Cape", waist="Cascade Belt", legs="Orsn. Pantaln. +2", feet="Orsn. Duckbills +2"}
		sets.midcast.BarStatus = {main="Beneficus",
				head="", neck="Colossus's Torque", lear="", rear="",
                body="Anhur Robe", hands="Ayao's Gages", lring="", rring="",
                back="Merciful Cape", waist="Cascade Belt", legs="Clr. Pantaln. +2", feet="Orsn. Duckbills +2"}
		sets.midcast.Boost = {main="Beneficus", sub="Fulcio Grip",
				head="", neck="Colossus's Torque", lear="", rear="",
                body="Anhur Robe", hands="Ayao's Gages", lring="", rring="",
                back="Merciful Cape", waist="Cascade Belt", legs="Clr. Pantaln. +2", feet="Orsn. Duckbills +2"}
		sets.midcast.Phalanx = set_combine(sets.Boost)
		sets.midcast.Hastespell = {ammo="Impatiens", waist="Witful Belt"}
		sets.midcast.Stoneskin = {neck="Stone Gorget", rear="Earthcry Earring", hands="Carapacho Cuffs",waist="Siegal Sash", legs="Haven Hose"}
		sets.midcast.Aquaveil = {waist="Empahatikos Rope", legs="Shedir Seraweels"}
		sets.midcast.Blink = set_combine(sets.midcast.Aquaveil)
		sets.midcast.Reraise = set_combine(sets.midcast.ConserveMP)

		--Divine Magic
		sets.midcast.Repose = set_combine(sets.midcast.Recast)
		sets.midcast.Flash = set_combine(sets.midcast.Macc)
		sets.midcast.Banish = {main="Soothsayer Staff",
				head="Nahtirah Hat", neck="Eddy Necklace", lear="Hecate's Earring", rear="Novio Earring",
                body="Bokwus Robe", hands="Yaoyotl Gloves", lring="Aquasoul Ring", rring="Aquasoul Ring",
                back="Searing Cape", waist="", legs="Gendewitha Spats", feet="Gendewitha Galoshes"}
		sets.midcast.Holy = set_combine(sets.midcast.Banish)

		-- Enfeebling
		-- Potency
		sets.midcast.Enfeebling = {main="Soothsayer Staff", sub="Mephitis Grip", ammo="Aureole",
				head="Nahtirah Hat", neck="Eddy Necklace", lear="Lifestorm Earring", rear="Psystorm Earring",
                body="Bokwus Robe", hands="Yaoyotl Gloves", lring="Sangoma Ring", rring="Mediator's Ring",
                back="Refraction Cape", waist="Demonry Sash", legs="Bokwus Slops", feet="Bokwus Boots"}
		sets.midcast.Macc = {main="Soothsayer Staff", sub="Mephitis Grip", ammo="Aureole",
				head="Nahtirah Hat", neck="Eddy Necklace", lear="Lifestorm Earring", rear="Psystorm Earring",
                body="Bokwus Robe", hands="Yaoyotl Gloves", lring="Sangoma Ring", rring="Mediator's Ring",
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
		sets.TP = {}
		sets.precast.WS = set_combine(sets.TP, {})
		sets.precast.WS['Hexa Strike'] = set_combine(sets.precast.WS, {})

end