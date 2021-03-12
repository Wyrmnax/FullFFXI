-- BLM Gearsets
-- Date: 4/11/2014
--
---

if player.Name == 'Feary' then
		-- includes
		include('include/mappings.lua')
		include('include/equipment.lua')
		include('include/utility.lua')

		-- sets Macros off = 0  on = 1
		automacroset = 0
		if automacroset == 1 then
			if player.sub_job == 'RDM' then
				set_macro_page(2,1)
			elseif player.sub_job =='WHM' then
				set_macro_page(2,2)
			elseif player.sub_job == 'SCH' then
				set_macro_page(2,3)
			elseif player.sub_job == 'BRD' then
				set_macro_page(2,4)
			elseif player.sub_job =='NIN' then 
				set_macro_page(2,5)
			end
		else
			set_macro_page(2,3)
		end

		-- Auto Sets
		-- Standard/idle
		sets.idle.PDT = {main="Earth Staff",
				head="Hagondes Hat", neck="Twilight Torque",
                body="Hagondes Coat", hands="Hagondes Cuffs", lring=Aug.Darkring1, rring="Defending Ring",
                back="Umbra Cape", waist="Fucho-no-obi", legs="Hagondes Pants", feet="Hagondes Sabots"}
		sets.idle.MDT = {
				head="Hagondes Hat", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
                body="Hagondes Coat", hands="Hagondes Cuffs", lring=Aug.Darkring1, rring="Defending Ring",
                back="Felicitas Cape", waist="Fucho-no-obi",  legs="Hagondes Pants", feet="Hagondes Sabots"}			
		sets.Resting = set_combine(sets.idle.PDT, {main="Chatoyant Staff",
				neck="Eidolon Pendant", lear="Magnetic Earring", rear="Moonshade Earring",
                body="Hagondes Coat", hands="Serpentes Cuffs",
                back="Umbra Cape", waist="Fucho-no-obi", legs="Nares Trews", feet="Chelona Boots"})
		sets.idle.Standard = set_combine(sets.idle.PDT,{
				lear="Merman's Earring", rear="Moonshade Earring",feet="Herald's Gaiters"})
		sets.misc.Town = set_combine(sets.idle.PDT, {feet="Herald's Gaiters"})
		
		-- JA
		sets.precast.JA["Manafont"] = {}
		sets.precast.JA["Subtle Sorcery"] = {}
		sets.precast.JA["Elemental Seal"] = {}
		sets.precast.JA["Emnity Douse"] = {}
		sets.precast.JA["Manawell"] = {}
		
		-- Precast
		-- Magic
		sets.precast.MinusHP = {head="Zenith Crown",neck="Morgana's Choker",body="Dalmatica",hands="Zenith Mitts",legs="Zenith Slacks",feet="Zenith Pumps"}
		sets.precast.Fastcast = {ammo="Impatiens",
				head="Nahtirah Hat", neck="", lear="Loquac. Earring",
                body="Anhur Robe", hands="Gende. Gages +1", rring="Prolix Ring",
                back="Swith Cape", waist="Witful Belt", legs="Orvail Pants +1", feet="Chelona Boots"}
		sets.precast.Elemental = set_combine(sets.precast.Fastcast,{head="Goetia Petasos +2"})
		sets.precast.Cure = set_combine(sets.precast.Fastcast, {
				head="", neck="", lear="", rear="",
                body="Heka's Kalasiris", hands="", lring="", rring="",
                back="Pahtli Cape", waist="", legs="", feet=""})
		-- Midcast
		sets.midcast.Recast = set_combine(sets.idle.PDT, {waist="Witful Belt"})
		
		sets.midcast.ConserveMP = {ammo="Clarus Stone",
				head="Nares Cap", neck="", lear="Magnetic Earring", rear="Gifted Earring",
                body="Hedera's Cotehardie", hands="Serpentes Cuffs", lring="", rring="",
				waist="Sekhmet Corset"}
		
		-- Elemental
		-- High Resist
		sets.midcast.Elemental = {main="Atinian Staff", sub="Wise Grip", ammo="Witchstone",
				head="Hagondes Hat", neck="Eddy Necklace", lear="Strophadic Earring", rear="Friomisi Earring",
                body="Bokwus Robe", hands="Yaoyotl Gloves", lring="Icesoul ring", rring="Icesoul ring",
                back="Toro Cape", waist="Sekhmet Corset", legs="Hagondes Pants", feet="Umbani Boots"}
		-- Damage
		sets.midcast.Nuke = {main="Atinian Staff", sub="Wise Grip", ammo="Witchstone",
				head="Hagondes Hat", neck="Eddy Necklace", lear="Novio Earring", rear="Friomisi Earring",
                body="Bokwus Robe", hands="Yaoyotl Gloves", lring="Icesoul ring", rring="Icesoul ring",
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
		sets.midcast.Enfeebling = {main="Atinian Staff", sub="Mephitis Grip", ammo="Aureole",
				head="Nahtirah Hat", neck="Eddy Necklace", lear="Lifestorm Earring", rear="Psystorm Earring",
                body="Bokwus Robe", hands="Hagondes Cuffs", lring="Perception ring", rring="Sangoma ring",
                back="Refraction Cape", waist="Demonry Sash", legs="Bokwus Slops", feet="Bokwus Boots"}
		sets.midcast.Macc = {main="Atinian Staff", sub="Mephitis Grip", ammo="Aureole",
				head="Nahtirah Hat", neck="Eddy Necklace", lear="Lifestorm Earring", rear="Psystorm Earring",
                body="Bokwus Robe", hands="Hagondes Cuffs", lring="Perception ring", rring="Sangoma ring",
                back="Refraction Cape", waist="Demonry Sash", legs="Bokwus Slops", feet="Bokwus Boots"}
		sets.midcast.Dia = set_combine(sets.midcast.ConserveMP)
		sets.midcast.Paralyze = set_combine(sets.midcast.Macc)
		sets.midcast.Blind = set_combine(sets.midcast.Macc)
		sets.midcast.Bio = set_combine(sets.midcast.Macc)
		sets.midcast.Slow = set_combine(sets.midcast.Macc)
		
		
		-- Dark Magic
		sets.midcast.Dark = set_combine(sets.midcast.Macc, {
				head="Appetence Crown", neck="Aesir Torque",
				hands="Sorcerer's Gloves", 
				back="Merciful Cape", waist="Fucho-no-Obi", legs="Wizard's Tonban", feet="Goetia Sabots +2"})
		sets.midcast.Aspir = set_combine(sets.midcast.Dark)
		sets.midcast.Stun = set_combine(sets.midcast.Macc)
		
		-- Melee Sets
		sets.TP = set_combine(sets.idle.PDT, {
				head="", neck="", lear="", rear="",
                body="", hands="", lring="", rring="",
                back="", waist="", legs="", feet=""})
		sets.precast.WS = set_combine(sets.TP, {
				head="", neck="", lear="", rear="",
                body="", hands="", lring="", rring="",
                back="", waist="", legs="", feet=""})
		sets.precast.WS['Shattersoul'] = set_combine(sets.precast.WS, {})
		
		-- Misc
		sets.misc.Waltz = {}
		sets.misc.Steps = {}
		sets.misc.flourish = {}
end