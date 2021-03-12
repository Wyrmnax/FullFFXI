--[[
    !! Special thanks to everyone that helped me with the code and to better understand it !!

    AutoExec Companion Code
    Job changes and registers job specific events
    <!-- Blue Mage -->
    <register event="jobchange_blu/dnc" silent="true">
        input /macro book 7;
        wait 1;
        input /macro set 9;
        input /echo [ Job Changed to BLU/DNC ];
        input /echo [ Set Spells to subjob now ]
    </register>
    <register event="jobchange_blu/nin" silent="true">
        input /macro book 8;
        wait 1;
        input /macro set 9;
        input /echo [ Job Changed to BLU/NIN ]; 
        input /echo [ Set Spells to subjob now ]
    </register>
    <register event="jobchange_blu/rdm" silent="true">
        input /macro book 9;
        wait 1;
        input /macro set 9;
        input /echo [ Job Changed to BLU/RDM ];
        input /echo [ Set Spells to subjob now ]
    </register>
    <register event="jobchange_blu/war" silent="true">
        input /macro book 10;
        wait 1;
        input /macro set 9;
        input /echo [ Job Changed to BLU/WAR ];
        input /echo [ Set Spells to subjob now ]
    </register>
]]

function get_sets()
    -- Will change to different Macro book and set based on sub job,
    -- currently doesn't change as you change jobs, therefore AutoExec is currently still needed
    local book = 7
    if player.sub_job:lower() == 'dnc' then
        book = 7
    elseif player.sub_job:lower() == 'nin' then
        book = 8
    elseif player.sub_job:lower() == 'rdm' then
        book = 9
    elseif player.sub_job:lower() == 'war' then
        book = 10
    end
    windower.send_command('input /macro book '..tostring(book)..'; wait .1; input /macro set 9')
    windower.send_command('input /echo [ Job Changed to '..player.main_job..'/'..player.sub_job..' ]')
    windower.send_command('input /echo [ Set Spells to sub job now ]')
    windower.send_command('@bind f10 gs c tryweaponskill')
    windower.send_command('input /blockhelp on')


    -- Maps Blue Mage spell Stats per spell for the midcast function, can expand mapping as needed
    bluSpellStats = T{["Amorphic Spikes"]="STR", ["Bloodrake"]="STR", ["Disseverment"]="STR", ["Glutinous Dart"]="STR", ["Goblin Rush"]="STR",
                ["Heavy Strike"]="STR", ["Paralyzing Triad"]="STR", ["Ram Charge"]="STR", ["Vanity Dive"]="STR", ["Vertical Cleave"]="STR",
                ["Whirl of Rage"]="STR",
                ["Cannonball"]="VIT", ["Delta Thrust"]="VIT", ["Quad. Continuum"]="VIT",
                ["Benthic Typhoon"]="AGI", ["Final Sting"]="AGI", ["Spiral Spin"]="AGI",
                ["Magic Hammer"]="MND", ["Mind Blast"]="MND"}
    bluSpells = T{["Animating Wail"]="Recast", ["Battery Charge"]="Recast", ["Cocoon"]="Recast", ["Nat. Meditation"]="Recast", ["Winds of Promy."]="Recast", ["White Wind"]="Recast",
                ["Magic Fruit"]="CurePot", ["Plenilune Embrace"]="CurePot", ["White Wind"]="CurePot",
                ["Sudden Lunge"]="BluACC", ["Head Butt"]="BluACC"}


    -- Start defining actual gear sets to be used below --
    -- Miscellaneous sets
    sets.misc = {}
    sets.misc.DT = {}
    sets.misc.DT.None = {}
    sets.misc.DT.Active = {
                head="Iuitl Headgear", neck="Twilight Torque",
                body="Iuitl Vest", hands="Iuitl Wristbands", lring="Dark Ring", rring="Defending Ring",
                back="Mollusca Mantle", waist="Flume Belt", legs="Iuitl Tights", feet="Iuitl Gaiters"}

    sets.misc.Efflux = {
                legs="Mavi Tayt +2"}

    sets.misc.Movement = {
                legs="Blood Cuisses"}

    sets.misc.RequiescatMinuet = {
                lear="Bladeborn Earring", rear="Steelflash Earring"}


    -- Precast sets --
    sets.precast = {}
    sets.precast.JA = {}
    sets.precast.JA['Azure Lore'] = {
                hands="Mrg. Bazubands +2"}

    sets.precast.WS = {}
    sets.precast.WS['Chant du Cygne'] = {ammo="Cheruski Needle",
                head="Uk'uxkaj Cap", neck="Light Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Assim. Jubbah +1", hands="Assim. Bazu. +1", lring="Rajas Ring", rring="Epona's Ring",
                back="Rancorous Mantle", waist="Wanion Belt", legs="Manibozho Brais", feet="Assim. Charuqs +1"}
    sets.precast.WS['Requiescat'] = {ammo="Aqua Sachet",
                head="Whirlpool Mask", neck="Shadow Gorget", lear="Brutal Earring", rear="Moonshade Earring",
                body="Wayfarer Robe", hands="Wayfarer Cuffs", lring="Aquasoul Ring", rring="Epona's Ring",
                back="Atheling Mantle", waist="Shadow Belt", legs="Quiahuiz Leggings", feet="Assim. Charuqs +1"}

    sets.precast.FastCast = {
                head="Athos's Chapeau", neck="Orunmila's Torque", lear="Loquac. Earring",
                body="Mirke Wardecors", hands="Thaumas Gloves", lring="Prolix Ring",
                back="Swith Cape", waist="Witful Belt", legs="Enif Cosciales", feet="Chelona Boots"}
    sets.precast.FastCast.BlueMagic = set_combine(sets.precast.FastCast, {
                body="Mavi Mintan +2"})


    -- Midcast sets --
    sets.midcast = {}
    sets.midcast.BlueMagic = {ammo="Mavi Tathlum",
                head="Mirage Keffiyeh +2",
                body="Assim. Jubbah +1", hands="Fea's Cuffs",
                back="Cornflower Cape", legs="Mavi Tayt +2"}
    sets.midcast.BlueMagic.STR = set_combine(sets.midcast.BlueMagic, {
                head="Uk'uxkaj Cap", neck="Tjukurrpa Medal", lear="Flame Pearl", rear="Flame Pearl",
                hands="Assim. Bazu. +1", lring="Rajas Ring", rring="Pyrosoul Ring",
                waist="Wanion Belt", legs="Manibozho Brais", feet="Assim. Charuqs +1"})
    sets.midcast.BlueMagic.VIT = set_combine(sets.midcast.BlueMagic.STR, {
                waist="Chuq'aba Belt", legs="Nahtirah Trousers"})
    sets.midcast.BlueMagic.AGI = set_combine(sets.midcast.BlueMagic.STR, {
                hands="Iuitl Wristbands",
                legs="Nahtirah Trousers"})
    sets.midcast.BlueMagic.MND = set_combine(sets.midcast.BlueMagic, {ammo="Aqua Sachet",
                head="Uk'uxkaj Cap", neck="Phalaina Locket", rear="Lifestorm Earring",
                hands="Assim. Bazu. +1", rring="Aquasoul Ring",
                legs="Quiahuiz Leggings", feet="Thur. Boots +1"})
    sets.midcast.BlueMagic.CurePot = set_combine(sets.midcast.BlueMagic.MND, {
                neck="Phalaina Locket", lear="Loquac. Earring",
                hands="Buremte Gloves", lring="Kunaji Ring",
                back="Oretania's Cape", waist="Chuq'aba Belt", legs="Magavan Slops"})
    sets.midcast.BlueMagic.BluACC = set_combine(sets.midcast.BlueMagic.STR, {ammo="Honed Tathlum",
                head="Whirlpool Mask",
                hands="Buremte Gloves",})
    sets.midcast.Recast = {
                head="Iuitl Headgear",
                body="Assim. Jubbah +1"}
    sets.midcast.BlueMagic.Recast = set_combine(sets.midcast.Recast, {
                hands="Mv. Bazubands +2"})


    -- Aftercast sets labeled to show either melee or idle --
    sets.melee = {}
    sets.melee.TP = {}
    -- Normal melee set Earrings are handled as part of the march buff check inside the gear_modes() function
    -- Normal melee set Waist is handled in gear_modes() based on Ionis buff
    sets.melee.TP.Normal = {ammo="Cheruski Needle",
                head="Thur. Chapeau +1", neck="Asperity Necklace",
                body="Thaumas Coat", hands="Iuitl Wristbands", lring="Rajas Ring", rring="Epona's Ring",
                back="Atheling Mantle", legs="Iuitl Tights", feet="Manibozho Boots"}
    sets.melee.TP.Refresh = set_combine(sets.melee.TP.Normal, {
                body="Assim. Jubbah +1"})
    sets.melee.TP.Accuracy = set_combine(sets.melee.TP.Normal, {ammo="Honed Tathlum",
                head="Whirlpool Mask",
                hands="Buremte Gloves",
                feet="Assim. Charuqs +1"})

    sets.idle = set_combine(sets.misc.DT.Active, {ammo="Mavi Tathlum",
                lear="Loquac. Earring", rear="Lifestorm Earring",
                body="Assim. Jubbah +1", hands="Serpentes Cuffs",
                feet="Serpentes Sabots"})

    DTMode = 'None'
    TPMode = 'Normal'
    ShadowType = 'None'
    WSBind = 'Requiescat'
