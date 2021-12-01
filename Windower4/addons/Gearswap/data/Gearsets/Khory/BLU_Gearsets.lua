-- Firetoplay's BLU Gearsets
-- Created: 4/26/2014
-- Last Updated: 6/13/2014
-- To Do List:
--
--

if player.name == 'Khory' then
		-- includes
		include('include/mappings.lua')
		include('include/equipment.lua')
		include('include/utility.lua')

		-- sets Macros off = 0  on = 1
		automacroset = 1
		if automacroset == 1 then
			if player.sub_job == 'NIN' then
				set_macro_page(1,2)
			elseif player.sub_job == 'WAR' then
				set_macro_page(1,2)
			elseif player.sub_job == 'RDM' then
				set_macro_page(1,2)
			elseif player.sub_job == 'DNC' then
				set_macro_page(1,2)
			elseif player.sub_job == 'NIN' then 
				set_macro_page(1,2)
			else		
				set_macro_page(1,2)
			end
		end

		-- Auto Sets
		-- Standard/idle
		sets.idle.PDT = {
			ammo="Staunch Tathlum +1",
			head="Rawhide Mask",
			body="Shamash Robe",
			hands="Nyame Gauntlets",
			legs="Rawhide Trousers",
			feet="Nyame Sollerets",
			neck="Bathy Choker +1",
			waist="Fucho-no-Obi",
			left_ear="Suppanomimi",
			right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
			left_ring="Defending Ring",
			right_ring="Shneddick Ring",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10','Phys. dmg. taken-10%',}},
			}
		sets.idle.MDT = set_combine(sets.idle.PDT,{
			})
		sets.Resting = set_combine(sets.idle.PDT, {
			})
		sets.idle.Standard = set_combine(sets.idle.PDT,{
			})
		sets.misc.Town = set_combine(sets.idle.PDT, {})
		
		
		-- Melee Sets
		sets.TP = {
		ammo="Coiste Bodhar",
		head={ name="Dampening Tam", augments={'DEX+10','Accuracy+15','Mag. Acc.+15','Quadruple Attack +3',}},
		body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		legs={ name="Samnuha Tights", augments={'STR+8','DEX+9','"Dbl.Atk."+3','"Triple Atk."+2',}},
		feet={ name="Herculean Boots", augments={'Accuracy+30','"Triple Atk."+3','DEX+1',}},
		neck="Lissome Necklace",
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear="Suppanomimi",
		right_ear="Brutal Earring",
		left_ring="Hetairoi Ring",
		right_ring="Epona's Ring",
		back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10','Phys. dmg. taken-10%',}},
		}
		-- Accuracy
		sets.TP.Acc = set_combine(sets.TP, {
		})
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
		sets.precast.JA["Diffusion"] = {feet="Luhlaza Charuqs +1"}
		sets.precast.JA["Convergence"] = {head="Luhlaza Keffiyeh"}
		sets.precast.JA["Enchainment"] = {body="Luhlaza Jubbah +1"}
		
		-- Precast
		-- Magic
		sets.precast.Fastcast = {
			ammo="Sapience Orb",
			head={ name="Amalric Coif", augments={'INT+10','Mag. Acc.+20','Enmity-5',}},
			body={ name="Luhlaza Jubbah +1", augments={'Enhances "Enchainment" effect',}},
			hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
			legs={ name="Psycloth Lappas", augments={'MP+75','Mag. Acc.+14','"Fast Cast"+7',}},
			feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}},
			neck="Voltsurge Torque",
			left_ear="Mendi. Earring",
			left_ring="Kishar Ring",
			right_ring="Strendu Ring",
			back={ name="Rosmerta's Cape", augments={'"Fast Cast"+10',}},
			}
			
		sets.precast.Cure = set_combine(sets.precast.Fastcast, {})
		
		sets.precast.BlueMagic = set_combine(sets.precast.Fastcast, {})
		
		-- Midcast
		sets.midcast.Recast = set_combine(sets.idle.PDT, {waist="Witful Belt"})
		sets.midcast.ConserveMP = {}
		
		-- Blue Magic
		-- Skill
		sets.midcast.BlueMagic = {
			ammo="Ginsen",
			head="Nyame Helm",
			body="Nyame Mail",
			hands="Nyame Gauntlets",
			legs="Nyame Flanchard",
			feet="Nyame Sollerets",
			neck="Caro Necklace",
			waist={ name="Sailfi Belt +1", augments={'Path: A',}},
			left_ear="Telos Earring",
			right_ear="Digni. Earring",
			left_ring="Regal Ring",
			right_ring={ name="Beithir Ring", augments={'Path: A',}},
			back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
			}
		sets.idle.BlueMagic = {}
		sets.idle.BlueMagic.Learn = set_combine(sets.midcast.BlueMagic,{hands="Assim. Bazu.", back="Atheling Mantle"})
		-- Recast
		sets.midcast.BlueMagic.Recast = set_combine(sets.midcast.Recast)
		-- STR
		sets.midcast.BlueMagic.STR = set_combine(sets.midcast.BlueMagic, {
		})
		-- Accuracy - I.E Heavy Strike
		sets.midcast.BlueMagic.STRAcc = set_combine(sets.midcast.BlueMagic, {
		})
		-- VIT
		sets.midcast.BlueMagic.VIT = set_combine(sets.midcast.BlueMagic, {
		})
		-- AGI
		sets.midcast.BlueMagic.AGI = set_combine(sets.midcast.BlueMagic, {
		})
		-- MND
		sets.midcast.BlueMagic.MND = set_combine(sets.midcast.BlueMagic, {
		})
		-- Cure Pot
		sets.midcast.BlueMagic.CurePot = set_combine(sets.midcast.BlueMagic.MND, {
                left_ear="Mendi. Earring",
				})
		-- INT
		sets.midcast.BlueMagic.Nuke = set_combine(sets.midcast.BlueMagic, {
			ammo="Pemphredo Tathlum",
			head="Nyame Helm",
			body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
			hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
			legs="Nyame Flanchard",
			feet="Nyame Sollerets",
			neck="Sanctity Necklace",
			waist="Orpheus's Sash",
			left_ear="Friomisi Earring",
			right_ear="Regal Earring",
			left_ring="Jhakri Ring",
			right_ring="Strendu Ring",
			back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}},
			})	
		
		sets.midcast.BlueMagic.Nuke["Tenebral Crush"] =	set_combine(sets.midcast.BlueMagic.Nuke, {
			head="Pixie Hairpin +1",
			})	
		sets.midcast.BlueMagic.NukeDark = set_combine(sets.midcast.BlueMagic.Nuke, {
			head="Pixie Hairpin +1",
			right_ring="Archon Ring",
			})
		sets.midcast.BlueMagic.Aquaveil = set_combine(sets.midcast.BlueMagic, {
			head="Amalric Coif",
			})
			
		-- Macc 
		sets.midcast.BlueMagic.Macc = set_combine(sets.midcast.BlueMagic, {
			ammo="Pemphredo Tathlum",
			head="Nyame Helm",
			body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
			hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
			legs="Nyame Flanchard",
			feet="Nyame Sollerets",
			neck="Sanctity Necklace",
			waist="Sacro Cord",
			left_ear="Friomisi Earring",
			right_ear="Regal Earring",
			left_ring="Jhakri Ring",
			right_ring="Strendu Ring",
			back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}},
			})	
		-- Weaponskill
		sets.precast.WS = {
			ammo="Coiste Bodhar",
			head="Nyame helm",
			body="Nyame Mail",
			hands="Jhakri Cuffs +2",
			legs="Nyame Flanchard",
			feet="Nyame Sollerets",
			neck="Fotia Gorget",
			waist="Fotia Belt",
			left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
			right_ear="Brutal Earring",
			left_ring="Hetairoi Ring",
			right_ring="Epona's Ring",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10','Phys. dmg. taken-10%',}},
			}
				
		sets.precast.WS.WSD = {
			ammo="Amar Cluster",
			head="Nyame helm",
			body="Nyame Mail",
			hands="Jhakri Cuffs +2",
			legs="Nyame Flanchard",
			feet="Nyame Sollerets",
			neck="Caro Necklace",
			waist={ name="Sailfi Belt +1", augments={'Path: A',}},
			left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
			right_ear="Ishvara Earring",
			left_ring={ name="Beithir Ring", augments={'Path: A',}},
			right_ring="Ilabrat Ring",
			back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
			}
			
		sets.precast.WS.MAB = {	
			ammo="Pemphredo Tathlum",
			head="Nyame Helm",
			body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
			hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
			legs="Nyame Flanchard",
			feet="Nyame Sollerets",
			neck="Sanctity Necklace",
			waist="Orpheus's Sash",
			left_ear="Friomisi Earring",
			right_ear="Sortiarius Earring",
			left_ring="Jhakri Ring",
			right_ring="Strendu Ring",
			back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}},
			}
			
		sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS.WSD, {
			})
		
		sets.precast.WS['Expiacion'] = set_combine(sets.precast.WS.WSD, {
			})
			
		sets.precast.WS.Acc = set_combine(sets.precast.WS, {
		})
		sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {
		})
		
		sets.precast.WS.Acc['Chant du Cygne'] = set_combine(sets.precast.WS, {
		})
		
		sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {
		})
		
		sets.precast.WS.Acc['Requiescat'] = set_combine(sets.precast.WS, {
		})
		
		sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast.WS.MAB, {
		})
		
		sets.precast.WS['Burning Blade'] = set_combine(sets.precast.WS.MAB, {
		})
		
		sets.precast.WS['Shining Blade'] = set_combine(sets.precast.WS.MAB, {
		})
		
		sets.precast.WS['Black Halo'] = set_combine(sets.precast.WS.WSD, {
		})
		
		sets.precast.WS['Judgment'] = set_combine(sets.precast.WS.WSD, {
		})

		-- Misc
		sets.misc.Waltz = {}
		sets.misc.Steps = {}
		sets.misc.flourish = {}
end