
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
    
        Toggle Function: 
        gs c toggle melee               Toggle Melee mode on / off and locking of weapons
        gs c toggle mb                  Toggles Magic Burst Mode on / off.
        gs c toggle runspeed            Toggles locking on / off Herald's Gaiters
        gs c toggle idlemode            Toggles between Refresh and DT idle mode. Activating Sublimation JA will auto replace refresh set for sublimation set. DT set will superceed both.        
        gs c toggle regenmode           Toggles between Hybrid, Duration and Potency mode for regen set  
        gs c toggle nukemode            Toggles between Normal and Accuracy mode for midcast Nuking sets (MB included)  
        gs c toggle matchsc             Toggles auto swapping element to match the last SC that just happenned.
                
        Casting functions:
        these are to set fewer macros (1 cycle, 5 cast) to save macro space when playing lazily with controler
        
        gs c nuke cycle                 Cycles element type for nuking & SC
        gs c nuke cycledown             Cycles element type for nuking & SC in reverse order    
        gs c nuke t1                    Cast tier 1 nuke of saved element 
        gs c nuke t2                    Cast tier 2 nuke of saved element 
        gs c nuke t3                    Cast tier 3 nuke of saved element 
        gs c nuke t4                    Cast tier 4 nuke of saved element 
        gs c nuke t5                    Cast tier 5 nuke of saved element 
        gs c nuke helix                 Cast helix2 nuke of saved element 
        gs c nuke storm                 Cast Storm II buff of saved element  
                    
        gs c sc tier                    Cycles SC Tier (1 & 2)
        gs c sc castsc                  Cast All the stuff to create a SC burstable by the nuke element set with '/console gs c nuke element'.

        HUD Functions:
        gs c hud hide                   Toggles the Hud entirely on or off
        gs c hud hidemode               Toggles the Modes section of the HUD on or off
        gs c hud hidejob                Toggles the job section of the HUD on or off
        gs c hud hidebattle             Toggles the Battle section of the HUD on or off
        gs c hud lite                   Toggles the HUD in lightweight style for less screen estate usage. Also on ALT-END
        gs c hud keybinds               Toggles Display of the HUD keybindings (my defaults) You can change just under the binds in the Gearsets file.

        // OPTIONAL IF YOU WANT / NEED to skip the cycles...  
        gs c nuke Ice                   Set Element Type to Ice DO NOTE the Element needs a Capital letter. 
        gs c nuke Air                   Set Element Type to Air DO NOTE the Element needs a Capital letter. 
        gs c nuke Dark                  Set Element Type to Dark DO NOTE the Element needs a Capital letter. 
        gs c nuke Light                 Set Element Type to Light DO NOTE the Element needs a Capital letter. 
        gs c nuke Earth                 Set Element Type to Earth DO NOTE the Element needs a Capital letter. 
        gs c nuke Lightning             Set Element Type to Lightning DO NOTE the Element needs a Capital letter. 
        gs c nuke Water                 Set Element Type to Water DO NOTE the Element needs a Capital letter. 
        gs c nuke Fire                  Set Element Type to Fire DO NOTE the Element needs a Capital letter. 
--]]

-------------------------------------------------------------                                        
--                              
--      ,---.     |    o               
--      |   |,---.|--- .,---.,---.,---.
--      |   ||   ||    ||   ||   |`---.
--      `---'|---'`---'``---'`   '`---'
--           |                         
-------------------------------------------------------------  

include('organizer-lib') -- Can remove this if you dont use organizer
res = require('resources')
texts = require('texts')
include('Modes.lua')

-- Define your modes: 
-- You can add or remove modes in the table below, they will get picked up in the cycle automatically. 
-- to define sets for idle if you add more modes, name them: sets.me.idle.mymode and add 'mymode' in the group.
-- to define sets for regen if you add more modes, name them: sets.midcast.regen.mymode and add 'mymode' in the group.
-- Same idea for nuke modes. 
idleModes = M('refresh', 'dt', 'mdt')
regenModes = M('hybrid', 'duration', 'potency')
-- To add a new mode to nuking, you need to define both sets: sets.midcast.nuking.mynewmode as well as sets.midcast.MB.mynewmode
nukeModes = M('normal', 'acc')

