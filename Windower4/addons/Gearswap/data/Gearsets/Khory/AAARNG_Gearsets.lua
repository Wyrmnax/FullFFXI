-- RNG Gear_sets
-- Created: 3/10/2014
-- Last Updated: 7/22/2014
-- To Do:
--
--
--
--

if player.name == 'Feary' then
-- includes
	include('include/utility.lua')
	include('include/mappings.lua')
	include('include/equipment.lua')
	
-- Auto macro sets off = 0  on = 1
		automacroset = 1
		if automacroset == 1 then
			if ranged_Bow:contains(player.equipment.range) then
				if player.sub_job == 'NIN' then
					set_macro_page(13,1)
				elseif player.sub_job == 'SAM' then
					set_macro_page(13,2)
				elseif player.sub_job == 'WAR' then
					set_macro_page(13,3)
				elseif player.sub_job == 'DRG' then 
					set_macro_page(13,4)
				end
			elseif ranged_Gun:contains(player.equipment.range) then
				if player.sub_job == 'NIN' then
					set_macro_page(13,5)
				elseif player.sub_job == 'SAM' then
					set_macro_page(13,6)
				elseif player.sub_job == 'WAR' then
					set_macro_page(13,7)
				elseif player.sub_job == 'DRG' then 
					set_macro_page(13,8)
				end
			end			
		else
			set_macro_page(13,1)
		end
		
-- Auto Sets
-- Standard/idle
sets.idle.PDT = { 
				head="Arcadian Beret +1", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
                body="Iuitl Vest", hands="Iuitl Wristbands +1", lring=Aug.Darkring1, rring="Defending Ring",
                back="Repulse Mantle", waist="Flume Belt", legs="Iuitl Tights", feet="Iuitl Gaiters"}

sets.idle.MDT = { 
				head="Arcadian Beret +1", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
                body="Iuitl Vest", hands="Iuitl Wristbands +1", lring=Aug.Darkring1, rring="Defending Ring",
                back="Engulfer Cape", waist="Flume Belt", legs="Nahtirah Trousers", feet="Iuitl Gaiters"}

sets.misc.Town = set_combine(sets.idle.PDT, 
				head="Arcadian Beret +1",
				body="Arcadian Jerkin +1", hands="Arcadian Bracers +1",
				legs="Arcadian Braccae +1", feet="Fajin Boots"})
				
sets.idle.Standard = set_combine(sets.idle.PDT, {
				lear="Merman's Earring", rear="Merman's Earring", feet="Fajin Boots"})
-- Melee TP 
sets.TP = { 
				head="Uk'uxkaj Cap", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Thaumas Coat", hands="Manibozho Gloves", lring="Rajas Ring", rring="Epona's Ring",
                back="Atheling Mantle", waist="Windbuffet Belt", legs="Manibozho Brais", feet="Manibozho Boots"}
-- Melee Accuracy TP
sets.TP.Acc = {
				head="Whirlpool Mask", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Manibozho Jerkin", hands="Manibozho Gloves", lring="Rajas Ring", rring="Epona's Ring",
                back="Atheling Mantle", waist="Hurch'lan Sash",  legs="Manibozho Brais", feet="Manibozho Boots"}

-- RA Sets
sets.precast.Snapshot = {head="Arcadian Beret +1",
                body="Arc. Jerkin +1", hands="Iuitl Wristbands +1",
                waist="Impulse Belt", legs="Nahtirah Trousers", feet="Arcadian Socks"}
sets.precast.Snapshot.Overkill = set_combine(sets.precast.Snapshot,{head="Orion Beret +1",
                body="Sylvan Caban +2", hands="Arc. Bracers +1",
                waist="Impulse Belt", legs="Nahtirah Trousers", feet="Arcadian Socks"})

