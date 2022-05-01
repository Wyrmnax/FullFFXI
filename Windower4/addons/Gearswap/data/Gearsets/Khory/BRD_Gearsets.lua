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
				set_macro_page(4,1)
			elseif player.sub_job =='whm' then
				set_macro_page(4,2)
			elseif player.sub_job == 'rdm' then
				set_macro_page(4,3)
			elseif player.sub_job =='sch' then 
				set_macro_page(4,4)
			elseif player.sub_job =='dnc' then 
				set_macro_page(4,5)
			elseif player.sub_job =='blm' then 
				set_macro_page(4,6)
			end
		else
			set_macro_page(4,1)
		end
		
	sets.Evisceration = { 
	main="Tauret",
    sub="Gleti's Knife",
	}
		
	sets.SavageBlade = { 
	main="Naegling",
    sub="Gleti's Knife",
	}
	
	sets.AccSB = { 
	main="Naegling",
    sub="Gleti's Knife",
	}
	
	sets.Mordant = { 
	main="Tauret",
    sub="Gleti's Knife",
	}
	
	sets.Rudra = { 
	main="Tauret",
    sub="Gleti's Knife",
	}
	
	sets.AccRudra = { 
	main="Tauret",
    sub="Gleti's Knife",
	}
	
	send_command('wait 3;input /lockstyleset 8')
		
		-- Instruments
		default = {range="Gjallahorn"}
		-- Buffs
		ballad = {range="Gjallahorn"}
		march = {range="Gjallahorn"}
		minuet = {range="Gjallahorn"}
		madrigal = {range="Gjallahorn"}
		minne = {range="Gjallahorn"}
		etude = {range="Gjallahorn"}
		carol = {range="Gjallahorn"}
		mambo  = {range="Gjallahorn"}
		mazurka = {range="Gjallahorn"}
		paeon = {range="Gjallahorn"}
		prelude = {range="Gjallahorn"}
		scherzo = {range="Gjallahorn"}
		hymnus = {range="Gjallahorn"}
		--Debuffs
		elegy = {range="Gjallahorn"}
		threnody = {range="Gjallahorn"}
		lullaby = {range="Gjallahorn"}
		horde = {range="Gjallahorn"}
		finale = {range="Gjallahorn"}
		requiem = {range="Gjallahorn"}
		virelai = {range="Gjallahorn"}
		nocturne = {range="Gjallahorn"}

		-- Auto Sets
		-- Standard/idle
		sets.idle.PDT = {
			range={ name="Linos", augments={'Accuracy+19','"Store TP"+4','Quadruple Attack +3',}},
			head={ name="Nyame Helm", augments={'Path: B',}},
			body={ name="Nyame Mail", augments={'Path: B',}},
			hands="Bunzi's Gloves",
			legs="Bunzi's Pants",
			feet={ name="Nyame Sollerets", augments={'Path: B',}},
			neck="Sanctity Necklace",
			waist="Reiki Yotai",
			left_ear="Etiolation Earring",
			right_ear="Eabani Earring",
			left_ring="Defending Ring",
			right_ring="Shneddick Ring",}	
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
	head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body="Inyanga Jubbah +2",
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs="Aya. Cosciales +2",
    neck="Voltsurge Torque",
    waist="Embla Sash",
    left_ear="Etiolation Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Kishar Ring",
	}
		sets.precast.Fastcast.Song = set_combine(sets.precast.Fastcast, {
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
		sets.midcast.Buffsong = {sub = "Kali"}
		-- Target Skill + 800
		sets.midcast.Skillsong = {sub = "Kali"}
		sets.midcast.Debuff = {sub = "Kali"}
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
    head="Aya. Zucchetto +2",
    body="Ayanmo Corazza +2",
    hands="Bunzi's Gloves",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Lissome Necklace",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Telos Earring",
    right_ear="Crep. Earring",
    left_ring="Petrov Ring",
    right_ring="Ilabrat Ring",
	}
		sets.precast.WS = set_combine(sets.TP, {})
		sets.precast.WS.WSD = {
	range={ name="Linos", augments={'Accuracy+18','Weapon skill damage +3%','STR+6 AGI+6',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Bunzi's Gloves",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Lissome Necklace",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Ishvara Earring",
    right_ear="Crep. Earring",
    left_ring="Petrov Ring",
    right_ring="Ilabrat Ring",
	}
	
	
	-- DAGGER
		sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {
	neck="Fotia Gorget",
    waist="Fotia Belt",
	})
		sets.precast.WS['Mercy Stroke'] = set_combine(sets.precast.WS.WSD, {})
		
		sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS.WSD, {
	right_ear="Moonshade Earring",
	})
		
		sets.precast.WS["Aeolian Edge"] = set_combine(sets.precast.WS.WSD, {
	right_ear="Moonshade Earring",
	})
	
	-- Sword
	
		sets.precast.WS["Savage Blade"] = set_combine(sets.precast.WS.WSD, {
	right_ear="Moonshade Earring",
	})
		
		sets.misc.Waltz = {}
		sets.misc.Steps = set_combine(sets.TP.Acc,{})
		sets.misc.flourish = set_combine(sets.TP.Macc,{})		

end