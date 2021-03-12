require 'organizer-lib'
---------------------------------------------------------------------------------------------------------------------------------------
-------------------------------- Initialization function that defines sets and variables to be used -----------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
 
-- IMPORTANT: Make sure to also get the Mote-Include.lua file to go with this.
 
-- Initialization function for this job file.
function get_sets()
    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

 
-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    -- Options: Override default values
    options.OffenseModes = {'Normal', 'Acc'}
	options.DefenseModes = {'Normal', 'PDT'}
    options.WeaponskillModes = {'Normal', 'Acc'}
    options.CastingModes = {'Normal', 'DT'} 
    options.IdleModes = {'Normal',}
    options.RestingModes = {'Normal'}
    options.PhysicalDefenseModes = {'Aegis', 'Srivatsa', 'Ochain'}
    options.MagicalDefenseModes = {'MDT' ,'BDT','ResistCharm'}
    options.HybridDefenseModes = {'None', 'Reraise',}
    options.BreathDefenseModes = {'BDT'}
	state.Defense.PhysicalMode = 'Aegis'
    state.HybridDefenseMode = 'None'
    state.BreathDefenseModes = 'BDT'
    send_command('bind f12 gs c cycle MagicalDefense')
 	send_command('bind ^= gs c activate MDT')
    select_default_macro_book()
end

 function user_unload()
	send_command('unbind `')
	send_command('unbind ^`')
	send_command('unbind !`')
	send_command('unbind ^-')
	send_command('unbind !-')	
	send_command('unbind ^=')
	send_command('unbind !=')		
	send_command('unbind delete')
	send_command('unbind end')
	send_command('unbind home')
end

-- Define sets and vars used by this job file.
function job_setup()
 	include('caster_buffWatcherPLD.lua')
	include('common_info.statusPLD.lua')	
buffWatcher.watchList = 
{
                       ["Enlight"]="Enlight II",
                       ["Crusade"]="Crusade",
                       ["Phalanx"]="Phalanx",
                       ["Protect"]="Protect V",
                       ["Shell"]="Shell IV",				   
}
end

--------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------Precast sets-----------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------

