-------------------------------------------------------------------------------------------------------------------
-- Last Revised: July 22nd, 2014
-- F8 cycles through Pet Food types, alt+F8 toggles Monster Correlation between Neutral and Favorable,
-- ctrl+F8 switches between Pet stances for Master/Pet hybrid gearsets. ctrl+F11 cycles between Magical Defense
-- Modes. ctrl+= can swap in the usage of Chaac Belt for Treasure Hunter on common subjob abilities.
-------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------
-- Initialization function that defines sets and variables to be used.
-------------------------------------------------------------------------------------------------------------------

-- IMPORTANT: Make sure to also get the Mote-Include.lua file (and its supplementary files) to go with this.

function get_sets()
	include('Mote-Include.lua')
end

function job_setup()
	state.Buff['Killer Instinct'] = buffactive['Killer Instinct'] or false
	state.Buff.Doomed = buffactive.doomed or false

	state.CombatForm = get_combat_form()
end

function user_setup()
        options.OffenseModes = {'Normal', 'MediumAcc', 'HighAcc'}
        options.DefenseModes = {'Normal'}
        options.WeaponskillModes = {'Normal', 'WSMedAcc', 'WSHighAcc'}
        options.CastingModes = {'Normal'}
        options.IdleModes = {'Normal', 'Refresh', 'Reraise'}
        options.RestingModes = {'Normal'}
        options.PhysicalDefenseModes = {'PDT', 'Hybrid', 'Killer', 'Reraise'}
        options.MagicalDefenseModes = {'MDT', 'Absorb'}

        state.Defense.PhysicalMode = 'PDT'

	-- Keybind Ctrl+F11 to cycle Magical Defense Modes
	send_command('bind ^f11 gs c cycle MagicalDefenseMode')

	-- Set up Reward Modes and keybind F8
        options.RewardModes = {'Theta','Zeta','Eta'}
        state.RewardMode = 'Zeta'
        RewardFood = {name="Pet Food Zeta"}
        send_command('bind f8 gs c cycle RewardMode')

	-- Set up Monster Correlation Modes and keybind Alt+F8
	options.CorrelationModes = {'Neutral','Favorable'}
	state.CorrelationMode = 'Neutral'
	send_command('bind !f8 gs c cycle CorrelationMode')

        -- Set up Pet Modes for Hybrid sets and keybind Ctrl+F8
        options.PetModes = {'Normal', 'PetTank'}
        state.PetMode = 'Normal'
	send_command('bind ^f8 gs c cycle PetMode')

	-- Set up Treasure Modes and keybind Ctrl+=
	options.TreasureModes = {'None','Tag'}
	state.TreasureMode = 'Tag'
	send_command('bind ^= gs c cycle TreasureMode')
end

function file_unload()
	if binds_on_unload then
		binds_on_unload()
	end

	-- Unbinds the Reward, Correlation, Treasure, PetMode hotkeys.
	send_command('unbind ^=')
	send_command('unbind f8')
	send_command('unbind !f8')
	send_command('unbind ^f8')
	send_command('unbind ^f11')
end

-- Complete list of Ready moves to use with Sic & Ready Recast -5 Desultor Tassets.
ready_moves_to_check = S{'Sic','Whirl Claws','Dust Cloud','Foot Kick','Sheep Song','Sheep Charge','Lamb Chop',
	'Rage','Head Butt','Scream','Dream Flower','Wild Oats','Leaf Dagger','Claw Cyclone','Razor Fang',
	'Roar','Gloeosuccus','Palsy Pollen','Soporific','Cursed Sphere','Venom','Geist Wall','Toxic Spit',
	'Numbing Noise','Nimble Snap','Cyclotail','Spoil','Rhino Guard','Rhino Attack','Power Attack',
	'Hi-Freq Field','Sandpit','Sandblast','Venom Spray','Mandibular Bite','Metallic Body','Bubble Shower',
	'Bubble Curtain','Scissor Guard','Big Scissors','Grapple','Spinning Top','Double Claw','Filamented Hold',
	'Frog Kick','Queasyshroom','Silence Gas','Numbshroom','Spore','Dark Spore','Shakeshroom','Blockhead',
	'Secretion','Fireball','Tail Blow','Plague Breath','Brain Crush','Infrasonics','1000 Needles',
	'Needleshot','Chaotic Eye','Blaster','Scythe Tail','Ripper Fang','Chomp Rush','Intimidate','Recoil Dive',
	'Water Wall','Snow Cloud','Wild Carrot','Sudden Lunge','Spiral Spin','Noisome Powder','Wing Slap',
	'Beak Lunge','Suction','Drainkiss','Acid Mist','TP Drainkiss','Back Heel','Jettatura','Choke Breath',
	'Fantod','Charged Whisker','Purulent Ooze','Corrosive Ooze','Tortoise Stomp','Harden Shell','Aqua Breath',
	'Sensilla Blades','Tegmina Buffet','Molting Plumage','Swooping Frenzy','Pentapeck','Sweeping Gouge',
	'Zealous Snort'}