-- Setting this to true will stop the text spam, and instead display modes in a UI.
-- Currently in construction.
use_UI = true
hud_x_pos = 1400    --important to update these if you have a smaller screen
hud_y_pos = 200     --important to update these if you have a smaller screen
hud_draggable = true
hud_font_size = 10
hud_transparency = 200 -- a value of 0 (invisible) to 255 (no transparency at all)
hud_font = 'Impact'


-- Setup your Key Bindings here:
    --windower.send_command('bind insert gs c nuke cycle')        -- insert to Cycles Nuke element
    windower.send_command('bind delete gs c nuke cycledown')    -- delete to Cycles Nuke element in reverse order   
    windower.send_command('bind f9 gs c toggle idlemode')       -- F9 to change Idle Mode    
    windower.send_command('bind !f9 gs c toggle runspeed') 		-- Alt-F9 toggles locking on / off Herald's Gaiters
    windower.send_command('bind f12 gs c toggle melee')			-- F12 Toggle Melee mode on / off and locking of weapons
    windower.send_command('bind !` input /ma Stun <t>') 		-- Alt-` Quick Stun Shortcut.
    windower.send_command('bind home gs c sc tier')				-- home to change SC tier between Level 1 or Level 2 SC
	windower.send_command('bind end gs c nuke cycle')  			-- bind end nuke cycles
    --windower.send_command('bind end gs c toggle regenmode')		-- end to change Regen Mode	
    windower.send_command('bind f10 gs c toggle mb')            -- F10 toggles Magic Burst Mode on / off.
    windower.send_command('bind !f10 gs c toggle nukemode')		-- Alt-F10 to change Nuking Mode
    windower.send_command('bind ^F10 gs c toggle matchsc')      -- CTRL-F10 to change Match SC Mode      	
    windower.send_command('bind !end gs c hud lite')            -- Alt-End to toggle light hud version   
	send_command('wait 3;input /lockstyleset 2')

--[[
    This gets passed in when the Keybinds is turned on.
    Each one matches to a given variable within the text object
    IF you changed the Default Keybind above, Edit the ones below so it can be reflected in the hud using "//gs c hud keybinds" command
]]
keybinds_on = {}
keybinds_on['key_bind_idle'] = '(F9)'
keybinds_on['key_bind_regen'] = '(END)'
keybinds_on['key_bind_casting'] = '(ALT-F10)'
keybinds_on['key_bind_mburst'] = '(F10)'

keybinds_on['key_bind_element_cycle'] = '(INSERT)'
keybinds_on['key_bind_sc_level'] = '(HOME)'
keybinds_on['key_bind_lock_weapon'] = '(F12)'
keybinds_on['key_bind_movespeed_lock'] = '(ALT-F9)'
keybinds_on['key_bind_matchsc'] = '(CTRL-F10)'

-- Remember to unbind your keybinds on job change.
function user_unload()
    send_command('unbind insert')
    send_command('unbind delete')	
    send_command('unbind f9')
    send_command('unbind f10')
    send_command('unbind f12')
    send_command('unbind !`')
    send_command('unbind home')
    send_command('unbind end')
    send_command('unbind !f10')	
    send_command('unbind `f10')
    send_command('unbind !f9')	
    send_command('unbind !end')      	
end


--------------------------------------------------------------------------------------------------------------
include('SCH_Lib.lua')          -- leave this as is    
refreshType = idleModes[1]      -- leave this as is     
--------------------------------------------------------------------------------------------------------------


-- Optional. Swap to your sch macro sheet / book
set_macros(1,5) -- Sheet, Book


