-- Firetoplay's THF Gear_sets
-- Created: 4/5/2014
-- Last Modified: 9/1/2014
-- To Do List 
--
--
--
--

if player.name == 'Firetoplay' then
-- includes
	include('include/utility.lua')
	include('include/mappings.lua')
	include('include/equipment.lua')
	-- include('../include/autoexec.lua')
	
-- sets Macros off = 0  on = 1
		automacroset = 1
		if automacroset == 1 then
			if player.sub_job == 'NIN' then
				set_macro_page(5,1)
			elseif player.sub_job == 'WAR' then
				set_macro_page(5,2)
			elseif player.sub_job == 'DNC' then
				set_macro_page(5,3)
			elseif player.sub_job == 'DRK' then 
				set_macro_page(5,4)
			end
		else
			set_macro_page(5,1)
		end
		
-- Auto Sets
-- Standard/idle
sets.idle.PDT = { 
				head="Espial Cap", neck="Twilight Torque", lear="", rear="",
                body="Iuitl Vest", hands="Iuitl Wristbands", lring="", rring="",
                back="Repulse Mantle", waist="", legs="Iuitl Tights", feet="Iuitl Gaiters"}

sets.idle.MDT = { 
				head="Espial Cap", neck="Twilight Torque", lear="", rear="",
                body="Iuitl Vest", hands="Iuitl Wristbands", lring="", rring="",
                back="Repulse Mantle", waist="", legs="Iuitl Tights", feet="Iuitl Gaiters"}

sets.misc.Town = set_combine(sets.idle.PDT, { 
				feet="Fajin Boots"})
				
sets.idle.Standard = set_combine(sets.idle.PDT, {
				lear="Merman's Earring", rear="Merman's Earring", feet="Fajin Boots"})
-- Full Evasion
sets.idle.Evasion = set_combine(sets.idle.PDT,{
			head="Uk'uxkaj Cap", neck="Torero Torque", lear="Musical Earring", rear="Novia Earring",
            body="Iuitl Vest", hands="Iuitl Wristbands", lring="Rajas Ring", rring="Epona's Ring",
            back="Boxer's Mantle", waist="Twilight Belt", legs="Iuitl Tights", feet="Iuitl Gaiters"})

sets.TH = {
			hands="Asn. Armlets +2",
			feet="Raider's Poulaines +2"}

-- Precast	
sets.precast.Recast = set_combine(sets.idle.PDT,{
			head="Athos's Chapeau", neck="Torero Torque", lear="Magnetic Earring", rear="Loquac. Earring",
            body="Iuitl Vest", hands="Iuitl Wristbands", lring="Rajas Ring", rring="Prolix Ring",
            back="Boxer's Mantle", waist="Twilight Belt", legs="Iuitl Tights", feet="Iuitl Gaiters"})
			
-- TP Sets 
sets.TP = {	ranged="Raider's Bmrng.",
			head="Espial Cap", neck="Chivalrous Chain", lear="Brutal Earring", rear="Suppanomimi",
            body="Iuitl Vest", hands="Iuitl Wristbands", lring="Rajas Ring", rring="Epona's Ring",
            back="Atheling Mantle", waist="Twilight Belt", legs="Iuitl Tights", feet="Iuitl Gaiters"}

-- Accuracy TP Set
sets.TP.Acc = {	
			head="Whirlpool Mask", neck="Asperity Necklace", lear="Dudgeon Earring", rear="Heartseeker Earring",
            body="Manibozho Jerkin", hands="Buremte Gloves", lring="Rajas Ring", rring="Epona's Ring",
            back="Atheling Mantle", waist="Hurch'lan Sash", legs="Manibozho Brais", feet="Manibozho Boots"}

-- Alliance Buffed
sets.TP.Buffed = {
			head="Felistris Mask", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
            body="Manibozho Jerkin", hands="Buremte Gloves", lring="Rajas Ring", rring="Epona's Ring",
            back="Atheling Mantle", waist="Windbuffet Belt", legs="Manibozho Brais", feet="Manibozho Boots"}