-- List of Ready buff moves to use with Ferine Manoplas +1 or +2.
tp_based_moves = S{'Sic','Rage','Rhino Guard','Metallic Body','Bubble Curtain','Scissor Guard','Secretion',
	'Water Wall','Wild Carrot','Fantod','Harden Shell','Zealous Snort'}

-- List of abilities to reference for applying Treasure Hunter +1 via Chaac Belt.
abilities_to_check = S{'Feral Howl','Quickstep','Box Step','Stutter Step','Desperate Flourish','Violent Flourish',
	'Animated Flourish','Provoke','Dia','Dia II','Flash','Bio','Bio II','Sleep','Sleep II',
	'Drain','Aspir','Dispel','Steal','Mug'}

-- BST gearsets
function init_gear_sets()
	-- PRECAST SETS
        sets.precast.JA['Killer Instinct'] = {head="Ankusa Helm +1"}
        sets.precast.JA['Feral Howl'] = {body="Ankusa Jackcoat +1"}
	sets.precast.JA['Call Beast'] = {hands="Ankusa Gloves +1"}
        sets.precast.JA.Familiar = {legs="Ankusa Trousers +1"}
	sets.precast.JA.Tame = {head="Totemic Helm +1",ear1="Tamer's Earring",legs="Stout Kecks"}
	sets.precast.JA.Spur = {feet="Ferine Ocreae +2"}

	sets.precast.JA.Reward = {ammo=RewardFood,
                head="Stout Bonnet",neck="Aife's Medal",ear1="Lifestorm Earring",ear2="Neptune's Pearl",
		body="Totemic Jackcoat +1",hands="Totemic Gloves +1",ring1="Aquasoul Ring",ring2="Aquasoul Ring",
		back="Pastoralist's Mantle",waist="Crudelis Belt",legs="Ankusa Trousers +1",feet="Ankusa Gaiters +1"}
			
	sets.precast.JA.Charm = {ammo="Tsar's Egg",
		head="Totemic Helm +1",neck="Ferine Necklace",ear1="Enchanter's Earring",ear2="Melody Earring +1",
		body="Ankusa Jackcoat +1",hands="Ankusa Gloves +1",ring1="Dawnsoul Ring",ring2="Dawnsoul Ring",
		back="Aisance Mantle +1",waist="Aristo Belt",legs="Ankusa Trousers +1",feet="Ankusa Gaiters +1"}

        -- CURING WALTZ
        sets.precast.Waltz = {ammo="Tsar's Egg",
		head="Totemic Helm +1",neck="Ferine Necklace",ear1="Enchanter's Earring",ear2="Melody Earring +1",
		body="Gorney Haubert +1",hands="Totemic Gloves +1",ring1="Valseur's Ring",ring2="Asklepian Ring",
		back="Aisance Mantle +1",waist="Aristo Belt",legs="Gorney Brayettes +1",feet="Totemic Gaiters +1"}
                
        -- HEALING WALTZ
        sets.precast.Waltz['Healing Waltz'] = {}

	-- STEPS
	sets.precast.Step = {ammo="Jukukik Feather",
		head="Yaoyotl Helm",neck="Ziel Charm",ear1="Choreia Earring",ear2="Heartseeker Earring",
		body="Mes'yohi Haubergeon",hands="Buremte Gloves",ring1="Mars's Ring",ring2="Oneiros Annulet",
		back="Letalis Mantle",waist="Hurch'lan Sash",legs="Xaddi Cuisses",feet="Gorney Sollerets +1"}

	-- VIOLENT FLOURISH
	sets.precast.Flourish1 = {}
	sets.precast.Flourish1['Violent Flourish'] = {ammo="Jukukik Feather",
		head="Seiokona Beret",neck="Stoicheion Medal",ear1="Lifestorm Earring",ear2="Psystorm Earring",
		body="Ankusa Jackcoat +1",hands="Buremte Gloves",ring1="Perception Ring",ring2="Sangoma Ring",
		back="Letalis Mantle",waist="Hurch'lan Sash",legs="Iuitl Tights +1",feet="Iuitl Gaiters +1"}

        sets.precast.FC = {ammo="Impatiens",neck="Orunmila's Torque",ear1="Loquacious Earring",ring1="Prolix Ring"}
        sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})

        -- MIDCAST SETS
        sets.midcast.FastRecast = {ammo="Demonry Core",
                head="Iuitl Headgear +1",neck="Orunmila's Torque",ear1="Loquacious Earring",
                body="Totemic Jackcoat +1",hands="Iuitl Wristbands +1",ring1="Prolix Ring",ring2="Defending Ring",
                back="Mollusca Mantle",waist="Hurch'lan Sash",legs="Iuitl Tights +1",feet="Iuitl Gaiters +1"}
 
        sets.midcast.Utsusemi = sets.midcast.FastRecast

	sets.midcast.Cure = {ammo="Erlene's Notebook",
		head="Yaoyotl Helm",neck="Phalaina Locket",ear1="Lifestorm Earring",ear2="Neptune's Pearl",
		body="Gorney Haubert +1",hands="Buremte Gloves",ring1="Kunaji Ring",ring2="Asklepian Ring",
		back="Pastoralist's Mantle",waist="Chuq'aba Belt",legs="Ankusa Trousers +1",feet="Ankusa Gaiters +1"}

	sets.midcast.Curaga = sets.midcast.Cure

	sets.midcast.Stoneskin = {
		head="Totemic Helm +1",neck="Stone Gorget",ear1="Earthcry Earring",ear2="Lifestorm Earring",
		body="Totemic Jackcoat +1",hands="Stone Mufflers",ring1="Aquasoul Ring",ring2="Aquasoul Ring",
		back="Pastoralist's Mantle",waist="Crudelis Belt",legs="Haven Hose",feet="Whirlpool Greaves"}

	sets.midcast.Cursna = {
		neck="Malison Medallion",
		ring1="Ephedra Ring"}

	sets.midcast.Protect = {ring2="Sheltered Ring"}
	sets.midcast.Protectra = sets.midcast.Protect

	sets.midcast.Shell = {ring2="Sheltered Ring"}
	sets.midcast.Shellra = sets.midcast.Shell

	sets.midcast['Enfeebling Magic'] = {
		head="Seiokona Beret",neck="Stoicheion Medal",ear1="Lifestorm Earring",ear2="Psystorm Earring",
		body="Ankusa Jackcoat +1",ring1="Perception Ring",ring2="Sangoma Ring",
		legs="Iuitl Tights +1",feet="Iuitl Gaiters +1"}

	sets.midcast['Elemental Magic'] = sets.midcast['Enfeebling Magic']

        -- WEAPONSKILLS
        -- Default weaponskill sets.
	sets.precast.WS = {ammo="Cheruski Needle",
		head="Otomi Helm",neck="Asperity Necklace",ear1="Kokou's Earring",ear2="Brutal Earring",
		body="Gorney Haubert +1",hands="Buremte Gloves",ring1="Pyrosoul Ring",ring2="Epona's Ring",
		back="Atheling Mantle",waist="Windbuffet Belt",legs="Gorney Brayettes +1",feet="Ejekamal Boots"}

	sets.precast.WS.WSMedAcc = {ammo="Jukukik Feather",
		head="Yaoyotl Helm",neck="Ziel Charm",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body="Gorney Haubert +1",hands="Buremte Gloves",ring1="Pyrosoul Ring",ring2="Oneiros Annulet",
		back="Letalis Mantle",waist="Anguinus Belt",legs="Gorney Brayettes +1",feet="Ejekamal Boots"}

	sets.precast.WS.WSHighAcc = {ammo="Jukukik Feather",
		head="Yaoyotl Helm",neck="Ziel Charm",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body="Mes'yohi Haubergeon",hands="Buremte Gloves",ring1="Mars's Ring",ring2="Oneiros Annulet",
		back="Letalis Mantle",waist="Anguinus Belt",legs="Mikinaak Cuisses",feet="Ejekamal Boots"}

        -- Specific weaponskill sets.
        sets.precast.WS['Ruinator'] = set_combine(sets.precast.WS, {neck="Breeze Gorget",back="Buquwik Cape",waist="Breeze Belt"})
	sets.precast.WS['Ruinator'].Mekira = set_combine(sets.precast.WS['Ruinator'], {head="Mekira-oto +1"})
        sets.precast.WS['Ruinator'].WSMedAcc = set_combine(sets.precast.WS.WSMedAcc, {neck="Breeze Gorget",waist="Breeze Belt"})
        sets.precast.WS['Ruinator'].WSHighAcc = set_combine(sets.precast.WS.WSHighAcc, {neck="Breeze Gorget",waist="Breeze Belt"})

        sets.precast.WS['Onslaught'] = set_combine(sets.precast.WS, {ear1="Steelflash Earring",ear2="Bladeborn Earring",
		hands="Aetosaur Gloves +1",ring1="Rajas Ring"})
        sets.precast.WS['Onslaught'].WSMedAcc = set_combine(sets.precast.WSMedAcc, {hands="Buremte Gloves",ring1="Rajas Ring"})
        sets.precast.WS['Onslaught'].WSHighAcc = set_combine(sets.precast.WSHighAcc, {hands="Buremte Gloves"})

	sets.precast.WS['Primal Rend'] = {ammo="Erlene's Notebook",
		head="Seiokona Beret",neck="Stoicheion Medal",ear1="Hecate's Earring",ear2="Friomisi Earring",
		body="Phorcys Korazin",hands="Ankusa Gloves +1",ring1="Acumen Ring",ring2="Demon's Ring",
		back="Toro Cape",waist="Soil Belt",legs="Iuitl Tights +1",feet="Iuitl Gaiters +1"}

	sets.precast.WS['Cloudsplitter'] = set_combine(sets.precast.WS['Primal Rend'], {waist="Thunder Belt"})

	-- PET SIC & READY MOVES
	sets.midcast.Pet.WS = {ammo="Demonry Core",
		neck="Ferine Necklace",ear1="Sabong Earring",ear2="Domesticator's Earring",
		body="Mirke Wardecors",hands="Regimen Mittens",ring1="Angel's Ring",ring2="Angel's Ring",
		back="Ferine Mantle",waist="Hurch'lan Sash",legs="Desultor Tassets",feet="Totemic Gaiters +1"}

	sets.midcast.Pet.Neutral = {head="Totemic Helm +1"}
	sets.midcast.Pet.Favorable = {head="Ferine Cabasset +2"}
	sets.midcast.Pet.TPBonus = {hands="Ferine Manoplas +2"}
	sets.midcast.Pet.ReadyRecast = {legs="Desultor Tassets"}

        -- RESTING
        sets.resting = {}
        
        -- IDLE SETS
	sets.ExtraRegen = {waist="Muscle Belt +1"}

        sets.idle = {ammo="Demonry Core",
		head="Twilight Helm",neck="Wiglen Gorget",ear1="Dawn Earring",ear2="Merman's Earring",
		body="Kirin's Osode",hands="Iuitl Wristbands +1",ring1="Paguroidea Ring",ring2="Sheltered Ring",
		back="Repulse Mantle",waist="Flume Belt",legs="Iuitl Tights +1",feet="Iuitl Gaiters +1"}

        sets.idle.Refresh = set_combine(sets.idle, {head="Wivre Hairpin",body="Twilight Mail",legs="Stearc Subligar"})
	sets.idle.Reraise = set_combine(sets.idle, {head="Twilight Helm",body="Twilight Mail"})

	sets.idle.Pet = set_combine(sets.idle, {ammo="Demonry Core",
		head="Twilight Helm",neck="Wiglen Gorget",ear1="Dawn Earring",ear2="Domesticator's Earring",
		body="Kirin's Osode",hands="Regimen Mittens",ring1="Paguroidea Ring",ring2="Sheltered Ring",
		back="Pastoralist's Mantle",waist="Isa Belt",legs="Ferine Quijotes +2",feet="Armada Sollerets"})

	sets.idle.Pet.Engaged = {ammo="Demonry Core",
		head="Anwig Salade",neck="Ferine Necklace",ear1="Ferine Earring",ear2="Domesticator's Earring",
		body="Ankusa Jackcoat +1",hands="Regimen Mittens",
		back="Ferine Mantle",waist="Hurch'lan Sash",legs="Ankusa Trousers +1",feet="Armada Sollerets"}
        
        -- DEFENSE SETS
	sets.defense.PDT = {ammo="Jukukik Feather",
		head="Nocturnus Helm",neck="Twilight Torque",
		body="Mekira Meikogai",hands="Iuitl Wristbands +1",ring1="Dark Ring",ring2="Defending Ring",
		back="Mollusca Mantle",waist="Flume Belt",legs="Iuitl Tights +1",feet="Iuitl Gaiters +1"}

	sets.defense.Hybrid = set_combine(sets.defense.PDT, {head="Iuitl Headgear +1",
		back="Mollusca Mantle",waist="Hurch'lan Sash",legs="Iuitl Tights +1",feet="Iuitl Gaiters +1"})

	sets.defense.Killer = set_combine(sets.defense.Hybrid, {body="Ferine Gausape +2"})

	sets.defense.MDT = set_combine(sets.defense.PDT, {ammo="Sihirik",
		head="Ogier's Helm",ear1="Flashward Earring",ear2="Spellbreaker Earring",
		ring1="Shadow Ring",
		waist="Nierenschutz"})

	sets.defense.Absorb = set_combine(sets.defense.MDT, {
		body="Nocturnus Mail",
		back="Engulfer Cape"})

	sets.Kiting = {feet="Skadi's Jambeaux +1"}

        -- MELEE (SINGLE-WIELD) SETS
     sets.engaged = {ammo="Paeapua",
		head="Otomi Helm",neck="Asperity Necklace",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body="Gorney Haubert +1",hands="Xaddi Gauntlets",ring1="Rajas Ring",ring2="Epona's Ring",
		back="Atheling Mantle",waist="Windbuffet Belt",legs="Xaddi Cuisses",feet="Ejekamal Boots"}
        sets.engaged.MediumAcc = {ammo="Paeapua",
		head="Yaoyotl Helm",neck="Ziel Charm",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body="Gorney Haubert +1",hands="Buremte Gloves",ring1="Rajas Ring",ring2="Epona's Ring",
		back="Letalis Mantle",waist="Hurch'lan Sash",legs="Xaddi Cuisses",feet="Ejekamal Boots"}
	sets.engaged.HighAcc = {ammo="Jukukik Feather",
		head="Yaoyotl Helm",neck="Ziel Charm",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body="Mes'yohi Haubergeon",hands="Buremte Gloves",ring1="Mars's Ring",ring2="Oneiros Annulet",
		back="Letalis Mantle",waist="Hurch'lan Sash",legs="Xaddi Cuisses",feet="Ejekamal Boots"}

        -- MELEE (DUAL-WIELD) SETS FOR DNC AND NIN SUBJOB
        sets.engaged.DW = {ammo="Paeapua",
		head="Otomi Helm",neck="Asperity Necklace",ear1="Suppanomimi",ear2="Brutal Earring",
		body="Skadi's Cuirie +1",hands="Xaddi Gauntlets",ring1="Rajas Ring",ring2="Epona's Ring",
		back="Atheling Mantle",waist="Patentia Sash",legs="Xaddi Cuisses",feet="Ejekamal Boots"}
        sets.engaged.DW.MediumAcc = {ammo="Paeapua",
		head="Yaoyotl Helm",neck="Ziel Charm",ear1="Heartseeker Earring",ear2="Dudgeon Earring",
		body="Skadi's Cuirie +1",hands="Buremte Gloves",ring1="Rajas Ring",ring2="Epona's Ring",
		back="Letalis Mantle",waist="Patentia Sash",legs="Xaddi Cuisses",feet="Ejekamal Boots"}
	sets.engaged.DW.HighAcc = {ammo="Jukukik Feather",
		head="Yaoyotl Helm",neck="Ziel Charm",ear1="Heartseeker Earring",ear2="Dudgeon Earring",
		body="Mes'yohi Haubergeon",hands="Buremte Gloves",ring1="Mars's Ring",ring2="Oneiros Annulet",
		back="Letalis Mantle",waist="Hurch'lan Sash",legs="Xaddi Cuisses",feet="Ejekamal Boots"}

	-- GEARSETS FOR MASTER ENGAGED (SINGLE-WIELD) & PET ENGAGED
        sets.engaged.PetStance = set_combine(sets.engaged,
		{head="Anwig Salade",
		body="Ankusa Jackcoat +1",hands="Regimen Mittens",
		waist="Hurch'lan Sash",legs="Ankusa Trousers +1",feet="Armada Sollerets"})
        sets.engaged.PetStance.MediumAcc = set_combine(sets.engaged.MediumAcc,
		{head="Ankusa Helm +1",
		hands="Regimen Mittens",
		waist="Hurch'lan Sash"})
        sets.engaged.PetStance.HighAcc = set_combine(sets.engaged.HighAcc,
		{hands="Regimen Mittens",
		waist="Hurch'lan Sash"})

	-- GEARSETS FOR MASTER ENGAGED (SINGLE-WIELD) & PET TANKING
        sets.engaged.PetTank = set_combine(sets.engaged,
		{head="Anwig Salade",neck="Shepherd's Chain",ear1="Topaz Earring",ear2="Topaz Earring",
		body="Ankusa Jackcoat +1",hands="Ankusa Gloves +1",
		back="Oneiros Cappa",waist="Isa Belt",legs="Ferine Quijotes +2",feet="Ankusa Gaiters +1"})
        sets.engaged.PetTank.MediumAcc = set_combine(sets.engaged.MediumAcc,
		{head="Anwig Salade",
		hands="Ankusa Gloves +1",
		back="Oneiros Cappa",legs="Ferine Quijotes +2"})
        sets.engaged.PetTank.HighAcc = set_combine(sets.engaged.HighAcc,
		{head="Anwig Salade",
		hands="Regimen Mittens"})

	-- GEARSETS FOR MASTER ENGAGED (DUAL-WIELD) & PET ENGAGED
        sets.engaged.DW.PetStance = set_combine(sets.engaged.DW,
		{head="Anwig Salade",
		body="Ankusa Jackcoat +1",hands="Regimen Mittens",
		waist="Hurch'lan Sash",legs="Ankusa Trousers +1",feet="Armada Sollerets"})
        sets.engaged.DW.PetStance.MediumAcc = set_combine(sets.engaged.DW.MediumAcc,
		{head="Ankusa Helm +1",
		hands="Regimen Mittens",
		waist="Hurch'lan Sash"})
        sets.engaged.DW.PetStance.HighAcc = set_combine(sets.engaged.DW.HighAcc,
		{hands="Regimen Mittens",
		waist="Hurch'lan Sash"})

	-- GEARSETS FOR MASTER ENGAGED (DUAL-WIELD) & PET TANKING
        sets.engaged.DW.PetTank = set_combine(sets.engaged.DW,
		{head="Anwig Salade",neck="Shepherd's Chain",ear1="Topaz Earring",ear2="Topaz Earring",
		body="Ankusa Jackcoat +1",hands="Ankusa Gloves +1",
		back="Oneiros Cappa",waist="Isa Belt",legs="Ferine Quijotes +2",feet="Ankusa Gaiters +1"})
        sets.engaged.DW.PetTank.MediumAcc = set_combine(sets.engaged.DW.MediumAcc,
		{head="Anwig Salade",
		hands="Ankusa Gloves +1",
		back="Oneiros Cappa",legs="Ferine Quijotes +2"})
        sets.engaged.DW.PetTank.HighAcc = set_combine(sets.engaged.DW.HighAcc,
		{head="Anwig Salade",
		hands="Regimen Mittens"})

	sets.buff['Killer Instinct'] = {body="Ferine Gausape +2"}
	sets.buff.Doomed = {ring1="Saida Ring"}
	sets.THBelt = {waist="Chaac Belt"}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks that are called to process player actions at specific points in time.
