-- *** Credit goes to Flippant for helping me with Gearswap *** --
-- ** I Use Some of Motenten's Functions ** --

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
	-- Load and initialize the include file.
	include('Mote-Include.lua')
	include('organizer-lib')
end


-- Setup vars that are user-independent.
function job_setup()
	get_combat_form()
    include('Mote-TreasureHunter')
    state.TreasureMode:set('Tag')
    
	
	-- list of weaponskills that make better use of otomi helm in low acc situations
    wsList = S{'Drakesbane'}

	state.Buff = {}
	-- JA IDs for actions that always have TH: Provoke, Animated Flourish
	info.default_ja_ids = S{35, 204}
	-- Unblinkable JA IDs for actions that always have TH: Quick/Box/Stutter Step, Desperate/Violent Flourish
	info.default_u_ja_ids = S{201, 202, 203, 205, 207}
end

 
-- //gs debugmode
-- //gs showswaps
 
function binds_on_load()
-- F9-F12
send_command('bind f9 gs c cycle OffenseMode')
send_command('bind f10 gs c cycle HybridMode')
send_command('bind f11 gs c cycle CastingMode')
send_command('bind f12 gs c update user')
-- CTRL F9-F12
send_command('bind ^q gs c mainweapon')
send_command('bind ^f9 gs c cycle WeaponskillMode')
-- ALT F9-12
send_command('bind !f9 gs c cycle IdleMode')
send_command('bind !f10 gs c cycle RangedMode')
send_command('bind !f12 gs c cycle Kiting')
end
 
function job_setup()
state.mainweapon = M{['description'] = 'Main Weapon'}
state.mainweapon:options('GAX','POL','Sword','Club','H2H')
end
 
function user_setup()
-- Options: Override default values
state.OffenseMode:options('Normal', 'Acc')
state.WeaponskillMode:options('Normal', 'Acc')
state.HybridMode:options('Normal', 'PDT')
state.CastingMode:options('Normal', 'Resistant')
state.IdleMode:options('Normal','PDT')
state.PhysicalDefenseMode:options('PDT', 'MDT')
 
GAX_weapons = S{'Chango'}
GSD_weapons = S{'Ragnarok'}
POL_weapons = S{'Shining One'}
Sword_weapons = S{'Naegling'}
Club_weapons = S{'Loxotic Mace +1'}
H2H_weapons = S{'Karambit'}
 
update_combat_form()
select_default_macro_book()
end
 
-- Called when this job file is unloaded (eg: job change)
function file_unload()
if binds_on_unload then
binds_on_unload()
end
end
 
sets.mainweapon = {}
sets.mainweapon.GAX = {
main="Chango",
sub="Utu Grip",
}
sets.mainweapon.Sword = {
main="Naegling",
sub="Blurred Shield +1",
}
 
sets.mainweapon.POL = {
main="Shining One",
sub="Utu Grip",
}

sets.mainweapon.Club = {
main="Loxotic Mace +1",
sub="Blurred Shield +1",
}

sets.mainweapon.H2H = {
main="Karambit",
}
 
-- Define sets and vars used by this job file.
function init_gear_sets()
-- Precast sets
	sets.JA = {}
	
	sets.precast.JA.Berserk = {body="Pumm. Lorica +3",feet="Agoge Calligae +3"}
	sets.precast.JA.Aggressor = {head="Pumm. Mask +3",body="Agoge Lorica +3"}
	sets.precast.JA["Blood Rage"] = {body="Boii Lorica +1"}
	sets.precast.JA.Warcry = {head="Agoge Mask +3"}
	sets.precast.JA.Tomahawk = {ammo="Thr. Tomahawk"}
	sets.precast.JA["Mighty Strikes"] = {hands="Agoge Mufflers +3"}
	
