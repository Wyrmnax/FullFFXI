-- BRD Gearsets
-- Created
-- Last Modified
--
--

if player.name == 'Khory' then
		-- includes
		include('include/mappings.lua')
		include('include/equipment.lua')
		--include('include/autoexec.lua')
		include('include/utility.lua')

		-- sets Macros off = 0  on = 1
		automacroset = 0
		if automacroset == 1 then
			if player.sub_job == 'nin' then
				set_macro_page(1,18)
			elseif player.sub_job =='whm' then
				set_macro_page(1,18)
			elseif player.sub_job == 'rdm' then
				set_macro_page(1,18)
			elseif player.sub_job =='sch' then 
				set_macro_page(1,18)
			elseif player.sub_job =='dnc' then 
				set_macro_page(1,18)
			elseif player.sub_job =='blm' then 
				set_macro_page(1,18)
			end
		else
			set_macro_page(1,18)
		end
		
	sets.Evisceration = { 
	main="Tauret",
    sub="Gleti's Knife",
	}
		
	sets.SavageBlade = { 
	main="Naegling",
    sub="Centovente",
	}
	
	sets.AccSB = { 
	main="Naegling",
    sub="Ternion Dagger +1",
	}
	
	sets.Mordant = { 
	main="Carnwenhan",
    sub="Ternion Dagger +1",
	}
	
	sets.Rudra = { 
	main="Aeneas",
    sub="Centovente",
	}
	
	sets.AccRudra = { 
	main="Aeneas",
    sub="Ternion Dagger +1",
	}
	
	send_command('wait 3;input /lockstyleset 15')
		
		-- Instruments
		defaultinstrument = {range="Gjallarhorn",}
		-- Buffs
		ballad = {range="Gjallarhorn",}
		march = {range="Gjallarhorn"}
		minuet = {range="Gjallarhorn"}
		madrigal = {range="Gjallarhorn"}
		minne = {range="Gjallarhorn"}
		etude = {range="Gjallarhorn"}
		carol = {range="Gjallarhorn"}
		mambo  = {range="Gjallarhorn"}
		mazurka = {range="Gjallarhorn"}
		paeon = {range="Gjallarhorn"}
		prelude = {range="Gjallarhorn"}
		scherzo = {range="Gjallarhorn"}
		hymnus = {range="Gjallarhorn"}
		honormarch = {range="Marsyas"}
		dummy = {range="Daurdabla"}
		--Debuffs
		elegy = {range="Gjallarhorn"}
		threnody = {range="Gjallarhorn"}
		lullaby = {range="Daurdabla"}
		horde = {range="Daurdabla"}
		finale = {range="Gjallarhorn"}
		requiem = {range="Gjallarhorn"}
		virelai = {range="Gjallarhorn"}
		nocturne = {range="Gjallarhorn"}

		-- Auto Sets
		-- Standard/idle
		sets.idle.PDT = {
			range={ name="Linos", augments={'Accuracy+19','"Store TP"+4','Quadruple Attack +3',}},
			head="Bunzi's Hat",
			body={ name="Nyame Mail", augments={'Path: B',}},
			hands="Bunzi's Gloves",
			legs="Bunzi's Pants",
			feet={ name="Nyame Sollerets", augments={'Path: B',}},
			neck="Rep. Plat. Medal",
			--neck="Bard's Charm +2",
			waist="Reiki Yotai",
			left_ear="Etiolation Earring",
			right_ear="Eabani Earring",
			left_ring="Defending Ring",
			right_ring="Shneddick Ring",
			back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
			}	
		sets.idle.Standard = set_combine(sets.idle.PDT,{})
		sets.misc.Town = set_combine(sets.idle.PDT, {
				})
		-- JA
		sets.precast.JA["Nightingale"] = {feet="Bihu Slippers"}
		sets.precast.JA["Troubadour"] = {body="Bihu Justaucorps"}
		sets.precast.JA["Soul Voice"] = {legs="Bihu Cannions"}
		
		-- Precast
		-- Magic
		sets.precast.Fastcast = { 
	head={ name="Bunzi's Hat", augments={'Path: A',}},
    body="Inyanga Jubbah +2",
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs="Aya. Cosciales +2",
    neck="Voltsurge Torque",
    waist="Embla Sash",
    left_ear="Etiolation Earring",
    right_ear="Enchntr. Earring +1",	
    left_ring="Defending Ring",
    right_ring="Kishar Ring",
	back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
	}
		sets.precast.Song =set_combine(sets.precast.Fastcast, { 
	head="Fili Calot +3",    
    feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}},
	})
		sets.precast.Cure = set_combine(sets.precast.Fastcast, {
	feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    left_ear="Mendi. Earring",
	})
		-- Midcast
		sets.midcast.Recast = set_combine(sets.idle.PDT, {waist="Witful Belt"})
		
		sets.midcast.ConserveMP = {
	head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
    body="Gyve Doublet",
    legs={ name="Vanya Slops", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
    neck="Incanter's Torque",
    right_ear="Lempo Earring",
	}
		-- Bard songs
		sets.midcast.Buffsong = {
	main="Carnwenhan",
	sub={ name="Kali", augments={'MP+60','Mag. Acc.+20','"Refresh"+1',}},
    head="Fili Calot +3",
    body="Fili Hongreline +3",
    hands="Fili Manchettes +3",
	neck="Mnbw. Whistle +1",
    legs="Inyanga Shalwar +2",
	feet="Brioso Slippers +3",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
	}
		-- Target Skill + 800
		sets.midcast.Skillsong = {
	main="Carnwenhan",
	sub={ name="Kali", augments={'MP+60','Mag. Acc.+20','"Refresh"+1',}},
    head="Brioso Roundlet +3",
    body="Brioso Justau. +3",
    hands="Inyan. Dastanas +2",
	lear="Gersemi Earring",
	rear="Regal Earring",
	neck="Mnbw. Whistle +1",
    legs="Inyanga Shalwar +2",
	feet="Brioso Slippers +3",
	rring="Stikini Ring +1",
	waist="Harfner's Sash",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
	}
		sets.midcast.Debuff = {
	main="Carnwenhan",
	sub={ name="Kali", augments={'MP+60','Mag. Acc.+20','"Refresh"+1',}},
    head="Brioso Roundlet +3",
    body="Brioso Justau. +3",
    hands="Brioso Cuffs +2",
    legs="Brioso Cannions +2",
    feet="Brioso Slippers +3",
    neck="Sanctity Necklace",
    waist="",
    left_ear="Digni. Earring",
    right_ear="Regal Earring",
    left_ring="Vertigo Ring",
    right_ring="Metamor. Ring +1",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
	}
		--Healing Magic
		sets.midcast.Cure = {
	main="Daybreak",
    head={ name="Vanya Hood", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
    legs={ name="Vanya Slops", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
	feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
	}
		
		sets.midcast.Curaga = {
	main="Daybreak",
    head={ name="Vanya Hood", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
    legs={ name="Vanya Slops", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
	feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
	}
	
		-- Enhancing
		sets.midcast.Phalanx = {}
		sets.midcast.Hastespell = {ammo="Impatiens", waist="Witful Belt"}
		-- 40 MND
		sets.midcast.Stoneskin = set_combine(sets.idle.PDT, {})
		sets.midcast.Aquaveil = {waist="Empahatikos Rope", legs="Shedir Seraweels"}
		sets.midcast.Blink = set_combine(sets.midcast.Aquaveil)
		sets.midcast.Reraise = set_combine(sets.midcast.ConserveMP)

		-- Enfeebling
		-- Potency
		sets.midcast.Enfeebling = {}
		sets.midcast.Macc = {}

		sets.midcast.Dia = set_combine(sets.midcast.ConserveMP,{})

		-- Melee Sets
		sets.TP = {
	range={ name="Linos", augments={'Accuracy+19','"Store TP"+4','Quadruple Attack +3',}},
    head="Bunzi's Hat",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Bunzi's Gloves",
    legs="Volte Tights",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Bard's Charm +2",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Telos Earring",
    right_ear="Crep. Earring",
    left_ring="Chirich Ring +1",
    right_ring="Moonlight Ring", 	
	back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}
		sets.precast.WS = set_combine(sets.TP, {})
		sets.precast.WS.WSD = {
	range={ name="Linos", augments={'Accuracy+18','Weapon skill damage +3%','STR+6 AGI+6',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Nyame Gauntlets",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Rep. Plat. Medal",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Ishvara Earring",
    right_ear="Crep. Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Cornelia's Ring", 	
	back={ name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
	}
	
		sets.precast.WS.MAB = {
	range={ name="Linos", augments={'Accuracy+18','Weapon skill damage +3%','STR+6 AGI+6',}},
    head="Bunzi's Hat",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Bunzi's Gloves",
    legs="Bunzi's Pants",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Sanctity Necklace",
    waist="Skrymir Cord",
    left_ear="Regal Earring",
    right_ear="Sortiarius Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Cornelia's Ring", 	
    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
	}
	
	
	-- DAGGER
		sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {
	neck="Fotia Gorget",
    waist="Fotia Belt",
	back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
	})
	
	sets.precast.WS["Evisceration"] = set_combine(sets.precast.WS.WSD, {
	neck="Fotia Gorget",
    waist="Fotia Belt",
	back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
	})
		sets.precast.WS['Mercy Stroke'] = set_combine(sets.precast.WS.WSD, {
	neck="Bard's Charm +2",		
	back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
	})
		
		sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS.WSD, {
	neck="Bard's Charm +2",
	right_ear="Moonshade Earring",
	back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
	})
		
		sets.precast.WS["Aeolian Edge"] = set_combine(sets.precast.WS.MAB, {
	right_ear="Moonshade Earring",
	})
	
	sets.precast.WS["Mordant Rime"] = set_combine(sets.precast.WS.WSD, {
	neck="Bard's Charm +2",
	back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
	})
	
	-- Sword
	
	sets.precast.WS["Savage Blade"] = set_combine(sets.precast.WS.WSD, {
	right_ear="Moonshade Earring",
	})
	
	sets.precast.WS["Shining Blade"] = set_combine(sets.precast.WS.MAB, {
	right_ear="Moonshade Earring",
	})
		
		sets.misc.Waltz = {}
		sets.misc.Steps = set_combine(sets.TP.Acc,{})
		sets.misc.flourish = set_combine(sets.TP.Macc,{})		

end