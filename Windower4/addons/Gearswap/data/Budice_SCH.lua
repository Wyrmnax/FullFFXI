-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

--[[
        Custom commands:

        Shorthand versions for each strategem type that uses the version appropriate for
        the current Arts.

                                        Light Arts              Dark Arts

        gs c scholar light              Light Arts/Addendum
        gs c scholar dark                                       Dark Arts/Addendum
        gs c scholar cost               Penury                  Parsimony
        gs c scholar speed              Celerity                Alacrity
        gs c scholar aoe                Accession               Manifestation
        gs c scholar power              Rapture                 Ebullience
        gs c scholar duration           Perpetuance
        gs c scholar accuracy           Altruism                Focalization
        gs c scholar enmity             Tranquility             Equanimity
        gs c scholar skillchain                                 Immanence
        gs c scholar addendum           Addendum: White         Addendum: Black
--]]



-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
	include('organizer-lib')	
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    info.addendumNukes = S{"Stone IV", "Water IV", "Aero IV", "Fire IV", "Blizzard IV", "Thunder IV",
        "Stone V", "Water V", "Aero V", "Fire V", "Blizzard V", "Thunder V"}

    state.Buff['Sublimation: Activated'] = buffactive['Sublimation: Activated'] or false
    update_active_strategems()
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal','Defense')
    state.CastingMode:options('Normal', 'Resistant', 'Magig_Burst')
    state.IdleMode:options('Normal', 'PDT','Defense')


    info.low_nukes = S{"Stone", "Water", "Aero", "Fire", "Blizzard", "Thunder"}
    info.mid_nukes = S{"Stone II", "Water II", "Aero II", "Fire II", "Blizzard II", "Thunder II",
                       "Stone III", "Water III", "Aero III", "Fire III", "Blizzard III", "Thunder III",
                       "Stone IV", "Water IV", "Aero IV", "Fire IV", "Blizzard IV", "Thunder IV",}
    info.high_nukes = S{"Stone V", "Water V", "Aero V", "Fire V", "Blizzard V", "Thunder V"}

    gear.macc_hagondes = {name="Hagondes Cuffs", augments={'Phys. dmg. taken -3%','Mag. Acc.+29'}}

    send_command('bind ^` input /ma Stun <t>')
	
    state.MagicBurst = M(false, 'Magic Burst')	
	
    send_command('bind @F9 gs c set MagicBurst')
    send_command('bind @F10 gs c set MagicBurst false')		

    select_default_macro_book()
end