end


function self_command(str)
    -- Use an in game macro "/con gs c DTMode" to toggle Damage Taken set
    if str == 'DTMode' then
        if DTMode == 'None' then
            DTMode = 'Active'
        else
            DTMode = 'None'
        end
        windower.add_to_chat(8,'Damage taken set to: '..DTMode)
        gear_modes()
    -- Use an in game macro "/con gs c TPMode" to cycle through Normal, Refresh, and Accuracy sets
    elseif str == 'TPMode' then
        if TPMode == 'Normal' then
            TPMode = 'Refresh'
        elseif TPMode == 'Refresh' then
            TPMode = 'Accuracy'
        else
            TPMode = 'Normal'
        end
        windower.add_to_chat(8,'Engaged melee set mode: '..TPMode)
        gear_modes()
    end

    -- Allows you to change the WeaponSkill that will be used when F10 is pressed,
    -- use in game macro "/con gs c WSBind"
    if str == 'WSBind' then
        if WSBind == 'Requiescat' then
            WSBind = 'Chant du Cygne'
        else
            WSBind = 'Requiescat'
        end
        windower.add_to_chat(8,'New weaponskill bound to F10: '..WSBind)
    -- With F10 as a dedicated Weaponskill button this will serve as a Weaponskill macro,
    -- and if pressed when Idle to quickly change to current Idle/DT set
    elseif str == 'tryweaponskill' then
        if player.status == 'Engaged' then
            windower.send_command(WSBind)
        else
            gear_modes()
        end
    end
