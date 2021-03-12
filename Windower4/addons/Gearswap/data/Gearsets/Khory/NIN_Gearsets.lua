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
				ammo="Happo Shuriken",
    head={ name="Dampening Tam", augments={'DEX+10','Accuracy+15','Mag. Acc.+15','Quadruple Attack +3',}},
    body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
    hands={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}},
    legs={ name="Samnuha Tights", augments={'STR+8','DEX+9','"Dbl.Atk."+3','"Triple Atk."+2',}},
    feet={ name="Herculean Boots", augments={'Accuracy+30','"Triple Atk."+3','DEX+1',}},
    neck="Vim Torque +1",
    waist="Windbuffet Belt +1",
    left_ear="Suppanomimi",
    right_ear="Brutal Earring",
    left_ring="Ilabrat Ring",
    right_ring="Epona's Ring",
    back="Sacro Mantle",
	}

sets.idle.MDT = { 
				ammo="Happo Shuriken",
    head={ name="Dampening Tam", augments={'DEX+10','Accuracy+15','Mag. Acc.+15','Quadruple Attack +3',}},
    body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
    hands={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}},
    legs={ name="Samnuha Tights", augments={'STR+8','DEX+9','"Dbl.Atk."+3','"Triple Atk."+2',}},
    feet={ name="Herculean Boots", augments={'Accuracy+30','"Triple Atk."+3','DEX+1',}},
    neck="Vim Torque +1",
    waist="Windbuffet Belt +1",
    left_ear="Suppanomimi",
    right_ear="Brutal Earring",
    left_ring="Ilabrat Ring",
    right_ring="Epona's Ring",
    back="Sacro Mantle",
	}

sets.misc.Town = set_combine(sets.idle.PDT, { 
				feet="Danzo Sune-Ate"})
				
sets.idle.Standard = set_combine(sets.idle.PDT, {
				lear="Merman's Earring", rear="Merman's Earring", feet="Danzo Sune-Ate"})
-- Full Evasion
sets.idle.Evasion = set_combine(sets.idle.PDT,{
			head="Felistris Mask", neck="Torero Torque", lear="Musical Earring", rear="Novia Earring",
            body="Otronif Harness", hands="Otronif Gloves +1", lring="Rajas Ring", rring="Epona's Ring",
            back="Fravashi Mantle", waist="Twilight Belt", legs="Otronif Brais +1",feet="Otronif Boots +1"})

sets.Enmity = {
		neck="Atzintli Necklace",
		back="Fravashi Mantle"}

-- Precast	
sets.precast.Fastcast = set_combine(sets.idle.PDT, {
			head="Athos's Chapeau", lear="Loquac. Earring", rring="Prolix Ring"})

sets.precast.Utsusemi = set_combine(sets.precast.Fastcast, {neck="Magoraga Beads"})

sets.precast.Recast = set_combine(sets.idle.PDT,{
			head="Athos's Chapeau", rear="Loquac. Earring",
			rring="Prolix Ring",
			})
-- Midcast
sets.midcast.Wheel = {
			head="Koga Hatsuburi", neck="Stoicheion Medal", lear="Novio Earring", rear="Friomisi Earring",
			body="Ninja Chainmail", hands="Ninja Tekko", lring="Icesoul Ring", rring="Icesoul Ring",
			back="Toro Cape", waist="Wanion Belt", legs="Ninja Hakama", feet="Ninja Kyahan",
			head="Ninja Hatsuburi", }
			
sets.midcast.Skill = {
			feet="Koga Kyahan"}
sets.midcast.Enfeeb = set_combine(sets.midcast.Skill,{
			lear="Lifestorm Earring", rear="Psystorm Earring",
			lring="Sangoma Ring", rring="Perception Ring"})
sets.midcast.Utsusemi = set_combine(sets.precast.Utsusemi,{
			waist="Twilight Belt", feet="Iga Kyahan +2"})
			
-- TP Sets 
sets.TP = { 
	ammo="Happo Shuriken",
    head={ name="Dampening Tam", augments={'DEX+10','Accuracy+15','Mag. Acc.+15','Quadruple Attack +3',}},
    body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
    hands={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}},
    legs={ name="Samnuha Tights", augments={'STR+8','DEX+9','"Dbl.Atk."+3','"Triple Atk."+2',}},
    feet={ name="Herculean Boots", augments={'Accuracy+30','"Triple Atk."+3','DEX+1',}},
    neck="Vim Torque +1",
    waist="Windbuffet Belt +1",
    left_ear="Suppanomimi",
    right_ear="Brutal Earring",
    left_ring="Ilabrat Ring",
    right_ring="Epona's Ring",
    back="Sacro Mantle",
	}

-- Accuracy TP Set
sets.TP.Acc = {ammo="Ginsen",
			head="Felistris Mask", neck="Asperity Necklace", lear="Dudgeon Earring", rear="Heartseeker Earring",
            body="Thaumas Coat", hands="Otronif Gloves +1", lring="Rajas Ring", rring="Epona's Ring",
            back="Atheling Mantle", waist="Windbuffet Belt", legs="Otronif Brais +1", feet="Manibozho Boots"}

-- Alliance Buffed
sets.TP.Buffed = {ammo="Ginsen",
			head="Felistris Mask", neck="Asperity Necklace", lear="Dudgeon Earring", rear="Heartseeker Earring",
            body="Thaumas Coat", hands="Otronif Gloves +1", lring="Rajas Ring", rring="Epona's Ring",
            back="Atheling Mantle", waist="Windbuffet Belt", legs="Otronif Brais +1", feet="Manibozho Boots"}

-- Hybrid Evasion
sets.TP.Hybrid = set_combine(sets.idle.PDT,{
			head="Felistris Mask", neck="Asperity Necklace", lear="Dudgeon Earring", rear="Heartseeker Earring",
            body="Otronif Harness", hands="Otronif Gloves +1", lring="Rajas Ring", rring="Epona's Ring",
            back="Atheling Mantle", waist="Windbuffet Belt", legs="Otronif Brais +1", feet="Otronif Boots +1"})

-- RA Sets
sets.precast.Snapshot = {legs="Nahtirah Trousers"}

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
    head={ name="Dampening Tam", augments={'DEX+10','Accuracy+15','Mag. Acc.+15','Quadruple Attack +3',}},
    body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
    hands={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}},
    legs={ name="Samnuha Tights", augments={'STR+8','DEX+9','"Dbl.Atk."+3','"Triple Atk."+2',}},
    feet={ name="Herculean Boots", augments={'Accuracy+30','"Triple Atk."+3','DEX+1',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Cessance Earring",
    right_ear="Brutal Earring",
    left_ring="Ilabrat Ring",
    right_ring="Epona's Ring",
    back="Sacro Mantle",
	}
-- Mercy Stroke 
sets.precast.WS["Blade: Jin"] = set_combine(sets.precast.WS, { 
})

sets.precast.WS["Blade: Shun"] = set_combine(sets.precast.WS, { 
})

sets.precast.WS["Blade: Hi"] = set_combine(sets.precast.WS, { 
})
				
sets.precast.WS["Blade: Metsu"] = set_combine(sets.precast.WS, { 
})

sets.precast.WS["Blade: Kamu"] = set_combine(sets.precast.WS, { 
})

sets.misc.Waltz = {}
sets.misc.Steps = set_combine(sets.TP.Acc)
sets.misc.flourish = {}


elseif player.name == 'Derion' then

elseif player.name == 'Aniyah' then

elseif player.name == 'Firetoplay' then

end