function init_gear_sets()

	 -- Precast sets to enhance JAs
    sets.precast.JA['Invincible'] = set_combine(sets.precast.JA['Provoke'], {legs="Cab. Breeches +1"})
   
    sets.precast.JA['Holy Circle'] = set_combine(sets.precast.JA['Provoke'], {feet="Rev. Leggings +3"})
         
    sets.precast.JA['Shield Bash'] = set_combine(sets.precast.JA['Provoke'], {hands="Cab. Gauntlets +1", left_ear="Knightly Earring", left_ring="Guardian's Ring",right_ring="Fenian Ring"})
     
    sets.precast.JA['Intervene'] = sets.precast.JA['Shield Bash']
    
    sets.precast.JA['Sentinel'] = set_combine(sets.precast.JA['Provoke'], {feet="Cab. Leggings +1"})   
     
    --The amount of damage absorbed is variable, determined by VIT*2
    sets.precast.JA['Rampart'] =     
{
    ammo="Iron Gobbet",
    head={ name="Cab. Coronet +1", augments={'Enhances "Iron Will" effect',}},
    body={ name="Souveran Cuirass", augments={'VIT+10','Attack+20','"Refresh"+2',}},
    hands="Chev. Gauntlets +1",
    legs={ name="Odyssean Cuisses", augments={'Damage taken-2%','VIT+15',}},
    feet={ name="Odyssean Greaves", augments={'Accuracy+5 Attack+5','"Dbl.Atk."+4','VIT+15',}},
    neck="Unmoving Collar +1",
    waist="Latria Sash",
    left_ear="Terra's Pearl",
    right_ear="Terra's Pearl",
    left_ring="Titan Ring +1",
    right_ring="Titan Ring +1",
    back={ name="Rudianos's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Enmity+10',}},
}
     
    sets.buff['Rampart'] = sets.precast.JA['Rampart']
   
    sets.precast.JA['Fealty'] = set_combine(sets.precast.JA['Provoke'], {feet="Chev. Sabatons +1",})
     
    sets.precast.JA['Divine Emblem'] = set_combine(sets.precast.JA['Provoke'], {feet="Chev. Sabatons +1"})
     
    --15 + min(max(floor((user VIT + user MND - target VIT*2)/4),0),15)
    sets.precast.JA['Cover'] = set_combine(sets.precast.JA['Rampart'], {head="Rev. Coronet +2", body="Cab. Surcoat +1"})
    
    sets.buff['Cover'] = sets.precast.JA['Cover']
     
    -- add MND for Chivalry
    sets.precast.JA['Chivalry'] = 
{
	ammo="Strobilus",
    head="Jumalik Helm",
    body="Rev. Surcoat +3",
    hands={ name="Cab. Gauntlets +1", augments={'Enhances "Chivalry" effect',}},
    legs={ name="Cab. Breeches +1", augments={'Enhances "Invincible" effect',}},
    feet="Odyssean Greaves",
    neck="Dualism Collar +1",
    waist="Creed Baudrier",
    left_ear="Halasz Earring",
    right_ear="Nourish. Earring +1",
    left_ring="Stikini Ring",
    right_ring="Globidonta Ring",
    back={ name="Weard Mantle", augments={'VIT+5','DEX+3','Phalanx +5',}}
}
     
    ------------------------ Sub WAR ------------------------ 
	sets.precast.JA['Provoke'] =    --enmity +121
{
    ammo="Iron Gobbet",
    head="Loess Barbuta +1",priority=2,
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',priority=1}},
    hands={ name="Yorium Gauntlets", augments={'Enmity+10','Phalanx +3',}},
    legs={ name="Odyssean Cuisses", augments={'Attack+24','Enmity+8','Accuracy+10',priority=1}},
    feet={ name="Eschite Greaves", augments={'HP+80','Enmity+7','Phys. dmg. taken -4',priority=3}},
    neck="Unmoving Collar +1",
    waist="Creed Baudrier",
    left_ear="Trux Earring",
    right_ear="Cryptic Earring",
    left_ring="Apeile Ring",
    right_ring="Apeile Ring +1",
    back={ name="Rudianos's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Enmity+10',}},
}		
 
    sets.precast.JA['Warcry'] = sets.precast.JA['Provoke'] 
     
    sets.precast.JA['Defender'] = sets.precast.JA['Provoke']
 
    ------------------------ Sub DNC ------------------------ 
     
    -- Waltz set (chr and vit)
    sets.precast.Waltz = 
{
    ammo="Iron Gobbet",
    head={ name="Jumalik Helm", augments={'MND+10','"Mag.Atk.Bns."+15','Magic burst mdg.+10%','"Refresh"+1',}},
    body={ name="Found. Breastplate", augments={'Accuracy+11','Mag. Acc.+10','Attack+10','"Mag.Atk.Bns."+9',}},
    hands={ name="Founder's Gauntlets", augments={'STR+10','Attack+15','"Mag.Atk.Bns."+15','Phys. dmg. taken -5%',}},
    legs="Dashing Subligar",
    feet={ name="Odyssean Greaves", augments={'Accuracy+5 Attack+5','"Dbl.Atk."+4','VIT+15',}},
    neck="Unmoving Collar +1",
    waist="Latria Sash",
    left_ear="Terra's Pearl",
    right_ear="Terra's Pearl",
    left_ring="Valseur's Ring",
    right_ring="Asklepian Ring",
    back={ name="Rudianos's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Enmity+10',}},
}
         
    -- Special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = sets.precast.Waltz
     
    sets.precast.Step = sets.precast.JA['Provoke']
        
    sets.precast.Flourish1 = sets.precast.Step
     
    ------------------------ Sub RUN ------------------------ 
    sets.precast.JA['Ignis'] = sets.precast.JA['Provoke']   
    sets.precast.JA['Gelus'] = sets.precast.JA['Provoke'] 
    sets.precast.JA['Flabra'] = sets.precast.JA['Provoke'] 
    sets.precast.JA['Tellus'] = sets.precast.JA['Provoke']  
    sets.precast.JA['Sulpor'] = sets.precast.JA['Provoke'] 
    sets.precast.JA['Unda'] = sets.precast.JA['Provoke'] 
    sets.precast.JA['Lux'] = sets.precast.JA['Provoke']     
    sets.precast.JA['Tenebrae'] = sets.precast.JA['Provoke'] 
     
    sets.precast.JA['Vallation'] = sets.precast.JA['Provoke'] 
     
    sets.precast.JA['Pflug'] = sets.precast.JA['Provoke'] 
          
    -- Fast cast sets for spells   2137HP FC+79/80
	sets.precast.FC = 
{ 
    ammo="Sapience Orb",
    head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',priority=5}},
    body={ name="Odyss. Chestplate", augments={'Mag. Acc.+15','"Fast Cast"+6',priority=2}},
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',priority=6}},
    legs={ name="Odyssean Cuisses", augments={'AGI+1','Pet: DEX+1','"Fast Cast"+7','Mag. Acc.+9 "Mag.Atk.Bns."+9',priority=4}},
    feet={ name="Odyssean Greaves", augments={'"Mag.Atk.Bns."+10','"Fast Cast"+6',priority=7}},
    neck="Orunmila's Torque",
    waist="Oneiros Belt",priority=3,
    left_ear="Loquac. Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Rahab Ring",
    right_ring="Kishar Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Fast Cast"+10',priority=1}},
}	
     
	sets.precast.FC.DT = 
{ 
    ammo="Impatiens",
    head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',priority=5}},
    body="Rev. Surcoat +3",
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs={ name="Odyssean Cuisses", augments={'AGI+1','Pet: DEX+1','"Fast Cast"+7','Mag. Acc.+9 "Mag.Atk.Bns."+9',priority=4}},
    feet={ name="Odyssean Greaves", augments={'"Mag.Atk.Bns."+10','"Fast Cast"+6',priority=6}},
    neck="Loricate Torque +1 +1",
    waist={"Oneiros Belt",priority=3},
    left_ear="Loquac. Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Karieyh Ring",
    right_ring="Defending Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Fast Cast"+10',priority=2}},
}
	 
    sets.precast.FC.Phalanx = set_combine(sets.precast.FC , {waist="Siegel Sash",})
	sets.precast.FC.Enlight = sets.precast.FC.Phalanx
	sets.precast.FC['Enlight II'] = sets.precast.FC.Phalanx
	sets.precast.FC.Protect = sets.precast.FC.Phalanx
	sets.precast.FC.Shell = sets.precast.FC.Phalanx
	sets.precast.FC.Crusade = sets.precast.FC.Phalanx
         
    sets.precast.FC.Cure = 
{
    ammo="Impatiens",
    head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
    body={ name="Jumalik Mail", augments={'HP+50','Attack+15','Enmity+9','"Refresh"+2',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs={ name="Odyssean Cuisses", augments={'AGI+1','Pet: DEX+1','"Fast Cast"+7','Mag. Acc.+9 "Mag.Atk.Bns."+9'}},
    feet={ name="Odyssean Greaves", augments={'"Mag.Atk.Bns."+10','"Fast Cast"+6',}},
    neck="Orunmila's Torque",
    waist="Acerbic Sash +1",
    left_ear="Nourish. Earring +1",
    right_ear="Mendi. Earring",
    left_ring="Lebeche Ring",
    right_ring="Kishar Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Fast Cast"+10',}},
}       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = 
{
    ammo="Paeapua",
    head="Ynglinga Sallet",
    body={ name="Valorous Mail", augments={'Accuracy+22 Attack+22','Weapon Skill Acc.+10','DEX+3','Accuracy+6',}},
    hands="Flam. Manopolas +1",
    legs="Sulevi. Cuisses +1",
    feet="Sulev. Leggings +1",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Odnowa Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Rajas Ring",
    right_ring="Ifrit Ring +1",
    back={ name="Rudianos's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
}
 
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
 
    --Stat Modifier:     73~85% MND  fTP:    1.0
 sets.precast.WS['Requiescat'] = 
{
    ammo="Quartz Tathlum +1",
    head={ name="Valorous Mask", augments={'Accuracy+27','"Dbl.Atk."+3','DEX+10',}},
    body={ name="Valorous Mail", augments={'Accuracy+22 Attack+22','Weapon Skill Acc.+10','DEX+3','Accuracy+6',}},
    hands="Sulev. Gauntlets +1",
    legs="Sulevi. Cuisses +1",
    feet="Sulev. Leggings +1",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Brutal Earring",
    right_ear="Telos Earring",
    left_ring="Rufescent Ring",
    right_ring="Stikini Ring",
    back={ name="Rudianos's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},
}
    
   --Stat Modifier:  50%MND / 30%STR MAB+    fTP:2.75
    sets.precast.WS['Sanguine Blade'] = 
{
    ammo="Pemphredo Tathlum",
    head={ name="Jumalik Helm", augments={'MND+10','"Mag.Atk.Bns."+15','Magic burst mdg.+10%','"Refresh"+1',}},
    body={ name="Found. Breastplate", augments={'Accuracy+11','Mag. Acc.+10','Attack+10','"Mag.Atk.Bns."+9',}},
    hands={ name="Founder's Gauntlets", augments={'STR+10','Attack+15','"Mag.Atk.Bns."+15','Phys. dmg. taken -5%',}},
    legs={ name="Odyssean Cuisses", augments={'"Mag.Atk.Bns."+29','Accuracy+24','Accuracy+17 Attack+17','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},
    feet={ name="Founder's Greaves", augments={'VIT+10','Accuracy+15','"Mag.Atk.Bns."+15','Mag. Evasion+15',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Crematio Earring",
    right_ear="Friomisi Earring",
    left_ring="Shiva Ring +1",
    right_ring="Shiva Ring +1",
    back={ name="Rudianos's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','Weapon skill damage +10%',}},
}	
	
     
    sets.precast.WS['Aeolian Edge'] = 
{
    ammo="Pemphredo Tathlum",
    head={ name="Jumalik Helm", augments={'MND+10','"Mag.Atk.Bns."+15','Magic burst mdg.+10%','"Refresh"+1',}},
    body={ name="Found. Breastplate", augments={'Accuracy+11','Mag. Acc.+10','Attack+10','"Mag.Atk.Bns."+9',}},
    hands={ name="Founder's Gauntlets", augments={'STR+10','Attack+15','"Mag.Atk.Bns."+15','Phys. dmg. taken -5%',}},
    legs={ name="Odyssean Cuisses", augments={'"Mag.Atk.Bns."+29','Accuracy+24','Accuracy+17 Attack+17','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},
    feet={ name="Founder's Greaves", augments={'VIT+10','Accuracy+15','"Mag.Atk.Bns."+15','Mag. Evasion+15',}},
    neck="Eddy Necklace",
    waist="Eschan Stone",
    left_ear="Crematio Earring",
    right_ear="Friomisi Earring",
    left_ring="Shiva Ring +1",
    right_ring="Shiva Ring +1",
    back={ name="Rudianos's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','Weapon skill damage +10%',}},
}	
 
    --Stat Modifier: 50%MND / 50%STR fTP: 1000:4.0 2000:10.25 3000:13.75
    sets.precast.WS['Savage Blade'] = 
{
    ammo="Paeapua",
    head="Flam. Zucchetto +1",
    body={ name="Valorous Mail", augments={'Accuracy+22 Attack+22','Weapon Skill Acc.+10','DEX+3','Accuracy+6',}},
    hands="Flam. Manopolas +1",
    legs="Sulevi. Cuisses +1",
    feet="Sulev. Leggings +1",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Brutal Earring",
    right_ear="Telos Earring",
    left_ring="Rufescent Ring",
    right_ring="Ifrit Ring +1",
    back={ name="Rudianos's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
}

   --Stat Modifier:  80%DEX  fTP:2.25
   sets.precast.WS['Chant du Cygne'] = 
{	
    ammo="Ginsen",
    head="Ynglinga Sallet",
    body={ name="Valorous Mail", augments={'Accuracy+22 Attack+22','Weapon Skill Acc.+10','DEX+3','Accuracy+6',}},
    hands="Flam. Manopolas +1",
    legs="Sulevi. Cuisses +1",
    feet="Sulev. Leggings +1",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Brutal Earring",
    right_ear="Telos Earring",
    left_ring="Rajas Ring",
    right_ring="Ramuh Ring +1",
    back={ name="Rudianos's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},
}
	
    --Stat Modifier: WS damage + 30/31%   2211DMG maxaggro
    sets.precast.WS['Atonement'] = 
{
	ammo="Iron Gobbet",
    head={ name="Odyssean Helm", augments={'Attack+25','Weapon skill damage +5%','Accuracy+2',}},   				
    body="Phorcys Korazin",                                                                   							
    hands={ name="Odyssean Gauntlets", augments={'Weapon skill damage +5%','VIT+4','Accuracy+11','Attack+14',}},	
    legs={ name="Odyssean Cuisses", augments={'MND+1','AGI+5','Weapon skill damage +6%','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
    feet="Sulevia's Leggings +1",																						
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Cryptic Earring",
    right_ear="Ishvara Earring",																					
    left_ring="Apeile Ring",
    right_ring="Apeile Ring +1",
    back={ name="Rudianos's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},
}
           
    ------------------------------------------------------------------------------------------------
    -----------------------------------------Midcast sets-------------------------------------------
    ------------------------------------------------------------------------------------------------
    sets.midcast.FastRecast = 
{
    ammo="Staunch Tathlum +1",
    head="Chev. Armet +1",
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands="Chev. Gauntlets +1",
    legs="Founder's Hose",
    feet="Chev. Sabatons +1",
    neck="Loricate Torque +1 +1",
    waist="Rumination sash",
    left_ear="Knightly Earring",
    right_ear="Halasz Earring",
    left_ring="Karieyh Ring",
    right_ring="Defending Ring",
    back={ name="Weard Mantle", augments={'VIT+5','DEX+3','Phalanx +5',}},
}
	
    -- Divine Skill 565/574 (+109 on gears) 140 Acc
    sets.midcast.Divine = 
{
    ammo="Staunch Tathlum +1",
    head={ name="Jumalik Helm", augments={'MND+10','"Mag.Atk.Bns."+15','Magic burst mdg.+10%','"Refresh"+1',}},
    body="Rev. Surcoat +3",
    hands={ name="Eschite Gauntlets", augments={'Mag. Evasion+15','Spell interruption rate down +15%','Enmity+7',}},
    legs={ name="Kaiser Diechlings", augments={'Magic dmg. taken -3%','Divine magic skill +5',}},
    feet="Templar Sabatons",
    neck="Incanter's Torque",
    waist="Asklepian Belt",
    left_ear="Knight's Earring",
    right_ear="Beatific Earring",
    left_ring="Globidonta Ring",
    right_ring="Stikini Ring",
    back="Altruistic Cape",
}

    sets.midcast.Divine.DT = 
{
    ammo="Staunch Tathlum +1",
    head={ name="Jumalik Helm", augments={'MND+10','"Mag.Atk.Bns."+15','Magic burst mdg.+10%','"Refresh"+1',}},
    body="Rev. Surcoat +3",
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Loricate Torque +1 +1",
    waist="Flume Belt +1",
    left_ear="Knight's Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Karieyh Ring",
    right_ring="Defending Ring",
    back="Solemnity Cape",
}

	
	--skill 401/402
	sets.midcast['Enhancing Magic'] =
{
    ammo="Staunch Tathlum +1",
    head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
    legs={ name="Carmine Cuisses +1", augments={'HP+80','STR+12','INT+12',}},
    neck="Incanter's Torque",
    waist="Olympus Sash",
    left_ear="Andoaa Earring",
    right_ear="Augment. Earring",
    left_ring="Evanescence Ring",
    right_ring="Stikini Ring",

}

	sets.midcast.MAB = 
{
    ammo="Pemphredo Tathlum",
    head={ name="Jumalik Helm", augments={'MND+10','"Mag.Atk.Bns."+15','Magic burst mdg.+10%','"Refresh"+1',}},
    body={ name="Found. Breastplate", augments={'Accuracy+11','Mag. Acc.+10','Attack+10','"Mag.Atk.Bns."+9',}},
    hands={ name="Founder's Gauntlets", augments={'STR+10','Attack+15','"Mag.Atk.Bns."+15','Phys. dmg. taken -5%',}},
    legs={ name="Odyssean Cuisses", augments={'"Mag.Atk.Bns."+29','Accuracy+24','Accuracy+17 Attack+17','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},
    feet={ name="Founder's Greaves", augments={'VIT+10','Accuracy+15','"Mag.Atk.Bns."+15','Mag. Evasion+15',}},
    neck="Eddy Necklace",
    waist="Yamabuki-no-Obi",
    left_ear="Crematio Earring",
    right_ear="Friomisi Earring",
    left_ring="Shiva Ring +1",
    right_ring="Shiva Ring +1",
    back="Toro Cape",
}
     
    sets.midcast.Flash = 
{
    ammo="Iron Gobbet",
    head={ name="Jumalik Helm", augments={'MND+10','"Mag.Atk.Bns."+15','Magic burst mdg.+10%','"Refresh"+1',}},
    body="Rev. Surcoat +3",
    hands={ name="Eschite Gauntlets", augments={'Mag. Evasion+15','Spell interruption rate down +15%','Enmity+7',}},
    legs={ name="Yorium Cuisses", augments={'Enmity+10','Phalanx +3',}},
    feet={ name="Eschite Greaves", augments={'HP+80','Enmity+7','Phys. dmg. taken -4',}},
    neck="Unmoving Collar +1",
    waist="Asklepian Belt",
	left_ear="Trux Earring",
    right_ear="Cryptic Earring",
    left_ring="Apeile Ring",
    right_ring="Apeile Ring +1",
    back={ name="Rudianos's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Enmity+10',}},
}	

    sets.midcast.Flash.DT = 
{
    ammo="Staunch Tathlum +1",
    head={ name="Jumalik Helm", augments={'MND+10','"Mag.Atk.Bns."+15','Magic burst mdg.+10%','"Refresh"+1',}},
    body="Rev. Surcoat +3",
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Loricate Torque +1 +1",
    waist="Flume Belt +1",
    left_ear="Knight's Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Karieyh Ring",
    right_ring="Defending Ring",
    back="Solemnity Cape",
}	
         
    sets.midcast.Enlight = sets.midcast.Divine --+95 accu
    sets.midcast['Enlight II'] = sets.midcast.Enlight--+140 accu +2 acc each 20 divine skill
     
    --Max HP+ set for reprisal 3496HP / war so 6992 damage reflect before it off
    sets.midcast.Reprisal =	
{
    ammo="Egoist's Tathlum",
    head={ name="Souv. Schaller +1", augments={'HP+105','VIT+12','Phys. dmg. taken -4',}},
    body="Rev. Surcoat +3",
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Dualism Collar +1",
    waist="Oneiros Belt",
    left_ear="Odnowa Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Meridian Ring",
    right_ring="K'ayres Ring",
    back="Reiki Cloak",
}
     
    --Phalanx skill 360/358 = 30/30  + phalanx + 27/30 total 57/60
    sets.midcast.Phalanx = 
{
    ammo="Staunch Tathlum +1",
    head={ name="Odyssean Helm", augments={'MND+10','AGI+4','Phalanx +4','Accuracy+8 Attack+8',}},
    body={ name="Odyss. Chestplate", augments={'Pet: Mag. Acc.+26','"Fast Cast"+1','Phalanx +5','Mag. Acc.+2 "Mag.Atk.Bns."+2',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    legs={ name="Odyssean Cuisses", augments={'AGI+8','Accuracy+3','Phalanx +4','Accuracy+3 Attack+3','Mag. Acc.+12 "Mag.Atk.Bns."+12',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Incanter's Torque",
    waist="Rumination Sash",
    left_ear="Halasz Earring",
    right_ear="Knightly Earring",
    left_ring="Evanescence Ring",
    right_ring="Apeile Ring +1",
    back={ name="Weard Mantle", augments={'VIT+5','DEX+3','Phalanx +5',}},
}
     
    sets.midcast.Banish = set_combine(sets.midcast.MAB, {right_ring="Fenian Ring"})
    sets.midcast['Banish II'] = sets.midcast.Banish
     
    sets.midcast.Holy = sets.midcast.MAB
    sets.midcast['Holy II'] = sets.midcast.Holy
     
    sets.midcast.Crusade = 
{
    ammo="Staunch Tathlum +1",
    head="Loess Barbuta +1",
    body="Souveran Cuirass",
    hands={ name="Yorium Gauntlets", augments={'Enmity+10','Phalanx +3',}},
	legs={ name="Founder's Hose", augments={'MND+8','Mag. Acc.+14','Attack+13','Breath dmg. taken -3%',}},
    feet={ name="Eschite Greaves", augments={'HP+80','Enmity+7','Phys. dmg. taken -4',}},
    neck="Unmoving Collar +1",
    waist="Rumination Sash",
    left_ear="Halasz Earring",
    right_ear="Knightly Earring",
    left_ring="Evanescence Ring",
    right_ring="Apeile Ring +1",
    back={ name="Rudianos's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Enmity+10',}},
}
     
-- Cure1=120; Cure2=266; Cure3=600; Cure4=1123; cure potency caps at 50/50% received caps at 32/30%. sans signet 
    sets.midcast.Cure = 
{
    ammo="Staunch Tathlum +1",
    head={ name="Souv. Schaller +1", augments={'HP+105','VIT+12','Phys. dmg. taken -4',}},
    body={ name="Jumalik Mail", augments={'HP+50','Attack+15','Enmity+9','"Refresh"+2',}},
    hands="Macabre Gaunt. +1",
    legs={ name="Founder's Hose", augments={'MND+8','Mag. Acc.+14','Attack+13','Breath dmg. taken -3%',}},
    feet={ name="Odyssean Greaves", augments={'Potency of "Cure" effect received+6%','MND+2','Mag. Acc.+8','"Mag.Atk.Bns."+3',}},
    neck="Incanter's Torque",
	waist="Hachirin-no-obi",
    left_ear="Nourish. Earring +1",
    right_ear="Mendi. Earring",
    left_ring="Karieyh Ring",
    right_ring="Stikini Ring",
    back="Solemnity Cape",
}	

    sets.midcast.Cure.DT = 
{
    ammo="Staunch Tathlum +1",
    head={ name="Souv. Schaller +1", augments={'HP+105','VIT+12','Phys. dmg. taken -4',}},
    body={ name="Jumalik Mail", augments={'HP+50','Attack+15','Enmity+9','"Refresh"+2',}},
    hands="Macabre Gaunt. +1",
    legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Loricate Torque +1 +1",
    waist="Flume Belt +1",
    left_ear="Nourish. Earring +1",
    right_ear="Mendi. Earring",
    left_ring="Karieyh Ring",
    right_ring="Defending Ring",
    back="Solemnity Cape",
}
-- 630 HP (curecheat)
	sets.self_healing =
{
    ammo="Staunch Tathlum +1",
    head={ name="Souv. Schaller +1", augments={'HP+105','VIT+12','Phys. dmg. taken -4',priority=1}},
    body={ name="Jumalik Mail", augments={'HP+50','Attack+15','Enmity+9','"Refresh"+2',priority=4}},
    hands="Macabre Gaunt. +1",
    legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',priority=3}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',priority=2}},
    neck="Phalaina Locket",
	waist="Gishdubar Sash",
    left_ear="Nourish. Earring +1",
    right_ear="Oneiros Earring",priority=5,
    left_ring="Karieyh Ring",
    right_ring="Defending Ring",
    back="Solemnity Cape",
}
	
	sets.self_healing.DT =
{
    ammo="Staunch Tathlum +1",
    head={ name="Souv. Schaller +1", augments={'HP+105','VIT+12','Phys. dmg. taken -4',}},
    body={ name="Jumalik Mail", augments={'HP+50','Attack+15','Enmity+9','"Refresh"+2',}},
    hands="Macabre Gaunt. +1",
    legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Phalaina Locket",
    waist="Gishdubar Sash",
    left_ear="Nourish. Earring +1",
    right_ear="Oneiros Earring",
    left_ring="Karieyh Ring",
    right_ring="Defending Ring",
    back="Solemnity Cape",
}

    sets.midcast.Protect = 
{
    ammo="Staunch Tathlum +1",
    head={ name="Souv. Schaller +1", augments={'HP+105','VIT+12','Phys. dmg. taken -4',}},
    body="Shab. Cuirass +1",
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    legs={ name="Founder's Hose", augments={'MND+8','Mag. Acc.+14','Attack+13','Breath dmg. taken -3%',}},
    feet={ name="Odyssean Greaves", augments={'"Fast Cast"+6','"Mag.Atk.Bns."+10',}},
    neck="Incanter's Torque",
    waist="Rumination Sash",
    left_ear="Halasz Earring",
    right_ear="Knightly Earring",
    left_ring="Evanescence Ring",
    right_ring="Sheltered Ring",
    back="Solemnity Cape",
}
    sets.midcast.Shell = 
{
    ammo="Staunch Tathlum +1",
    head={ name="Souv. Schaller +1", augments={'HP+105','VIT+12','Phys. dmg. taken -4',}},
    body="Shab. Cuirass +1",
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    legs={ name="Founder's Hose", augments={'MND+8','Mag. Acc.+14','Attack+13','Breath dmg. taken -3%',}},
    feet={ name="Odyssean Greaves", augments={'"Fast Cast"+6','"Mag.Atk.Bns."+10',}},
    neck="Incanter's Torque",
    waist="Rumination Sash",
    left_ear="Halasz Earring",
    right_ear="Knightly Earring",
    left_ring="Evanescence Ring",
    right_ring="Sheltered Ring",
    back="Solemnity Cape",
}
	sets.midcast.Raise = 
{
    ammo="Staunch Tathlum +1",
    head={ name="Souv. Schaller +1", augments={'HP+105','VIT+12','Phys. dmg. taken -4',}},
    body="Souveran Cuirass",
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    legs={ name="Founder's Hose", augments={'MND+8','Mag. Acc.+14','Attack+13','Breath dmg. taken -3%',}},
    feet={ name="Odyssean Greaves", augments={'"Fast Cast"+6','"Mag.Atk.Bns."+10',}},
    neck="Incanter's Torque",
    waist="Rumination Sash",
    left_ear="Halasz Earring",
    right_ear="Knightly Earring",
    left_ring="Evanescence Ring",
    right_ring="Sheltered Ring",
    back="Solemnity Cape",
}	
    sets.midcast.Stun = sets.midcast.Flash
	
	--Spell interupt down (pro shell raise)104/102
	sets.SID =
{
    ammo="Staunch Tathlum +1",
    head={ name="Souv. Schaller +1", augments={'HP+105','VIT+12','Phys. dmg. taken -4',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    legs={ name="Founder's Hose", augments={'MND+8','Mag. Acc.+14','Attack+13','Breath dmg. taken -3%',}},
    feet={ name="Odyssean Greaves", augments={'"Mag.Atk.Bns."+10','"Fast Cast"+6',}},
    neck="Incanter's Torque",
    waist="Rumination Sash",
    left_ear="Halasz Earring",
    right_ear="Knightly Earring",
    left_ring="Evanescence Ring",
    right_ring="Defending Ring",
    back="Solemnity Cape",
}

---------- NIN Spell	--------------
	sets.midcast.Utsusemi = 
{
    ammo="Staunch Tathlum +1",
    head={ name="Souv. Schaller +1", augments={'HP+105','VIT+12','Phys. dmg. taken -4',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    legs={ name="Founder's Hose", augments={'MND+8','Mag. Acc.+14','Attack+13','Breath dmg. taken -3%',}},
    feet={ name="Odyssean Greaves", augments={'"Mag.Atk.Bns."+10','"Fast Cast"+6',}},
    neck="Incanter's Torque",
    waist="Rumination Sash",
    left_ear="Halasz Earring",
    right_ear="Knightly Earring",
    left_ring="Evanescence Ring",
    right_ring="Defending Ring",
    back="Solemnity Cape",
}

	
---------- BLU Spell	--------------
    sets.midcast['Geist Wall'] =
{
    ammo="Iron Gobbet",
    head="Loess Barbuta +1",
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands={ name="Yorium Gauntlets", augments={'Enmity+10','Phalanx +3',}},
    legs={ name="Odyssean Cuisses", augments={'Attack+24','Enmity+8','Accuracy+10',}},
    feet={ name="Eschite Greaves", augments={'HP+80','Enmity+7','Phys. dmg. taken -4',}},
    neck="Unmoving Collar +1",
    waist="Creed Baudrier",
    left_ear="Trux Earring",
    right_ear="Cryptic Earring",
    left_ring="Apeile Ring",
    right_ring="Apeile Ring +1",
    back={ name="Rudianos's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Enmity+10',}},
}	

    sets.midcast['Sheep Song'] = 
{
    ammo="Iron Gobbet",
    head="Loess Barbuta +1",
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands={ name="Yorium Gauntlets", augments={'Enmity+10','Phalanx +3',}},
    legs={ name="Odyssean Cuisses", augments={'Attack+24','Enmity+8','Accuracy+10',}},
    feet={ name="Eschite Greaves", augments={'HP+80','Enmity+7','Phys. dmg. taken -4',}},
    neck="Unmoving Collar +1",
    waist="Creed Baudrier",
    left_ear="Trux Earring",
    right_ear="Cryptic Earring",
    left_ring="Apeile Ring",
    right_ring="Apeile Ring +1",
    back={ name="Rudianos's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Enmity+10',}},
}	
	
	sets.midcast.Soporific = 
{
    ammo="Iron Gobbet",
    head="Loess Barbuta +1",
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands={ name="Yorium Gauntlets", augments={'Enmity+10','Phalanx +3',}},
    legs={ name="Odyssean Cuisses", augments={'Attack+24','Enmity+8','Accuracy+10',}},
    feet={ name="Eschite Greaves", augments={'HP+80','Enmity+7','Phys. dmg. taken -4',}},
    neck="Unmoving Collar +1",
    waist="Creed Baudrier",
    left_ear="Trux Earring",
    right_ear="Cryptic Earring",
    left_ring="Apeile Ring",
    right_ring="Apeile Ring +1",
    back={ name="Rudianos's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Enmity+10',}},
}	
	
	sets.midcast['Stinking Gas'] = 
{
    ammo="Iron Gobbet",
    head="Loess Barbuta +1",
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands={ name="Yorium Gauntlets", augments={'Enmity+10','Phalanx +3',}},
    legs={ name="Odyssean Cuisses", augments={'Attack+24','Enmity+8','Accuracy+10',}},
    feet={ name="Eschite Greaves", augments={'HP+80','Enmity+7','Phys. dmg. taken -4',}},
    neck="Unmoving Collar +1",
    waist="Creed Baudrier",
    left_ear="Trux Earring",
    right_ear="Cryptic Earring",
    left_ring="Apeile Ring",
    right_ring="Apeile Ring +1",
    back={ name="Rudianos's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Enmity+10',}},
}	
    
	sets.midcast['Bomb Toss'] = 
{
    ammo="Iron Gobbet",
    head="Loess Barbuta +1",
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands={ name="Yorium Gauntlets", augments={'Enmity+10','Phalanx +3',}},
    legs={ name="Odyssean Cuisses", augments={'Attack+24','Enmity+8','Accuracy+10',}},
    feet={ name="Eschite Greaves", augments={'HP+80','Enmity+7','Phys. dmg. taken -4',}},
    neck="Unmoving Collar +1",
    waist="Creed Baudrier",
    left_ear="Trux Earring",
    right_ear="Cryptic Earring",
    left_ring="Apeile Ring",
    right_ring="Apeile Ring +1",
    back={ name="Rudianos's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Enmity+10',}},
}
	
	
	
	
	
	
    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
    sets.Doom = {legs="Shabti Cuisses +1",left_ring="Eshmun's Ring",right_ring="Eshmun's Ring", waist="Gishdubar Sash"}
    sets.Petri = {back="Sand Mantle"} 
	sets.Reraise = {head="Twilight Helm", body="Twilight Mail"}
	sets.Breath =
{
    ammo="Staunch Tathlum +1",
    head={ name="Souv. Schaller +1", augments={'HP+105','VIT+12','Phys. dmg. taken -4',}},
    body="Souveran Cuirass",
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    feet={ name="Amm Greaves", augments={'HP+50','VIT+10','Accuracy+15','Damage taken-2%',}},
    neck="Loricate Torque +1 +1",
    waist="Creed Baudrier",
    left_ear="Odnowa Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Karieyh Ring",
    right_ring="Defending Ring",
    back="Xucau Mantle",
}
   
    sets.resting = 
{
    ammo="Homiliary",
    head={ name="Jumalik Helm", augments={'MND+10','"Mag.Atk.Bns."+15','Magic burst mdg.+10%','"Refresh"+1',}},
    body={ name="Jumalik Mail", augments={'HP+50','Attack+15','Enmity+9','"Refresh"+2',}},
    hands={ name="Odyssean Gauntlets", augments={'Pet: DEX+2','Pet: STR+6','"Refresh"+1',}},
	legs= "Carmine Cuisses +1",
    feet={ name="Amm Greaves", augments={'HP+50','VIT+10','Accuracy+15','Damage taken-2%',}},
    neck="Creed Collar",
    waist="Fucho-no-Obi",
    left_ear="Infused Earring",
    right_ear="Ethereal Earring",
    left_ring="Sheltered Ring",
    right_ring="Paguroidea Ring",
    back={ name="Rudianos's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Enmity+10',}},
}
     
    -- Idle sets
    sets.idle = 
{	
    ammo="Homiliary",
    head={ name="Souv. Schaller +1", augments={'HP+105','VIT+12','Phys. dmg. taken -4',}},
    body={ name="Souveran Cuirass", augments={'VIT+10','Attack+20','"Refresh"+2',}},
    hands={ name="Odyssean Gauntlets", augments={'Pet: DEX+2','Pet: STR+6','"Refresh"+1',}},
    legs={ name="Carmine Cuisses +1", augments={'HP+80','STR+12','INT+12',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    feet={ name="Amm Greaves", augments={'HP+50','VIT+10','Accuracy+15','Damage taken-2%',}},
    neck="Creed Collar",
    waist="Fucho-no-Obi",
    left_ear="Infused Earring",
    right_ear="Ethereal Earring",
    left_ring="Sheltered Ring",
    right_ring="Paguroidea Ring",
    back="Reiki Cloak",
}
 
    sets.idle.Town = 
{		
    ammo="Homiliary",
    head={ name="Souv. Schaller +1", augments={'HP+105','VIT+12','Phys. dmg. taken -4',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    legs={ name="Carmine Cuisses +1", augments={'HP+80','STR+12','INT+12',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Loricate Torque +1 +1",
    waist="Fucho-no-Obi",
    left_ear="Infused Earring",
    right_ear="Ethereal Earring",
    left_ring="Dim. Ring (Holla)",
    right_ring="Warp Ring",
    back="Reiki Cloak",
}
     
    sets.idle.Weak = 
{
	ammo="Homiliary",
    head="Twilight helm",
    neck="Loricate Torque +1 +1",
    ear1="Infused Earring",
    ear2="Ethereal Earring",
    body="Twilight mail",
    hands="Chev. Gauntlets +1",
    ring1="Sheltered Ring",
    ring2="Paguroidea Ring",
    back="Reiki Cloak",
    waist="Fucho-no-obi",
	legs= "Carmine Cuisses +1",
    feet="Amm Greaves"
}
     
    sets.idle.Weak.Reraise = set_combine(sets.idle.Weak, sets.Reraise)
	

     
    --   Physical
    --     PDT
    --     Aegis
    -- Defense sets
    --   Magical
    --     MDT
    --   Hybrid (on top of either physical or magical)
    --     Repulse  
    --     Reraise
    --     RepulseReraise
    --   Custom
     
    -- sets.Repulse = {back="Repulse Mantle"}
  --3367 HP   
    sets.defense.PDT = 
{
    ammo="Staunch Tathlum +1",
    head={ name="Souv. Schaller +1", augments={'HP+105','VIT+12','Phys. dmg. taken -4',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Creed Collar",
    waist="Flume Belt +1",
    left_ear="Thureous Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Karieyh Ring",
	right_ring="Defending Ring",
    back={ name="Rudianos's Mantle", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10',}},
}
 
    -- To cap MDT with Shell IV (52/256), need 76/256 in gear. Current gear set is 248/256.
    -- Shellra V can provide 75/256.
    sets.defense.MDT =
{
    ammo="Staunch Tathlum +1",
    head={ name="Souv. Schaller +1", augments={'HP+105','VIT+12','Phys. dmg. taken -4',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Warder's Charm +1",
    waist="Asklepian Belt",
    left_ear="Eabani Earring",
    right_ear="Flashward Earring",
    left_ring="Shadow Ring",
    right_ring="Defending Ring",
    back="Reiki Cloak",
}

	sets.defense.BDT =
{
    ammo="Staunch Tathlum +1",
    head={ name="Souv. Schaller +1", augments={'HP+105','VIT+12','Phys. dmg. taken -4',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Loricate Torque +1 +1",
    waist="Creed Baudrier",
    left_ear="Odnowa Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Karieyh Ring",
	right_ring="Defending Ring",
    back={ name="Rudianos's Mantle", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10',}},
}

	sets.defense.ResistCharm =
{
    ammo="Staunch Tathlum +1",
    head={ name="Souv. Schaller +1", augments={'HP+105','VIT+12','Phys. dmg. taken -4',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Unmoving Collar +1",
    waist="Asklepian Belt",
    left_ear="Eabani Earring",
    right_ear="Volunt. Earring",
    left_ring="Unyielding Ring",
    right_ring="Wuji Ring",
    back="Solemnity Cape",
}	
	
    sets.defense.Ochain = 
{
    main="Burtgang",
    sub="Ochain",
    ammo="Staunch Tathlum +1",
    head={ name="Souv. Schaller +1", augments={'HP+105','VIT+12','Phys. dmg. taken -4',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    legs={ name="Odyssean Cuisses", augments={'Accuracy+1','Sklchn.dmg.+2%','Chance of successful block +9','Mag. Acc.+5 "Mag.Atk.Bns."+5',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Creed Collar",
    waist="Flume Belt +1",
    left_ear="Thureous Earring",
    right_ear="Ethereal Earring",
    left_ring="Karieyh Ring",
	right_ring="Defending Ring",
    back={ name="Rudianos's Mantle", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10',}},
}
         
    sets.defense.Aegis = 
{
    main="Burtgang",
    sub="Aegis",
    ammo="Staunch Tathlum +1",
    head={ name="Souv. Schaller +1", augments={'HP+105','VIT+12','Phys. dmg. taken -4',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Creed Collar",
    waist="Flume Belt +1",
    left_ear="Thureous Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Karieyh Ring",
	right_ring="Defending Ring",
    back={ name="Rudianos's Mantle", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10',}},--HP+180 Evasion+20, Magic Evasion+20 Enmity+10
}
 
    sets.defense.Srivatsa = 
{
    main="Burtgang",
    sub="Srivatsa",
    ammo="Staunch Tathlum +1",
    head={ name="Souv. Schaller +1", augments={'HP+105','VIT+12','Phys. dmg. taken -4',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    legs={ name="Odyssean Cuisses", augments={'Accuracy+1','Sklchn.dmg.+2%','Chance of successful block +9','Mag. Acc.+5 "Mag.Atk.Bns."+5',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Creed Collar",
    waist="Flume Belt +1",
    left_ear="Thureous Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Karieyh Ring",
	right_ring="Defending Ring",
    back={ name="Rudianos's Mantle", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10',}},--HP+180 Evasion+20, Magic Evasion+20 Enmity+10
}
 
--Doom/RR",
     
    sets.defense.PDT.Reraise = set_combine(sets.defense.PDT, sets.Reraise)
    sets.defense.Aegis.Reraise = set_combine(sets.defense.Aegis, sets.Reraise)
    sets.defense.MDT.Reraise = set_combine(sets.defense.MDT, sets.Reraise)
    sets.defense.Aegis.Reraise = set_combine(sets.defense.Aegis, sets.Reraise)
     
    sets.defense.PDT.Doom = set_combine(sets.defense.PDT, sets.Doom)
    sets.defense.Aegis.Doom = set_combine(sets.defense.Aegis, sets.Doom)
    sets.defense.MDT.Doom = set_combine(sets.defense.PDT, sets.Doom)
    sets.defense.Aegis.Doom = set_combine(sets.defense.Aegis, sets.Doom)
     
    sets.Kiting = {legs="Carmine Cuisses +1"}

 
 
    --------------------------------------
    -- Engaged sets
    --------------------------------------
     
    sets.engaged = --1124 / 1264 avec enlight up
{
    ammo="Paeapua",
    head="Flam. Zucchetto +1",
    body={ name="Valorous Mail", augments={'Accuracy+4','"Dbl.Atk."+5','DEX+9','Attack+12',}},
    hands="Sulev. Gauntlets +1",
    legs={ name="Odyssean Cuisses", augments={'"Mag.Atk.Bns."+29','Accuracy+24','Accuracy+17 Attack+17','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},
    feet={ name="Valorous Greaves", augments={'Accuracy+24','"Store TP"+6',}},
    neck="Combatant's Torque",
    waist="Sailfi Belt +1",
    left_ear="Digni. Earring",
    right_ear="Telos Earring",
    left_ring="Rajas Ring",
    right_ring="K'ayres Ring",
    back={ name="Rudianos's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
}
 
    sets.engaged.Acc = --1179 / 1319 avec enlight up
{
    ammo="Ginsen",
    head={ name="Valorous Mask", augments={'Accuracy+27','"Dbl.Atk."+3','DEX+10',}},
    body={ name="Valorous Mail", augments={'Accuracy+22 Attack+22','Weapon Skill Acc.+10','DEX+3','Accuracy+6',}},
    hands={ name="Valorous Mitts", augments={'Accuracy+30','Crit.hit rate+2','Attack+3',}},
    legs={ name="Odyssean Cuisses", augments={'"Mag.Atk.Bns."+29','Accuracy+24','Accuracy+17 Attack+17','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},
    feet={ name="Valorous Greaves", augments={'Accuracy+24 Attack+24','Accuracy+15','Attack+4',}},
    neck="Combatant's Torque",
    waist="Olseni Belt",
    left_ear="Digni. Earring",
    right_ear="Telos Earring",
    left_ring="Rajas Ring",
    right_ring="Ramuh Ring +1",
    back={ name="Rudianos's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
}
end
------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------Job-specific hooks that are called to process player actions at specific points in time-----------
------------------------------------------------------------------------------------------------------------------------------------------
 

 
function job_update(cmdParams, eventArgs)
    update_defense_mode()
end
 
-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    if state.Buff.Doom then
        idleSet = set_combine(idleSet, sets.buff.Doom)
    end
     
    return idleSet
end
 
 
 
function customize_defense_set(defenseSet)
    if state.ExtraDefenseMode.value ~= 'None' then
        defenseSet = set_combine(defenseSet, sets[state.ExtraDefenseMode.value])
    end
     
    if state.EquipShield.value == true then
        defenseSet = set_combine(defenseSet, sets[state.DefenseMode.current .. 'Shield'])
    end
     
    return defenseSet
end
 
-------------------------------------------------------------------------------------------------------------------
-- Customization hooks for idle and melee sets, after they've been automatically constructed.
-------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------
-- General hooks for change events.
-------------------------------------------------------------------------------------------------------------------
 
-- Run after the default precast() is done.
-- eventArgs is the same one used in job_precast, in case information needs to be persisted.
function job_post_precast(spell, action, spellMap, eventArgs)
 
end
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_midcast(spell, action, spellMap, eventArgs)
 
end
-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
 
end
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
    if state.Buff[spell.english] ~= nil then
        state.Buff[spell.english] = not spell.interrupted or buffactive[spell.english]
    end
end
-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
 
    return idleSet
end
-- Modify the default melee set after it was constructed.
function customize_melee_set(meleeSet)
    return meleeSet
end
-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
 
        --print( buff )
        --print( state.Buff[buff] )
 
-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
    update_defense_mode()
end
-- Called when the player's status changes.
function job_state_change(field, new_value, old_value)
    if field == 'HybridDefenseMode' then
        classes.CustomDefenseGroups:clear()
        classes.CustomDefenseGroups:append(new_value)
    end
end
-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)
 
end
function update_defense_mode()
    if player.equipment.main == 'Bustgang' and not classes.CustomDefenseGroups:contains('Burtgang') then
        classes.CustomDefenseGroups:append('Burtgang')
    end
     
    if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
        if player.equipment.sub and not player.equipment.sub:endswith('Shield') and
        player.equipment.sub ~= 'Aegis' and player.equipment.sub ~= 'Ochain' then
        state.CombatForm = 'DW'
        else
        state.CombatForm = nil
        end
    end
end

function job_buff_change(buff, gain)
        if buff == "cover" then
                if gain then
                        equip(sets.buff['Cover'])
                        disable('Body','Head')
                else
                        enable('Body','Head')
                        handle_equipping_gear(player.status)
                end
        elseif buff == "doom" then
                if gain then           
                        equip(sets.Doom)
                        send_command('@input /p Doomed, please Cursna.')
                        disable('legs','ring1','ring2','waist')
                elseif not gain and not player.status == "Dead" and not player.status == "Engaged Dead" then
                        enable('legs','ring1','ring2','waist')
                        send_command('input /p Doom removed, Thank you.')
                        handle_equipping_gear(player.status)
                else
                        enable('legs','ring1','ring2','waist')
                        send_command('input /p '..player.name..' is no longer Doom Thank you !')
                end
				 elseif buff == "petrification" then
                if gain then    
						equip(sets.Petri)
                        disable('back')				
                        send_command('@input /p Petrification, please Stona.')		
				else
                        enable('back')
                        send_command('input /p '..player.name..' is no longer Petrify Thank you !')
					end
				 elseif buff == "Charm" then
				 if gain then  			
                        send_command('@input /p Charmd, please Sleep me.')		
				else	
                        send_command('input /p '..player.name..' is no longer Charmed, please wake me up!')
					end
				elseif buff == "paralysis" then
                 if gain then
                        
                        send_command('@input /p '..player.name..' Paralysed, please Paralyna.')
                else                        
                        send_command('input /p '..player.name..' is no longer Paralysed Thank you !')
                    end	
        end
	for index,value in pairs(buffWatcher.watchList) do
    if index==buff then
      buffWatch()
      break
    end
  end
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(2, 7)
    elseif player.sub_job == 'NIN' then
        set_macro_page(1, 7)
    elseif player.sub_job == 'RDM' then
        set_macro_page(9, 7)
    elseif player.sub_job == 'RUN' then
        set_macro_page(8, 7)
	elseif player.sub_job == 'WAR' then
        set_macro_page(1, 7)	
	elseif player.sub_job == 'BLU' then
        set_macro_page(5, 7)	
    else
        set_macro_page(1, 7)
    end
end

function job_post_midcast(spell, action, spellMap, eventArgs)
  if spellMap == 'Cure' and spell.target.type == 'SELF' then
    if options.CastingModes.value == 'DT' then
      equip(sets.self_healing.DT)
    else
      equip(sets.self_healing)
  end
end
  end


function job_self_command(cmdParams, eventArgs)
if cmdParams[1] == 'buffWatcher' then
      buffWatch(cmdParams[2],cmdParams[3])
  end
  if cmdParams[1] == 'stopBuffWatcher' then
      stopBuffWatcher()
  end
end

-- Curing rules
function refine_various_spells(spell,action,spell_map,event_args)
 
    local cures = S{'Cure','Cure II','Cure III','Cure IV'}
     
    if cures:contains(spell.english) then
     
        local spell_recasts = windower.ffxi.get_spell_recasts()
         
        if spell_recasts[spell.recast_id] > 0 then
            event_args.cancel = true
             
            if spell.english == 'Cure IV' then
                send_command('@input /ma "Cure III" '..tostring(spell.target.raw))
                return
            elseif spell.english == 'Cure III' then
                send_command('@input /ma "Cure II" '..tostring(spell.target.raw))
                return
            elseif spell.english == 'Cure II' then
                send_command('@input /ma "Cure" '..tostring(spell.target.raw))
                return
            else
                add_to_chat(122,'All Cure spells are on cooldown. Canceling the cast.')
                return
            end
        end     
    end 
end

-------------------------------------Aspir,Sleep/ga Nuke's refine rules (thanks Asura.Vafruvant for this code)-----------------------------------
function refine_various_spells(spell, action, spellMap, eventArgs)

	Enmity = S{'Geist Wall', 'Sheep Song', 'Soporific'}
 
    if not Enmitys:contains(spell.english) then
        return
    end
 
    local newSpell = spell.english
    local spell_recasts = windower.ffxi.get_spell_recasts()
    local cancelling = 'All '..spell.english..' spells are on cooldown. Cancelling spell casting.'
  
    if spell_recasts[spell.recast_id] > 0 then
        if aspirs:contains(spell.english) then
            if spell.english == 'Geist Wall' then
                add_to_chat(122,cancelling)
                eventArgs.cancel = true
                return
				elseif spell.english == 'Geist Wall' then
                newSpell = 'Sheep Song'
				elseif spell.english == 'Sheep Song' then
                newSpell = 'Soporific'

            end         
 
        end
    end
  
    if newSpell ~= spell.english then
        send_command('@input /ma "'..newSpell..'" '..tostring(spell.target.raw))
        eventArgs.cancel = true
        return
    end
end