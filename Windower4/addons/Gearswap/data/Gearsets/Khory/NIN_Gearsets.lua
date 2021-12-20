-- Firetoplay's NIN Gear_sets
-- Created: 7/13/2014
-- Last Modified: 9/1/2014
-- To Do List 
--
--
--
--

if player.name == 'Khory' then
-- includes
	include('include/utility.lua')
	include('include/mappings.lua')
	include('include/equipment.lua')
	-- include('../include/autoexec.lua')
	
-- sets Macros off = 0  on = 1
		automacroset = 1
		if automacroset == 1 then
			if player.sub_job == 'WAR' then
				set_macro_page(1,20)
			elseif player.sub_job == 'DNC' then
				set_macro_page(1,20)
			elseif player.sub_job == 'DRK' then
				set_macro_page(1,20)
			elseif player.sub_job == 'RDM' then 
				set_macro_page(1,20)
			end
		else
			set_macro_page(1,20)
		end
		
-- Auto Sets
-- Standard/idle
sets.idle.PDT = { 
	head="Mpaca's Cap",
	body="Malignance Tabard",
	hands="Mpaca's Gloves",
	left_ring="Defending Ring",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
	}

sets.idle.MDT = {}

sets.misc.Town = set_combine(sets.idle.PDT, { 
				})
				
sets.idle.Standard = set_combine(sets.idle.PDT, {
				})
-- Full Evasion
sets.idle.Evasion = set_combine(sets.idle.PDT,{})

sets.Enmity = {}

-- Precast	
sets.precast.Fastcast = set_combine(sets.idle.PDT, {
	head={ name="Herculean Helm", augments={'INT+3','"Mag.Atk.Bns."+20','Magic Damage +23','Mag. Acc.+16 "Mag.Atk.Bns."+16',}},
    body={ name="Taeon Tabard", augments={'Pet: Accuracy+23 Pet: Rng. Acc.+23','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    neck="Voltsurge Torque",
    left_ring="Kishar Ring",
			})

sets.precast.Utsusemi = set_combine(sets.precast.Fastcast, {
			})

sets.precast.Recast = set_combine(sets.idle.PDT,{
			
			})
-- Midcast
sets.midcast.Wheel = {
	ammo="Seeth. Bomblet +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Sanctity Necklace",
    waist="Orpheus's Sash",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Friomisi Earring",
    left_ring="Ilabrat Ring",
    right_ring="Dingir Ring",
    back="Sacro mantle",
			}
			
sets.midcast.Skill = {
	ammo="Seeth. Bomblet +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands={ name="Herculean Gloves", augments={'Mag. Acc.+17 "Mag.Atk.Bns."+17','"Fast Cast"+2','INT+5','"Mag.Atk.Bns."+15',}},
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Friomisi Earring",
    left_ring="Ilabrat Ring",
    right_ring="Dingir Ring",
    back="Sacro mantle",
			}
sets.midcast.Enfeeb = set_combine(sets.midcast.Skill,{
			})
sets.midcast.Utsusemi = set_combine(sets.precast.Utsusemi,{
			})
			
-- TP Sets 
sets.TP = { 
	ammo="Date Shuriken",
    head="Mpaca's Cap",
    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs={ name="Samnuha Tights", augments={'STR+8','DEX+9','"Dbl.Atk."+3','"Triple Atk."+2',}},
    feet={ name="Herculean Boots", augments={'Accuracy+30','"Triple Atk."+3','DEX+1',}},
    neck="Lissome Necklace",
    waist="Sailfi Belt +1",
    left_ear="Suppanomimi",
    right_ear="Telos Earring",
    left_ring="Hetairoi Ring",
    right_ring="Epona's Ring",
    back="Sacro mantle",
	}

-- Accuracy TP Set
sets.TP.Acc = {}

-- Alliance Buffed
sets.TP.Buffed = {}

-- Hybrid Evasion
sets.TP.Hybrid = set_combine(sets.idle.PDT,{})

-- RA Sets
sets.precast.Snapshot = {}

sets.RA = {}
				
-- JA
sets.precast.JA["Mijin Gakure"] = {legs="Koga Hakama +2"}
sets.precast.JA["Mikage"] = {}

sets.precast.JA["Sange"] = {body="Koga Chainmail +2"}
sets.precast.JA["Yonin"] = {legs="Iga Hakama +2"}
sets.precast.JA["Innin"] = {head="Iga Zukin +2"}
sets.precast.JA["Futae"] = {hands="Iga Tekko +2"}

-- Weaponskills
sets.precast.WS = { 
	ammo="Seeth. Bomblet +1",
    head="Mpaca's Cap",
    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs={ name="Samnuha Tights", augments={'STR+8','DEX+9','"Dbl.Atk."+3','"Triple Atk."+2',}},
    feet={ name="Herculean Boots", augments={'Accuracy+30','"Triple Atk."+3','DEX+1',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Brutal Earring",
    left_ring="Hetairoi Ring",
    right_ring="Epona's Ring",
    back="Sacro mantle",
	}
	
sets.precast.WS.WSD = { 
	ammo="Seeth. Bomblet +1",
	head="Nyame Helm",
    body="Nyame Mail", 
    hands="Nyame Gauntlets",
    legs="Hiza. Hizayoroi +2",
    feet="Nyame Sollerets",
    neck="Caro Necklace",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Ilabrat Ring",
    right_ring={ name="Beithir Ring", augments={'Path: A',}},
    back="Sacro Mantle",
	}
-- Mercy Stroke 
sets.precast.WS["Blade: Jin"] = set_combine(sets.precast.WS, { 
	left_ear= "Telos Earring",
})

sets.precast.WS["Blade: Shun"] = set_combine(sets.precast.WS, { 
})

sets.precast.WS["Blade: Hi"] = set_combine(sets.precast.WS.WSD, { 
    neck="Lissome Necklace",
    waist="Svelt. Gouriz +1",
})

sets.precast.WS["Blade: Ten"] = set_combine(sets.precast.WS.WSD, { 
	head="Mpaca's Cap",
})
				
sets.precast.WS["Blade: Metsu"] = set_combine(sets.precast.WS.WSD, { 
	left_ear= "Telos Earring",
})

sets.precast.WS["Blade: Kamu"] = set_combine(sets.precast.WS, { 
	left_ear= "Telos Earring",
})

sets.precast.WS["Blade: Ku"] = set_combine(sets.precast.WS, { 
	left_ear= "Telos Earring",
})

sets.precast.WS["Blade: Teki"] = set_combine(sets.precast.WS, { 
	ammo="Seeth. Bomblet +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Sanctity Necklace",
    waist="Orpheus's Sash",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Friomisi Earring",
    left_ring="Ilabrat Ring",
    right_ring="Dingir Ring",
    back="Sacro mantle",
})

sets.precast.WS["Blade: To"] = set_combine(sets.precast.WS["Blade: Teki"], { 
})

sets.precast.WS["Blade: Chi"] = set_combine(sets.precast.WS["Blade: Teki"], { 
})

sets.precast.WS["Blade: Ei"] = set_combine(sets.precast.WS["Blade: Teki"], { 
})

sets.precast.WS["Blade: Yu"] = set_combine(sets.precast.WS["Blade: Teki"], { 
})

sets.precast.WS["Savage Blade"] = set_combine(sets.precast.WS.WSD, { 
	head="Mpaca's Cap",
})


sets.misc.Waltz = {}
sets.misc.Steps = set_combine(sets.TP.Acc)
sets.misc.flourish = {}


elseif player.name == 'Derion' then

elseif player.name == 'Aniyah' then

elseif player.name == 'Firetoplay' then

end