-- Hybrid Evasion
sets.TP.Hybrid = set_combine(sets.idle.PDT,{
			head="Uk'uxkaj Cap", neck="Torero Torque", lear="Dudgeon Earring", rear="Heartseeker Earring",
            body="Iuitl Vest", hands="Iuitl Wristbands +1", lring="Rajas Ring", rring="Epona's Ring",
            back="Boxer's Mantle", waist="Twilight Belt", legs="Iuitl Tights", feet="Iuitl Gaiters"})

-- RA Sets
sets.precast.Snapshot = {legs="Nahtirah Trousers"}

sets.RA = {}
				
-- JA
sets.precast.JA["Perfect Dodge"] = {hands="Plunderer's Armlets"}
sets.precast.JA["Larceny"] = {}

sets.precast.JA["Steal"] = {head="Plun. Bonnet",hands="Pillager's Armlets",legs="Pillager's Culottes",feet="Pillager's Poulaines"}
sets.precast.JA["Mug"] = {head="Plun. Bonnet"}
sets.precast.JA["Feint"] = {legs="Plun. Culottes"}
sets.precast.JA["Flee"] = {feet="Pillager's Poulaines"}
sets.precast.JA["Hide"] = {body="Pillager's Vest"}
sets.precast.JA["Ambush"] = {body="Plunderer's Vest"}
sets.precast.JA["Assassin's Charge"] = {feet="Plunderer's Poulaines"}
sets.precast.JA["Accomplice"] = {head="Raider's Bonnet +2"}
sets.precast.JA["Collaborator"] = {head="Raider's Bonnet +2"}
sets.precast.JA["Conspirator"] = {body="Raider's Vest +2"}
sets.precast.JA["Bully"] = {}
sets.precast.JA["Despoil"] = {legs="Raider's Culottes +2",feet="Raider's Poulaines +2"}

-- Sneak Attack 
sets.precast.JA["Sneak Attack"] = {
				head="Uk'uxkaj Cap", neck="Love Torque", lear="Dudgeon Earring", rear="Heartseeker Earring",
                body="Manibozho Jerkin", hands="Raid. Armlets +2", lring="Thundersoul Ring", rring="Epona's Ring",
                back="Atheling Mantle", waist="Twilight Belt", legs="Manibozho Brais", feet="Iuitl Gaiters"}
-- Trick Attack
sets.precast.JA["Trick Attack"] = {
				head="Uk'uxkaj Cap", neck="Houyi's Gorget", lear="Dudgeon Earring", rear="Bladeborn earring",
                body="Manibozho Jerkin", hands="Iuitl Wristbands +1", lring="Stormsoul Ring", rring="Stormsoul Ring",
                back="Vespid Mantle", waist="Twilight Belt", legs="Iuitl Tights", feet="Iuitl Gaiters"}

-- Weaponskills
sets.precast.WS = {
			head="Espial Cap", neck="Chivalrous Chain", lear="Brutal Earring", rear="Suppanomimi",
            body="Espial Gambison", hands="Espial Bracers", lring="Rajas Ring", rring="Epona's Ring",
            back="Atheling Mantle", waist="Warwolf Belt", legs="Espial Hose", feet="Espial Socks"}
-- Mercy Stroke
sets.precast.WS["Mercy Stroke"] = {
				head="Pillager's Bonnet", neck="Shadow Gorget", lear="Steelflash Earring", rear="Bladeborn Earring",
                body="Pillager's Vest", hands="Pillager's Armlets", lring="Rajas Ring", rring="Pyrosoul Ring",
                back="Vespid Mantle", waist="Metalsinger Belt", legs="Pillager's Culottes", feet="Pillager's Poulaines"}

sets.precast.WS.SA = {}
sets.precast.WS.SA["Mercy Stroke"] = {
				head="Pillager's Bonnet", neck="Shadow Gorget", lear="Steelflash Earring", rear="Bladeborn Earring",
                body="Pillager's Vest", hands="Raid. Armlets +2", lring="Rajas Ring", rring="Pyrosoul Ring",
                back="Vespid Mantle", waist="Metalsinger Belt", legs="Pillager's Culottes", feet="Pillager's Poulaines"}