-------------------------------------------------------------------------------------------------------------------

function job_precast(spell, action, spellMap, eventArgs)
	cancel_conflicting_buffs(spell, action, spellMap, eventArgs)

-- Define class for Sic and Ready moves.
        if ready_moves_to_check:contains(spell.name) and pet.status == 'Engaged' then
                classes.CustomClass = "WS"
		equip(sets.midcast.Pet.ReadyRecast)
        end
end

function job_post_precast(spell, action, spellMap, eventArgs)
-- If Killer Instinct is active during WS, equip Ferine Gausape +2.
	if spell.type:lower() == 'weaponskill' and buffactive['Killer Instinct'] then
		equip(sets.buff['Killer Instinct'])
	end

-- Equip Chaac Belt for TH+1 on common Subjob Abilities or Spells.
	if abilities_to_check:contains(spell.name) and state.TreasureMode == "Tag" then
		equip(sets.THBelt)
	end
end

function job_pet_midcast(spell, action, spellMap, eventArgs)
-- Equip monster correlation gear, as appropriate
        equip(set_combine(sets.midcast.Pet.WS, sets.midcast.Pet[state.CorrelationMode]))

	-- If the Ready move buff effect is modified by TP then equip Ferine Manoplas +1 or +2.
	if tp_based_moves:contains(spell.name) then
		equip(sets.midcast.Pet.TPBonus)
	end
