-- Pup Gear_sets
-- Created:
-- Last Updated:
-- To Do
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
	
-- sets Macros off = 0  on = 1
		automacroset = 1
		if automacroset == 1 then
			if player.sub_job == 'war' then
				set_macro_page(19,1)
			elseif player.sub_job == 'nin' then
				set_macro_page(19,2)
			elseif player.sub_job == 'dnc' then
				set_macro_page(19,3)
			elseif player.sub_job == 'sch' then 
				set_macro_page(19,4)
			elseif player.sub_job == 'whm' then 
				set_macro_page(19,5)
			end
		else
			set_macro_page(19,1)
		end
	
	animator = {range="Em. Animator"}
	oil = {ammo="Automat. Oil +3"}
	
-- Auto Sets
-- Standard/idle
sets.idle.PDT = { 
				head="Otronif Mask", neck="Twilight Torque",
                body="Otronif Harness", hands="Otronif Gloves +1", lring=Aug.Darkring1, rring="Defending Ring",
                back="Repulse Mantle", waist="Hurch'lan Sash", legs="Otronif Brais +1", feet="Otronif Boots"}

sets.idle.MDT = { 
				head="Whirlpool Mask", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
                body="Manibozho Jerkin", hands="Otronif Gloves +1", lring=Aug.Darkring1, rring="Defending Ring",
                back="Engulfer Cape", waist="", legs="Otronif Brais +1", feet="Otronif Boots"}

sets.idle.Regen = set_combine(sets.idle.PDT, {head="Pantin Taj"})

sets.idle.Evasion = {
				head="Uk'uxkaj Cap", neck="Torero Torque", lear="Musical earring", rear="Novia Earring",
                body="Manibozho Jerkin", hands="Otronif Gloves +1", lring=Aug.Darkring1, rring="Defending Ring",
                back="Boxer's Mantle", waist="Scouter's Rope",  legs="Otronif Brais +1", feet="Manibozho Boots"}

sets.misc.Town = set_combine(animator, oil, sets.idle.PDT, {
				feet="Hermes' Sandals"})
				
sets.idle.Standard = set_combine(animator, oil, sets.idle.PDT, {
				lear="Merman's Earring", rear="Merman's Earring", feet="Hermes' Sandals"})

-- Master TP 
-- TP 
sets.TP = set_combine(animator, oil, { 
				head="Uk'uxkaj Cap", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Thaumas Coat", hands="Otronif Gloves +1", lring="Rajas Ring", rring="Epona's Ring",
                back="Buquwik Cape", waist="Windbuffet Belt", legs="Otronif Brais +1", feet="Manibozho Boots"})
-- Accuracy TP
sets.TP.MidAcc =  set_combine(animator, oil, sets.TP,{
				head="Uk'uxkaj Cap", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Thaumas Coat", hands="Otronif Gloves +1", lring="Rajas Ring", rring="Epona's Ring",
                back="Buquwik Cape", waist="Hurch'lan Sash", legs="Manibozho Brais", feet="Manibozho Boots"})
-- High Accuracy TP
sets.TP.HighAcc = set_combine(animator, oil, sets.TP,{
				head="Whirlpool Mask", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Thaumas Coat", hands="Otronif Gloves +1", lring="Rajas Ring", rring="Epona's Ring",
                back="Buquwik Cape", waist="Hurch'lan Sash", legs="Manibozho Brais", feet="Manibozho Boots"})

-- Hybrid PDT/TP
sets.TP.Hybrid = set_combine(animator, oil, sets.TP, sets.idle.PDT)
				
-- Pet TP 
sets.TP.Pet = set_combine(animator,sets.TP,{ 
				head="Uk'uxkaj Cap", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Thaumas Coat", hands="Regimen Mittens", lring="Rajas Ring", rring="Epona's Ring",
                back="Buquwik Cape", waist="Hurch'lan Sash", legs="Manibozho Brais", feet="Manibozho Boots"})
sets.TP.Pet.Idle = {}
sets.TP.Pet.Tank = set_combine(animator,sets.TP.Pet,{ 
				head="Uk'uxkaj Cap", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Thaumas Coat", hands="Regimen Mittens", lring="Rajas Ring", rring="Epona's Ring",
                back="Buquwik Cape", waist="Hurch'lan Sash", legs="Manibozho Brais", feet="Manibozho Boots"})
sets.TP.Pet.Range = set_combine(animator,sets.TP.Pet,{ 
				head="Uk'uxkaj Cap", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Thaumas Coat", hands="Regimen Mittens", lring="Rajas Ring", rring="Epona's Ring",
                back="Buquwik Cape", waist="Hurch'lan Sash", legs="Manibozho Brais", feet="Manibozho Boots"})
sets.TP.Pet.Mage = set_combine(animator,sets.TP.Pet,{ 
				head="Uk'uxkaj Cap", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Thaumas Coat", hands="Regimen Mittens", lring="Rajas Ring", rring="Epona's Ring",
                back="Buquwik Cape", waist="Hurch'lan Sash", legs="Manibozho Brais", feet="Manibozho Boots"})

