-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end


-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.Buff.Migawari = buffactive.migawari or false
    state.Buff.Doom = buffactive.doom or false
    state.Buff.Yonin = buffactive.Yonin or false
    state.Buff.Innin = buffactive.Innin or false
    state.Buff.Futae = buffactive.Futae or false
	state.HasteMode = M{['description']='Haste Mode', 'Hi', 'Normal'}

    determine_haste_group()
end
-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal','Acc','FullAcc')
    state.HybridMode:options('Normal','Tank')
    state.RangedMode:options('Normal','Acc')
    state.WeaponskillMode:options('Match','Normal','Acc','FullAcc','Proc')
    state.CastingMode:options('Normal','Proc','Resistant')
    state.IdleMode:options('Normal','PDT','refresh','Crafting','Fishing')
    state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')

    gear.MovementFeet = {name="Danzo Sune-ate"}
    gear.DayFeet = "Danzo Sune-ate"
    gear.NightFeet = "Hachiya Kyahan"
    
    select_movement_feet()
    select_default_macro_book()
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Precast sets
    --------------------------------------

    sets.Enmity = {
		neck="Moonlight Necklace",
		ear1="Trux Earring",
		ear2="Cryptic Earring",
		body="Emet Harness +1",
		legs="Zoar Subligar +1",
		ring1="Begrudging Ring",
		ring2="Eihwaz Ring",
		feet="Mochizuki Kyahan +3"}
	
    -- Precast sets to enhance JAs
    sets.precast.JA['Mijin Gakure'] = {legs="Mochizuki Hakama +3"}
    sets.precast.JA['Futae'] = {hands="Hattori Tekko +1"}
    sets.precast.JA['Sange'] = {body="Mochizuki Chainmail +3"}
	sets.precast.JA['Provoke'] = sets.Enmity
	sets.precast.JA['Warcry'] = sets.Enmity
	sets.precast.JA['Swipe'] = {
        head="Mochizuki Hatsuburi +3",neck="Baetyl Pendant",ear1="Friomisi Earring",ear2="Crematio Earring",
        body="Samnuha Coat",hands="Nyame Gauntlets",ring1="Dingin Ring",ring2="Mujin Band",
		back={ name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
        waist="Orpheus's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}--Hachiya Kyahan +3
	sets.precast.JA['Lunge'] = sets.precast.JA['Swipe']

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        head="Mummu Bonnet +2",
        body="Passion Jacket",hands="Slither Gloves",ring1="Defending Ring",
        back="Moonlight Cape",waist="Flume Belt +1",legs="Dashing Subligar"}
	
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Set for acc on steps, since Yonin drops acc a fair bit
    sets.precast.Step = {ear1="Mache Earring +1"}

    sets.precast.Flourish1 = {ammo="Happo Shuriken +1",
        head="Malignance Chapeau",neck="Ninja Nodowa +2",ear1="Trux Earring",ear2="Dignitary's Earring",
        body="Malignance Tabard",hands="Malignance Gloves",
        back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
		waist="Reiki Yotai",legs="Mummu Kecks +2",feet="Malignance Boots"}

    -- Fast cast sets for spells
    
    sets.precast.FC = {
		ammo="Sapience Orb",
    head={ name="Herculean Helm", augments={'"Mag.Atk.Bns."+18','"Fast Cast"+6',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs={ name="Herculean Trousers", augments={'"Mag.Atk.Bns."+11','"Fast Cast"+5','Mag. Acc.+12',}},
    feet={ name="Herculean Boots", augments={'"Fast Cast"+5','MND+3',}},
    neck="Voltsurge Torque",
    waist="Eschan Stone",
    left_ear="Loquac. Earring",
    right_ear="Tuisto Earring",
    left_ring="Weather. Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back={ name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}}}
		
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {
		neck="Magoraga Beads",
		body="Mochizuki Chainmail +3",
		back={ name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}}})

	sets.precast.FC.Shadows = set_combine(sets.precast.FC.Utsusemi, {})

    -- Snapshot for ranged
    sets.precast.RA = {
		head="Taeon Chapeau",
		waist="Impulse Belt"}

    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
		head="Hachiya Hatsuburi +2",neck="Fotia Gorget",ear1="Ishvara Earring",ear2="Moonshade Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Epaminondas's Ring",ring2="Karieyh Ring +1",
		back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}},
		waist="Fotia Belt",legs="Mochizuki Hakama +3",feet="Nyame Sollerets"}
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {})
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, {})
	sets.precast.WS.Proc = {
        head="Volte Cap",neck=empty,ear1=empty,ear2=empty,
        body="Volte Jupon",hands="Volte Gloves",ring1="Defending Ring",ring2=empty,
        back="Moonlight Cape",waist="Flume Belt +1",legs=empty,feet=empty}
	
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Blade: Chi'] = set_combine(sets.precast.WS, {--ammo="Seething Bomblet +1",
		head="Mochizuki Hatsuburi +3",neck="Ninja Nodowa +2",ear1="Lugra Earring +1",ear2="Crematio Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",
		waist="Orpheus's Sash",feet="Nyame Sollerets"})
	sets.precast.WS['Blade: Chi'].Acc = set_combine(sets.precast.WS['Blade: Chi'], {})
	sets.precast.WS['Blade: Chi'].FullAcc = set_combine(sets.precast.WS['Blade: Chi'], {})

    sets.precast.WS['Blade: Ten'] = set_combine(sets.precast.WS, {--ammo="Seething Bomblet +1",
		head="Mpaca's Cap",neck="Ninja Nodowa +2",ear1="Lugra Earring +1",
		ring1="Hetairoi Ring",ring2="Regal Ring",
		waist="Sailfi Belt +1"})
    sets.precast.WS['Blade: Ten'].Acc = set_combine(sets.precast.WS['Blade: Ten'], {
		hands="Adhemar Wristbands +1"})
    sets.precast.WS['Blade: Ten'].FullAcc = set_combine(sets.precast.WS['Blade: Ten'], {
		hands="Adhemar Wristbands +1"})

    sets.precast.WS['Blade: Kamu'] = set_combine(sets.precast.WS, {--ammo="Seething Bomblet +1",
		ear1="Lugra Earring +1",ear2="Balder Earring +1",
		body="Mochizuki Chainmail +3",hands="Mpaca's Gloves",ring1="Regal Ring",ring2="Epona's Ring",--ring1="Gere Ring"
		waist="Sailfi Belt +1",feet="Mochizuki Kyahan +3"})
    sets.precast.WS['Blade: Kamu'].Acc = set_combine(sets.precast.WS['Blade: Kamu'], {
		neck="Ninja Nodowa +2",ear2="Balder Earring +1",
		body="Kendatsuba Samue +1",
		feet="Ryuo Sune-Ate +1"})
    sets.precast.WS['Blade: Kamu'].FullAcc = set_combine(sets.precast.WS['Blade: Kamu'], {
		neck="Ninja Nodowa +2",ear2="Mache Earring +1",
		body="Kendatsuba Samue +1",
		feet="Ryuo Sune-Ate +1"})
	
	sets.precast.WS['Blade: Hi'] = set_combine(sets.precast.WS, {--ammo="Yetshila +1",
		neck="Ninja Nodowa +2",ear1="Ishvara Earring",ear2="Odr Earring",
		body="Kendatsuba Samue +1",hands="Mummu Wrists +2",ring1="Begrudging Ring",ring2="Regal Ring",
		waist="Sailfi Belt +1",feet="Mummu Gamashes +2"})
    sets.precast.WS['Blade: Hi'].Acc = set_combine(sets.precast.WS['Blade: Hi'], {})
    sets.precast.WS['Blade: Hi'].FullAcc = set_combine(sets.precast.WS['Blade: Hi'], {})

    sets.precast.WS['Blade: Shun'] = set_combine(sets.precast.WS, {--ammo="Aurgelmir Orb +1",
		head="Kendatsuba Jinpachi +1",ear1="Lugra Earring +1",ear2="Odr Earring",
		body="Kendatsuba Samue +1",hands="Kendatsuba Tekko +1",ring1="Ilabrat Ring",ring2="Regal Ring",--ring1="Gere Ring"
		feet="Kendatsuba Sune-Ate +1"})
    sets.precast.WS['Blade: Shun'].Acc = set_combine(sets.precast.WS['Blade: Shun'], {--ammo="Aurgelmir Orb +1",
		head="Kendatsuba Jinpachi +1",neck="Ninja Nodowa +2",
		hands="Kendatsuba Tekko +1"})
    sets.precast.WS['Blade: Shun'].FullAcc = set_combine(sets.precast.WS['Blade: Shun'], {--ammo="Aurgelmir Orb +1",
		head="Kendatsuba Jinpachi +1",neck="Ninja Nodowa +2",
		hands="Kendatsuba Tekko +1"})

	sets.precast.WS['Blade: Yu'] = sets.precast.WS['Blade: Chi']

    sets.precast.WS['Aeolian Edge'] = sets.precast.WS['Blade: Chi']
	
	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {--ammo="Seething Bomblet +1",
		neck="Ninja Nodowa +2",ear1="Lugra Earring +1",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Regal Ring"})
    sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS['Savage Blade'], {})
    sets.precast.WS['Savage Blade'].FullAcc = set_combine(sets.precast.WS['Savage Blade'], {})

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.HeadMaxTp = {head="Hachiya Hatsuburi +2"}
	sets.MaxTP = {ear1="Lugra Earring +1",ear2="Balder Earring +1",}
	sets.AccMaxTP = {ear1="Lugra Earring +1",ear2="Telos Earring"}
	sets.DayMaxTPWSEars = {ear1="Mache Earring +1",ear2="Balder Earring +1"}
	sets.AccDayMaxTPWSEars = {ear1="Mache Earring +1",ear2="Telos Earring"}

	sets.Skillchain = {ring1="Mujin Band",legs="Ryuo Hakama +1"}

    
    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {
		head="Herculean Helm",neck="Orunmila's Torque",ear1="Enchanter Earring +1",ear2="Etiolation Earring",
		body="Samnuha Coat",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Prolix Ring",
		back={ name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
		legs="Arjuna Breeches"}

    sets.midcast.ElementalNinjutsu = {ammo="Yamarang",
		head="Mochizuki Hatsuburi +3",neck="Baetyl Pendant",ear1="Friomisi Earring",ear2="Crematio Earring",
		body="Nyame Mail",hands="Herculean Gloves",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		back={ name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
		waist="Orpheus's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.midcast.ElementalNinjutsu.Proc = sets.midcast.FastRecast
		
    sets.midcast.ElementalNinjutsu.Resistant = set_combine(sets.midcast.ElementalNinjutsu, {hands="Nyame Gauntlets"})
	
	sets.MagicBurst = set_combine(sets.midcast.ElementalNinjutsu, {
		body="Samnuha Coat",hands="Nyame Gauntlets",ring2="Mujin Band"}) --feet="Hachiya Kyahan +3"
	
	sets.element.Earth = {}

    sets.midcast.NinjutsuDebuff = {ammo="Yamarang",
        head="Hachiya Hatsuburi +2",neck="Incanter's Torque",ear1="Dignitary's Earring",ear2="Enchanter Earring +1",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
        back={ name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
		waist="Eschan Stone",legs="Nyame Flanchard",feet="Mochizuki Kyahan +3"}

    sets.midcast.NinjutsuBuff = set_combine(sets.midcast.FastRecast, {hands="Mochizuki Tekko +3"})
	
    sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {
		hands="Mochizuki Tekko +3",
		back={ name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
		feet="Hattori Kyahan +1"})

	sets.midcast['Flash'] = sets.Enmity

    sets.midcast.RA = {ammo="Happo Shuriken",
        head="Mummu Bonnet +2",neck="Combatant's Torque",ear2="Telos Earring",
        body="Ashera Harness",hands="Hachiya Tekko +2",ring1="Ilabrat Ring",ring2="Regal Ring",
        back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}},
		waist="Yemaya Belt",legs="Mummu Kecks +2",feet="Mummu Gamashes +2"}
		
    sets.midcast.RA.Acc = {ammo="Happo Shuriken",
        head="Mummu Bonnet +2",neck="Combatant's Torque",ear2="Telos Earring",
        body="Ashera Harness",hands="Hachiya Tekko +2",ring1="Ilabrat Ring",ring2="Regal Ring",
        back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}},
		waist="Yemaya Belt",legs="Mummu Kecks +2",feet="Mummu Gamashes +2"}

    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
    
    -- Resting sets
    sets.resting = {}

    -- Idle sets
    sets.idle = {
        head="Malignance Chapeau",neck="Sanctity Necklace",ear1="Etiolation Earring",ear2="Eabani Earring",
        body="Hizamaru Haramaki +2",hands="Malignance Gloves",ring1="Defending Ring",ring2="Karieyh Ring +1",
        back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
		waist="Flume Belt +1",legs="Nyame Flanchard",feet="Malignance Boots"}--Malignance Tights

    sets.idle.PDT = {ammo="Crepuscular Pebble",
        head="Malignance Chapeau",neck="Sanctity Necklace",ear1="Etiolation Earring",ear2="Eabani Earring",
        body="Malignance Tabard",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Gelatinous Ring +1",
        back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
		waist="Flume Belt +1",legs="Nyame Flanchard",feet="Malignance Boots"}--Malignance Tights

	sets.idle.refresh = {
        head="Malignance Chapeau",neck="Sanctity Necklace",ear1="Etiolation Earring",ear2="Eabani Earring",
        body="Mekosuchinae Harness",hands="Malignance Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
        back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
		waist="Flume Belt +1",legs="Nyame Flanchard",feet="Malignance Boots"}--Malignance Tights
		
    sets.idle.Weak = {
        head="Malignance Chapeau",neck="Sanctity Necklace",ear1="Etiolation Earring",ear2="Eabani Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Karieyh Ring +1",
        back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
		waist="Flume Belt +1",legs="Nyame Flanchard",feet="Malignance Boots"}--Malignance Tights

	sets.idle.Crafting = {main="Caduceus",sub="Plaiter's Escutcheon",
		head="Magnifying Spectacles",neck="Weaver's Torque",
		body="Weaver's Smock",ring1="Craftkeeper's Ring",
		back="Shaper's Shawl"}

	sets.idle.Fishing = {range="Ebisu Fishing Rod",
		head="Tlahtlamah Glasses",neck="Fisher's Torque",
		body="Fisherman's Smock",hands="Angler's Gloves",
		back="Shaper's Shawl",legs="Angler's Hose",feet="Waders"}
    
    -- Defense sets
    sets.defense.PDT = {ammo="Crepuscular Pebble",
        head="Malignance Chapeau",neck="Sanctity Necklace",ear1="Etiolation Earring",ear2="Eabani Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Warden's Ring",
        back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
		waist="Flume Belt +1",legs="Nyame Flanchard",feet="Malignance Boots"}--Malignance Tights

    sets.defense.MDT = {ammo="Crepuscular Pebble",
        head="Malignance Chapeau",neck="Sanctity Necklace",ear1="Etiolation Earring",ear2="Eabani Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Warden's Ring",
        back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
		waist="Flume Belt +1",legs="Nyame Flanchard",feet="Malignance Boots"}--Malignance Tights
		
	sets.defense.MEVA = {ammo="Crepuscular Pebble",
        head="Malignance Chapeau",neck="Sanctity Necklace",ear1="Etiolation Earring",ear2="Eabani Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Warden's Ring",
        back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
		waist="Flume Belt +1",legs="Nyame Flanchard",feet="Malignance Boots"}--Malignance Tights


    sets.Kiting = {feet="Danzo Sune-Ate"}
	sets.DuskKiting = {feet="Hachiya Kyahan +2"}
	sets.DuskIdle = {}
	sets.DayIdle = {}
	sets.NightIdle = {}

    --------------------------------------
    -- Engaged sets
    --------------------------------------

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.PDT
    
    -- Normal melee group (39% DW - 0%Haste)
    sets.engaged = {ammo="Happo Shuriken +1",
        head="Ryuo Somen +1",neck="Ninja Nodowa +2",ear1="Dedition Earring",ear2="Balder Earring +1",
        body="Adhemar Jacket +1",hands="Hachiya Tekko +2",ring1="Hetairoi Ring",ring2="Epona's Ring",--ring1="Gere Ring"
        back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
		waist="Reiki Yotai",legs="Mochizuki Hakama +3",feet="Hizamaru Sune-Ate +2"}
    sets.engaged.Acc = {ammo="Happo Shuriken +1",
        head="Ryuo Somen +1",neck="Ninja Nodowa +2",ear1="Telos Earring",ear2="Balder Earring +1",
        body="Mochizuki Chainmail +3",hands="Adhemar Wristbands +1",ring1="Hetairoi Ring",ring2="Epona's Ring",--ring1="Gere Ring"
        back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
		waist="Reiki Yotai",legs="Mochizuki Hakama +3",feet="Hizamaru Sune-Ate +2"}
    sets.engaged.FullAcc = {ammo="Happo Shuriken +1",
        head="Ryuo Somen +1",neck="Ninja Nodowa +2",ear1="Telos Earring",ear2="Odr Earring",
        body="Mochizuki Chainmail +3",hands="Adhemar Wristbands +1",ring1="Ilabrat Ring",ring2="Regal Ring",--ring1="Gere Ring"
        back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
		waist="Reiki Yotai",legs="Mochizuki Hakama +3",feet="Hizamaru Sune-Ate +2"}

    sets.engaged.Tank = {ammo="Yamarang",
		head="Ryuo Somen +1",neck="Unmoving Collar +1",ear1="Trux Earring",ear2="Eabani Earring",
        body="Mpaca's Doublet",hands="Mpaca's Gloves",ring1="Begrudging Ring",ring2="Epona's Ring",
        back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
		waist="Reiki Yotai",legs="Mochizuki Hakama +3",feet="Hizamaru Sune-Ate +2"}
    sets.engaged.Acc.Tank = {ammo="Yamarang",
		head="Ryuo Somen +1",neck="Unmoving Collar +1",ear1="Trux Earring",ear2="Eabani Earring",
        body="Mpaca's Doublet",hands="Mpaca's Gloves",ring1="Begrudging Ring",ring2="Epona's Ring",
        back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
		waist="Reiki Yotai",legs="Mochizuki Hakama +3",feet="Hizamaru Sune-Ate +2"}
    sets.engaged.FullAcc.Tank = {ammo="Yamarang",
		head="Ryuo Somen +1",neck="Unmoving Collar +1",ear1="Trux Earring",ear2="Eabani Earring",
        body="Mpaca's Doublet",hands="Mpaca's Gloves",ring1="Begrudging Ring",ring2="Regal Ring",
        back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
		waist="Reiki Yotai",legs="Mochizuki Hakama +3",feet="Hizamaru Sune-Ate +2"}

    -- Low Haste melee group (32% DW - 15%Haste)
    sets.engaged.Haste_15 = {ammo="Happo Shuriken +1",
        head="Hattori Zukin +1",neck="Ninja Nodowa +2",ear1="Dedition Earring",ear2="Balder Earring +1",
        body="Mochizuki Chainmail +3",hands="Hachiya Tekko +2",ring1="Hetairoi Ring",ring2="Epona's Ring",--ring1="Gere Ring"
        back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
		waist="Gerdr Belt +1",legs="Hachiya Hakama +2",feet="Hizamaru Sune-Ate +2"}
    sets.engaged.Acc.Haste_15 = {ammo="Happo Shuriken +1",
        head="Ryuo Somen +1",neck="Ninja Nodowa +2",ear1="Telos Earring",ear2="Balder Earring +1",
        body="Mochizuki Chainmail +3",hands="Mpaca's Gloves",ring1="Hetairoi Ring",ring2="Epona's Ring",--ring1="Gere Ring"
        back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
		waist="Gerdr Belt +1",legs="Mochizuki Hakama +3",feet="Kendatsuba Sune-Ate +1"}
    sets.engaged.FullAcc.Haste_15 = {ammo="Happo Shuriken +1",
        head="Ryuo Somen +1",neck="Ninja Nodowa +2",ear1="Telos Earring",ear2="Odr Earring",
        body="Mochizuki Chainmail +3",hands="Mpaca's Gloves",ring1="Ilabrat Ring",ring2="Regal Ring",--ring1="Gere Ring"
        back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
		waist="Gerdr Belt +1",legs="Mochizuki Hakama +3",feet="Kendatsuba Sune-Ate +1"}

    sets.engaged.Tank.Haste_15 = {ammo="Yamarang",
		head="Ryuo Somen +1",neck="Unmoving Collar +1",ear1="Trux Earring",ear2="Cryptic Earring",
        body="Mpaca's Doublet",hands="Mpaca's Gloves",ring1="Begrudging Ring",ring2="Epona's Ring",
        back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
		waist="Patentia Sash",legs="Mochizuki Hakama +3",feet="Hizamaru Sune-Ate +2"}
    sets.engaged.Acc.Tank.Haste_15 = {ammo="Yamarang",
		head="Ryuo Somen +1",neck="Unmoving Collar +1",ear1="Trux Earring",ear2="Cryptic Earring",
        body="Mpaca's Doublet",hands="Hachiya Tekko +2",ring1="Begrudging Ring",ring2="Epona's Ring",
        back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
		waist="Gerdr Belt +1",legs="Mochizuki Hakama +3",feet="Hizamaru Sune-Ate +2"}
    sets.engaged.FullAcc.Tank.Haste_15 = {ammo="Yamarang",
		head="Ryuo Somen +1",neck="Unmoving Collar +1",ear1="Trux Earring",ear2="Cryptic Earring",
        body="Mpaca's Doublet",hands="Hachiya Tekko +2",ring1="Begrudging Ring",ring2="Regal Ring",
        back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
		waist="Gerdr Belt +1",legs="Mochizuki Hakama +3",feet="Hizamaru Sune-Ate +2"}

    -- High Haste melee group (20% DW - 30%Haste)
    sets.engaged.Haste_30 = {ammo="Happo Shuriken +1",
        head="Hattori Zukin +1",neck="Ninja Nodowa +2",ear1="Dedition Earring",ear2="Balder Earring +1",
        body="Mochizuki Chainmail +3",hands="Hachiya Tekko +2",ring1="Hetairoi Ring",ring2="Epona's Ring",--ring1="Gere Ring"
        back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
		waist="Gerdr Belt +1",legs="Samnuha Tights",feet="Kendatsuba Sune-Ate +1"}
    sets.engaged.Acc.Haste_30 = {ammo="Happo Shuriken +1",
        head="Adhemar Bonnet +1",neck="Ninja Nodowa +2",ear1="Telos Earring",ear2="Balder Earring +1",
        body="Mochizuki Chainmail +3",hands="Mpaca's Gloves",ring1="Ilabrat Ring",ring2="Epona's Ring",--ring1="Gere Ring"
        back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
		waist="Reiki Yotai",legs="Hachiya Hakama +2",feet="Kendatsuba Sune-Ate +1"}
    sets.engaged.FullAcc.Haste_30 = {ammo="Happo Shuriken +1",
        head="Kendatsuba Jinpachi +1",neck="Ninja Nodowa +2",ear1="Telos Earring",ear2="Odr Earring",
        body="Mochizuki Chainmail +3",hands="Mpaca's Gloves",ring1="Ilabrat Ring",ring2="Regal Ring",--ring1="Gere Ring"
        back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
		waist="Reiki Yotai",legs="Hachiya Hakama +2",feet="Kendatsuba Sune-Ate +1"}

    sets.engaged.Tank.Haste_30 = {ammo="Yamarang",
		head="Ryuo Somen +1",neck="Unmoving Collar +1",ear1="Trux Earring",ear2="Eabani Earring",
        body="Mpaca's Doublet",hands="Mpaca's Gloves",ring1="Begrudging Ring",ring2="Epona's Ring",
        back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
		waist="Reiki Yotai",legs="Mpaca's Hose",feet="Mpaca's Boots"}
    sets.engaged.Acc.Tank.Haste_30 = {ammo="Yamarang",
		head="Ryuo Somen +1",neck="Unmoving Collar +1",ear1="Trux Earring",ear2="Eabani Earring",
        body="Mpaca's Doublet",hands="Mpaca's Gloves",ring1="Begrudging Ring",ring2="Epona's Ring",
        back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
		waist="Reiki Yotai",legs="Mpaca's Hose",feet="Mpaca's Boots"}
    sets.engaged.FullAcc.Tank.Haste_30 = {ammo="Yamarang1",
		head="Ryuo Somen +1",neck="Unmoving Collar +1",ear1="Trux Earring",ear2="Eabani Earring",
        body="Mpaca's Doublet",hands="Mpaca's Gloves",ring1="Begrudging Ring",ring2="Regal Ring",
        back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
		waist="Reiki Yotai",legs="Mpaca's Hose",feet="Mpaca's Boots"}

    -- Embrava Haste melee group (7% DW - 35%Haste)
    sets.engaged.Haste_35 = {ammo="Happo Shuriken +1",
        head="Hattori Zukin +1",neck="Ninja Nodowa +2",ear1="Dedition Earring",ear2="Balder Earring +1",
        body="Kendatsuba Samue +1",hands="Hachiya Tekko +2",ring1="Hetairoi Ring",ring2="Epona's Ring",--ring1="Gere Ring"
        back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
		waist="Sweordfaetels +1",legs="Samnuha Tights",feet="Kendatsuba Sune-Ate +1"}
    sets.engaged.Acc.Haste_35 = {ammo="Happo Shuriken +1",
        head="Adhemar Bonnet +1",neck="Ninja Nodowa +2",ear1="Telos Earring",ear2="Balder Earring +1",
        body="Kendatsuba Samue +1",hands="Mpaca's Gloves",ring1="Ilabrat Ring",ring2="Epona's Ring",--ring1="Gere Ring"
        back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
		waist="Reiki Yotai",legs="Kendatsuba Hakama +1",feet="Kendatsuba Sune-Ate +1"}
    sets.engaged.FullAcc.Haste_35 = {ammo="Happo Shuriken +1",
        head="Kendatsuba Jinpachi +1",neck="Ninja Nodowa +2",ear1="Telos Earring",ear2="Odr Earring",
        body="Kendatsuba Samue +1",hands="Mpaca's Gloves",ring1="Ilabrat Ring",ring2="Regal Ring",--ring1="Gere Ring"
        back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
		waist="Reiki Yotai",legs="Kendatsuba Hakama +1",feet="Kendatsuba Sune-Ate +1"}

    sets.engaged.Tank.Haste_35 = {ammo="Yamarang",
		head="Mpaca's Cap",neck="Unmoving Collar +1",ear1="Trux Earring",ear2="Balder Earring +1",
        body="Mpaca's Doublet",hands="Mpaca's Gloves",ring1="Begrudging Ring",ring2="Epona's Ring",
        back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
		waist="Reiki Yotai",legs="Mpaca's Hose",feet="Mpaca's Boots"}
    sets.engaged.Acc.Tank.Haste_35 = {ammo="Yamarang",
		head="Mpaca's Cap",neck="Unmoving Collar +1",ear1="Trux Earring",ear2="Balder Earring +1",
        body="Mpaca's Doublet",hands="Mpaca's Gloves",ring1="Begrudging Ring",ring2="Epona's Ring",
        back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
		waist="Reiki Yotai",legs="Mpaca's Hose",feet="Mpaca's Boots"}
    sets.engaged.FullAcc.Tank.Haste_35 = {ammo="Yamarang",
		head="Mpaca's Cap",neck="Unmoving Collar +1",ear1="Trux Earring",ear2="Balder Earring +1",
        body="Mpaca's Doublet",hands="Mpaca's Gloves",ring1="Begrudging Ring",ring2="Regal Ring",
        back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
		waist="Reiki Yotai",legs="Mpaca's Hose",feet="Mpaca's Boots"}

    -- Max Haste melee group (1% DW)
    sets.engaged.MaxHaste = {ammo="Happo Shuriken +1",
        head="Hattori Zukin +1",neck="Ninja Nodowa +2",ear1="Dedition Earring",ear2="Balder Earring +1",
        body="Kendatsuba Samue +1",hands="Hachiya Tekko +2",ring1="Hetairoi Ring",ring2="Epona's Ring",--ring1="Gere Ring"
        back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
		waist="Sweordfaetels +1",legs="Samnuha Tights",feet="Kendatsuba Sune-Ate +1"}
    sets.engaged.Acc.MaxHaste = {ammo="Happo Shuriken +1",
        head="Adhemar Bonnet +1",neck="Ninja Nodowa +2",ear1="Telos Earring",ear2="Balder Earring +1",
        body="Kendatsuba Samue +1",hands="Mpaca's Gloves",ring1="Ilabrat Ring",ring2="Epona's Ring",--ring1="Gere Ring"
        back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
		waist="Gerdr Belt +1",legs="Samnuha Tights",feet="Kendatsuba Sune-Ate +1"}
    sets.engaged.FullAcc.MaxHaste = {ammo="Happo Shuriken +1",
        head="Mpaca's Cap",neck="Ninja Nodowa +2",ear1="Telos Earring",ear2="Odr Earring",
        body="Kendatsuba Samue +1",hands="Mpaca's Gloves",ring1="Ilabrat Ring",ring2="Regal Ring",--ring1="Gere Ring"
        back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
		waist="Gerdr Belt +1",legs="Kendatsuba Hakama +1",feet="Kendatsuba Sune-Ate +1"}

    sets.engaged.Tank.MaxHaste = {ammo="Yamarang",
		head="Mpaca's Cap",neck="Unmoving Collar +1",ear1="Trux Earring",ear2="Balder Earring +1",
        body="Mpaca's Doublet",hands="Mpaca's Gloves",ring1="Begrudging Ring",ring2="Epona's Ring",
        back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
		waist="Gerdr Belt +1",legs="Mpaca's Hose",feet="Mpaca's Boots"}
    sets.engaged.Acc.Tank.MaxHaste = {ammo="Yamarang",
		head="Mpaca's Cap",neck="Unmoving Collar +1",ear1="Trux Earring",ear2="Balder Earring +1g",
        body="Mpaca's Doublet",hands="Mpaca's Gloves",ring1="Begrudging Ring",ring2="Epona's Ring",
        back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
		waist="Gerdr Belt +1",legs="Mpaca's Hose",feet="Mpaca's Boots"}
    sets.engaged.FullAcc.Tank.MaxHaste = {ammo="Yamarang",
		head="Mpaca's Cap",neck="Unmoving Collar +1",ear1="Trux Earring",ear2="Odr Earring",
        body="Mpaca's Doublet",hands="Mpaca's Gloves",ring1="Begrudging Ring",ring2="Regal Ring",
        back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
		waist="Gerdr Belt +1",legs="Mpaca's Hose",feet="Mpaca's Boots"}
		
    --------------------------------------
    -- Custom buff sets
    --------------------------------------

	sets.buff.Doom = {neck="Nicander's Necklace",ring1="Eshmun's Ring",ring2="Eshmun's Ring",waist="Gishdubar Sash"}
    sets.buff.Migawari = {}--body="Hattori Ningi +1"
    sets.buff.Yonin = {}--legs="Hattori Hakama +1"
	sets.buff.Futae = {hands="Hattori Tekko +1"}
	
    -- Extra Melee sets.  Apply these on top of melee sets.
    sets.Knockback = {}
	sets.DWEarrings = {ear1="Suppanomimi",ear2="Eabani Earring"}
	sets.DWMax = {ear1="Suppanomimi",ear2="Eabani Earring",body="Hachiya Chainmail +2",legs="Mochizuki Hakama +3",waist="Raiki Yotai"}

