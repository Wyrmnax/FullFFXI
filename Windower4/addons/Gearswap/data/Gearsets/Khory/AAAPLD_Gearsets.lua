-- PLD Gearsets
-- Created:4/1/2014
-- Last Modified: 7/19/2014
-- To Do List
--
--
--
--

if player.name == 'Feary' then
	-- includes
	include('include/utility.lua')
	include('include/mappings.lua')
	include('include/equipment.lua')
	-- include('../include/autoexec.lua')

	-- sets Macros: 0ff = 0  On = 1
		automacroset = 0
		if automacroset == 1 then
			if player.sub_job == 'NIN' then
				set_macro_page(16,1)
			elseif player.sub_job == 'DNC' then
				set_macro_page(16,2)
			elseif player.sub_job == 'WAR' then
				set_macro_page(16,3)
			elseif player.sub_job == 'BLU' then 
				set_macro_page(16,4)
			elseif player.sub_job == 'whm' then 
				set_macro_page(16,5)
			elseif player.sub_job == 'run' then 
				set_macro_page(16,6)
			end
		elseif automacroset == 2 then
			set_macro_page(16,2)
		else
			windower.send_command('input /macro book 16')
		end
-- Auto Sets
physicalshield = {sub="Ochain"}
magicalshield = {sub="Aegis"}

-- Standard/idle
sets.idle.PDT = { ammo="Angha Gem",
				head="Rev. Coronet +1", neck="Twilight Torque",
                body="Cab. Surcoat +1", hands="Cizin Mufflers", lring=Aug.Darkring1, rring="Defending Ring",
                back="Repulse Mantle", waist="Flume Belt", legs="Cab. Breeches", feet="Rev. Leggings +1"}

sets.idle.MDT = { ammo="Vanir Battery",
				head="Rev. Coronet +1", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
                body="Cab. Surcoat +1", hands="Cizin Mufflers", lring="Defending Ring", rring="Shadow Ring",
                back="Engulfer Cape", waist="Creed Baudrier", legs="Cab. Breeches", feet="Rev. Leggings +1"}

sets.misc.Town = set_combine(sets.idle.PDT, {
				legs="Blood Cuisses"})
				
sets.idle.Standard = set_combine(sets.idle.PDT, {
				lear="Merman's Earring", rear="Merman's Earring", legs="Blood Cuisses"})
-- TP 
sets.TP = { 	ammo="Paeapua",
				head="Otomi Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Pak Corselet", hands="Cizin Gauntlets", lring="Rajas Ring", rring="K'ayres Ring",
                back="Atheling Mantle", waist="Windbuffet Belt", legs="Cizin Breeches +1", feet="Ejekamal Boots"}
sets.TP.Acc = { ammo="Ginsen",
				head="Yaoyotl Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Pak Corselet", hands="Buremte Gloves", lring="Rajas Ring", rring="Thundersoul Ring",
                back="Atheling Mantle", waist="Dynamic Belt +1", legs="Miki. Cuisses", feet="Whirlpool Greaves"}
sets.TP.Hybrid = { ammo="Angha Gem",
				head="Yaoyotl Helm", neck="Twilight Torque", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Cab. Surcoat +1", hands="Buremte Gloves", lring=Aug.Darkring1, rring="Defending Ring",
                back="Repulse Mantle", waist="Dynamic Belt +1", legs="Cizin Breeches +1", feet="Cizin Greaves"}			
sets.Weakened = { ammo="Angha Gem",
				head="Rev. Coronet +1", neck="Twilight Torque", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Cab. Surcoat +1", hands="Cab. Gauntlets", lring=Aug.Darkring1, rring="Defending Ring",
                back="Repulse Mantle", waist="Flume Belt", legs="Cizin Breeches +1", feet="Cizin Greaves"}
				
-- Precast 
-- Enmity Caps at 100 
sets.Enmity = set_combine(sets.idle.PDT,{ ammo="Paeapua",
				head="Cab. Coronet", neck="Atzintli Necklace",
				body="Cab. Surcoat +1", hands="Cab. Gauntlets",
				back="Fravashi Mantle", waist="Creed Baudrier", legs="Cab. Breeches", feet="Cab. Leggings"})

sets.HPDown = set_combine(sets.idle.PDT,{
				head="Cizin Helm", lear="Loquac. Earring",
				rring="Prolix Ring"})
-- Midcast
sets.Recast = set_combine(sets.TP,{})

sets.Cure = set_combine(sets.Recast,{
				head="Yaoyotl Helm", neck="Phalaina Locket", lear="Creed Earring", rear="Knightly Earring",
				body="Reverence Surcoat",hands="Buremte Gloves",lring="Meridian Ring",rring="K'ayres Ring",
				back="Fravashi Mantle", waist="Chuq'aba Belt", legs="Cab. Breeches", feet="Cab. Leggings"})