end

-- User created bridge for built in aftercast and status_change functions,
-- also self_command references listed above to help handle mode changes for situation needs
function gear_modes()
    -- Handles Waist for Normal TP mode set depending on Ionis buff being active
    -- Caution with buff when not in an Ionis area
    if buffactive.Ionis then
        sets.melee.TP.Normal = set_combine(sets.melee.TP.Normal, {waist="Cetl Belt"})
    else
        sets.melee.TP.Normal = set_combine(sets.melee.TP.Normal, {waist="Twilight Belt"})
    end

    -- Adjusts Normal TP mode earrings when approaching delay cap
    if buffactive.Haste and buffactive.March == 2 then
        sets.melee.TP.Normal = set_combine(sets.melee.TP.Normal, {lear="Brutal Earring", rear="Suppanomimi"})
    else
        sets.melee.TP.Normal = set_combine(sets.melee.TP.Normal, {lear="Dudgeon Earring", rear="Heartseeker Earring"})
    end

    -- Sequential gear sets used to easier allow for changing player needs
    if player.status == 'Engaged' then
        equip(sets.melee.TP[TPMode], sets.misc.DT[DTMode])
    else
        equip(sets.idle, sets.misc.DT[DTMode], sets.misc.Movement)
    end
end

-- Used to disable slots for items such as Reraise Earring among other things
function slot_disabling()
    if player.equipment.left_ear == 'Reraise Earring' then
        disable('left_ear')
        windower.add_to_chat(8,'Reraise Earring equiped on left ear')
    elseif player.equipment.right_ear == 'Reraise Earring' then
        disable('right_ear')
        windower.add_to_chat(8,'Reraise Earring equiped on right ear')
    else
        enable('left_ear','right_ear')
    end
end


----------- Start of ----------
------ built in functions -----
function status_change(new,old)
    if T{'Idle','Engaged'}:contains(new) then
        -- Gear info each time you Engage, useful if using DressUp or BlinkMeNot
        if player.status == 'Engaged' then
            windower.add_to_chat(8,player.name..':   Melee = '..TPMode..'   |   Damage Taken = '..DTMode)
        end
        gear_modes()
        slot_disabling()
    end
end