-------------------------------------------------------------                                        
--      ,---.                         |         
--      |  _.,---.,---.,---.,---.,---.|--- ,---.
--      |   ||---',---||    `---.|---'|    `---.
--      `---'`---'`---^`    `---'`---'`---'`---'
-------------------------------------------------------------                                              

-- Setup your Gear Sets below:
function get_sets()
  
    -- My formatting is very easy to follow. All sets that pertain to my character doing things are under 'me'.
    -- All sets that are equipped to faciliate my avatar's behaviour or abilities are under 'avatar', eg, Perpetuation, Blood Pacts, etc
      
    sets.me = {}        		-- leave this empty
    sets.buff = {} 				-- leave this empty
    sets.me.idle = {}			-- leave this empty
	
	sets.wakeup = {
	main = "Opashoro"
	}

    -- Your idle set
    sets.me.idle.refresh = {
	main="Daybreak",
	sub="Genmei Shield",
    ammo="Homiliary",
    head="Acad. Mortar. +3",
    body="Shamash Robe",
    hands="Nyame Gauntlets",
    legs="Assid. Pants +1",
    feet="Nyame Sollerets",
    neck="Loricate Torque +1",
    waist="Embla Sash",
    left_ear="Eabani Earring",
    right_ear="Savant's Earring",
    left_ring="Stikini Ring +1",
    right_ring="Shneddick Ring",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
    }

    -- Your idle Sublimation set combine from refresh or DT depening on mode.
    sets.me.idle.sublimation = set_combine(sets.me.idle.refresh,{
    head="Acad. Mortar. +3",
    waist="Embla Sash",
    })   
    -- Your idle DT set
    sets.me.idle.dt = set_combine(sets.me.idle[refreshType],{

    })  
    sets.me.idle.mdt = set_combine(sets.me.idle[refreshType],{

    })  
	-- Your MP Recovered Whilst Resting Set
    sets.me.resting = { 

    }
    
    sets.me.latent_refresh = {waist="Fucho-no-obi"}     
    
	-- Combat Related Sets
    sets.me.melee = set_combine(sets.me.idle[idleModes.current],{

    })
      
    -- Weapon Skills sets just add them by name.
    sets.me["Shattersoul"] = {
	ammo="Amar Cluster",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Malignance Earring",
    right_ear="Crep. Earring",
    left_ring="Crepuscular Ring",
    right_ring="Metamor. Ring +1",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},

    }
	
	sets.me["Shell Crusher"] = {
	ammo="Amar Cluster",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Malignance Earring",
    right_ear="Crep. Earring",
    left_ring="Crepuscular Ring",
    right_ring="Metamor. Ring +1",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},

    }
    sets.me["Myrkr"] = {

    }
      
    -- Feel free to add new weapon skills, make sure you spell it the same as in game. These are the only two I ever use though
  
    ------------
    -- Buff Sets
    ------------	
    -- Gear that needs to be worn to **actively** enhance a current player buff.
    -- Fill up following with your avaible pieces.
    sets.buff['Rapture'] = {head="Arbatel bonnet +2"}
    sets.buff['Perpetuance'] = {hands="Arbatel Bracers +3"}
    sets.buff['Immanence'] = {hands="Arbatel Bracers +3"}
    sets.buff['Penury'] = {legs="Arbatel Pants +3"}
    sets.buff['Parsimony'] = {legs="Arbatel Pants +3"}
    sets.buff['Celerity'] = {feet="Peda. Loafers +3"}
    sets.buff['Alacrity'] = {feet="Peda. Loafers +3"}
    sets.buff['Klimaform'] = {feet="Arbatel Loafers +3"}	
    -- Ebulience set empy now as we get better damage out of a good Merlinic head
    sets.buff['Ebullience'] = {} -- I left it there still if it becomes needed so the SCH.lua file won't need modification should you want to use this set
   
	
	
    ---------------
    -- Casting Sets
    ---------------
    sets.precast = {}   		-- Leave this empty  
    sets.midcast = {}    		-- Leave this empty  
    sets.aftercast = {}  		-- Leave this empty  
	sets.midcast.nuking = {}	-- leave this empty
	sets.midcast.MB	= {}		-- leave this empty      
    ----------
    -- Precast
    ----------
      
    -- Generic Casting Set that all others take off of. Here you should add all your fast cast 
    -- Grimoire: 10(cap:25) / rdm: 15
    sets.precast.casting = {
	main="Musa",
	sub="Clerisy Strap",
    ammo="Sapience Orb",
    head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    body={ name="Merlinic Jubbah", augments={'Mag. Acc.+1 "Mag.Atk.Bns."+1','"Fast Cast"+6','INT+8','Mag. Acc.+7','"Mag.Atk.Bns."+5',}},
    hands="Acad. Bracers +3",
    legs="Agwu's Slops",
    feet={ name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+20','"Fast Cast"+5','INT+2','Mag. Acc.+9',}},
    neck="Voltsurge Torque",
    waist="Embla Sash",
    lear="Enchntr. Earring +1",
    right_ear="Savant's Earring",
    left_ring="Kishar Ring",
    right_ring="",
    back="Fi Follet Cape +1",
    }

	sets.precast["Stun"] = {	
	main="Musa",
	sub="Clerisy Strap",
	ammo="Impatiens",
    head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    body={ name="Merlinic Jubbah", augments={'Mag. Acc.+1 "Mag.Atk.Bns."+1','"Fast Cast"+6','INT+8','Mag. Acc.+7','"Mag.Atk.Bns."+5',}},
    hands="Acad. Bracers +3",
    legs="Agwu's Slops",
    feet={ name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+20','"Fast Cast"+5','INT+2','Mag. Acc.+9',}},
    neck="Voltsurge Torque",
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Kishar Ring",
    right_ring="Lebeche Ring",
    back="Fi Follet Cape +1",
	}
	
	sets.precast["Impact"] = {	
	main="Musa",
	sub="Clerisy Strap",
	ammo="Impatiens",
    body="Crepuscular Cloak",
    hands="Acad. Bracers +3",
    legs="Agwu's Slops",
    feet={ name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+20','"Fast Cast"+5','INT+2','Mag. Acc.+9',}},
    neck="Voltsurge Torque",
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Kishar Ring",
    right_ring="Lebeche Ring",
    back="Fi Follet Cape +1",
	}

    -- When spell school is aligned with grimoire, swap relevent pieces -- Can also use Arbatel +1 set here if you value 1% quickcast procs per piece. (2+ pieces)  
    -- Dont set_combine here, as this is the last step of the precast, it will have sorted all the needed pieces already based on type of spell.
    -- Then only swap in what under this set after everything else. 
    sets.precast.grimoire = {
    head="Peda. M.Board +3",
    }

	
    -- Enhancing Magic, eg. Siegal Sash, etc
    sets.precast.enhancing = set_combine(sets.precast.casting,{

    })
  
    -- Stoneskin casting time -, works off of enhancing -
    sets.precast.stoneskin = set_combine(sets.precast.enhancing,{

    })
      
    -- Curing Precast, Cure Spell Casting time -
    sets.precast.cure = set_combine(sets.precast.casting,{
	
    })
      
    ---------------------
    -- Ability Precasting
    ---------------------

    sets.precast["Tabula Rasa"] = {legs="Pedagogy Pants +1"}
    sets.precast["Enlightenment"] = {body="Peda. Gown +3"}	 
    sets.precast["Sublimation"] = {head="Acad. Mortar. +3", body="Peda. Gown +3",right_ear="Savant's Earring", waist="Embla sash"}	 

	
	----------
    -- Midcast
    ----------
	
    -- Just go make it, inventory will thank you and making rules for each is meh.
    sets.midcast.Obi = {
    	waist="Hachirin-no-Obi",
    }
	
	-----------------------------------------------------------------------------------------------
	-- Helix sets automatically derives from casting sets. SO DONT PUT ANYTHING IN THEM other than:
	-- Pixie in DarkHelix
	-- Boots that aren't arbatel +1 (15% of small numbers meh, amalric+1 does more)
	-- Belt that isn't Obi.
	-----------------------------------------------------------------------------------------------
    -- Make sure you have a non weather obi in this set. Helix get bonus naturally no need Obi.	
    sets.midcast.DarkHelix = {
	main="Bunzi's Rod",
	sub="Culminus",
    ammo="Seeth. Bomblet +1",
    ammo="Ghastly Tathlum +1",
    head="Pixie Hairpin +1",
	body="Agwu's Robe",
    hands="Agwu's Gages",	
    legs="Agwu's Slops",
    feet="Arbatel Loafers +3",
    neck="Argute Stole +2",
    waist="Skrymir Cord",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Freke Ring",
    right_ring="Mujin Band",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
    }
	-- Make sure you have a non weather obi in this set. Helix get bonus naturally no need Obi.	
    sets.midcast.LightHelix = {
	main="Daybreak",
	sub="Culminus",
    ammo="Seeth. Bomblet +1",
    ammo="Ghastly Tathlum +1",
    head="Peda. M.Board +3",
	body="Agwu's Robe",
    hands="Agwu's Gages",	
    legs="Agwu's Slops",
    feet="Arbatel Loafers +3",
    neck="Argute Stole +2",
    waist="Skrymir Cord",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Freke Ring",
    right_ring="Mujin Band",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
    }
    -- Make sure you have a non weather obi in this set. Helix get bonus naturally no need Obi.	
    sets.midcast.Helix = {
	main="Bunzi's Rod",
	sub="Culminus",
    ammo="Seeth. Bomblet +1",
    ammo="Ghastly Tathlum +1",
    head="Peda. M.Board +3",
    --body="Amalric Doublet +1",
    --hands="Amalric Gages +1",	
	body="Agwu's Robe",
    hands="Agwu's Gages",	
    legs="Agwu's Slops",
    feet="Arbatel Loafers +3",
    neck="Argute Stole +2",
    waist="Skrymir Cord",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Freke Ring",
    right_ring="Mujin Band",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
    }	

    -- Whatever you want to equip mid-cast as a catch all for all spells, and we'll overwrite later for individual spells
    sets.midcast.casting = {

    }

	sets.midcast["Sublimation"] = {head="Acad. Mortar. +3", body="Peda. Gown +3", waist="Embla sash"}
    
    sets.midcast.nuking.normal = {
	main="Bunzi's Rod",
	--sub="Ammurapi Shield",
	sub="Culminus",
    ammo="Seeth. Bomblet +1",
    ammo="Ghastly Tathlum +1",
	head="Peda. M.Board +3",   
	body="Agwu's Robe",
    hands="Agwu's Gages",	
    legs="Agwu's Slops",
    feet="Arbatel Loafers +3",
    neck="Argute Stole +2",
    waist="Skrymir Cord",
    left_ear="Malignance Earring",
    right_ear="Arbatel Earring +2",
    left_ring="Freke Ring",
    right_ring="Jhakri Ring",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
    }
    -- used with toggle, default: F10
    -- Pieces to swap from freen nuke to Magic Burst
    sets.midcast.MB.normal = set_combine(sets.midcast.nuking.normal, {	
	head="Peda. M.Board +3",
    right_ring="Mujin Band",
    })
	
    sets.midcast.nuking.acc = {
	main="Bunzi's Rod",
	--sub="Ammurapi Shield",
	sub="Culminus",
    ammo="Seeth. Bomblet +1",
    ammo="Ghastly Tathlum +1",
    head="Peda. M.Board +3",
	body="Agwu's Robe",
    hands="Agwu's Gages",	
    legs="Agwu's Slops",
    feet="Arbatel Loafers +3",
    neck="Argute Stole +2",
    waist="Sacro Cord",
    left_ear="Malignance Earring",
    right_ear="Arbatel Earring +2",
    left_ring="Freke Ring",
    right_ring="Jhakri Ring",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
    }
	
	sets.midcast.nuking.lowtier = set_combine(sets.midcast.nuking.normal, {
	ammo="Per. Lucky Egg",
    head="Volte Cap",
    waist="Chaac Belt",
	})
    -- used with toggle, default: F10
    -- Pieces to swap from freen nuke to Magic Burst
    sets.midcast.MB.acc = set_combine(sets.midcast.nuking.normal, { 
    right_ring="Mujin Band",
    })	
	
    -- Enfeebling
	sets.midcast["Stun"] = {
	main="Bunzi's Rod",
	sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Acad. Mortar. +3",
    body="Acad. Gown +3",
    hands="Acad. Bracers +3",
    legs="Arbatel Pants +3",
    feet="Acad. Loafers +2",
    neck="Argute Stole +2",
    waist="Sacro Cord",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Metamor. Ring +1",
    right_ring="Jhakri Ring",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
	}

	sets.midcast.impact = {
	main="Bunzi's Rod",
	sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    body="Crepuscular Cloak",
    hands="Acad. Bracers +3",
    legs="Arbatel Pants +3",
    feet="Acad. Loafers +2",
    neck={ name="Argute Stole +2", augments={'Path: A',}},
    waist={ name="Acuity Belt +1", augments={'Path: A',}},
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Crepuscular Ring",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
	}		
	
    sets.midcast.IntEnfeebling = {
	main="Bunzi's Rod",
	sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Acad. Mortar. +3",
    body="Acad. Gown +3",
    hands="Acad. Bracers +3",
    legs="Arbatel Pants +3",
    feet="Acad. Loafers +2",
    neck="Argute Stole +2",
    waist="Sacro Cord",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Metamor. Ring +1",
    right_ring="Jhakri Ring",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
    }
	
    sets.midcast.MndEnfeebling = {
	main="Daybreak",
	sub="Ammurapi Shield",
	ammo="Pemphredo Tathlum",
    head="Peda. M.Board +3",
    body="Acad. Gown +3",
    hands="Acad. Bracers +3",
    legs="Arbatel Pants +3",
    feet="Acad. Loafers +2",
    neck="Argute Stole +2",
    waist="Sacro Cord",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Metamor. Ring +1",
    right_ring="Jhakri Ring",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
    }
	
    -- Enhancing
    sets.midcast.enhancing = set_combine(sets.midcast.casting,{
	main="Musa",
	sub="Giuoco Grip",
	ammo="Staunch Tathlum +1",
    head="Telchine Cap",
	body="Peda. Gown +3",
    hands="Telchine Gloves",
    legs="Telchine Braconi",
    feet="Telchine Pigaches",
    neck="Incanter's Torque",
    waist="Embla Sash",
    left_ear="Lempo Earring",
    right_ear="Halasz Earring",
    left_ring="Jhakri Ring",
    right_ring="Lebeche Ring",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
    })
    sets.midcast.storm = set_combine(sets.midcast.enhancing,{

    })       
    -- Stoneskin
    sets.midcast.stoneskin = set_combine(sets.midcast.enhancing,{
		waist="Siegel Sash",
    })
    sets.midcast.refresh = set_combine(sets.midcast.enhancing,{
		head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    })
    sets.midcast.aquaveil = set_combine(sets.midcast.enhancing,{
		head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    })
	
    sets.midcast["Drain"] = set_combine(sets.midcast.nuking, {
		head="Pixie Hairpin +1",
		neck="Erra Pendant",
    })
    sets.midcast["Aspir"] = sets.midcast["Drain"]
 	
 	sets.midcast.cure = {} -- Leave This Empty
    -- Cure Potency
    sets.midcast.cure.normal = set_combine(sets.midcast.casting,{		
	main="Daybreak",
	sub="Genmei Shield",
	ammo="Staunch Tathlum +1",
    head={ name="Vanya Hood", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
	body="Shamash Robe",
    hands="Nyame Gauntlets",
    legs={ name="Vanya Slops", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
    feet="Nyame Sollerets",
    neck={ name="Argute Stole +2", augments={'Path: A',}},
    waist="Rumination Sash",
    left_ear="Lempo Earring",
    right_ear="Halasz Earring",
    left_ring="Defending Ring",
    right_ring="Lebeche Ring",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
    })
    sets.midcast.cure.weather = set_combine(sets.midcast.cure.normal,{
    })    

    ------------
    -- Regen
    ------------	
	sets.midcast.regen = {} 	-- leave this empty
	-- Normal hybrid well rounded Regen
    sets.midcast.regen.hybrid = {
	main="Musa",
	sub="Giuoco Grip",
	ammo="Staunch Tathlum +1",
    head="Arbatel bonnet +2",
	body="Telchine Chas.",
    hands="Telchine Gloves",
    legs="Telchine Braconi",
    feet="Telchine Pigaches",
    neck="Incanter's Torque",
    waist="Embla Sash",
    left_ear="Lempo Earring",
    right_ear="Halasz Earring",
    left_ring="Jhakri Ring",
    right_ring="Lebeche Ring",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
    }
	-- Focus on Regen Duration 	
    sets.midcast.regen.duration = set_combine(sets.midcast.regen.hybrid,{

    }) 
	-- Focus on Regen Potency 	
    sets.midcast.regen.potency = set_combine(sets.midcast.regen.hybrid,{

    }) 
	
    ------------
    -- Aftercast
    ------------
      
    -- I don't use aftercast sets, as we handle what to equip later depending on conditions using a function.
	
end