end
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Run after the general midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if state.Buff.Doom then
        equip(sets.buff.Doom)
    end
end


-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
    if not spell.interrupted and spell.english == "Migawari: Ichi" then
        state.Buff.Migawari = true
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    -- If we gain or lose any haste buffs, adjust which gear set we target.
    if S{'haste','march','embrava','haste samba'}:contains(buff:lower()) then
        determine_haste_group()
        handle_equipping_gear(player.status)
    elseif state.Buff[buff] ~= nil then
        handle_equipping_gear(player.status)
    end
end

function job_status_change(new_status, old_status)
    if new_status == 'Idle' then
        select_movement_feet()
    end
end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Get custom spell maps
function job_get_spell_map(spell, default_spell_map)
    if spell.skill == "Ninjutsu" then
        if not default_spell_map then
            if spell.target.type == 'SELF' then
                return 'NinjutsuBuff'
            else
                return 'NinjutsuDebuff'
            end
        end
    end
end

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if state.Buff.Migawari then
        idleSet = set_combine(idleSet, sets.buff.Migawari)
    end
    if state.Buff.Doom then
        idleSet = set_combine(idleSet, sets.buff.Doom)
    end
    return idleSet
end


-- Modify the default melee set after it was constructed.
function customize_melee_set(meleeSet)
    if state.Buff.Migawari then
        meleeSet = set_combine(meleeSet, sets.buff.Migawari)
    end
    if state.Buff.Doom then
        meleeSet = set_combine(meleeSet, sets.buff.Doom)
    end
    return meleeSet
