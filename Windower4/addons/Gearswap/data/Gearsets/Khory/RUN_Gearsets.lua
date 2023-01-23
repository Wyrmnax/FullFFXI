-- RUN Gear_sets
-- Created: 7/13/2014
-- Last Modified: 7/19/2014
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
			if player.sub_job == 'DRK' then
				set_macro_page(1,7)
			elseif player.sub_job == 'SAM' then
				set_macro_page(2,7)
			elseif player.sub_job == 'WAR' then
				set_macro_page(3,7)
			elseif player.sub_job == 'BLU' then 
				set_macro_page(1,7)
			elseif player.sub_job == 'DRG' then 
				set_macro_page(5,7)
			elseif player.sub_job == 'MNK' then 
				set_macro_page(6,7)
			elseif player.sub_job == 'WHM' then 
				set_macro_page(7,7)
			elseif player.sub_job == 'RDM' then 
				set_macro_page(8,7)
			elseif player.sub_job == 'SCH' then 
				set_macro_page(9,7)
			else
				set_macro_page(1,7)
			end
		end
		
	send_command('wait 3;input /lockstyleset 5')
		
-- Auto Sets
-- Standard/idle
sets.idle.PDT = { 
	main="Epeolatry",
	sub="Utu Grip",
	ammo="Homiliary",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Runeist Coat +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Eri. Leg Guards +3",
    feet="Erilaz Greaves +2",
    neck="Rep. Plat. Medal",
    waist="Flume Belt +1",
    left_ear="Odnowa Earring +1",
    right_ear="Tuisto Earring",
    left_ring="Moonbeam Ring",
    right_ring="Shneddick Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},
}


sets.idle.MDT = { 
	ammo="Homiliary",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Erilaz Surcoat +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Eri. Leg Guards +3",
    feet="Erilaz Greaves +2",
    neck={ name="Futhark Torque +1", augments={'Path: A',}},
    waist="Flume Belt +1",
    left_ear="Odnowa Earring +1",
    right_ear="Tuisto Earring",
    left_ring="Moonbeam Ring",
    right_ring="Shneddick Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},
}

sets.misc.Town = set_combine(sets.idle.PDT, {
			})
				
sets.idle.Standard = set_combine(sets.idle.PDT, {
				})
				
sets.idle.Evasion = { 
				}

sets.Enmity = set_combine(sets.idle.PDT, {
	ammo="Sapience Orb",
	body="Emet Harness +1",
    hands="Kurys Gloves",
	waist="Audumbla Sash",
    legs="Eri. Leg Guards +3",
	feet="Erilaz Greaves +2",
    neck="Unmoving Collar +1",
	rring="Supershear ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},
	})

-- TP set
sets.TP = {
	main="Epeolatry",
	sub="Utu Grip",
	ammo="Yamarang",
    head="Nyame helm",
    body="Erilaz Surcoat +3",
    hands="Turms Mittens +1",
    legs="Eri. Leg Guards +3",
    feet="Turms Leggings +1",
    neck="Futhark Torque +1",
    waist="Sailfi Belt +1",
    left_ear="Odnowa Earring +1",
    right_ear="Tuisto Earring",
    left_ring="Defending Ring",
    right_ring="Moonbeam Ring",
    back={ name="Ogma's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},

    --ammo="Staunch Tathlum +1",
    --head={ name="Nyame Helm", augments={'Path: B',}},
    --body="Ayanmo Corazza +2",
    --hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    --legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    --feet={ name="Nyame Sollerets", augments={'Path: B',}},
    --neck="Lissome Necklace",
    --waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    --left_ear="Sherida Earring",
    --right_ear="Telos Earring",
    --left_ring="Niqmaddu Ring",
    --right_ring="Moonbeam Ring",
    --back={ name="Ogma's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}
			
sets.TP.Acc = { }
sets.TP.Buffed = { }			
sets.TP.Hybrid = { }
				
-- JA
sets.precast.JA["Elemental Sforzo"] = {body="Futhark Coat"}
sets.precast.JA["Odyllic Subterfuge"] = {}

sets.precast.JA["Lunge"] = {
	ammo="Seeth. Bomblet +1",
    head="Nyame Helm",
    body="Agwu's Robe",
    hands="Agwu's Gages",
    legs="Agwu's slops",
    feet="Agwu's Pigaches",
    neck="Sanctity Necklace",
    waist="Orpheus's Sash",
    left_ear="Friomisi Earring",
    right_ear="Sortiarius Earring",
    left_ring="Defending Ring",
    right_ring="Gelatinous Ring +1",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},
	}
sets.precast.JA["Swipe"] = set_combine(sets.precast.JA["Lunge"],{	})
sets.precast.JA["Valiance"] = {body="Runeist Coat +3"}
sets.precast.JA["Vallation"] = {body="Runeist Coat +3"}
sets.precast.JA["Gambit"] = {hands="Runiest Mitons"}
sets.precast.JA["Pflug"] = {feet="Runiest Boots"}
sets.precast.JA["Battuta"] = {head="Futhark Bandeau +3"}
sets.precast.JA["Sleight of Sword"] = {hands="Futhark Mitons"}
sets.precast.JA["Inspiration"] = {legs="Futhark Trousers"}
sets.precast.JA["Rayke"] = {feet="Futhark Boots"}
sets.precast.JA["Vivacious Pulse"] = {head="Erilaz galea +2"}

-- Magic 
sets.precast.Fastcast = set_combine(sets.idle.PDT, {
	ammo="Sapience Orb",
    head="Rune. Bandeau +3",
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
	body="Erilaz Surcoat +3",
    legs="Aya. Cosciales +2",
    feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}},    
    neck="Voltsurge Torque",
    left_ear="Odnowa Earring +1",
    right_ring="Defending Ring",
    left_ring="Moonbeam Ring",
	})
	