-- Pet 
sets.pet = {}
-- Weaponsskill
sets.pet.RA = {}
sets.pet.Attack = {hands="Cirque Guanti +2"}
sets.pet.MAB = {
		head="Pantin Taj",
		legs="Pantin Churidars",feet="Pantin Babouches"}
sets.pet.Cure = {legs="Pup. Churidars"}

-- JA
sets.precast.JA["Overdrive"] = {body="Pantin Tobe +2"}
sets.precast.JA["Heady Artifice"] = {}

sets.precast.JA["Activate"] = {}
sets.precast.JA["Deus Ex Automata"] = {}

sets.precast.JA["Fine-Tuning"] = {hands="Pantin Dastanas +2"}
sets.precast.JA["Optimization"] = {head="Pantin Taj +2"}

sets.precast.JA["Ventriloquy"] = {legs="Pantin Churidars +2"}
sets.precast.JA["Role Reversal"] = {feet="Pantin Babouches +2"}
sets.precast.JA["Tactical Switch"] = {feet="Cirque Scarpe +2"}
sets.precast.JA["Cooldown"] = {}

sets.precast.JA["Repair"] = set_combine(animator,{ammo="Automaton Oil+3",hands="Pup. Babouches"})
sets.precast.JA["Maintenance"] = set_combine(animator,{ammo="Automaton Oil+3"})
-- Maneuvers 
sets.precast.Maneuvers = set_combine(sets.idle.PDT,Animator,{
		neck="Bfn. Collar +1",
		body="Cirque Farsetto +2", hands="Pup. Dastanas",
		back="Dispersal Mantle"})

-- Weaponskills
		
sets.precast.WS = {ammo="Honed Tathlum",
				head="Uk'uxkaj Cap", neck="Justiciar's Torque", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Manibozho Jerkin", hands="Manibozho Gloves", lring="Rajas Ring", rring="Pyrosoul Ring",
                back="Buquwik Cape", waist="Anguinus Belt",  legs="Manibozho Brais", feet="Manibozho Boots"}

sets.precast.WS['Stringing Pummel'] = set_combine(sets.precast.WS, {})

sets.precast.WS['Victory Smite'] = { ammo="Honed Tathlum",
				head="Uk'uxkaj Cap", neck="Light Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Manibozho Jerkin", hands="Manibozho Gloves", lring="Rajas Ring", rring="Pyrosoul Ring",
                back="Buquwik Cape", waist="Wanion Belt",  legs="Manibozho Brais", feet="Manibozho Boots"}

sets.precast.WS['Shijin Spiral'] = set_combine(sets.precast.WS, {ammo="Potestas Bomblet",
				head="Uk'uxkaj Cap", neck="Justiciar's Torque", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Manibozho Jerkin", hands="Otronif Gloves +1", lring="Thundersoul Ring", rring="Epona's Ring",
                back="Buquwik Cape", waist="Wanion Belt",  legs="Manibozho Brais", feet="Manibozho Boots"})

sets.precast.WS.MidAcc = {}
sets.precast.WS.HighAcc = {}
sets.precast.WS.MidAcc['Shijin Spiral'] = set_combine(sets.precast.WS['Shijin Spiral'], {
				head="Uk'uxkaj Cap", neck="Justiciar's Torque", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Manibozho Jerkin", hands="Otronif Gloves +1", lring="Thundersoul Ring", rring="Epona's Ring",
                back="Buquwik Cape", waist="Anguinus Belt", legs="Manibozho Brais", feet="Manibozho Boots"})
sets.precast.WS.HighAcc['Shijin Spiral'] = set_combine(sets.precast.WS['Shijin Spiral'], {ammo="Potestas Bomblet",
				head="Whirlpool Mask", neck="Light Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Manibozho Jerkin", hands="Otronif Gloves +1", lring="Mars's Ring", rring="Epona's Ring",
                back="Buquwik Cape", waist="Anguinus Belt",  legs="Manibozho Brais", feet="Manibozho Boots"})

sets.precast.WS["Ascetic's Fury"] = set_combine(sets.precast.WS, {
				head="Uk'uxkaj Cap", neck="Light Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Manibozho Jerkin", hands="Manibozho Gloves", lring="Rajas Ring", rring="Pyrosoul Ring",
                back="Buquwik Cape", waist="Wanion Belt",  legs="Manibozho Brais", feet="Manibozho Boots"})

sets.precast.WS["Asuran Fists"] = set_combine(sets.precast.WS, {neck="Shadow Gorget", waist="Anguinus Belt"})

-- Misc Sets
sets.precast.Fastcast = set_combine(sets.idle.PDT, {})
sets.midcast.Recast = set_combine(sets.idle.PDT, {})
sets.precast.Utsusemi = set_combine(sets.precast.Fastcast,{})

sets.misc.Waltz = {}
sets.misc.Steps = set_combine(sets.TP.MidAcc,{})
sets.misc.flourish = {}


elseif player.name == 'Derion' then

elseif player.name == 'Aniyah' then

elseif player.name == 'Firetoplay' then

end