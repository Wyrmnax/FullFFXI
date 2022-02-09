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
		
	send_command('wait 3;input /lockstyleset 3')
-- Auto Sets
-- Standard/idle
sets.idle.PDT = { 
	ammo="Date Shuriken",
	head="Nyame Helm",
	body="Malignance Tabard",
	hands="Nyame Gauntlets",
	left_ring="Defending Ring",
	right_ring="Shneddick Ring",
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
    waist="Eschan Stone",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Friomisi Earring",
    left_ring="Metamor. Ring +1",
    right_ring="Dingir Ring",
    back={ name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10','Damage taken-5%',}},
			}
			
sets.midcast.Futae = set_combine(sets.midcast.Wheel,{
    hands="Hattori Tekko +1"
	})
			
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
    back={ name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10','Damage taken-5%',}}
			}
sets.midcast.Enfeeb = set_combine(sets.midcast.Skill,{
			})
sets.midcast.Utsusemi = set_combine(sets.precast.Utsusemi,{
			feet="Hattori Kyahan +1",})
			
-- TP Sets 
sets.TP = { 
	ammo="Date Shuriken",
    head="Mpaca's Cap",
    body={ name="Mpaca's Doublet", augments={'Path: A',}},
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs={ name="Samnuha Tights", augments={'STR+8','DEX+9','"Dbl.Atk."+3','"Triple Atk."+2',}},
    feet="Malignance Boots",
    neck="Lissome Necklace",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Brutal Earring",
    right_ear="Telos Earring",
    left_ring="Hetairoi Ring",
    right_ring="Epona's Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
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
sets.precast.JA["Futae"] = {hands="Hattori Tekko +1"}

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
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}
	
sets.precast.WS.WSD = { 
	ammo="Seeth. Bomblet +1",
	head="Nyame Helm",
    body="Nyame Mail", 
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Caro Necklace",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Cessance Earring",
    right_ear="Ishvara Earring",
    left_ring="Ilabrat Ring",
    right_ring={ name="Beithir Ring", augments={'Path: A',}},
    back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
	}
	
sets.precast.WS.MAB = { 
	ammo="Seeth. Bomblet +1",
	head="Nyame Helm",
    body="Nyame Mail", 
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Caro Necklace",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Crepuscular Earring",
    right_ear="Frimosi Earring",
    left_ring="Ilabrat Ring",
    right_ring={ name="Beithir Ring", augments={'Path: A',}},
    back={ name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10','Damage taken-5%',}}
	}
-- Mercy Stroke 
sets.precast.WS["Blade: Jin"] = set_combine(sets.precast.WS, { 
	left_ear= "Telos Earring",
})

sets.precast.WS["Blade: Shun"] = set_combine(sets.precast.WS, { 
})

sets.precast.WS["Blade: Hi"] = set_combine(sets.precast.WS.WSD, { 
	body="Abnoba Kaftan",
    neck="Lissome Necklace",
    waist="Svelt. Gouriz +1",
})

sets.precast.WS["Blade: Ten"] = set_combine(sets.precast.WS.WSD, { 
	head="Mpaca's Cap",	
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
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

sets.precast.WS["Blade: Teki"] = set_combine(sets.precast.WS.MAB, { 
})

sets.precast.WS["Blade: To"] = set_combine(sets.precast.WS.MAB, { 
})

sets.precast.WS["Blade: Chi"] = set_combine(sets.precast.WS.MAB, { 
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
})

sets.precast.WS["Blade: Ei"] = set_combine(sets.precast.WS.MAB, { 
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
})

sets.precast.WS["Blade: Yu"] = set_combine(sets.precast.WS.MAB, { 
})

sets.precast.WS["Savage Blade"] = set_combine(sets.precast.WS.WSD, { 
	head="Mpaca's Cap",	
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
})

sets.precast.WS["Aeolian Edge"] = set_combine(sets.precast.WS.MAB, { 
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
})

sets.misc.Waltz = {}
sets.misc.Steps = set_combine(sets.TP.Acc)
sets.misc.flourish = {}


elseif player.name == 'Derion' then

elseif player.name == 'Aniyah' then

elseif player.name == 'Firetoplay' then

end