end

-- Called by the default 'update' self-command.
function job_update(cmdParams, eventArgs)
    select_movement_feet()
    determine_haste_group()
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function determine_haste_group()
	classes.CustomMeleeGroups:clear()
    -- assuming +4 for marches (ghorn has +5)
    -- Haste (white magic) 15%
    -- Haste Samba (Sub) 5%
    -- Haste (Merited DNC) 10% (never account for this)
    -- Victory March +0/+3/+4/+5    9.4/14%/15.6%/17.1% +0
    -- Advancing March +0/+3/+4/+5  6.3/10.9%/12.5%/14%  +0
    -- Embrava 30% with 500 enhancing skill
    -- Mighty Guard - 15%
    -- buffactive[580] = geo haste
    -- buffactive[33] = regular haste
    -- buffactive[604] = mighty guard
    -- state.HasteMode = toggle for when you know Haste II is being cast on you
    -- Hi = Haste II is being cast. This is clunky to use when both haste II and haste I are being cast
	if state.HasteMode.value == 'Hi' then
		if ( ( (buffactive[33] or buffactive[580] or buffactive.embrava) and (buffactive.march or buffactive[604]) ) or -- haste/geo haste/embrava + march/mighty
			 ( buffactive[33] and (buffactive[580] or buffactive.embrava) ) or -- haste + geo haste/embrava
			 ( buffactive.march == 2 and buffactive[604] ) ) then -- march 2 + might
			classes.CustomMeleeGroups:append('MaxHaste')
		elseif ( (buffactive[33] or buffactive.march == 2 or buffactive[580]) and buffactive['haste samba'] ) then
			classes.CustomMeleeGroups:append('Haste_35')
		elseif ( ( buffactive[580] or buffactive[33] or buffactive.march == 2 ) or
				 ( buffactive.march == 1 and buffactive[604] ) ) then
			classes.CustomMeleeGroups:append('Haste_30')
		elseif ( buffactive.march == 1 or buffactive[604] ) then
			classes.CustomMeleeGroups:append('Haste_15')
		end
	else
		if	( buffactive[580] and ( buffactive.march or buffactive[33] or buffactive.embrava or buffactive[604]) ) or  -- geo haste + anything
			( buffactive.embrava and (buffactive.march or buffactive[33] or buffactive[604]) ) or  -- embrava + anything
			( buffactive.march == 2 and (buffactive[33] or buffactive[604]) ) or  -- two marches + anything
			( buffactive[33] and buffactive[604] and buffactive.march ) then -- haste + mighty guard + any marches
			classes.CustomMeleeGroups:append('MaxHaste')
		elseif	( (buffactive[604] or buffactive[33]) and buffactive['haste samba'] and buffactive.march == 1) or -- MG or haste + samba with 1 march
				( buffactive.march == 2 and buffactive['haste samba'] ) or
				( buffactive[580] and buffactive['haste samba'] ) then
			classes.CustomMeleeGroups:append('Haste_35')
		elseif  ( buffactive.march == 2 ) or -- two marches from ghorn
				( (buffactive[33] or buffactive[604]) and buffactive.march == 1 ) or  -- MG or haste + 1 march
				( buffactive[580] ) or  -- geo haste
				( buffactive[33] and buffactive[604] ) then  -- haste with MG
			classes.CustomMeleeGroups:append('Haste_30')
		elseif buffactive[33] or buffactive[604] or buffactive.march == 1 then
			classes.CustomMeleeGroups:append('Haste_15')
		end
	end

    -- We have three groups of DW in gear: Hachiya body/legs, Iga head + Patentia Sash, and DW earrings
    
    -- Standard gear set reaches near capped delay with just Haste (77%-78%, depending on HQs)
    -- For high haste, we want to be able to drop one of the 10% groups.
    -- Basic gear hits capped delay (roughly) with:
    -- 1 March + Haste
    -- 2 March
    -- Haste + Haste Samba
    -- 1 March + Haste Samba
    -- Embrava
    
    -- High haste buffs:
    -- 2x Marches + Haste Samba == 19% DW in gear
    -- 1x March + Haste + Haste Samba == 22% DW in gear
    -- Embrava + Haste or 1x March == 7% DW in gear
    
    -- For max haste (capped magic haste + 25% gear haste), we can drop all DW gear.
    -- Max haste buffs:
    -- Embrava + Haste+March or 2x March
    -- 2x Marches + Haste
    
    -- So we want four tiers:
    -- Normal DW
    -- 20% DW -- High Haste
    -- 7% DW (earrings) - Embrava Haste (specialized situation with embrava and haste, but no marches)
    -- 0 DW - Max Haste
    
