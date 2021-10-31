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
			elseif player.sub_job == 'DNC' then 
				set_macro_page(4,7)
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
			end
		else
			set_macro_page(10,7)
		end
		
-- Auto Sets
-- Standard/idle
sets.idle.PDT = { 
	ammo="Staunch Tathlum +1",
    head="Nyame helm",
    body="Nyame mail",
    hands="Turms Mittens +1",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Futhark Torque +1", augments={'Path: A',}},
    waist="Flume Belt +1",
    left_ear="Odnowa Earring +1",
    right_ear="Tuisto Earring",
    left_ring="Defending Ring",
    right_ring="Moonbeam Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},
}


sets.idle.MDT = { 
	ammo="Staunch Tathlum +1",
    head="Nyame helm",
    body="Nyame mail",
    hands="Turms Mittens +1",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Futhark Torque +1", augments={'Path: A',}},
    waist="Flume Belt +1",
    left_ear="Odnowa Earring +1",
    right_ear="Tuisto Earring",
    left_ring="Defending Ring",
    right_ring="Moonbeam Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},
}

sets.misc.Town = set_combine(sets.idle.PDT, {
			right_ring="Shneddick Ring",
			hands="Regal Gauntlets",
			})
				
sets.idle.Standard = set_combine(sets.idle.PDT, {
				right_ring="Shneddick Ring",				
				hands="Regal Gauntlets",
				})
				
sets.idle.Evasion = { 
				head="Felistris Mask", neck="Torero Torque", lear="Musical Earring", rear="Novia Earring",
                body="Iuitl Vest", hands="Iuitl Wristbands +1", lring="Defending Ring", rring=Aug.Darkring1,
                back="Fravashi Mantle", waist="Flume Belt", legs="Iuitl Tights", feet="Iuitl Gaiters"}

sets.Enmity = set_combine(sets.idle.PDT, {
	ammo="Sapience Orb",
	body="Emet Harness +1",
    hands="Kurys Gloves",
	waist="Audumbla Sash",
    legs="Eri. Leg Guards +1",
	feet="Erilaz Greaves +1",
    neck="Unmoving Collar +1",
	rring="Supershear ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},
	})

-- TP set
sets.TP = {
	ammo="Staunch Tathlum +1",
    head="Nyame helm",
    body="Nyame mail",
    hands="Turms Mittens +1",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Futhark Torque +1", augments={'Path: A',}},
    waist="Flume Belt +1",
    left_ear="Odnowa Earring +1",
    right_ear="Tuisto Earring",
    left_ring="Defending Ring",
    right_ring="Moonbeam Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},

    --ammo="Staunch Tathlum +1",
    --head="Aya. Zucchetto +2",
    --body="Ayanmo Corazza +2",
    --hands="Turms Mittens +1",
	--head={ name="Dampening Tam", augments={'DEX+10','Accuracy+15','Mag. Acc.+15','Quadruple Attack +3',}},
    --body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    --hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    --legs="Meg. Chausses +2",
    --feet={ name="Herculean Boots", augments={'Accuracy+30','"Triple Atk."+3','DEX+1',}},
    --neck={ name="Futhark Torque +1", augments={'Path: A',}},
    --waist="Ioskeha Belt +1",
    --left_ear="Sherida Earring",
    --right_ear="Telos Earring",
    --left_ring="Defending Ring",
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
    body="Nyame Mail",
    hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Sortiarius Earring",
    left_ring="Mujin Band",
    right_ring="Vertigo Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},
	}
sets.precast.JA["Valiance"] = {body="Runeist's Coat +2"}
sets.precast.JA["Vallation"] = {body="Runeist's Coat +2"}
sets.precast.JA["Gambit"] = {hands="Runiest Mitons"}
sets.precast.JA["Pflug"] = {feet="Runiest Boots"}
sets.precast.JA["Battuta"] = {head="Futhark Bandeau +2"}
sets.precast.JA["Sleight of Sword"] = {hands="Futhark Mitons"}
sets.precast.JA["Inspiration"] = {legs="Futhark Trousers"}
sets.precast.JA["Rayke"] = {feet="Futhark Boots"}
sets.precast.JA["Vivacious Pulse"] = {head="Erilaz galea +1"}

-- Magic 
sets.precast.Fastcast = set_combine(sets.idle.PDT, {
	ammo="Sapience Orb",
    head="Rune. Bandeau +1",
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs="Aya. Cosciales +2",
    feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}},    
    neck="Unmoving Collar +1",
    left_ear="Odnowa Earring +1",
    left_ring="Defending Ring",
    right_ring="Moonbeam Ring",
	})
	
sets.midcast.Enhancing = {
    head="Erilaz Galea +1",
	body="Emet Harness +1",
    hands="Regal Gauntlets",
    legs={ name="Futhark Trousers +1", augments={'Enhances "Inspire" effect',}},
    waist="Rumination Sash",
    left_ear="Odnowa Earring +1",
    left_ring="Defending Ring",
    right_ring="Moonbeam Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},}
	
sets.midcast.Phalanx = set_combine(sets.midcast.Enhancing,{
				head="Futhark Bandeau +2"
				})
				
sets.midcast.Regen = set_combine(sets.midcast.Enhancing,{
				head="Rune. Bandeau +1"
				})

-- INT
sets.midcast.Spikes = set_combine(sets.idle.PDT,{lring="Icesoul Ring", rring="Icesoul Ring"})
sets.midcast.Flash = set_combine(sets.Enmity,{})

-- Weaponskills
sets.precast.WS = {ammo="Coiste Bodhar",
    head={ name="Dampening Tam", augments={'DEX+10','Accuracy+15','Mag. Acc.+15','Quadruple Attack +3',}},
    body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
    hands={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}},
    legs="Nyame Flanchard",
    feet={ name="Herculean Boots", augments={'Accuracy+30','"Triple Atk."+3','DEX+1',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Sherida Earring",
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
sets.precast.WS["Dimidiation"] = set_combine(sets.precast.WS, {
	ammo="Knobkierrie",
    head={ name="Herculean Helm", augments={'Weapon skill damage +5%','STR+9','Accuracy+7','Attack+8',}},
    body={ name="Herculean Vest", augments={'Accuracy+15','Weapon skill damage +5%',}},
    hands="Meg. Gloves +2",
    legs="Nyame Flanchard",
    feet={ name="Lustra. Leggings +1", augments={'Accuracy+20','DEX+8','Crit. hit rate+3%',}},
    neck="Caro Necklace",
    waist="Sailfi Belt +1",
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Niqmaddu Ring",
    right_ring="Ilabrat Ring",
    back={ name="Ogma's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
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