sets.precast.WS.TA = {}
sets.precast.WS.TA["Mercy Stroke"] = {
				head="Pillager's Bonnet", neck="Shadow Gorget", lear="Steelflash Earring", rear="Bladeborn Earring",
                body="Pillager's Vest", hands="Pillager's Armlets", lring="Rajas Ring", rring="Pyrosoul Ring",
                back="Vespid Mantle", waist="Metalsinger Belt", legs="Pillager's Culottes", feet="Pillager's Poulaines"}
-- Rudra's Storm
sets.precast.WS["Rudra's Storm"] = {
				head="Pillager's Bonnet", neck="Shadow Gorget", lear="Steelflash Earring", rear="Bladeborn Earring",
                body="Pillager's Vest", hands="Pillager's Armlets", lring="Rajas Ring", rring="Thundersoul Ring",
                back="Vespid Mantle", waist="Metalsinger Belt", legs="Pillager's Culottes", feet="Pillager's Poulaines"}
sets.precast.WS.SA["Rudra's Storm"] = {
				head="Pillager's Bonnet", neck="Shadow Gorget", lear="Steelflash Earring", rear="Bladeborn Earring",
                body="Pillager's Vest", hands="Pillager's Armlets", lring="Rajas Ring", rring="Thundersoul Ring",
                back="Vespid Mantle", waist="Metalsinger Belt", legs="Pillager's Culottes", feet="Pillager's Poulaines"}
sets.precast.WS.TA["Rudra's Storm"] = {
				head="Pillager's Bonnet", neck="Shadow Gorget", lear="Steelflash Earring", rear="Bladeborn Earring",
                body="Pillager's Vest", hands="Pillager's Armlets", lring="Rajas Ring", rring="Thundersoul Ring",
                back="Vespid Mantle", waist="Metalsinger Belt", legs="Pillager's Culottes", feet="Pillager's Poulaines"}

-- Exenterator
sets.precast.WS["Exenterator"] = {
				head="Whirlpool Mask", neck="Justiciar's Torque", lear="Steelflash Earring", rear="Bladeborn Earring",
                body="Pillager's Vest", hands="Pillager's Armlets", lring="Stormsoul Ring", rring="Epona's Ring",
                back="Vespid Mantle", waist="Metalsinger Belt", legs="Nahtirah Trousers", feet="Pillager's Poulaines"}

sets.precast.WS.Acc = {}
sets.precast.WS.Acc["Exenterator"] = {
				head="Whirlpool Mask", neck="Justiciar's Torque", lear="Steelflash Earring", rear="Bladeborn Earring",
                body="Manibozho Jerkin", hands="Pillager's Armlets", lring="Stormsoul Ring", rring="Epona's Ring",
                back="Vespid Mantle", waist="Metalsinger Belt", legs="Nahtirah Trousers", feet="Pillager's Poulaines"}
-- Evisceration
sets.precast.WS["Evisceration"] = {
				head="Pillager's Bonnet", neck="Asperity Necklace", lear="Steelflash Earring", rear="Bladeborn Earring",
                body="Pillager's Vest", hands="Pillager's Armlets", lring="Rajas Ring", rring="Epona's Ring",
                back="Atheling Mantle", waist="Wanion Belt", legs="Pillager's Culottes", feet="Iuitl Gaiters"}

sets.precast.WS.Acc["Evisceration"] = {
				head="Whirlpool Mask", neck="Asperity Necklace", lear="Steelflash Earring", rear="Bladeborn Earring",
                body="Pillager's Vest", hands="Pillager's Armlets", lring="Rajas Ring", rring="Epona's Ring",
                back="Atheling Mantle", waist="Wanion Belt", legs="Pillager's Culottes", feet="Manibozho Boots"}

	
	
-- Midcast Sets

-- Aftercast

-- Misc Sets
sets.precast.Fastcast = set_combine(sets.idle.PDT, {head="Athos's Chapeau", lear="Loquac. Earring", rring="Prolix Ring",})

sets.precast.Utsusemi = set_combine(sets.precast.Fastcast, {neck="Magoraga Beads"})

sets.misc.Waltz = {hands="Buremte Gloves", waist="Chuq'aba Belt"}
sets.misc.Steps = set_combine(sets.TP.ACC)
sets.misc.flourish = {}


