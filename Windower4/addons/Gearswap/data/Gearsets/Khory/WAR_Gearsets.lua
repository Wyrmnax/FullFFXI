-- WAR Gear_sets
-- Created: 6/1/2014
-- Last Modified: 6/14/2014
-- To Do
--

if player.name == 'Khory' then
-- includes
	include('include/utility.lua')
	include('include/mappings.lua')
	include('include/equipment.lua')
	-- include('../include/autoexec.lua')	
	
	--send_command('wait 6;input /lockstyleset 1')
	
-- sets Macros off = 0  on = 1
		automacroset = 1
		if automacroset == 1 then
			if player.sub_job == 'DRG' then
				set_macro_page(1,12)
			elseif player.sub_job == 'SAM' then
				set_macro_page(2,12)
			elseif player.sub_job == 'DNC' then
				set_macro_page(3,12)
			elseif player.sub_job == 'MNK' then 
				set_macro_page(4,12)
			elseif player.sub_job == 'NIN' then 
				set_macro_page(5,12)
			end
		else
			set_macro_page(1,12)
		end
		
-- Auto Sets
	
--Maximum Multi Attack set	
--	    sets.Engaged = {
--        ammo="Coiste Bodhar",
--        head="Flam. Zucchetto +2",
--        body="Sakpata's Plate", --da5 augment
--        hands="Sakpata's Gauntlets",
--        legs=Pumm_Legs,
--        feet=Pumm_Feet,
--        neck="War. Beads +2",
--        waist="Ioskeha Belt +1 +1",
--        left_ear="Schere Earring",
--        right_ear="Telos Earring",
--        left_ring="Flamma Ring",--"Regal Ring",                
--        right_ring="Niqmaddu Ring",
--        back=back_Cichol_Melee,                 -- da 10
--    } 
	
-- Standard/idle
sets.idle.DT = { 
	 ammo="Coiste Bodhar",
    head="Sakpata's Helm",
    body="Sacro Breastplate",
    hands="Sakpata's Gauntlets",
    legs="Sakpata's Cuisses",
    feet="Sakpata's Leggings",	
    neck={ name="Vim Torque +1", augments={'Path: A',}},
    --neck={ name="War. Beads +2", augments={'Path: A',}},
    waist="Ioskeha Belt +1",
    left_ear="Cessance Earring",	
	--left_ear="Suppanomimi",
    right_ear="Schere Earring",
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}

sets.misc.Town = set_combine(sets.idle.DT, {right_ring="Shneddick Ring"})
				
sets.idle.Standard = set_combine(sets.misc.Town, {
				})

sets.Enmity = {}

-- TP sets