function user_unload()
    send_command('unbind ^`')
    send_command('unbind @F9')
    send_command('unbind @F10')	
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Precast sets to enhance JAs

    sets.precast.JA['Tabula Rasa'] = {legs={ name="Peda. Pants +1", augments={'Enhances "Tabula Rasa" effect',}},}
	
    -- Fast cast sets for spells

    sets.precast.FC = { main={ name="Musa", augments={'Path: C',}},
	ammo="Sapience Orb",
    head={ name="Merlinic Hood", augments={'"Fast Cast"+6','Mag. Acc.+6',}},
    body="Pinga Tunic",
    hands="Acad. Bracers +2",
    legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
    feet={ name="Merlinic Crackows", augments={'"Fast Cast"+7','"Mag.Atk.Bns."+16',}},
    neck="Voltsurge Torque",
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear="Loquac. Earring",
    left_ring="Kishar Ring",
    right_ring="Prolix Ring",
    back="Swith Cape",}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {neck="Stoicheion Medal"})

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {body="Heka's Kalasiris",back="Pahtli Cape"})

    sets.precast.FC.Curaga = sets.precast.FC.Cure

    sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'], {head=empty,body="Twilight Cloak"})
	
    sets.precast.WS['Myrkr'] = {ammo="Hydrocera",
    head="Pixie Hairpin +1",
    body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    feet={ name="Amalric Nails +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Malignance Earring",
    right_ear="Mendi. Earring",
    left_ring="Mephitas's Ring +1",
    right_ring="Persis Ring",
    back="Solemnity Cape",}	


    -- Midcast Sets

    sets.midcast.FastRecast = { main={ name="Musa", augments={'Path: C',}},
	ammo="Sapience Orb",
    head={ name="Merlinic Hood", augments={'"Fast Cast"+7','Mag. Acc.+8',}},
    body="Zendik Robe",
    hands="Acad. Bracers +2",
    legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
    feet={ name="Merlinic Crackows", augments={'"Fast Cast"+7','DEX+4',}},
    neck="Orunmila's Torque",
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear="Loquac. Earring",
    left_ring="Kishar Ring",
    right_ring="Prolix Ring",
    back="Swith Cape",}

    sets.midcast.Cure = {main="Daybreak",
    sub="Sors Shield",
    ammo="Esper Stone +1",
    head={ name="Kaykaus Mitra +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
    body={ name="Kaykaus Bliaut +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    hands={ name="Peda. Bracers +2", augments={'Enh. "Tranquility" and "Equanimity"',}},
    legs={ name="Kaykaus Tights +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    feet={ name="Kaykaus Boots +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
    neck="Incanter's Torque",
    waist="Hachirin-no-Obi",
    left_ear="Mendi. Earring",
    right_ear="Meili Earring",
    left_ring="Naji's Loop",
    right_ring="Lebeche Ring",
    back="Solemnity Cape",}

    sets.midcast.CureWithLightWeather = { main="Chatoyant Staff",
    sub="Enki Strap",
    ammo="Esper Stone +1",
    head={ name="Kaykaus Mitra +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
    body={ name="Kaykaus Bliaut +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    hands={ name="Peda. Bracers +2", augments={'Enh. "Tranquility" and "Equanimity"',}},
    legs={ name="Kaykaus Tights +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    feet={ name="Kaykaus Boots +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
    neck="Incanter's Torque",
    waist="Hachirin-no-Obi",
    left_ear="Mendi. Earring",
    right_ear="Meili Earring",
    left_ring="Naji's Loop",
    right_ring="Lebeche Ring",
    back="Twilight Cape",}

    sets.midcast.Curaga = sets.midcast.Cure
	
	sets.midcast.CuragaWithLightWeather = sets.midcast.CureWithLightWeather

    sets.midcast.Regen = { main={ name="Musa", augments={'Path: C',}},
    sub="Kaja Grip",
    ammo="Impatiens",
    head="Arbatel Bonnet +2",
    body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
    hands="Arbatel Bracers +2",
    legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
    feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}},
    neck="Incanter's Torque",
    waist="Embla Sash",
    left_ear="Mimir Earring",
    right_ear="Andoaa Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Bookworm's Cape", augments={'INT+3','MND+1','Helix eff. dur. +18','"Regen" potency+7',}},}

    sets.midcast.Cursna = {main={ name="Gada", augments={'"Conserve MP"+6','MND+5','"Mag.Atk.Bns."+10',}},
    sub="Ammurapi Shield",
    ammo="Impatiens",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body={ name="Peda. Gown +1", augments={'Enhances "Enlightenment" effect',}},
    hands={ name="Vanya Cuffs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    feet={ name="Gende. Galosh. +1", augments={'Phys. dmg. taken -4%','Magic dmg. taken -4%','"Cure" spellcasting time -5%',}},
    neck="Debilis Medallion",
    waist="Bishop's Sash",
    left_ear="Malignance Earring",
    right_ear="Mendi. Earring",
    left_ring="Haoma's Ring",
    right_ring="Menelaus's Ring",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Occ. inc. resist. to stat. ailments+10',}},}
	
	 sets.midcast.StatusRemoval = {main={ name="Musa", augments={'Path: C',}},
    sub="Kaja Grip",
    ammo="Impatiens",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    hands="Acad. Bracers +2",
    legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    feet={ name="Kaykaus Boots", augments={'Mag. Acc.+15','"Cure" potency +5%','"Fast Cast"+3',}},
    neck="Incanter's Torque",
    waist="Witful Belt",
    left_ear="Malignance Earring",
    right_ear="Loquac. Earring",
    left_ring="Kishar Ring",
    right_ring="Lebeche Ring",
    back="Perimede Cape",}

    sets.midcast['Enhancing Magic'] = {main={ name="Musa", augments={'Path: C',}},
    sub="Kaja Grip",
    ammo="Staunch Tathlum +1",
    head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +9',}},
    body={ name="Peda. Gown +1", augments={'Enhances "Enlightenment" effect',}},
    hands="Arbatel Bracers +2",
    legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
    feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}},
    neck="Incanter's Torque",
    waist="Embla Sash",
     left_ear="Mimir Earring",
    right_ear="Andoaa Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Fi Follet Cape +1",}
	
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash"})

    sets.midcast.Storm = set_combine(sets.midcast['Enhancing Magic'], {feet={ name="Peda. Loafers +1", augments={'Enhances "Stormsurge" effect',}},})

    sets.midcast.Protect = {main={ name="Musa", augments={'Path: C',}},
    sub="Kaja Grip",
	ammo="Impatiens",
    head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +9',}},
    body={ name="Peda. Gown +1", augments={'Enhances "Enlightenment" effect',}},
    hands="Arbatel Bracers +2",
    legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
    feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}},
    neck="Incanter's Torque",
    waist="Embla Sash",
    left_ear="Mimir Earring",
    right_ear="Andoaa Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Fi Follet Cape +1",}
    sets.midcast.Protectra = sets.midcast.Protect

    sets.midcast.Shell = {main={ name="Musa", augments={'Path: C',}},
    sub="Kaja Grip",
	ammo="Impatiens",
    head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
    body={ name="Peda. Gown +1", augments={'Enhances "Enlightenment" effect',}},
    hands="Arbatel Bracers +2",
    legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
    feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}},
    neck="Incanter's Torque",
    waist="Embla Sash",
    left_ear="Mimir Earring",
    right_ear="Andoaa Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Fi Follet Cape +1",}
    sets.midcast.Shellra = sets.midcast.Shell


    -- Custom spell classes 
    sets.midcast.MndEnfeebles = { main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
	ammo="Pemphredo Tathlum",
    head="Befouled Crown",
    body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    hands={ name="Peda. Bracers +2", augments={'Enh. "Tranquility" and "Equanimity"',}},
    legs={ name="Chironic Hose", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','MND+10','Mag. Acc.+10',}},
    feet="Jhakri Pigaches +2",
    neck="Imbodla Necklace",
    waist="Hachirin-no-Obi",
    left_ear="Regal Earring",
    right_ear={ name="Arbatel Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+18','Enmity-8','INT+11 MND+11',}},
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Stikini Ring +1",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Occ. inc. resist. to stat. ailments+10',}},}

    sets.midcast.IntEnfeebles = { main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield", 
	ammo="Pemphredo Tathlum",
    head="Befouled Crown",
    body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    hands={ name="Peda. Bracers +2", augments={'Enh. "Tranquility" and "Equanimity"',}},
    legs={ name="Chironic Hose", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','MND+10','Mag. Acc.+10',}},
    feet="Jhakri Pigaches +2",
    neck="Imbodla Necklace",
    waist="Hachirin-no-Obi",
    left_ear="Regal Earring",
    right_ear={ name="Arbatel Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+18','Enmity-8','INT+11 MND+11',}},
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Stikini Ring +1",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Occ. inc. resist. to stat. ailments+10',}},}

    sets.midcast.ElementalEnfeeble = sets.midcast.IntEnfeebles

    sets.midcast['Dark Magic'] = {main={ name="Rubicundity", augments={'Mag. Acc.+10','"Mag.Atk.Bns."+10','Dark magic skill +10','"Conserve MP"+7',}},
    sub="Ammurapi Shield", 
	ammo="Pemphredo Tathlum",
    head="Pixie Hairpin +1",
    body="Acad. Gown +1",
    hands="Acad. Bracers +2",
    legs={ name="Peda. Pants +1", augments={'Enhances "Tabula Rasa" effect',}},
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','Magic burst dmg.+10%','CHR+10','"Mag.Atk.Bns."+11',}},
    neck="Erra Pendant",
    waist="Hachirin-no-Obi",
    left_ear="Regal Earring",
    right_ear={ name="Arbatel Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+18','Enmity-8','INT+11 MND+11',}},
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Evanescence Ring",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+5','"Mag.Atk.Bns."+10',}},}

    sets.midcast.Kaustra = { main={ name="Akademos", augments={'MP+80','INT+20','"Mag.Atk.Bns."+20',}},
    sub="Enki Strap",
	ammo="Pemphredo Tathlum",
    head="Jhakri Coronal +2",
    body="Acad. Gown +1",
    hands="Jhakri Cuffs +2",
    legs={ name="Peda. Pants +1", augments={'Enhances "Tabula Rasa" effect',}},
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','Magic burst dmg.+10%','CHR+10','"Mag.Atk.Bns."+11',}},
    neck="Erra Pendant",
    waist="Hachirin-no-Obi",
    left_ear="Regal Earring",
    right_ear={ name="Arbatel Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+18','Enmity-8','INT+11 MND+11',}},
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Archon Ring",
    back={name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+5','"Mag.Atk.Bns."+10',}},}

    sets.midcast.Drain = {main={ name="Rubicundity", augments={'Mag. Acc.+10','"Mag.Atk.Bns."+10','Dark magic skill +10','"Conserve MP"+7',}},
    sub="Ammurapi Shield",
	ammo="Pemphredo Tathlum",
    head="Pixie Hairpin +1",
    body={ name="Psycloth Vest", augments={'MP+50','INT+7','"Conserve MP"+6',}},
    hands="Acad. Bracers +2",
    legs={ name="Peda. Pants +1", augments={'Enhances "Tabula Rasa" effect',}},
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck="Erra Pendant",
    waist="Fucho-no-Obi",
    left_ear="Regal Earring",
    right_ear={ name="Arbatel Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+18','Enmity-8','INT+11 MND+11',}},
    left_ring="Archon Ring",
    right_ring="Evanescence Ring",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+5','"Mag.Atk.Bns."+10',}},}

    sets.midcast.Aspir = sets.midcast.Drain

    sets.midcast.Stun = {main={ name="Musa", augments={'Path: C',}},
    sub="Kaja Grip",
	ammo="Pemphredo Tathlum",
    head="Pixie Hairpin +1",
    body={ name="Psycloth Vest", augments={'MP+50','INT+7','"Conserve MP"+6',}},
    hands="Acad. Bracers +2",
    legs={ name="Peda. Pants +1", augments={'Enhances "Tabula Rasa" effect',}},
    feet="Acad. Loafers +2",
    neck="Erra Pendant",
    waist="Hachirin-no-Obi",
    left_ear="Regal Earring",
    right_ear={ name="Arbatel Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+18','Enmity-8','INT+11 MND+11',}},
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+5','"Mag.Atk.Bns."+10',}},}

    sets.midcast.Stun.Resistant = set_combine(sets.midcast.Stun, {main="Akademos"})


    -- Elemental Magic sets are default for handling low-tier nukes.
    sets.midcast['Elemental Magic'] = { main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head={ name="Peda. M.Board +1", augments={'Enh. "Altruism" and "Focalization"',}},
    body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    hands="Arbatel Bracers +2",
    legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    feet={ name="Amalric Nails +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    neck={ name="Argute Stole +1", augments={'Path: A',}},
    waist="Hachirin-no-Obi",
    left_ear="Regal Earring",
    right_ear={ name="Arbatel Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+18','Enmity-8','INT+11 MND+11',}},    
	left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Freke Ring",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Occ. inc. resist. to stat. ailments+10',}},}

    sets.midcast['Elemental Magic'].Helix = {main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Culminus",
    ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head="Agwu's Cap",
    body="Agwu's Robe",
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs="Agwu's Slops",
    feet={ name="Amalric Nails +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    neck={ name="Argute Stole +1", augments={'Path: A',}},
    waist={ name="Acuity Belt +1", augments={'Path: A',}},
    left_ear="Regal Earring",
    right_ear={ name="Arbatel Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+18','Enmity-8','INT+11 MND+11',}},
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Freke Ring",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Occ. inc. resist. to stat. ailments+10',}},}
		
    sets.midcast['Elemental Magic'].Resistant = { main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Acad. Mortar. +1",
    body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    feet={ name="Amalric Nails +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    neck={ name="Argute Stole +1", augments={'Path: A',}},
    waist="Hachirin-no-Obi",
    left_ear="Regal Earring",
    right_ear={ name="Arbatel Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+18','Enmity-8','INT+11 MND+11',}},
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Freke Ring",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Occ. inc. resist. to stat. ailments+10',}},}

    -- Custom refinements for certain nuke tiers
    sets.midcast['Elemental Magic'].LowTierNuke = set_combine(sets.midcast['Elemental Magic'],{ legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}}})

    sets.midcast['Elemental Magic'].LowTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant,{ legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}}})
	
    sets.magic_burst = { main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head={ name="Peda. M.Board +1", augments={'Enh. "Altruism" and "Focalization"',}},
    body="Agwu's Robe",
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs="Agwu's Slops",
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck={ name="Argute Stole +1", augments={'Path: A',}},
    waist="Hachirin-no-Obi",
    left_ear="Regal Earring",
    right_ear={ name="Arbatel Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+18','Enmity-8','INT+11 MND+11',}},
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Mujin Band",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Occ. inc. resist. to stat. ailments+10',}},}
	 
	sets.magic_burst.Helix = {main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Culminus",
    ammo="Pemphredo Tathlum",
    head="Agwu's Cap",
    body="Agwu's Robe",
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs="Agwu's Slops",
    feet={ name="Amalric Nails +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    neck={ name="Argute Stole +1", augments={'Path: A',}},
    waist={ name="Acuity Belt +1", augments={'Path: A',}},
    left_ear="Regal Earring",
    right_ear={ name="Arbatel Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+18','Enmity-8','INT+11 MND+11',}},    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Mujin Band",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Occ. inc. resist. to stat. ailments+10',}},
	 }

    -- Sets to return to when not performing an action.

    -- Resting sets
 


    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.idle.Town={
    main="Malignance Pole",
    sub="Kaja Grip",
    ammo="Crepuscular Pebble",
    head={ name="Peda. M.Board +1", augments={'Enh. "Altruism" and "Focalization"',}},
    body={ name="Peda. Gown +1", augments={'Enhances "Enlightenment" effect',}},
    hands={ name="Peda. Bracers +2", augments={'Enh. "Tranquility" and "Equanimity"',}},
    legs={ name="Peda. Pants +1", augments={'Enhances "Tabula Rasa" effect',}},
    feet={ name="Peda. Loafers +1", augments={'Enhances "Stormsurge" effect',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Fucho-no-Obi",
    left_ear="Genmei Earring",
    right_ear="Handler's Earring +1",
    left_ring="Defending Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back="Swith Cape",
}

    sets.idle.Field = {
    main="Malignance Pole",
    sub="Kaja Grip",
    ammo="Staunch Tathlum +1",
    head="Befouled Crown",
    body="Agwu's Robe",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Assid. Pants +1",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Fucho-no-Obi",
    left_ear="Genmei Earring",
    right_ear="Etiolation Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Occ. inc. resist. to stat. ailments+10',}},}

	
    -- Defense sets

    sets.defense.PDT = { main="Malignance Pole",
    sub="Kaja Grip",ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Fucho-no-Obi",
    left_ear="Hearty Earring",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Fortified Ring",
    back="Solemnity Cape",}

    sets.defense.MDT = {main="Malignance Pole",
    sub="Kaja Grip",ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Fucho-no-Obi",
    left_ear="Hearty Earring",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Fortified Ring",
    back="Solemnity Cape",}

    sets.Kiting = {feet="Herald's Gaiters"}

    sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    sets.engaged= { main="Malignance Pole",
    sub="Kaja Grip",
    ammo="Hasty Pinion +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Jhakri Robe +2",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Jhakri Slops +2",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Combatant's Torque",
    waist="Eschan Stone",
    left_ear="Cessance Earring",
    right_ear="Telos Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back="Moonbeam Cape",}

	


    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
	
    sets.buff['Ebullience'] = {head="Arbatel Bonnet +2"}
	
    sets.buff['Rapture'] = {"Arbatel Bonnet +2"}
	
    sets.buff['Perpetuance']  = {hands="Arbatel Bracers +2",}
	
    sets.buff['Immanence'] = {hands="Arbatel Bracers +2",}
	
    sets.buff['Penury'] = {legs="Arbatel Pants +1"}
	
    sets.buff['Parsimony'] = {legs="Arbatel Pants +1"}
	
    sets.buff['Celerity'] = {feet={ name="Peda. Loafers +1", augments={'Enhances "Stormsurge" effect',}},}
	
    sets.buff['Alacrity'] = {feet={ name="Peda. Loafers +1", augments={'Enhances "Stormsurge" effect',}},}

    sets.buff['Klimaform'] = {feet="Arbatel Loafers +1",}

    sets.buff.FullSublimation = {head="Acad. Mortar. +3",ear1="Savant's Earring",body={ name="Peda. Gown +1", augments={'Enhances "Enlightenment" effect',}}, waist="Embla Sash",}
	
    sets.buff.PDTSublimation = {head="Acad. Mortar. +3",ear1="Savant's Earring",body={ name="Peda. Gown +1", augments={'Enhances "Enlightenment" effect',}}, waist="Embla Sash",}

    --sets.buff['Sandstorm'] = {feet="Desert Boots"}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Run after the general midcast() is done.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.action_type == 'Magic' then
        apply_grimoire_bonuses(spell, action, spellMap, eventArgs)
	end
	if spell.skill == 'Elemental Magic' and state.MagicBurst.value then
        equip(sets.magic_burst)
    end
	if spell.skill == 'Elemental Magic' and spell.element == world.day_element or spell.element == world.weather_element and not spell.name == 'Meteor' then
        equip ({waist="Hachirin-no-Obi"})
    end	
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    if buff == "Sublimation: Activated" then
        handle_equipping_gear(player.status)
    end
end

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'Normal' then
            disable('main','sub','range')
        else
            enable('main','sub','range')
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Custom spell mapping.
function job_get_spell_map(spell, default_spell_map)
    if spell.action_type == 'Magic' then
        if default_spell_map == 'Cure' or default_spell_map == 'Curaga' then
            if world.weather_element == 'Light' then
                return 'CureWithLightWeather'
            end
        elseif spell.skill == 'Enfeebling Magic' then
            if spell.type == 'WhiteMagic' then
                return 'MndEnfeebles'
            else
                return 'IntEnfeebles'
            end
        elseif spell.skill == 'Elemental Magic' then
            if info.low_nukes:contains(spell.english) then
                return 'LowTierNuke'
            elseif info.mid_nukes:contains(spell.english) then
                return 'MidTierNuke'
            elseif info.high_nukes:contains(spell.english) then
                return 'HighTierNuke'
            end
        end
    end
end

function aftercast(spell,arg)
	if spell.name == "Sleep II" or spell.name == "Sleepga II" or spell.name == "Repose" or spell.name == "Dream Flower" then
		windower.send_command('wait 75;input /echo [ WARNING! '..spell.name..' : Will wear off within 0:15 ]')
        windower.send_command('wait 80;input /echo [ WARNING! '..spell.name..' : Will wear off within 0:10 ]')
        windower.send_command('wait 85;input /echo [ WARNING! '..spell.name..' : Will wear off within 0:05 ]')
	elseif spell.name == "Sleep" or spell.name == "Sleepga" then
		windower.send_command('wait 45;input /echo [ WARNING! '..spell.name..' : Will wear off within 0:15 ]')
        windower.send_command('wait 50;input /echo [ WARNING! '..spell.name..' : Will wear off within 0:10 ]')
        windower.send_command('wait 55;input /echo [ WARNING! '..spell.name..' : Will wear off within 0:05 ]')
	elseif spell.english == 'Sleep' or spell.english == 'Sleepga' then
			send_command('@timers c "'..spell.english..' ['..spell.target.name..']" 60 down spells/00220.png')
	elseif spell.english == 'Sleep II' or spell.english == 'Sleepga II' then
			send_command('@timers c "'..spell.english..' ['..spell.target.name..']" 90 down spells/00220.png')		
	end
-- Convert
	if spell.name == 'Convert' then
	  windower.send_command('wait 2;input /ma "Cure IV" me')
	end
end	

function customize_idle_set(idleSet)
    if state.Buff['Sublimation: Activated'] then
        if state.IdleMode.value == 'Normal' then
            idleSet = set_combine(idleSet, sets.buff.FullSublimation)
        elseif state.IdleMode.value == 'PDT' then
            idleSet = set_combine(idleSet, sets.buff.PDTSublimation)
        end
    end

    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end

    return idleSet
end

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    if cmdParams[1] == 'user' and not (buffactive['light arts']      or buffactive['dark arts'] or
                       buffactive['addendum: white'] or buffactive['addendum: black']) then
        if state.IdleMode.value == 'Stun' then
            send_command('@input /ja "Dark Arts" <me>')
        else
            send_command('@input /ja "Light Arts" <me>')
        end
    end

    update_active_strategems()
    update_sublimation()
end

-- Function to display the current relevant user state when doing an update.
-- Return true if display was handled, and you don't want the default info shown.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements self-commands.
-------------------------------------------------------------------------------------------------------------------

-- Called for direct player commands.
function job_self_command(cmdParams, eventArgs)
    if cmdParams[1]:lower() == 'scholar' then
        handle_strategems(cmdParams)
        eventArgs.handled = true
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Reset the state vars tracking strategems.
function update_active_strategems()
    state.Buff['Ebullience'] = buffactive['Ebullience'] or false
    state.Buff['Rapture'] = buffactive['Rapture'] or false
    state.Buff['Perpetuance'] = buffactive['Perpetuance'] or false
    state.Buff['Immanence'] = buffactive['Immanence'] or false
    state.Buff['Penury'] = buffactive['Penury'] or false
    state.Buff['Parsimony'] = buffactive['Parsimony'] or false
    state.Buff['Celerity'] = buffactive['Celerity'] or false
    state.Buff['Alacrity'] = buffactive['Alacrity'] or false

    state.Buff['Klimaform'] = buffactive['Klimaform'] or false
end

function update_sublimation()
    state.Buff['Sublimation: Activated'] = buffactive['Sublimation: Activated'] or false
end

-- Equip sets appropriate to the active buffs, relative to the spell being cast.
function apply_grimoire_bonuses(spell, action, spellMap)
    if state.Buff.Perpetuance and spell.type =='WhiteMagic' and spell.skill == 'Enhancing Magic' then
        equip(sets.buff['Perpetuance'])
    end
    if state.Buff.Rapture and (spellMap == 'Cure' or spellMap == 'Curaga') then
        equip(sets.buff['Rapture'])
    end
    if spell.skill == 'Elemental Magic' and spellMap ~= 'ElementalEnfeeble' then
        if state.Buff.Ebullience and spell.english ~= 'Impact' then
            equip(sets.buff['Ebullience'])
        end
        if state.Buff.Immanence then
            equip(sets.buff['Immanence'])
        end
        if state.Buff.Klimaform and spell.element == world.weather_element then
            equip(sets.buff['Klimaform'])
        end
    end

    if state.Buff.Penury then equip(sets.buff['Penury']) end
    if state.Buff.Parsimony then equip(sets.buff['Parsimony']) end
    if state.Buff.Celerity then equip(sets.buff['Celerity']) end
    if state.Buff.Alacrity then equip(sets.buff['Alacrity']) end
end


-- General handling of strategems in an Arts-agnostic way.
-- Format: gs c scholar <strategem>
function handle_strategems(cmdParams)
    -- cmdParams[1] == 'scholar'
    -- cmdParams[2] == strategem to use

    if not cmdParams[2] then
        add_to_chat(123,'Error: No strategem command given.')
        return
    end
    local strategem = cmdParams[2]:lower()

    if strategem == 'light' then
        if buffactive['light arts'] then
            send_command('input /ja "Addendum: White" <me>')
        elseif buffactive['addendum: white'] then
            add_to_chat(122,'Error: Addendum: White is already active.')
        else
            send_command('input /ja "Light Arts" <me>')
        end
    elseif strategem == 'dark' then
        if buffactive['dark arts'] then
            send_command('input /ja "Addendum: Black" <me>')
        elseif buffactive['addendum: black'] then
            add_to_chat(122,'Error: Addendum: Black is already active.')
        else
            send_command('input /ja "Dark Arts" <me>')
        end
    elseif buffactive['light arts'] or buffactive['addendum: white'] then
        if strategem == 'cost' then
            send_command('input /ja Penury <me>')
        elseif strategem == 'speed' then
            send_command('input /ja Celerity <me>')
        elseif strategem == 'aoe' then
            send_command('input /ja Accession <me>')
        elseif strategem == 'power' then
            send_command('input /ja Rapture <me>')
        elseif strategem == 'duration' then
            send_command('input /ja Perpetuance <me>')
        elseif strategem == 'accuracy' then
            send_command('input /ja Altruism <me>')
        elseif strategem == 'enmity' then
            send_command('input /ja Tranquility <me>')
        elseif strategem == 'skillchain' then
            add_to_chat(122,'Error: Light Arts does not have a skillchain strategem.')
        elseif strategem == 'addendum' then
            send_command('input /ja "Addendum: White" <me>')
        else
            add_to_chat(123,'Error: Unknown strategem ['..strategem..']')
        end
    elseif buffactive['dark arts']  or buffactive['addendum: black'] then
        if strategem == 'cost' then
            send_command('input /ja Parsimony <me>')
        elseif strategem == 'speed' then
            send_command('input /ja Alacrity <me>')
        elseif strategem == 'aoe' then
            send_command('input /ja Manifestation <me>')
        elseif strategem == 'power' then
            send_command('input /ja Ebullience <me>')
        elseif strategem == 'duration' then
            add_to_chat(122,'Error: Dark Arts does not have a duration strategem.')
        elseif strategem == 'accuracy' then
            send_command('input /ja Focalization <me>')
        elseif strategem == 'enmity' then
            send_command('input /ja Equanimity <me>')
        elseif strategem == 'skillchain' then
            send_command('input /ja Immanence <me>')
        elseif strategem == 'addendum' then
            send_command('input /ja "Addendum: Black" <me>')
        else
            add_to_chat(123,'Error: Unknown strategem ['..strategem..']')
        end
    else
        add_to_chat(123,'No arts has been activated yet.')
    end
end


-- Gets the current number of available strategems based on the recast remaining
-- and the level of the sch.
function get_current_strategem_count()
    -- returns recast in seconds.
    local allRecasts = windower.ffxi.get_ability_recasts()
    local stratsRecast = allRecasts[231]

    local maxStrategems = (player.main_job_level + 10) / 20

    local fullRechargeTime = 4*60

    local currentCharges = math.floor(maxStrategems - maxStrategems * stratsRecast / fullRechargeTime)

    return currentCharges
end


-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    if player.sub_job == 'BLM' then
    	set_macro_page(1, 3)
    elseif player.sub_job == 'WHM' then
    	set_macro_page(5, 3)
	elseif player.sub_job == 'RDM' then
    	set_macro_page(5, 3)
	 
    end

end