end

-------------------------------------------------------------------------------------------------------------------
-- Customization hook for idle sets.
-------------------------------------------------------------------------------------------------------------------

function customize_idle_set(idleSet)
	if player.hpp < 50 and pet.status ~= 'Engaged' then
		idleSet = set_combine(idleSet, sets.ExtraRegen)
	end

	return idleSet
end

-------------------------------------------------------------------------------------------------------------------
-- Hooks for Reward, Correlation, Treasure Hunter, and Pet Mode handling.
-------------------------------------------------------------------------------------------------------------------

function job_state_change(stateField, newValue, oldValue)
        if stateField == 'RewardMode' then
                -- Theta, Zeta or Eta
                RewardFood.name = "Pet Food " .. newValue
	elseif stateField == 'CorrelationMode' then
		state.CorrelationMode = newValue
	elseif stateField == 'TreasureMode' then
		state.TreasureMode = newvalue
        elseif stateField == 'PetMode' then
                state.CombatWeapon = newValue
        end
end

function get_custom_wsmode(spell, spellMap, default_wsmode)
        if default_wsmode == 'Normal' then
                if spell.english == "Ruinator" and (world.day_element == 'Water' or world.day_element == 'Wind' or world.day_element == 'Ice') then
                        return 'Mekira'
                end
        end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements self-commands.
-------------------------------------------------------------------------------------------------------------------

-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
	state.CombatForm = get_combat_form()
end

-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)
	local defenseString = ''
	if state.Defense.Active then
		local defMode = state.Defense.PhysicalMode
		if state.Defense.Type == 'Magical' then
			defMode = state.Defense.MagicalMode
		end
		defenseString = 'Defense: '..state.Defense.Type..' '..defMode..', '
	end

	add_to_chat(122,'Melee: '..state.OffenseMode..'/'..state.DefenseMode..', WS: '..state.WeaponskillMode..', '..defenseString..
	 'Reward: '..state.RewardMode..', Corr.: '..state.CorrelationMode..', Pet Mode: '..state.PetMode)

	eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function get_combat_form()
	if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
                return 'DW'
	else
		return
        end
end