-- Bow
sets.RA = { 
			head="Arcadian Beret +1", neck="Ocachi Gorget", lear="Clearview Earring", rear="Volley Earring",
            body="Orion Jerkin +1", hands="Orion Bracers +1", lring="Rajas Ring", rring="Arewe Ring +1",
            back="Sylvan Chlamys", waist="Scout's Belt", legs="Nahtirah Trousers", feet="Orion Socks +1"}
				
sets.RA.Acc = {
			head="Arcadian Beret +1", neck="Ocachi Gorget", lear="Clearview Earring", rear="Volley Earring",
            body="Orion Jerkin +1", hands="Orion Bracers +1", lring="Arewe Ring +1", rring="Arewe Ring +1",
			back="Kayapa Cape", waist="Scout's Belt", legs="Nahtirah Trousers", feet="Orion Socks +1"}
				
-- Gun
sets.RA.Gun = { 
			head="Arcadian Beret +1", neck="Ocachi Gorget", lear="Clearview Earring", rear="Volley Earring",
            body="Orion Jerkin +1", hands="Orion Bracers +1", lring="Rajas Ring", rring="Arewe Ring +1",
            back="Sylvan Chlamys", waist="Scout's Belt", legs="Nahtirah Trousers", feet="Orion Socks +1"}
				
sets.RA.Acc.Gun = { 
			head="Arcadian Beret +1", neck="Ocachi Gorget", lear="Clearview Earring", rear="Volley Earring",
            body="Orion Jerkin +1", hands="Orion Bracers +1", lring="Arewe Ring +1", rring="Arewe Ring +1",
            back="Kayapa Cape", waist="Scout's Belt", legs="Nahtirah Trousers", feet="Orion Socks +1"}

-- JA
-- 	
sets.precast.JA.Acc = {}
sets.precast.JA["Barrage"] =  {
				head="Arcadian Beret +1", neck="Ocachi Gorget", lear="Clearview Earring", rear="Volley Earring",
                body="Orion Jerkin +1", hands="Orion Bracers +1", lring="Rajas Ring", rring="Arewe Ring +1",
                back="Sylvan's Chlamys", waist="Scout's Belt", legs="Nahtirah Trousers", feet="Orion Socks +1"}

sets.precast.JA.Acc["Barrage"] =  {
				head="Arcadian Beret +1", neck="Ocachi Gorget", lear="Clearview Earring", rear="Volley Earring",
                body="Orion Jerkin +1", hands="Orion Bracers +1", lring="Arewe Ring +1", rring="Arewe Ring +1",
                back="Sylvan's Chlamys", waist="Scout's Belt", legs="Nahtirah Trousers", feet="Orion Socks +1"}
-- Eagle Eye Shot
sets.precast.JA["Eagle Eye Shot"] = set_combine(sets.RA, {legs="Arcadian Braccae +1"})

sets.precast.JA.Acc["Eagle Eye Shot"] = set_combine(sets.RA.Acc, {legs="Arcadian Braccae +1"})

-- Overkill
sets.precast.JA["Overkill"] = {
				head="Arcadian Beret +1", neck="Ocachi Gorget", lear="Clearview Earring", rear="Volley Earring",
                body="Orion Jerkin +1", hands="Orion Bracers +1", lring="Rajas Ring", rring="Arewe Ring +1",
                back="Sylvan's Chlamys", waist="Scout's Belt", legs="Nahtirah Trousers", feet="Orion Socks +1"}

sets.precast.JA.Acc["Overkill"] = set_combine(sets.RA.Acc, {
				head="Arcadian Beret +1", neck="Ocachi Gorget", lear="Clearview Earring", rear="Volley Earring",
                body="Orion Jerkin +1", hands="Orion Bracers +1", lring="Areew Ring +1", rring="Arewe Ring +1",
                back="Sylvan's Chlamys", waist="Scout's Belt", legs="Nahtirah Trousers", feet="Orion Socks +1"})