--	if buffactive.embrava and (buffactive.march == 2 or (buffactive.march and buffactive.haste)) then
--		classes.CustomMeleeGroups:append('MaxHaste')
--	elseif buffactive.march == 2 and buffactive.haste then
--		classes.CustomMeleeGroups:append('MaxHaste')
--	elseif buffactive.embrava and (buffactive.haste or buffactive.march) then
--		classes.CustomMeleeGroups:append('EmbravaHaste')
--	elseif buffactive.march == 1 and buffactive.haste and buffactive['haste samba'] then
--		classes.CustomMeleeGroups:append('HighHaste')
--	elseif buffactive.march == 2 then
--		classes.CustomMeleeGroups:append('LowHaste')
--	end
end


function select_movement_feet()
    if world.time >= 17*60 or world.time < 7*60 then
        gear.MovementFeet.name = gear.NightFeet
    else
        gear.MovementFeet.name = gear.DayFeet
    end
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'DNC' then
		set_macro_page(2, 12)
	elseif player.sub_job == 'RUN' then
		set_macro_page(3, 12)
	elseif player.sub_job == 'RDM' then
		set_macro_page(4, 12)
	elseif player.sub_job == 'THF' then
		set_macro_page(5, 12)
	else
		set_macro_page(1, 12)
	end
end