-- Firetoplay's BLU Gearsets
-- Created: 4/26/2014
-- Last Updated: 6/13/2014
-- To Do List:
--
--

if player.name == 'Firetoplay' then
		-- includes
		include('include/mappings.lua')
		include('include/equipment.lua')
		include('include/utility.lua')

		-- sets Macros off = 0  on = 1
		automacroset = 1
		if automacroset == 1 then
			if player.sub_job == 'NIN' then
				set_macro_page(8,1)
			elseif player.sub_job == 'WAR' then
				set_macro_page(8,2)
			elseif player.sub_job == 'RDM' then
				set_macro_page(8,3)
			elseif player.sub_job == 'DNC' then
				set_macro_page(8,4)
			elseif player.sub_job == 'NIN' then 
				set_macro_page(8,5)
			end
		else
			set_macro_page(8,3)
		end

		-- Auto Sets
		-- Standard/idle
		sets.idle.PDT = {
				head="Hagondes Hat", neck="Twilight Torque",
                body="Hagondes Coat", hands="Hagondes Cuffs", lring="", rring="",
                back="Umbra Cape", waist="Flume belt", legs="Hagondes Pants", feet="Hagondes Sabots"}
		sets.idle.MDT = {
				head="Hagondes Hat", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
                body="Hagondes Coat", hands="Hagondes Cuffs", lring="", rring="",
                back="Engulfer Cape", waist="Flume Belt",  legs="Hagondes Pants", feet="Hagondes Sabots"}			
		sets.Resting = set_combine(sets.idle.PDT, {
				head="", neck="Eidolon Pendant", lear="Magnetic Earring", rear="Moonshade Earring",
                body="Hagondes Coat", hands="Serpentes Cuffs", lring="", rring="",
                back="Umbra Cape", waist="Fucho-no-obi", feet="Serpentes Boots"})
		sets.idle.Standard = set_combine(sets.idle.PDT,{
				lear="Merman's Earring", rear="Moonshade Earring",legs="Blood Cuisses"})
		sets.misc.Town = set_combine(sets.idle.PDT, {body="Assim. Jubbah", legs="Blood Cuisses"})
		
		
		-- Melee Sets
		sets.TP = set_combine(sets.idle.PDT, {ammo="Vanir Battery",
                head="Whirlpool Mask", neck="Asperity Necklace", lear="Dudgeon Earring", rear="Heartseeker Earring",
                body="Thaumas Coat", hands="Luh. Bazubands", lring="Rajas Ring", rring="Epona's Ring",
                back="Atheling Mantle", waist="Windbuffet Belt", legs="Manibozho Brais", feet="Manibozho Boots"})
		-- Accuracy
		sets.TP.Acc = set_combine(sets.TP, {ammo="Honed Tathlum",
                hands="Buremte Gloves",
                back="Atheling Mantle", waist="Hurch'lan Belt", legs="Manibozho Brais", feet="Assim. Charuqs"})
		-- Allianced Buffs - Haste + March x2 
		sets.TP.Buffed = set_combine(sets.TP, {ammo="Vanir Battery",
				lear="Dudgeon Earring", rear="Heartseeker Earring",
                waist="Celt Belt"})
		-- Evasion
		sets.TP.Hybrid = set_combine(sets.idle.PDT, {
                hands="Buremte Gloves",
                back="Boxer Mantle", feet="Assim. Charuqs"})
		
		-- JA
		sets.precast.JA["Azure Lore"] = {hands="Luhlaza Bazubands"}
		sets.precast.JA["Unbridled Wisdom"] = {}
		
		sets.precast.JA["Unbridled Learning"] = {}
		sets.precast.JA["Chain Affinity"] = {head="Mavi Kavuk +2", feet="Assimilator's Charuqs"}
		sets.precast.JA["Burst Affinity"] = {legs="Assimilator's Shalwar", feet="Mavi Basmak +2"}
		sets.precast.JA["Efflux"] = {legs="Mavi Tayt +2"}
		sets.precast.JA["Diffusion"] = {feet="Luhlaza Charuqs"}
		sets.precast.JA["Convergence"] = {head="Luhlaza Keffiyeh"}
		sets.precast.JA["Enchainment"] = {body="Luhlaza Jubbah"}
		
		-- Precast
		-- Magic
		sets.precast.Fastcast = {ammo="Impatiens",
				head="Haruspex Hat", neck="Orunmila's Torque", lear="Loquac. Earring",
                body="Luhlaza Jubbah", hands="Thaumas Gloves", rring="Prolix Ring",
                back="Swith Cape", waist="Witful Belt", legs="Orvail Pants +1", feet="Chelona Boots"}
		sets.precast.BlueMagic = set_combine(sets.precast.Fastcast,{body="Mavi Mintan +2"})
		sets.precast.Cure = set_combine(sets.precast.Fastcast, {back="Pahtli Cape"})
		
		-- Midcast
		sets.midcast.Recast = set_combine(sets.idle.PDT, {waist="Witful Belt"})
		sets.midcast.ConserveMP = {}
		
		-- Blue Magic
		-- Skill
		sets.midcast.BlueMagic = set_combine(sets.TP,{ammo="Mavi Tathlum",
                head="Luhlaza Keffiyeh",
                body="Assimilator's Jubbah", hands="Fea's Cuffs",
                back="Cornflower Cape", legs="Mavi Tayt +2", feet="Luhlaza Charuqs"})
		sets.idle.BlueMagic = {}
		sets.idle.BlueMagic.Learn = set_combine(sets.midcast.BlueMagic,{hands="Assim. Bazu.", back="Atheling Mantle"})
		-- Recast
		sets.midcast.BlueMagic.Recast = set_combine(sets.midcast.Recast)
		-- STR
		sets.midcast.BlueMagic.STR = set_combine(sets.midcast.BlueMagic, {
                head="Uk'uxkaj Cap", neck="Tjukurrpa Medal", lear="Flame Pearl", rear="Flame Pearl",
                body="Assimilator's Jubbah", hands="Luhlaza Bazubands", lring="Rajas Ring", rring="Pyrosoul Ring",
                back="Cornflower Cape", waist="Wanion Belt", legs="Manibozho Brais", feet="Assim. Charuqs"})
		-- Accuracy - I.E Heavy Strike
		sets.midcast.BlueMagic.STRAcc = set_combine(sets.midcast.BlueMagic, {ammo="Honed Tathlum",
                head="Whirlpool Mask", neck="Eddy Necklace", lear="Flame Pearl", rear="Steelflash Earring",
                Body="Assimilator's Jubbah", hands="Buremte Gloves", lring="Rajas Ring", rring="Pyrosoul Ring",
                Back="Cornflower Cape", waist="Wanion Belt", legs="Manibozho Brais",feet="Assim. Charuqs"})
		-- VIT
		sets.midcast.BlueMagic.VIT = set_combine(sets.midcast.BlueMagic, {
                head="Whirlpool Mask", neck="Tjukurrpa Medal", lear="Vulcan's Pearl", rear="Vulcan's Pearl",
                body="Luhlaza Jubbah", hands="Luhlaza Bazubands", lring="Rajas Ring", rring="Pyrosoul Ring",
                back="Cornflower Cape", waist="Chuq'aba Belt", legs="Nahtirah Trousers", feet="Assim. Charuqs"})
		-- AGI
		sets.midcast.BlueMagic.AGI = set_combine(sets.midcast.BlueMagic, {
                head="Uk'uxkaj Cap", neck="Houyi's Gorget", lear="Flame Pearl", rear="Flame Pearl",
				body="Assimilator's Jubbah", hands="Iuitl Wristbands +1", lring="Stormsoul Ring", rring="Stormsoul Ring",
				back="Cornflower Cape", legs="Nahtirah Trousers", feet="Assim. Charuqs"})
		-- MND
		sets.midcast.BlueMagic.MND = set_combine(sets.midcast.BlueMagic, {ammo="Aqua Sachet",
                head="Uk'uxkaj Cap", neck="Phalaina Locket", lear="Psystorm Earring", rear="Lifestorm Earring",
				body="Hagondes Coat", hands="Hagondes Cuffs", lring="Aquasoul ring", rring="Aquasoul Ring",
                back="Swith Cape", waist="Cascade Belt", legs="Hagondes Pants", feet="Hagondes Pants"})
		-- Cure Pot
		sets.midcast.BlueMagic.CurePot = set_combine(sets.midcast.BlueMagic.MND, {
                neck="Phalaina Locket",
                hands="Buremte Gloves", lring="Kunaji Ring",
                back="Oretania's Cape", waist="Chuq'aba Belt",})
		-- INT
		sets.midcast.BlueMagic.Nuke = set_combine(sets.midcast.BlueMagic, {
                head="Hagondes Hat", neck="Eddy Necklace", lear="Novio Earring", rear="Friomisi Earring",
                body="Hagondes Coat", hands="Hagondes Cuffs", lring="Icesoul Ring", rring="Icesoul Ring",
                back="Toro Cape", waist="Wanion Belt", legs="Hagondes Pants", feet="Hagondes Sabots"})
		-- Macc 
		sets.midcast.BlueMagic.Macc = set_combine(sets.midcast.BlueMagic, {
                head="Mirage Keffiyeh", neck="Eddy Necklace", lear="Psystorm Earring", rear="Lifestorm Earring",
                body="Assimilator's Jubbah", hands="Hagondes Cuffs", lring="Sangoma Ring", rring="Perception Ring",
                back="Cornflower Cape", waist="Ovate Rope", legs="Mavi Tayt +2", feet="Iuitl Gaiters"})	
		-- Weaponskill
		sets.precast.WS = set_combine(sets.TP, {ammo="Honed Tahtlum",
				head="Uk'uxkaj Cap", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Assim. Jubbah", hands="Manibozho Gloves", lring="Rajas Ring", rring="Pyrosoul Ring",
                back="Atheling Mantle", waist="Wanion Belt", legs="Manibozho Brais", feet="Assim. Charuqs"})
		sets.precast.WS.Acc = set_combine(sets.TP, {ammo="Honed Tathlum",
				head="Whirlpool Mask", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Assim. Jubbah", hands="Manibozho Gloves", lring="Rajas Ring", rring="Pyrosoul Ring",
                back="Atheling Mantle", waist="Wanion Belt", legs="Manibozho Brais", feet="Assim. Charuqs"})
		sets.precast.WS['Chant du Cygne'] = {ammo="Jukukik Feather",
                head="Uk'uxkaj Cap", neck="Light Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Luhlaza Jubbah", hands="Luh. Bazubands", lring="Rajas Ring", rring="Epona's Ring",
                back="Atheling Mantle", waist="Wanion Belt", legs="Manibozho Brais", feet="Manibozho Boots"}
		sets.precast.WS.Acc['Chant du Cygne'] = {ammo="Jukukik Feather",
                head="Uk'uxkaj Cap", neck="Light Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Luhlaza Jubbah", hands="Assim. Bazu.", lring="Rajas Ring", rring="Epona's Ring",
                back="Atheling Mantle", waist="Wanion Belt", legs="Manibozho Brais", feet="Manibozho Boots"}
		sets.precast.WS['Requiescat'] = {ammo="Aqua Sachet",
                head="Whirlpool Mask", neck="Shadow Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Assim. Jubbah", hands="Buremte Gloves", lring="Aquasoul Ring", rring="Epona's Ring",
                back="Atheling Mantle", waist="Shadow Belt", legs="Manibozho Brais", feet="Assim. Charuqs"}
		sets.precast.WS.Acc['Requiescat'] = {ammo="Aqua Sachet",
                head="Whirlpool Mask", neck="Shadow Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Assim. Jubbah", hands="Buremte Gloves", lring="Aquasoul Ring", rring="Epona's Ring",
                back="Atheling Mantle", waist="Shadow Belt", legs="Manibozho Brais", feet="Assim. Charuqs"}	
		sets.precast.WS['Sanguine Blade'] = {ammo="Aqua Sachet",
                head="Hagondes Hat", neck="Eddy Necklace", lear="Novio Earring", rear="Friomisi Earring",
                body="Hagondes Coat", hands="Hagondes Cuffs", lring="Icesoul Ring", rring="Icesoul Ring",
                back="Toro Cape", waist="Wanion Belt", legs="Hagondes Pants", feet="Hagondes Sabots"}

		-- Misc
		sets.misc.Waltz = {}
		sets.misc.Steps = {}
		sets.misc.flourish = {}
end