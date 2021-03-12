-- BLM Gearsets
-- Created: 4/11/2014
-- Last Updated:
-- To Do List
--
--
--
--

if player.Name == 'Lorah' then
		-- includes
		include('include/mappings.lua')
		include('include/equipment.lua')
		include('include/utility.lua')

		-- sets Macros off = 0  on = 1
		automacroset = 0
		if automacroset == 1 then
			if player.sub_job == 'RDM' then
				set_macro_page(2,6)
			elseif player.sub_job =='BLM' then
				set_macro_page(2,7)
			elseif player.sub_job == 'WHM' then
				set_macro_page(2,6)
			elseif player.sub_job == 'SCH' then
				set_macro_page(2,7)
			elseif player.sub_job =='DNC' then 
				set_macro_page(2,8)
			elseif player.sub_job =='DRK' then 
				set_macro_page(2,9)
			elseif player.sub_job =='NIN' then 
				set_macro_page(2,8)
			end
		else
			set_macro_page(2,6)
		end

		-- Auto Sets
		-- Standard/idle
		sets.idle.PDT = {
			main="Solstice",
			range="Dunna",
			head="Geomancy Galero",
			body="Geomancy Tunic",
			hands="Geomancy Mitaines",
			legs="Assid. Pants +1",
			feet="Geomancy Sandals",
			left_ear="Pixie Earring",
			left_ring="Mallquis Ring",
			right_ring="Warp Ring"
		}
		sets.idle.MDT =  {
			main="Solstice",
			range="Dunna",
			head="Geomancy Galero",
			body="Geomancy Tunic",
			hands="Geomancy Mitaines",
			legs="Assid. Pants +1",
			feet="Geomancy Sandals",
			left_ear="Pixie Earring",
			left_ring="Mallquis Ring",
			right_ring="Warp Ring"
		}			
		sets.Resting = set_combine(sets.idle.PDT,  {
			main="Solstice",
			range="Dunna",
			head="Geomancy Galero",
			body="Geomancy Tunic",
			hands="Geomancy Mitaines",
			legs="Assid. Pants +1",
			feet="Geomancy Sandals",
			left_ear="Pixie Earring",
			left_ring="Mallquis Ring",
			right_ring="Warp Ring"
		})
		sets.idle.Standard = set_combine(sets.idle.PDT, {
			main="Solstice",
			range="Dunna",
			head="Geomancy Galero",
			body="Geomancy Tunic",
			hands="Geomancy Mitaines",
			legs="Assid. Pants +1",
			feet="Geomancy Sandals",
			left_ear="Pixie Earring",
			left_ring="Mallquis Ring",
			right_ring="Warp Ring"
		})
		sets.idle.Standard.Pet = set_combine(sets.idle.PDT, {
			main="Solstice",
			range="Dunna",
			head="Geomancy Galero",
			body="Geomancy Tunic",
			hands="Geomancy Mitaines",
			legs="Assid. Pants +1",
			feet="Geomancy Sandals",
			left_ear="Pixie Earring",
			left_ring="Mallquis Ring",
			right_ring="Warp Ring"
		})
						
		sets.misc.Town = set_combine(sets.idle.PDT, {feet="Geomancy Sandals"})
		-- JA
		sets.precast.JA["Bolster"] = {body="Bagua Tunic"}
		sets.precast.JA["Widened Compass"] = {}
		
		sets.precast.JA["Life Circle"] = {body="Geomancy Tunic"}
		sets.precast.JA["Full Circle"] = {hands="Bagua Mitianes"}
		sets.precast.JA["Mending Halation"] = {legs="Bagua Pants"}
		sets.precast.JA["Radial Arcana"] = {feet="Bagua Sandals"}
		sets.precast.JA["Cardinal Chant"] = {head="Geomancy Galero"}
		sets.precast.JA["Collimated Fervor"] = {head="Geomancy Galero"}
		
		-- Precast
		-- Magic
		sets.precast.Fastcast = {ammo="Impatiens",
				head="Nahtirah Hat", neck="", lear="Loquac. Earring",
                body="Anhur Robe", hands="", lring="", rring="Prolix Ring",
                back="Lifestream Cape", waist="Witful Belt", legs="Geomancy Pants", feet="Chelona Boots"}
		sets.precast.Cure = set_combine(sets.precast.Fastcast, {
				head="", neck="", lear="", rear="",
                body="Heka's Kalasiris", hands="", lring="", rring="",
                back="Pahtli Cape", waist="", legs="", feet=""})
		-- Midcast
		sets.midcast.Recast = set_combine(sets.idle.PDT, {waist="Witful Belt"})
		
		sets.midcast.ConserveMP = {
				head="Nares Cap", neck="", lear="Magnetic Earring", rear="Gifted Earring",
                body="Hedera's Cotehardie", hands="Serpentes Cuffs", lring="", rring="",
				waist="Sekhmet Corset", feet="Umbani Boots"}
		-- Geomancy
		sets.midcast.Geomancy = set_combine(sets.midcast.ConserveMP,{range="Filiae Bell",
				body="Bagua Tunic", hands="Geomancy Mitaines",
				back="Lifestream Cape",legs="Bagua Pants"})
		
		-- Elemental
		-- High Resist
		sets.midcast.Elemental = {main="Atinian Staff", sub="Wise Grip", ammo="Witchstone",
				head="Hagondes Hat", neck="Eddy Necklace", lear="Lifestorm Earring", rear="Psystorm Earring",
                body="Bokwus Robe", hands="Hagondes Cuffs", lring="Icesoul Ring", rring="Icesoul ring",
                back="Toro Cape", waist="Sekhmet Corset", legs="Hagondes Pants", feet="Umbani Boots"}
		-- Damage
		sets.midcast.Nuke = {main="Atinian Staff", sub="Wise Grip", ammo="Witchstone",
				head="Hagondes Hat", neck="Eddy Necklace", lear="Novio Earring", rear="Friomisi Earring",
                body="Bokwus Robe", hands="Yaoyotl Gloves", lring="Icesoul Ring", rring="Icesoul ring",
                back="Toro Cape", waist="Sekhmet Corset", legs="Hagondes Pants", feet="Umbani Boots"}		
		
		--Healing Magic
		sets.midcast.Cure = {main="Arka IV", 
				head="", neck="Colossus's Torque", lear="Novia Earring", rear="Lifestorm Earring",
                body="Heka's Kalasiris", hands="Bokwus Gloves", lring="Aquasoul Ring", rring="Aquasoul Ring",
                back="Refraction Cape", waist="Cascade Belt", legs="Bokwus Slops", feet="Rubeus Boots"}
		
		sets.midcast.Curaga = {main="Arka IV", 
				head="", neck="Colossus's Torque", lear="Novia Earring", rear="Lifestorm Earring",
                body="Heka's Kalasiris", hands="Bokwus Gloves", lring="Aquasoul Ring", rring="Aquasoul Ring",
                back="Refraction Cape", waist="Cascade Belt", legs="Bokwus Slops", feet="Rubeus Boots"}
	
		-- Enhancing 
		sets.midcast.Enhancing = {sub="Fulcio Grip",neck="Colossus's Torque",body="Anhur Robe",hands="Ayao's Gloves",legs="Portant Pants",feet="Rubeus Boots",waist="Cascade Belt",back="Merciful Cape"}
		sets.midcast.Phalanx = set_combine(sets.midcast.Enhancing)
		sets.midcast.Hastespell = {ammo="Impatiens", waist="Witful Belt"}
		sets.midcast.Stoneskin = {}
		sets.midcast.Aquaveil = {}
		sets.midcast.Blink = set_combine(sets.midcast.Aquaveil)
		sets.midcast.Reraise = set_combine(sets.midcast.ConserveMP)

		-- Enfeebling
		-- Potency
		sets.midcast.Enfeebling = {main="Atinian Staff", sub="Mephitis Grip", ammo="Aureole",
				head="Nahtirah Hat", neck="Eddy Necklace", lear="Lifestorm Earring", rear="Psystorm Earring",
                body="Bokwus Robe", hands="Hagondes Cuffs", lring="Perception ring", rring="Sangoma ring",
                back="Lifestream Cape", waist="Demonry Sash", legs="Bokwus Slops", feet="Bokwus Boots"}
		sets.midcast.Macc = {main="Atinian Staff", sub="Mephitis Grip", ammo="Aureole",
				head="Nahtirah Hat", neck="Eddy Necklace", lear="Lifestorm Earring", rear="Psystorm Earring",
                body="Bokwus Robe", hands="Hagondes Cuffs", lring="Perception ring", rring="Sangoma ring",
                back="Lifestream Cape", waist="Demonry Sash", legs="Bokwus Slops", feet="Bokwus Boots"}
		sets.midcast.Dia = set_combine(sets.midcast.ConserveMP)
		sets.midcast.Paralyze = set_combine(sets.midcast.Macc)
		sets.midcast.Blind = set_combine(sets.midcast.Macc)
		sets.midcast.Bio = set_combine(sets.midcast.Macc)
		sets.midcast.Slow = set_combine(sets.midcast.Macc)
		
		
		-- Dark Magic
		sets.midcast.Dark = set_combine(sets.midcast.Macc, {
				head="Bagua Galero", neck="Aesir Torque",
				body="Geomancy Tunic", 
				back="Merciful Cape", waist="Fucho-no-Obi"})
		sets.midcast.Aspir = set_combine(sets.midcast.Dark,{waist="Fucho-no-Obi"})
		sets.midcast.Stun = set_combine(sets.midcast.Macc)
		
		-- Melee Sets
		sets.TP = set_combine(sets.idle.PDT, {waist="Witful Belt",})
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