sets.midcast.Enhancing = {
    head="Erilaz galea +2",
	body="Emet Harness +1",
    hands="Regal Gauntlets",
    legs={ name="Futhark Trousers +2", augments={'Enhances "Inspire" effect',}},
    waist="Rumination Sash",
    left_ear="Odnowa Earring +1",
	right_ear="Mimir Earring",
    right_ring="Defending Ring",
    left_ring="Moonbeam Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},}
	
sets.midcast.Phalanx = {
	ammo="Staunch Tathlum +1",
    head={ name="Fu. Bandeau +3", augments={'Enhances "Battuta" effect',}},
    body={ name="Herculean Vest", augments={'VIT+4','Attack+14','Phalanx +4','Mag. Acc.+14 "Mag.Atk.Bns."+14',}},
    hands={ name="Taeon Gloves", augments={'Evasion+24','"Counter"+3','Phalanx +3',}},
    legs={ name="Taeon Tights", augments={'Phalanx +3',}},
    feet={ name="Taeon Boots", augments={'Phalanx +3',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Flume Belt +1",
    left_ear="Tuisto Earring",
    right_ear="Mimir Earring",
    right_ring="Defending Ring",
    left_ring="Moonbeam Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},
	}
				
sets.midcast.Regen = set_combine(sets.midcast.Enhancing,{
				head="Rune. Bandeau +3"
				})
				
sets.midcast.Refresh = set_combine(sets.midcast.Enhancing,{
				head="Erilaz galea +2",
				})
				
sets.midcast.Cure = set_combine(sets.Enmity,{
				left_ear="Mendi. Earring"
				})
			

-- INT
sets.midcast.Spikes = set_combine(sets.idle.PDT,{lring="Icesoul Ring", rring="Icesoul Ring"})
sets.midcast.Flash = set_combine(sets.Enmity,{})

-- Weaponskills
sets.precast.WS = {ammo="Coiste Bodhar",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Sherida Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Niqmaddu Ring",
    right_ring="Ilabrat Ring",
    back={ name="Ogma's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
	}
	
sets.precast.WS.WSD = {ammo="Knobkierrie",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Caro Necklace",
    waist="Sailfi Belt +1",
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Niqmaddu Ring",
    right_ring="Ilabrat Ring",
    back={ name="Ogma's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
	}
sets.precast.WS.Acc = {}

-- GreatSword
sets.precast.WS["Resolution"] = set_combine(sets.precast.WS, {
})
sets.precast.WS.Acc["Resolution"] = set_combine(sets.precast.WS, {
})	
sets.precast.WS["Shockwave"] = set_combine(sets.precast.WS, {
	ammo="Per. Lucky Egg",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Kurys Gloves",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Sanctity Necklace",
    waist="Chaac Belt",
    left_ear="Digni. Earring",
    right_ear="Hermetic Earring",
    left_ring="Vertigo Ring",
    right_ring="Kishar Ring",
    back={ name="Ogma's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
})				
sets.precast.WS["Dimidiation"] = set_combine(sets.precast.WS.WSD, {
    back={ name="Ogma's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
})
sets.precast.WS["Fell Cleave"] = set_combine(sets.precast.WS.WSD, {
})
sets.precast.WS["Steel Cyclone"] = set_combine(sets.precast.WS.WSD, {
})
sets.precast.WS["Torcleaver"] = set_combine(sets.precast.WS, {
})

sets.precast.WS["Herculean Slash"] = set_combine(sets.precast.WS["Shockwave"], {
})
-- Sword
sets.precast.WS["Requiescat"] = set_combine(sets.precast.WS, {
})
			
-- Misc Sets
sets.precast.Utsusemi = set_combine(sets.precast.Fastcast, {})

sets.misc.Waltz = set_combine(sets.idle.PDT,{})
sets.misc.Steps = set_combine(sets.TP.ACC)
sets.misc.flourish = {}


elseif player.name == 'Derion' then

elseif player.name == 'Aniyah' then

elseif player.name == 'Firetoplay' then

end