function precast(spell,arg)
    slot_disabling()
    -- Situational spell logic for Warrior sub job
    if (spell.name == 'Chant du Cygne' or spell.name == 'Requiescat') and not buffactive.Berserk and not buffactive.Obliviscence and not buffactive.Paralysis and player.sub_job == 'WAR' and windower.ffxi.get_ability_recasts()[1] < 1 then
        windower.send_command('berserk; wait 1; warcry; wait 1; '..spell.name..' '..spell.target.raw)
        cancel_spell()
        return
    end

    -- Generic equip command for all Job Abilities and Weaponskills
    if sets.precast.JA[spell.name] then
        equip(sets.precast.JA[spell.name])
    elseif sets.precast.WS[spell.name] then
        equip(sets.precast.WS[spell.name])
        if spell.name == 'Requiescat' and buffactive.Minuet and buffactive.Minuet >= 2 then
            equip(sets.misc.RequiescatMinuet)
        end
    end

    -- Magic spell gear handling(Precast)
    if spell.skill == 'BlueMagic' then
        equip(sets.precast.FastCast.BlueMagic)
    elseif spell.skill == 'HealingMagic' or spell.skill == 'EnhancingMagic' or spell.skill == 'Ninjutsu' then
        equip(sets.precast.FastCast)
    end

    -- Special handling to remove Dancer sub job Sneak effect
    if spell.name == 'Spectral Jig' and buffactive.Sneak then
        windower.ffxi.cancel_buff(71)
        cast_delay(0.3)
    -- If Dancer sub job will use same set as VIT spells
    elseif windower.wc_match(spell.name,'Curing*') then
        equip(sets.midcast.BlueMagic.VIT)
    elseif windower.wc_match(spell.name,'*Step') then
        equip(sets.melee.TP.Accuracy)
    end
end

function midcast(spell,arg)
    -- Magic spell gear handling(Midcast)
    if spell.skill == 'BlueMagic' then
        if bluSpellStats[spell.english] then
            equip(sets.midcast.BlueMagic[bluSpellStats[spell.english]])
            if buffactive.Efflux then
                equip(sets.misc.Efflux)
            end
        elseif bluSpells[spell.english] then
            equip(sets.midcast.BlueMagic[bluSpells[spell.english]])
        else
            equip(sets.midcast.BlueMagic)
        end
    elseif spell.skill == 'HealingMagic' or spell.skill == 'EnhancingMagic' then
        equip(sets.midcast.Recast)
        if windower.wc_match(spell.name,'Cure*') then
            equip(sets.midcast.BlueMagic.CurePot)
        end
    end

    -- Gear change to Damage Taken set when in midcast of Utsusemi
    -- Special handling to remove Utsusemi, Sneak, and Stoneskin effects if they are active
    if windower.wc_match(spell.name,'Utsusemi*') then
        equip(sets.misc.DT.Active)
        if spell.name == 'Utsusemi: Ichi' and ShadowType == 'Ni' then
            if buffactive['Copy Image'] then
                windower.ffxi.cancel_buff(66)
            elseif buffactive['Copy Image (2)'] then
                windower.ffxi.cancel_buff(444)
            elseif buffactive['Copy Image (3)'] then
                windower.ffxi.cancel_buff(445)
            elseif buffactive['Copy Image (4+)'] then
                windower.ffxi.cancel_buff(446)
            end
        end
    elseif spell.name == 'Monomi: Ichi' or spell.name == 'Sneak' and buffactive.Sneak and spell.target.type == 'SELF' then
        windower.ffxi.cancel_buff(71)
    elseif spell.name == 'Stoneskin' and buffactive.Stoneskin then
        windower.ffxi.cancel_buff(37)
    end
end

function aftercast(spell,arg)
    gear_modes()
    -- Changes shadow type variable to allow cancel Copy Image if last cast was Utsusemi: Ni
    if spell and spell.name == 'Utsusemi: Ni' then
        ShadowType = 'Ni'
    elseif spell and spell.name == 'Utsusemi: Ichi' then
        ShadowType = 'Ichi'
    end
    if spell and spell.name == 'Dream Flower' then
        windower.send_command('wait 75;input /echo [ WARNING! Sleep : Will wear off within 0:15 ]')
        windower.send_command('wait 80;input /echo [ WARNING! Sleep : Will wear off within 0:10 ]')
        windower.send_command('wait 85;input /echo [ WARNING! Sleep : Will wear off within 0:05 ]')
    end
end