--Standard TP
sets.TP = {  
	ammo="Coiste Bodhar",
    head="Flam. Zucchetto +2",
    body="Sakpata's Plate",
    hands="Sakpata's Gauntlets",
    legs="Pumm. Cuisses +3",
    feet="Pumm. Calligae +3",
    neck={ name="Vim Torque +1", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Telos Earring",
    right_ear="Schere Earring",
	--left_ear="Suppanomimi",
    left_ring="Hetairoi Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},	
	}
	
					
sets.TP.DT = set_combine(sets.TP, {
	ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Sakpata's Helm",
    body="Sakpata's Plate",
    hands="Sakpata's Gauntlets",
    legs="Sakpata's Cuisses",
    feet="Sakpata's Leggings",
    neck={ name="Vim Torque +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Brutal Earring",
    right_ear="Schere Earring",
    left_ring="Hetairoi Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
				})
	
sets.TP.DW = set_combine(sets.TP,{
	hands={ name="Emi. Gauntlets +1", augments={'Accuracy+25','"Dual Wield"+6','Pet: Accuracy+25',}},
    left_ear="Suppanomimi",
	})

sets.TP.DW.DT = set_combine(sets.TP.DT, {
	hands={ name="Emi. Gauntlets +1", augments={'Accuracy+25','"Dual Wield"+6','Pet: Accuracy+25',}},
    left_ear="Suppanomimi",
				})	

--sets.TP.DW.ATK = set_combine(sets.TP, {
--				})
	
--sets.TP.DW.DT.ATK = set_combine(sets.TP, {
--				})


--sets.TP.DT.ATK = set_combine(sets.TP.DT, {
--	})
	
--sets.TP.ATK = set_combine(sets.TP.DT, {
--				})
				
	
sets.TH = {
	ammo="Per. Lucky Egg",
    head="Volte Cap",
	waist="Chaac Belt",
    legs={ name="Valorous Hose", augments={'Crit. hit damage +2%','MND+13','"Treasure Hunter"+1','Accuracy+1 Attack+1','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
	}

-- JA
sets.precast.JA["Mighty Strikes"] = {hands="Agoge Mufflers"}
sets.precast.JA["Brazen Rush"] = {}

sets.precast.JA["Provoke"] = set_combine(sets.Enmity, sets.TH)
sets.precast.JA["Berserk"] = {body="Pumm. Lorica +3", feet="Agoge Calligae +1"}
sets.precast.JA["Defender"] = {}
sets.precast.JA["Warcry"] = {head="Agoge Mask +3"}
sets.precast.JA["Aggressor"] = {head="Pummeler's Mask", body="Sakpata's Plate"}
sets.precast.JA["Tomahawk"] = {ammo="Thr. Tomahawk", feet="Warrior's Calligae +2"}
sets.precast.JA["Restraint"] = {hands="Ravager's Mufflers +2"}
sets.precast.JA["Warrior's Charge"] = {legs="Warrior Cuisses +2"}
sets.precast.JA["Savagery"] = {head="Warrior's Mask +2"}
sets.precast.JA["Aggressive Aim"] = {body="Warrior's Lorica +2"}

-- Weaponskills
sets.precast.WS = {    
    ammo="Seeth. Bomblet +1",
	--head="Sakpata's Helm",
    --body="Sakpata's Plate",
    --hands="Sakpata's Gauntlets",
    --feet="Sakpata's Leggings",
    head="Flam. Zucchetto +2",
    body={ name="Argosy Hauberk +1", augments={'STR+12','DEX+12','Attack+20',}},
    hands={ name="Argosy Mufflers +1", augments={'STR+20','"Dbl.Atk."+3','Haste+3%',}},
    feet="Flam. Gambieras +2",
    legs="Nyame Flanchard",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Cessance Earring",
    right_ear="Schere Earring",
    left_ring="Flamma Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
		
sets.precast.WS.wsd = {
	ammo="Knobkierrie",
    head="Agoge Mask +3",
    body="Pumm. Lorica +3",
    hands={ name="Valorous Mitts", augments={'Accuracy+7','STR+4','Weapon skill damage +9%','Accuracy+19 Attack+19','Mag. Acc.+15 "Mag.Atk.Bns."+15',}},
    legs="Nyame Flanchard",
    feet="Sulev. Leggings +2",
    neck="War. Beads +2",
    waist="Sailfi Belt +1",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Thrud Earring",
    right_ring="Niqmaddu Ring",
    left_ring="Beithir Ring",
    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
	}

-- THIS IS NOT WORKING!	
sets.precast.WS.MAB = {
	ammo="Seeth. Bomblet +1",
    head="Nyame Helm",
    body="Sacro Breastplate",
    hands={ name="Valorous Mitts", augments={'Accuracy+7','STR+4','Weapon skill damage +9%','Accuracy+19 Attack+19','Mag. Acc.+15 "Mag.Atk.Bns."+15',}},
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Sanctity Necklace",
    waist="Orpheus's Sash",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Friomisi Earring",
    left_ring="Beithir Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
		
--Axe		
	sets.precast.WS["Decimation"] = set_combine(sets.precast.WS, { 
	})
	
	sets.precast.WS["Mistral Axe"] = set_combine(sets.precast.WS.wsd, { 
	})
	
	sets.precast.WS["Cloudsplitter"] = set_combine(sets.precast.WS.MAB, { 	
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	})
	
--Sword
	sets.precast.WS["Savage Blade"] = set_combine(sets.precast.WS.wsd, { 	
    neck="War. Beads +2",
	--hands="Sakpata's Gauntlets",
    --legs="Sakpata's Cuisses",
	--right_ring="Defending Ring",
	})
	
	sets.precast.WS["Seraph Blade"] = set_combine(sets.precast.WS.MAB, { 	
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	})
	
	sets.precast.WS["Red Lotus Blade"] = set_combine(sets.precast.WS.MAB, { 	
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	})
	
	sets.precast.WS["Sanguine Blade"] = set_combine(sets.precast.WS.MAB, { 	
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	})
	
	sets.precast.WS["Circle Blade"] = set_combine(sets.precast.WS.wsd, sets.TH)
	
	sets.precast.WS["Requiescat"] = set_combine(sets.precast.WS, sets.TH)
	
-- Great Axe
sets.precast.WS["Ukko's Fury"] = set_combine(sets.precast.WS.wsd, { 

})

sets.precast.WS["King's Justice"] = set_combine(sets.precast.WS.wsd, {   
})
				
sets.precast.WS["Upheaval"] = set_combine(sets.precast.WS.wsd, {   
    neck="War.Beads +2",	
	waist="Ioskeha Belt +1",	
    back={ name="Cichol's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
})
				
sets.precast.WS["Fell Cleave"] = set_combine(sets.precast.WS.wsd, sets.TH)

sets.precast.WS["Full Break"] = set_combine(sets.precast.WS.wsd, {    
})

sets.precast.WS["Steel Cyclone"] = set_combine(sets.precast.WS.wsd, {  
})

-- GreatSword
sets.precast.WS["Resolution"] = set_combine(sets.precast.WS, {
	})
				
-- Dagger
sets.precast.WS["Aeolian Edge"] = set_combine(sets.precast.WS, 
	{ammo="Seeth. Bomblet +1",
    head={ name="Jumalik Helm", augments={'MND+10','"Mag.Atk.Bns."+15','Magic burst dmg.+10%','"Refresh"+1',}},
    body={ name="Found. Breastplate", augments={'Accuracy+14','Mag. Acc.+13','Attack+14','"Mag.Atk.Bns."+14',}},
    hands={ name="Valorous Mitts", augments={'Accuracy+7','STR+4','Weapon skill damage +9%','Accuracy+19 Attack+19','Mag. Acc.+15 "Mag.Atk.Bns."+15',}},
    legs="Nyame Flanchard",
    feet={ name="Valorous Greaves", augments={'Pet: Haste+4','Crit.hit rate+3','Weapon skill damage +6%','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Moldavite Earring",
    right_ring="Niqmaddu Ring",
    left_ring="Flamma Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	})

-- Polearm
sets.precast.WS['Impulse Drive'] = set_combine(sets.precast.WS.wsd, 
{
})

sets.precast.WS['Sonic Thrust'] = set_combine(sets.precast.WS.wsd, 
{
})

-- Club
sets.precast.WS['Black Halo'] = set_combine(sets.precast.WS.wsd, 
{
})

sets.precast.WS['Judgment'] = set_combine(sets.precast.WS.wsd, 
{
})

				
-- Misc Sets
sets.precast.Fastcast = set_combine(sets.idle.DT, {
				head="Cizin Helm", 
				lear="Loquac. Earring", 
				body="Sacro Breastplate",
				rring="Prolix Ring"})

sets.precast.Utsusemi = set_combine(sets.precast.Fastcast, {neck="Magoraga Beads"})

sets.misc.Waltz = set_combine(sets.idle.DT,{})
sets.misc.Steps = set_combine(sets.TP.ACC)
sets.misc.flourish = {}

end