sets.midcast.DivineMagic = set_combine(sets.Recast,{body="Reverence Surcoat"})

sets.midcast.EnhancingMagic = set_combine(sets.Recast,{})

-- JA
sets.precast.JA["Invincible"] = set_combine(sets.Enmity,{legs="Cab. Breeches"})
sets.precast.JA["Intervene"] = set_combine(sets.precast.JA["Shield Bast"],{
				hands="Cab. Gauntlets",lear="Knightly Earring"})
-- MND			
sets.precast.JA["Chivalry"] = set_combine(sets.idle.PDT,{hands="Cab. Gauntlets"},{
				head="Yaoyotl Helm", neck="Phalaina Locket",
				body="Cab. Surcoat", lring="Aquasoul Ring", rring="Aquasoul Ring",
				legs="Cab. Breeches", feet="Whirlpool Greaves"})
-- VIT
sets.precast.JA["Rampart"] = set_combine(sets.Enmity,{
				head="Cab. Coronet", 
				body="Cab. Surcoat", hands="Cab. Gauntlets",
				waist="Chuq'aba Belt", legs="Cab. Breeches", feet="Whirlpool Greaves"})
sets.precast.JA["Sentinel"] = set_combine(sets.Enmity,{feet="Cab. Leggings"})
sets.precast.JA["Holy Circle"] = set_combine(sets.Enmity,{feet="Rev. Leggings +1"})
sets.precast.JA["Fealty"] = set_combine(sets.Enmity,{body="Cab. Surcoat"})
sets.precast.JA["Shield Bash"] = set_combine(sets.Enmity,{
				hands="Cab. Gauntlets",lear="Knightly Earring"})

-- WS
sets.precast.WS = {
				head="Yaoyotl Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Miki. Breastplate", hands="Miki. Gauntlets", lring="Rajas Ring", rring="Pyrosoul Ring",
                back="Atheling Mantle", waist="Zoran's Belt", legs="Miki. Cuisses", feet="Whirlpool Greaves"}
sets.precast.WS['Requiescat'] = { ammo="",
				head="Yaoyotl Helm", neck="Shadow Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Miki. Breastplate", hands="Miki. Gauntlets", lring="Aquasoul Ring", rring="Aquasoul Ring",
                back="Atheling Mantle", waist="Shadow Belt", legs="Miki. Cuisses", feet="Whirlpool Greaves"}
sets.precast.WS['Chant du Cygne'] = {ammo="",
				head="Yaoyotl Helm", neck="Light Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Miki. Breastplate", hands="Miki. Gauntlets", lring="Rajas Ring", rring="Thundersoul Ring",
                back="Atheling Mantle", waist="Wanion Belt",  legs="Miki. Cuisses", feet="Whirlpool Greaves"}
sets.precast.WS['Atonement'] = set_combine(sets.precast.WS, sets.Enmity,{
				neck="Light Gorget",
                body="Phorcys Korazin", 
				waist="Light Belt"})

sets.precast.WS.Acc = {}
sets.precast.WS.Acc['Requiescat'] = {ammo="Aqua Sachet",
				head="Yaoyotl Helm", neck="Shadow Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Miki. Breastplate", hands="Miki. Gauntlets", lring="Aquasoul Ring", rring="Aquasoul Ring",
                back="Vespid Mantle", waist="Shadow Belt",  legs="Miki. Cuisses", feet="Whirlpool Greaves"}

sets.precast.WS.Acc['Chant du Cygne'] = {ammo="Ginsen",
				head="Yaoyotl Helm", neck="Light Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Miki. Breastplate", hands="Miki. Gauntlets", lring="Rajas Ring", rring="Mars's Ring",
                back="Vespid Mantle", waist="Wanion Belt",  legs="Miki. Cuisses", feet="Whirlpool Greaves"}

-- Misc Sets
sets.precast.Fastcast = set_combine(sets.idle.PDT, {
				head="Cizin Helm", lear="Loquac. Earring",
                rring="Prolix Ring",
                })
sets.precast.Utsusemi = set_combine(sets.precast.Fastcast, {neck="Magoraga Beads"})

sets.misc.Waltz = set_combine(sets.precast.JA["Chivalry"],{})
sets.misc.Steps = set_combine(sets.TP.Acc,{})
sets.misc.flourish = {}

elseif player.name == 'Derion' then

elseif player.name == 'Aniyah' then

elseif player.name == 'Firetoplay' then

else

end