sets.precast.JA["Shadowbind"] = {hands="Orion Bracers +1"}
sets.precast.JA["Sharpshot"] = {legs="Orion Braccae +1"}
sets.precast.JA["Double Shot"] = {body="Sylvan Gapette +2"}
sets.precast.JA["Velocity Shot"] = {legs="Sylvan Caban +2"}
sets.precast.JA["Camouflage"] = {head="Orion Jerkin +1"}
sets.precast.JA["Scavenge"] = {feet="Orion Socks +1"}
sets.precast.JA["Bounty Shot"] = {hands="Syl. Glvltte. +2"}
sets.precast.JA["Unlimited Shot"] = {feet="Sylvan Bottln. +2"}
sets.precast.JA["Flashy Shot"] = {hands="Arcadian Bracers"}
sets.precast.JA["Stealth Shot"] = {feet="Arcadian Socks"}

-- Weaponskills
-- Melee
sets.precast.WS = {}
-- Range
sets.precast.RAWS = {
				head="Uk'uxkaj Cap", neck="Ocachi Gorget", lear="Clearview Earring", rear="Flame Pearl",
                body="Orion Jerkin +1", hands="Arc. Bracers +1", lring="Rajas Ring", rring="Pyrosoul Ring",
                back="Buquwik Cape", waist="Scout's Belt", legs="Nahtirah Trousers", feet="Orion Socks +1"}
-- Bow WS
sets.precast.RAWS['Jishnu\'s Radiance'] = {
				head="Uk'uxkaj Cap", neck="Light Gorget", lear="Clearview Earring", rear="Flame Pearl",
                body="Orion Jerkin +1", hands="Arc. Bracers +1", lring="Rajas Ring", rring="Pyrosoul Ring",
                back="Buquwik Cape", waist="Light Belt", legs="Nahtirah Trousers", feet="Orion Socks +1"}
sets.precast.RAWS['Namas Arrow'] = {
				head="Orion Beret +1", neck="Light Gorget", lear="Clearview Earring", rear="Flame Pearl",
                body="Orion Jerkin +1", hands="Arc. Bracers +1", lring="Rajas Ring", rring="Pyrosoul Ring",
				back="Buquwik Cape", waist="Light Belt", legs="Nahtirah Trousers", feet="Orion Socks +1"}

-- Gun/Crossbow WS
sets.precast.RAWS['Last Stand'] = {
				head="Uk'uxkaj Cap", neck="Light Gorget", lear="Clearview Earring", rear="Flame Pearl",
                body="Orion Jerkin +1", hands="Orion Bracers +1", lring="Rajas Ring", rring="Pyrosoul Ring",
                back="Buquwik Cape", waist="Scout's Belt", legs="Nahtirah Trousers", feet="Orion Socks +1"}

sets.precast.RAWS['Coronach'] = {
				head="Uk'uxkaj Cap", neck="Light Gorget", lear="Clearview Earring", rear="Flame Pearl",
                body="Orion Jerkin +1", hands="Orion Bracers +1", lring="Rajas Ring", rring="Pyrosoul Ring",
                back="Buquwik Cape", waist="Scout's Belt", legs="Nahtirah Trousers", feet="Orion Socks +1"}

sets.precast.RAWS['Wildfire'] = {
				head="Uk'uxkaj Cap", neck="Stoicheion Medal", lear="Novio Earring", rear="Friomisi Earring",
                body="Orion Jerkin +1", hands="Orion Bracers +1", lring="Stormsoul Ring", rring="Stormsoul Ring",
                back="Toro Cape", waist="Aquiline Belt", legs="Arcadian Braccae +1", feet="Arcadian Socks"}

sets.precast.RAWS['Trueflight'] = {
				head="Uk'uxkaj Cap", neck="Stoicheion Medal", lear="Novio Earring", rear="Friomisi Earring",
                body="Orion Jerkin +1", hands="Orion Bracers +1", lring="Stormsoul Ring", rring="Stormsoul Ring",
                back="Toro Cape", waist="Aquiline Belt", legs="Arcadian Braccae +1", feet="Arcadian Socks"}
					
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

end