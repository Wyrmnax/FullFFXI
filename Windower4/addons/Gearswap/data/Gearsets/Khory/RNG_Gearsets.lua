-- RNG Gear_sets
-- Created: 3/10/2014
-- Last Updated: 7/22/2014
-- To Do:
--
--
--
--

if player.name == 'Khory' then
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
	main={ name="Malevolence", augments={'INT+9','Mag. Acc.+10','"Mag.Atk.Bns."+9','"Fast Cast"+4',}},
    sub={ name="Malevolence", augments={'INT+10','Mag. Acc.+10','"Mag.Atk.Bns."+10','"Fast Cast"+5',}},
    range={ name="Fomalhaut", augments={'Path: A',}},
    ammo="Chrono Bullet",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Rep. Plat. Medal",
    waist="Flume belt +1",
    left_ear="Eabani Earring",
    right_ear={ name="Amini Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','Crit.hit rate+3',}},
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
	}

sets.idle.MDT = { 
	main={ name="Malevolence", augments={'INT+9','Mag. Acc.+10','"Mag.Atk.Bns."+9','"Fast Cast"+4',}},
    sub={ name="Malevolence", augments={'INT+10','Mag. Acc.+10','"Mag.Atk.Bns."+10','"Fast Cast"+5',}},
    range={ name="Fomalhaut", augments={'Path: A',}},
    ammo="Chrono Bullet",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Rep. Plat. Medal",
    waist="Yemaya Belt",
    left_ear="Eabani Earring",
    right_ear={ name="Amini Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','Crit.hit rate+3',}},
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
	}

sets.misc.Town = set_combine(sets.idle.PDT,{})
				
sets.idle.Standard = set_combine(sets.idle.PDT, {})
-- Melee TP 
sets.TP = { 
	main={ name="Malevolence", augments={'INT+9','Mag. Acc.+10','"Mag.Atk.Bns."+9','"Fast Cast"+4',}},
    sub={ name="Malevolence", augments={'INT+10','Mag. Acc.+10','"Mag.Atk.Bns."+10','"Fast Cast"+5',}},
    range={ name="Fomalhaut", augments={'Path: A',}},
    ammo="Chrono Bullet",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet="Malignance Boots",
    neck="Lissome Necklace",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Sherida Earring",
    right_ear="Cessance Earring",
    left_ring="Defending Ring",
    right_ring="Epona's Ring",
	}
-- Melee Accuracy TP
sets.TP.Acc = set_combine(sets.TP,{})

-- RA Sets
sets.precast.Snapshot = {    
	hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    feet="Meg. Jam. +2",}
sets.precast.Snapshot.Overkill = set_combine(sets.precast.Snapshot,{})

-- Bow
sets.RA = { 
	main={ name="Malevolence", augments={'INT+9','Mag. Acc.+10','"Mag.Atk.Bns."+9','"Fast Cast"+4',}},
    sub={ name="Malevolence", augments={'INT+10','Mag. Acc.+10','"Mag.Atk.Bns."+10','"Fast Cast"+5',}},
    range={ name="Fomalhaut", augments={'Path: A',}},
    ammo="Chrono Bullet",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands={ name="Ikenga's Gloves", augments={'Path: A',}},
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist="Chr. Bul. Pouch",
    left_ear="Telos Earring",
    right_ear={ name="Amini Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','Crit.hit rate+3',}},
    left_ring="Dingir Ring",
    right_ring="Regal Ring",}
				
sets.RA.Acc = {
			head="Arcadian Beret +1", neck="Ocachi Gorget", lear="Clearview Earring", rear="Volley Earring",
            body="Orion Jerkin +1", hands="Orion Bracers +1", lring="Arewe Ring +1", rring="Arewe Ring +1",
			back="Kayapa Cape", waist="Scout's Belt", legs="Nahtirah Trousers", feet="Orion Socks +1"}
				
-- Gun
sets.RA.Gun = { 
	main={ name="Malevolence", augments={'INT+9','Mag. Acc.+10','"Mag.Atk.Bns."+9','"Fast Cast"+4',}},
    sub={ name="Malevolence", augments={'INT+10','Mag. Acc.+10','"Mag.Atk.Bns."+10','"Fast Cast"+5',}},
    range={ name="Fomalhaut", augments={'Path: A',}},
    ammo="Chrono Bullet",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands={ name="Ikenga's Gloves", augments={'Path: A',}},
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist="Chr. Bul. Pouch",
    left_ear="Telos Earring",
    right_ear={ name="Amini Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','Crit.hit rate+3',}},
    left_ring="Dingir Ring",
    right_ring="Regal Ring",
	}
				
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
sets.precast.WS = {
    ammo="Chrono Bullet",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Sanctity Necklace",
    waist="Orpheus's Sash",
    left_ear="Friomisi Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Ilabrat Ring",
    right_ring="Dingir Ring",
	}
	
sets.precast.WS.WSD = {
    ammo="Chrono Bullet",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Sanctity Necklace",
    waist="Orpheus's Sash",
    left_ear="Friomisi Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Ilabrat Ring",
    right_ring="Dingir Ring",
	}
	
sets.precast.WS.MAB = {
    ammo="Chrono Bullet",
    body="Cohort Cloak +1",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Sanctity Necklace",
    waist="Orpheus's Sash",
    left_ear="Friomisi Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Ilabrat Ring",
    right_ring="Dingir Ring",
	}
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
	 main={ name="Malevolence", augments={'INT+9','Mag. Acc.+10','"Mag.Atk.Bns."+9','"Fast Cast"+4',}},
    sub={ name="Malevolence", augments={'INT+10','Mag. Acc.+10','"Mag.Atk.Bns."+10','"Fast Cast"+5',}},
    range={ name="Fomalhaut", augments={'Path: A',}},
    ammo="Chrono Bullet",
    body="Cohort Cloak +1",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Sanctity Necklace",
    waist="Orpheus's Sash",
    left_ear="Friomisi Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Ilabrat Ring",
    right_ring="Dingir Ring",
	}

sets.precast.RAWS['Trueflight'] = {				
	 main={ name="Malevolence", augments={'INT+9','Mag. Acc.+10','"Mag.Atk.Bns."+9','"Fast Cast"+4',}},
    sub={ name="Malevolence", augments={'INT+10','Mag. Acc.+10','"Mag.Atk.Bns."+10','"Fast Cast"+5',}},
    range={ name="Fomalhaut", augments={'Path: A',}},
    ammo="Chrono Bullet",    
    body="Cohort Cloak +1",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Sanctity Necklace",
    waist="Orpheus's Sash",
    left_ear="Friomisi Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Ilabrat Ring",
    right_ring="Dingir Ring",
	}
	
sets.precast.WS['Aeolian Edge'] = set_combine(sets.precast.WS.MAB,{})
					
-- Midcast Sets

-- Aftercast

-- Misc Sets
sets.precast.Fastcast = set_combine(sets.idle.PDT, {head="Athos's Chapeau", lear="Loquac. Earring", rring="Prolix Ring",})

sets.precast.Utsusemi = set_combine(sets.precast.Fastcast, {neck="Magoraga Beads"})

sets.misc.Waltz = {hands="Buremte Gloves", waist="Chuq'aba Belt"}
sets.misc.Steps = set_combine(sets.TP.ACC)
sets.misc.flourish = {}

end