elseif player.name == 'Derion' then

elseif player.name == 'Aniyah' then

elseif player.name == 'Firetoplay' then

elseif player.name == 'Fugiwara' then
-- includes
	include('include/utility.lua')
	include('include/mappings.lua')
	include('include/equipment.lua')
	-- include('../include/autoexec.lua')
	
-- sets Macros off = 0  on = 1
		automacroset = 0
		if automacroset == 1 then
			if player.sub_job == 'NIN' then
				set_macro_page(5,1)
			elseif player.sub_job == 'WAR' then
				set_macro_page(5,2)
			elseif player.sub_job == 'DNC' then
				set_macro_page(5,3)
			elseif player.sub_job == 'DRK' then 
				set_macro_page(5,4)
			end
		else
			set_macro_page(5,1)
		end
		
-- Auto Sets
-- Standard/idle
sets.idle.PDT = { 
				head="Iuitl Headgear", neck="Twilight Torque", lear="Brutal Earring", rear="Suppanomimi",
                body="Iuitl Vest", hands="Iuitl Wristbands +1", lring="Dark Ring", rring="Shadow Ring",
                back="Shadow Mantle", waist="Flume Belt", legs="Iuitl Tights", feet="Iuitl Gaiters"}

sets.idle.MDT = { 
				head="Iuitl Headgear", neck="Twilight Torque", lear="Brutal Earring", rear="Suppanomimi",
                body="Iuitl Vest", hands="Iuitl Wristbands +1", lring="Dark Ring", rring="Shadow Ring",
                back="Shadow Mantle", waist="Flume Belt", legs="Iuitl Tights", feet="Iuitl Gaiters"}

sets.misc.Town = set_combine(sets.idle.PDT, {
				feet="Pillager's Poulaines"})
				
sets.idle.Standard = set_combine(sets.idle.PDT, {feet="Pillager's Poulaines"})
-- Full Evasion
sets.idle.Evasion = set_combine(sets.idle.PDT,{
			head="", neck="", lear="", rear="",
            body="", hands="", lring="", rring="",
            back="", waist="", legs="", feet=""})

sets.TH = {hands="Plunderer's Armlets",feet="Raider's Poulaines +2"}

-- Precast	
sets.precast.Recast = set_combine(sets.idle.PDT,{
			head="Athos's Chapeau", neck="Torero Torque", lear="Magnetic Earring", rear="Loquac. Earring",
            body="Iuitl Vest", hands="Iuitl Wristbands +1", lring="Rajas Ring", rring="Prolix Ring",
            back="Boxer's Mantle", waist="Twilight Belt", legs="Iuitl Tights", feet="Iuitl Gaiters"})
			
-- TP Sets 
sets.TP = { ammo="Raider's Bmrng.",
			head="Whirlpool Mask", neck="Asperity Necklace", lear="Brutal Earring", rear="Suppanomimi",
            body="Manibozho Jerkin", hands="Iuitl Wristbands +1", lring="Rajas Ring", rring="Epona's Ring",
            back="Letalis Mantle", waist="Windbuffet Belt", legs="Manibozho Brais", feet="Manibozho Boots"}

-- Accuracy TP Set
sets.TP.Acc = {	
			head="Whirlpool Mask", neck="Asperity Necklace", lear="Dudgeon Earring", rear="Heartseeker Earring",
            body="Manibozho Jerkin", hands="Buremte Gloves", lring="Rajas Ring", rring="Epona's Ring",
            back="Letalis mantle", waist="Windbuffet Belt", legs="Manibozho Brais", feet="Manibozho Boots"}

-- Alliance Buffed
sets.TP.Buffed = {
			head="Whirlpool Mask", neck="Asperity Necklace", lear="Brutal Earring", rear="Suppanomimi",
            body="Manibozho Jerkin", hands="Iuitl Wristbands +1", lring="Rajas Ring", rring="Epona's Ring",
            back="Letalis Mantle", waist="Windbuffet Belt", legs="Manibozho Brais", feet="Manibozho Boots"}