-- Fast cast sets for spells
sets.precast.FC = {    ammo="Sapience Orb",
    head={ name="Odyssean Helm", augments={'Accuracy+29','"Fast Cast"+2','AGI+4','Attack+5',}},
    body={ name="Odyss. Chestplate", augments={'Accuracy+22 Attack+22','"Fast Cast"+5','MND+10',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2',}},
    legs={ name="Eschite Cuisses", augments={'"Mag.Atk.Bns."+25','"Conserve MP"+6','"Fast Cast"+5',}},
    feet={ name="Odyssean Greaves", augments={'Accuracy+18','"Fast Cast"+4','INT+13','"Mag.Atk.Bns."+2',}},
    neck="Voltsurge Torque",
    waist="Flume Belt",
    left_ear="Cessance Earring",
    right_ear="Loquac. Earring",
    left_ring="Defending Ring",
    right_ring="Vocane Ring",
    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},}
 
-- Midcast Sets
sets.midcast.FastRecast = {}
sets.JA.Berserk = {body="Pumm. Lorica +3",feet="Agoge Calligae +3"}
sets.JA.Aggressor = {head="Pumm. Mask +3",body="Agoge Lorica +3"}
sets.JA["Blood Rage"] = {body="Boii Lorica +1"}
sets.JA.Warcry = {head="Agoge Mask +3"}
sets.JA.Tomahawk = {ammo="Thr. Tomahawk"}
sets.JA["Mighty Strikes"] = {hands="Agoge Mufflers +3"}

sets.midcast.Flash = {}
 
-- Resting sets
sets.resting = {}
 
-- Idle sets
sets.idle ={
    ammo="Ginsen",
    head="Flam. Zucchetto +2",
    body="Flamma Korazin +2",
    hands="Sulev. Gauntlets +2",
    legs="Sulev. Cuisses +2",
    feet="Flam. Gambieras +2",
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Handler's Earring +1",
    right_ear="Genmei Earring",
    left_ring="Defending Ring",
    right_ring="Gelatinous Ring +1",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
 
sets.idle.PDT = {    ammo="Staunch Tathlum",
    head="Sulevia's Mask +2",
    body="Arke Corazza",
    hands="Sulev. Gauntlets +2",
    legs="Arke Cosciales",
    feet="Hermes' Sandals",
    neck="Loricate Torque",
    waist="Ioskeha Belt +1",
    left_ear="Odnowa Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Vocane Ring",
    right_ring="Defending Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
 
--Engaged GAX
sets.engaged.GAX = {
    ammo="Coiste Bodhar",
    head="Sakpata's Helm",
    body="Sakpata's Plate",
    hands="Sakpata's Gauntlets",
    legs="Pumm. Cuisses +3",
    feet="Pumm. Calligae +3",
    neck={ name="War. Beads +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Schere Earring",
    right_ear="Dedition Earring",
    left_ring="Chirich Ring +1",
    right_ring="Niqmaddu Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
}
 
sets.engaged.GAX.PDT = {
    ammo="Ginsen",
    head="Flam. Zucchetto +2",
    body="Flamma Korazin +2",
    hands={ name="Tatena. Gote +1", augments={'Path: A',}},
    legs={ name="Tatena. Haidate +1", augments={'Path: A',}},
    feet={ name="Tatena. Sune. +1", augments={'Path: A',}},
    neck="Sanctity Necklace",
    waist="Ioskeha Belt +1",
    left_ear="Dedition Earring",
    right_ear="Telos Earring",
    left_ring="Chirich Ring +1",
    right_ring="Niqmaddu Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
}
 
--Engaged POL
sets.engaged.POL = {
    ammo="Ginsen",
    head="Flam. Zucchetto +2",
    body="Pumm. Lorica +3",
    hands="Sulev. Gauntlets +2",
    legs="Pumm. Cuisses +2",
    feet="Pumm. Calligae +3",
    neck="Warrior's Beads",
    waist="Ioskeha Belt +1",
    left_ear="Cessance Earring",
    right_ear="Telos Earring",
    left_ring="Regal Ring",
    right_ring="Flamma Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20, Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage Taken -5%'}},
}
 
sets.engaged.POL.PDT = set_combine(sets.engaged.POL), {    ammo="Staunch Tathlum",
    head="Sulevia's Mask +2",
    body="Arke Corazza",
    hands="Sulev. Gauntlets +2",
    legs="Arke Cosciales",
    feet="Pumm. Calligae +3",
    neck="Warrior's Beads",
    waist="Ioskeha Belt +1",
    left_ear="Cessance Earring",
    right_ear="Telos Earring",
    left_ring="Regal Ring",
    right_ring="Defending Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
 
sets.engaged.POL.Acc = set_combine(sets.engaged.POL, {})
 
 
-- Sword and Board Sets
sets.engaged.Sword = {ammo="Coiste Bodhar",
    head="Flam. Zucchetto +2",
    body="Sakpata's Plate",
    hands="Sakpata's Gauntlets",
    legs="Pumm. Cuisses +3",
    feet="Pumm. Calligae +3",
    neck={ name="War. Beads +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Schere Earring",
    right_ear="Dedition Earring",
    left_ring="Chirich Ring +1",
    right_ring="Niqmaddu Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
}
 
sets.engaged.Sword.PDT = {    ammo="Staunch Tathlum",
    head="Sulevia's Mask +2",
    body="Arke Corazza",
    hands="Sulev. Gauntlets +2",
    legs="Arke Cosciales",
    feet="Pumm. Calligae +3",
    neck="Warrior's Beads",
    waist="Ioskeha Belt +1",
    left_ear="Cessance Earring",
    right_ear="Telos Earring",
    left_ring="Regal Ring",
    right_ring="Defending Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}


sets.engaged.Sword.Acc = set_combine(sets.engaged.Sword, {})


-- Club and Board Sets
sets.engaged.Club = {ammo="Coiste Bodhar",
    head="Flam. Zucchetto +2",
    body="Boii Lorica +2",
    hands="Sakpata's Gauntlets",
    legs="Pumm. Cuisses +3",
    feet="Pumm. Calligae +3",
    neck={ name="War. Beads +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Schere Earring",
    right_ear="Dedition Earring",
    left_ring="Chirich Ring +1",
    right_ring="Niqmaddu Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
}
 
sets.engaged.Club.PDT = {    ammo="Staunch Tathlum",
    head="Sulevia's Mask +2",
    body="Boii Lorica +2",
    hands="Sulev. Gauntlets +2",
    legs="Arke Cosciales",
    feet="Pumm. Calligae +3",
    neck="Warrior's Beads",
    waist="Ioskeha Belt +1",
    left_ear="Cessance Earring",
    right_ear="Telos Earring",
    left_ring="Regal Ring",
    right_ring="Defending Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}


sets.engaged.Club.Acc = set_combine(sets.engaged.Club, {})

-- H2H Sets
sets.engaged.H2H = {ammo="Coiste Bodhar",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Sakpata's Gauntlets",
    legs="Pumm. Cuisses +3",
    feet="Pumm. Calligae +3",
    neck={ name="War. Beads +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Schere Earring",
    right_ear="Dedition Earring",
    left_ring="Chirich Ring +1",
    right_ring="Niqmaddu Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
}
 
sets.engaged.H2H.PDT = {    ammo="Staunch Tathlum",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Sulev. Gauntlets +2",
    legs="Arke Cosciales",
    feet="Pumm. Calligae +3",
    neck="Warrior's Beads",
    waist="Ioskeha Belt +1",
    left_ear="Cessance Earring",
    right_ear="Telos Earring",
    left_ring="Regal Ring",
    right_ring="Defending Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}


sets.engaged.H2H.Acc = set_combine(sets.engaged.H2H, {})

 
-- Weaponskill sets
 
-- GEAR ON THESE SETS ARE PLACEHOLDERS FOR TESTING. Redo them.

-- Default set. Used for multi-hits and any other non-spoecified WS. Prioritize multi-hit, acc, atk.
sets.precast.WS = {
    ammo="Knobkierrie",
    head="Nyame helm",
    body="Souv. Cuirass +1",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="War. Beads +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
    right_ear="Telos Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Petrov Ring",
    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
}

-- WSD set. Used as a base for strong first hit WSes ( Savage Blade, Impulse Drive, Upheaval, etc). Prioritize WSD
sets.precast.WS.WSD = {
    ammo="Knobkierrie",
    head="Nyame helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="War. Beads +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
    right_ear="Telos Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Petrov Ring",
    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
}

-- MAB se. used for magical / hybrids. Prioritize MAB.
sets.precast.WS.MAB = {
    ammo="Knobkierrie",
    head="Nyame helm",
    body="Emet Harness +1",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="War. Beads +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
    right_ear="Telos Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Petrov Ring",
    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
}

--Every weaponskill that uses a set different from the base on will need to have one of there:
--Sword
sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS.WSD, {
})

sets.precast.WS['Red Lotus Blade'] = set_combine(sets.precast.WS.MAB, {
})


--Great Sword
sets.precast.WS['Resolution'] = set_combine(sets.precast.WS, {ammo="Seething Bomblet +1",
})
 
-- Mighty Strikes WS Set --
sets.MS_WS = {feet="Boii Calligae +1"}
end
 
-- Job-specific hooks for standard casting events.
function job_midcast(spell, action, spellMap, eventArgs)
 
end
 
-- Called when the player's status changes.
function job_state_change(field, new_value, old_value)
 
end
 
function display_current_job_state(eventArgs)
local msg = 'Melee'
if state.HybridMode.value ~= 'Normal' then
msg = msg .. '/' .. state.HybridMode.value
end
end
 
 
 
function update_combat_form()
-- Check Weapontype
if GAX_weapons:contains(player.equipment.main) then
    state.CombatForm:set('GAX')
elseif 
    GSD_weapons:contains(player.equipment.main) then
    state.CombatForm:set('POL')
elseif
    Sword_weapons:contains(player.equipment.main) then
    state.CombatForm:set('Sword')
elseif
    Club_weapons:contains(player.equipment.main) then
    state.CombatForm:set('Club')
elseif
    H2H_weapons:contains(player.equipment.main) then
    state.CombatForm:set('H2H')
else
    state.CombatForm:reset()
    end
end
 
 function midcast(spell,action)
	if spell.action_type == 'Magic' then
		if spell.english:startswith('Utsusemi') then
			if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)'] or buffactive['Copy Image (3)']) then -- Cancel Copy Image 1, 2 & 3 For Utsusemi: Ichi --
				send_command('@wait 1.7;cancel Copy Image*')
			end
			equip(sets.Midcast.Haste)
		elseif spell.english == 'Monomi: Ichi' then -- Cancel Sneak --
			if buffactive['Sneak'] then
				send_command('@wait 1.7;cancel sneak')
			end
			equip(sets.Midcast.Haste)
		else
			equip(sets.Midcast.Haste)
		end
	end
end
 
function job_self_command(cmdParams, eventArgs)
command = cmdParams[1]:lower()
if command=='mainweapon' then
enable('main','sub')
mainswap=1
send_command('gs c cycle mainweapon')
end
end
 
function job_update(cmdParams, eventArgs)
update_combat_form()
end
 
-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
update_combat_form()
end
 
-- eventArgs is the same one used in job_precast, in case information needs to be persisted.
moonshade_WS = S{"Resolution", "Torcleaver", "Savage Blade"}
 
function job_post_precast(spell, action, spellMap, eventArgs)
--if spell.type == 'WeaponSkill' then
--if world.time >= (17*60) or world.time <= (7*60) then
--equip({ear1="Lugra Earring +1",ear2="Lugra Earring"})
--end
if moonshade_WS:contains(spell.english) and player.tp<2950 then 
equip({ear1="Moonshade Earring"})
end
--if buffactive['Mighty Strikes'] then 
--if sets.precast.WS[spell] then
--equipSet = sets.precast.WS[spell]
--equipSet = set_combine(equipSet,sets.MS_WS)
--equip(equipSet)
--else
--equipSet = sets.precast.WS
--equipSet = set_combine(equipSet,sets.MS_WS)
--equip(equipSet)
--end
--end
--end
end
 
function customize_idle_set(idleSet)
if mainswap then
mainswap=0
enable('main','sub')
equip(sets.mainweapon[state.mainweapon.value])
disable('main','sub')
end
if player.mpp < 51 then
return set_combine(idleSet, sets.latent_refresh)
end
if state.Buff.Doom or state.Buff.Curse then
return set_combine(idleSet, sets.Doom)
else
return idleSet
end
end
 
function customize_melee_set(meleeSet)
if mainswap then
mainswap=0
enable('main','sub')
equip(sets.mainweapon[state.mainweapon.value])
disable('main','sub')
end
if state.Buff.Aftermath then
return set_combine(meleeSet, sets.Aftermath)
end
if state.Buff.Doom then
return set_combine(meleeSet, sets.Doom)
end
if state.Buff.Curse then
return set_combine(meleeSet, sets.Curse)
else
return meleeSet
end
end
 
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
 
 
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
-- Default macro set/book
if player.sub_job == 'SAM' then
set_macro_page(2, 8)
elseif player.sub_job == 'NIN' then
set_macro_page(3, 8)
elseif player.sub_job == 'DRG' then
set_macro_page(5, 8)
elseif player.sub_job == 'DNC' then
set_macro_page(3, 8)
else
set_macro_page(1, 8)
end
end

function set_lockstyle()
    send_command('wait 3; input /lockstyleset 020')
end