-- Hybrid Evasion
sets.TP.Hybrid = set_combine(sets.TP,{
			head="Felistris Mask", neck="Torero Torque", lear="Brutal Earring", rear="Suppanomimi",
            body="Manibozho Jerkin", hands="Iuitl Wristbands +1", lring="Dark Ring", rring="Shadow Ring",
            back="Boxer's Mantle", waist="Twilight Belt", legs="Iuitl Tights", feet="Manibozho Boots"})

-- RA Sets
sets.precast.Snapshot = {legs="Nahtirah Trousers"}

sets.RA = {}
				
-- JA
sets.precast.JA["Perfect Dodge"] = {hands="Plunderer's Armlets"}
sets.precast.JA["Larceny"] = {}

sets.precast.JA["Steal"] = {head="Plun. Bonnet",hands="Pillager's Armlets",legs="Pillager's Culottes",feet="Pillager's Poulaines"}
sets.precast.JA["Mug"] = {head="Plun. Bonnet"}
sets.precast.JA["Feint"] = {legs="Plun. Culottes"}
sets.precast.JA["Flee"] = {feet="Pillager's Poulaines"}
sets.precast.JA["Hide"] = {body="Pillager's Vest"}
sets.precast.JA["Ambush"] = {body="Plunderer's Vest"}
sets.precast.JA["Assassin's Charge"] = {feet="Plunderer's Poulaines"}
sets.precast.JA["Accomplice"] = {head="Raider's Bonnet +2"}
sets.precast.JA["Collaborator"] = {head="Raider's Bonnet +2"}
sets.precast.JA["Conspirator"] = {body="Raider's Vest +2"}
sets.precast.JA["Bully"] = {}
sets.precast.JA["Despoil"] = {legs="Raider's Culottes +2",feet="Raider's Poulaines +2"}

-- Sneak Attack 
sets.precast.JA["Sneak Attack"] = {
				head="Uk'uxkaj Cap", neck="Love Torque", lear="Dudgeon Earring", rear="Heartseeker Earring",
                body="Manibozho Jerkin", hands="Raid. Armlets +2", lring="Thundersoul Ring", rring="Epona's Ring",
                back="Atheling Mantle", waist="Twilight Belt", legs="Manibozho Brais", feet="Iuitl Gaiters"}
-- Trick Attack
sets.precast.JA["Trick Attack"] = {
				head="Uk'uxkaj Cap", neck="Houyi's Gorget", lear="Dudgeon Earring", rear="Bladeborn earring",
                body="Manibozho Jerkin", hands="Iuitl Wristbands +1", lring="Stormsoul Ring", rring="Stormsoul Ring",
                back="Vespid Mantle", waist="Twilight Belt", legs="Iuitl Tights", feet="Iuitl Gaiters"}

-- Weaponskills
sets.precast.WS = {
				head="Pillager's Bonnet", neck="Asperity Necklace", lear="Steelflash Earring", rear="Bladeborn Earring",
                body="Pillager's Vest", hands="Pillager's Armlets", lring="Rajas Ring", rring="Pyrosoul Ring",
                back="Vespid Mantle", waist="Wanion Belt", legs="Pillager's Culottes", feet="Pillager's Poulaines"}
-- Mercy Stroke
sets.precast.WS["Mercy Stroke"] = {
				head="Pillager's Bonnet", neck="Shadow Gorget", lear="Steelflash Earring", rear="Bladeborn Earring",
                body="Pillager's Vest", hands="Pillager's Armlets", lring="Rajas Ring", rring="Pyrosoul Ring",
                back="Vespid Mantle", waist="Metalsinger Belt", legs="Pillager's Culottes", feet="Pillager's Poulaines"}

sets.precast.WS.SA = {}
sets.precast.WS.SA["Mercy Stroke"] = {
				head="Pillager's Bonnet", neck="Shadow Gorget", lear="Steelflash Earring", rear="Bladeborn Earring",
                body="Pillager's Vest", hands="Raid. Armlets +2", lring="Rajas Ring", rring="Pyrosoul Ring",
                back="Vespid Mantle", waist="Metalsinger Belt", legs="Pillager's Culottes", feet="Pillager's Poulaines"}

sets.precast.WS.TA = {}
sets.precast.WS.TA["Mercy Stroke"] = {
				head="Pillager's Bonnet", neck="Shadow Gorget", lear="Steelflash Earring", rear="Bladeborn Earring",
                body="Pillager's Vest", hands="Pillager's Armlets", lring="Rajas Ring", rring="Pyrosoul Ring",
                back="Vespid Mantle", waist="Metalsinger Belt", legs="Pillager's Culottes", feet="Pillager's Poulaines"}
-- Rudra's Storm
sets.precast.WS["Rudra's Storm"] = {
				head="Pillager's Bonnet", neck="Shadow Gorget", lear="Steelflash Earring", rear="Bladeborn Earring",
                body="Pillager's Vest", hands="Pillager's Armlets", lring="Rajas Ring", rring="Thundersoul Ring",
                back="Vespid Mantle", waist="Metalsinger Belt", legs="Pillager's Culottes", feet="Pillager's Poulaines"}
sets.precast.WS.SA["Rudra's Storm"] = {
				head="Pillager's Bonnet", neck="Shadow Gorget", lear="Steelflash Earring", rear="Bladeborn Earring",
                body="Pillager's Vest", hands="Pillager's Armlets", lring="Rajas Ring", rring="Thundersoul Ring",
                back="Vespid Mantle", waist="Metalsinger Belt", legs="Pillager's Culottes", feet="Pillager's Poulaines"}
sets.precast.WS.TA["Rudra's Storm"] = {
				head="Pillager's Bonnet", neck="Shadow Gorget", lear="Steelflash Earring", rear="Bladeborn Earring",
                body="Pillager's Vest", hands="Pillager's Armlets", lring="Rajas Ring", rring="Thundersoul Ring",
                back="Vespid Mantle", waist="Metalsinger Belt", legs="Pillager's Culottes", feet="Pillager's Poulaines"}

-- Exenterator
sets.precast.WS["Exenterator"] = {
				head="Whirlpool Mask", neck="Justiciar's Torque", lear="Steelflash Earring", rear="Bladeborn Earring",
                body="Pillager's Vest", hands="Pillager's Armlets", lring="Stormsoul Ring", rring="Epona's Ring",
                back="Vespid Mantle", waist="Metalsinger Belt", legs="Nahtirah Trousers", feet="Pillager's Poulaines"}

sets.precast.WS.Acc = {}
sets.precast.WS.Acc["Exenterator"] = {
				head="Whirlpool Mask", neck="Justiciar's Torque", lear="Steelflash Earring", rear="Bladeborn Earring",
                body="Manibozho Jerkin", hands="Pillager's Armlets", lring="Stormsoul Ring", rring="Epona's Ring",
                back="Vespid Mantle", waist="Metalsinger Belt", legs="Nahtirah Trousers", feet="Pillager's Poulaines"}
-- Evisceration
sets.precast.WS["Evisceration"] = {
				head="Pillager's Bonnet", neck="Asperity Necklace", lear="Steelflash Earring", rear="Bladeborn Earring",
                body="Pillager's Vest", hands="Pillager's Armlets", lring="Rajas Ring", rring="Epona's Ring",
                back="Atheling Mantle", waist="Wanion Belt", legs="Pillager's Culottes", feet="Iuitl Gaiters"}

sets.precast.WS.Acc["Evisceration"] = {
				head="Whirlpool Mask", neck="Asperity Necklace", lear="Steelflash Earring", rear="Bladeborn Earring",
                body="Pillager's Vest", hands="Pillager's Armlets", lring="Rajas Ring", rring="Epona's Ring",
                back="Atheling Mantle", waist="Wanion Belt", legs="Pillager's Culottes", feet="Manibozho Boots"}

	
	
-- Midcast Sets

-- Aftercast

-- Misc Sets
sets.precast.Fastcast = set_combine(sets.idle.PDT, {head="Athos's Chapeau", lear="Loquac. Earring", rring="Prolix Ring",})

sets.precast.Utsusemi = set_combine(sets.precast.Fastcast, {neck="Magoraga Beads"})

sets.misc.Waltz = {hands="Buremte Gloves", waist="Chuq'aba Belt"}
sets.misc.Steps = set_combine(sets.TP.ACC)
sets.misc.flourish = {}

end