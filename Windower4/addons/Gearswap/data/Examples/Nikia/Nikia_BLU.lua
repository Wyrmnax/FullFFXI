--[[
    !! Special thanks to everyone that helped me with the code and to better understand it !!
]]

function get_sets()
    sub_job_change()
    windower.send_command('@bind f10 gs c tryweaponskill')
    windower.send_command('input /blockhelp on')


    -- Maps Blue Mage spell Stats per spell for the midcast function, can expand mapping as needed
    bluSpellStats = T{["Amorphic Spikes"]="STR", ["Bloodrake"]="STR", ["Disseverment"]="STR", ["Glutinous Dart"]="STR", ["Goblin Rush"]="STR",
                ["Heavy Strike"]="STR", ["Paralyzing Triad"]="STR", ["Ram Charge"]="STR", ["Vanity Dive"]="STR", ["Vertical Cleave"]="STR",
                ["Whirl of Rage"]="STR",
                ["Cannonball"]="VIT", ["Delta Thrust"]="VIT", ["Quad. Continuum"]="VIT",
                ["Benthic Typhoon"]="AGI", ["Final Sting"]="AGI", ["Spiral Spin"]="AGI",
                ["Magic Hammer"]="MND", ["Mind Blast"]="MND"}
    bluSpells = T{["Animating Wail"]="Recast", ["Battery Charge"]="Recast", ["Cocoon"]="Recast", ["Nat. Meditation"]="Recast", ["Winds of Promy."]="Recast",
                ["Magic Fruit"]="CurePot", ["Plenilune Embrace"]="CurePot", ["White Wind"]="CurePot",
                ["Sudden Lunge"]="BluACC", ["Head Butt"]="BluACC"}


    -- Start defining actual gear sets to be used below --
    -- Miscellaneous sets
    sets.misc = {}
    sets.misc.DT = {}
    sets.misc.DT.None = {}
    sets.misc.DT.Active = {
                head="Iuitl Headgear +1", neck="Twilight Torque",
                body="Iuitl Vest +1", hands="Iuitl Wristbands +1", lring="Dark Ring", rring="Defending Ring",
                back="Mollusca Mantle", waist="Flume Belt", legs="Iuitl Tights +1", feet="Iuitl Gaiters +1"}

    sets.misc['Chain Affinity'] = {
                feet="Assim. Charuqs +1"}

    sets.misc.Efflux = {
                legs="Mavi Tayt +2"}

    sets.misc.IonisWaist = {
                waist="Cetl Belt"}

    sets.misc.DualWieldMarch = {
                lear="Brutal Earring", rear="Suppanomimi"}

    sets.misc.Movement = {
                legs="Blood Cuisses"}

    sets.misc.RequiescatMinuet = {
                lear="Bladeborn Earring", rear="Steelflash Earring"}


    -- Precast sets --
    sets.precast = {}
    sets.precast.JA = {}
    sets.precast.JA['Azure Lore'] = {
                hands="Luh. Bazubands +1"}

    sets.precast.WS = {}
    sets.precast.WS['Chant du Cygne'] = {ammo="Jukukik Feather",
                head="Uk'uxkaj Cap", neck="Light Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Luhlaza Jubbah +1", hands="Qaaxo Mitaines", lring="Rajas Ring", rring="Epona's Ring",
                back="Rancorous Mantle", waist="Wanion Belt", legs="Manibozho Brais", feet="Qaaxo Leggings"}
    sets.precast.WS['Requiescat'] = {ammo="Aqua Sachet",
                head="Whirlpool Mask", neck="Shadow Gorget", lear="Brutal Earring", rear="Moonshade Earring",
                body="Vanir Cotehardie", hands="Qaaxo Mitaines", lring="Aquasoul Ring", rring="Epona's Ring",
                back="Atheling Mantle", waist="Shadow Belt", legs="Quiahuiz Leggings", feet="Assim. Charuqs +1"}

    sets.precast.FastCast = {
                head="Haruspex Hat +1", neck="Orunmila's Torque", lear="Loquac. Earring",
                body="Luhlaza Jubbah +1", hands="Thaumas Gloves", lring="Prolix Ring",
                back="Swith Cape +1", waist="Witful Belt", legs="Enif Cosciales", feet="Chelona Boots +1"}
    sets.precast.FastCast.BlueMagic = set_combine(sets.precast.FastCast, {
                body="Mavi Mintan +2"})


    -- Midcast sets --
    sets.midcast = {}
    sets.midcast.BlueMagic = {ammo="Mavi Tathlum",
                head="Luh. Keffiyeh +1",
                body="Assim. Jubbah +1", hands="Fea's Cuffs",
                back="Cornflower Cape", legs="Mavi Tayt +2", feet="Luhlaza Charuqs +1"}
    sets.midcast.BlueMagic.STR = set_combine(sets.midcast.BlueMagic, {
                neck="Tjukurrpa Medal", lear="Vulcan's Pearl", rear="Vulcan's Pearl",
                hands="Luh. Bazubands +1", lring="Rajas Ring", rring="Pyrosoul Ring",
                waist="Wanion Belt", legs="Manibozho Brais"})
    sets.midcast.BlueMagic.VIT = set_combine(sets.midcast.BlueMagic.STR, {
                waist="Chuq'aba Belt", legs="Nahtirah Trousers"})
    sets.midcast.BlueMagic.AGI = set_combine(sets.midcast.BlueMagic.STR, {
                hands="Iuitl Wristbands +1",
                legs="Nahtirah Trousers"})
    sets.midcast.BlueMagic.MND = set_combine(sets.midcast.BlueMagic, {ammo="Aqua Sachet",
                neck="Phalaina Locket", rear="Lifestorm Earring",
                hands="Luh. Bazubands +1", rring="Aquasoul Ring",
                legs="Quiahuiz Leggings"})
    sets.midcast.BlueMagic.BluACC = set_combine(sets.midcast.BlueMagic.STR, {ammo="Honed Tathlum",
                hands="Buremte Gloves",})
    sets.midcast.BlueMagic.CurePot = {ammo="Aqua Sachet",
                head="Uk'uxkaj Cap", neck="Phalaina Locket", lear="Loquac. Earring", rear="Lifestorm Earring",
                body="Chelona Blazer", hands="Buremte Gloves", lring="Kunaji Ring", rring="Aquasoul Ring",
                back="Tempered Cape", waist="Chuq'aba Belt", legs="Magavan Slops", feet="Thur. Boots +1"}
    sets.midcast.Recast = {
                waist="Twilight Belt"}
    sets.midcast.BlueMagic.Recast = set_combine(sets.midcast.Recast, {
                hands="Mv. Bazubands +2"})


    -- Aftercast sets labeled to show either TP or idle --
    sets.TP = {}
    sets.TP.Normal = {ammo="Vanir Battery",
                head="Iuitl Headgear +1", neck="Asperity Necklace", lear="Dudgeon Earring", rear="Heartseeker Earring",
                body="Thaumas Coat", hands="Qaaxo Mitaines", lring="Rajas Ring", rring="Epona's Ring",
                back="Atheling Mantle", waist="Windbuffet Belt", legs="Iuitl Tights +1", feet="Qaaxo Leggings"}
    sets.TP.Refresh = set_combine(sets.TP.Normal, {
                body="Luhlaza Jubbah +1"})
    sets.TP.Accuracy = set_combine(sets.TP.Normal, {ammo="Honed Tathlum",
                head="Whirlpool Mask",
                body="Luhlaza Jubbah +1", hands="Buremte Gloves",
                back="Letalis Mantle", feet="Assim. Charuqs +1"})

    sets.idle = set_combine(sets.misc.DT.Active, {ammo="Vanir Battery",
                head="Luh. Keffiyeh +1", lear="Loquac. Earring", rear="Ethereal Earring",
                body="Luhlaza Jubbah +1", hands="Serpentes Cuffs",
                feet="Serpentes Sabots"})

    DTMode = 'None'
    TPMode = 'Normal'
    ShadowType = 'None'
    WSBind = 'Requiescat'
end

function sub_job_change(new,old)
    -- Will change to different Macro book and set based on sub job
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
    windower.send_command('input /macro book '..book..'; wait .1; input /macro set 9')
    windower.send_command('input /echo [ Job Changed to '..player.main_job..'/'..player.sub_job..' ]')
    windower.send_command('input /echo [ Set Spells to sub job now ]')
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

-- User created bridge for built in aftercast and status_change functions
function gear_modes()
    -- Sequential gear sets used to easier allow for changing player needs
    if player.status == 'Engaged' then
        equip(sets.TP[TPMode], sets.misc.DT[DTMode])
        -- Handles Waist for Normal TP mode set depending on Ionis buff being active
        -- Caution with buff when not in an Ionis area
--        if buffactive.Ionis and DTMode == 'None' then
--            equip(sets.misc.IonisWaist)
--        end
        -- Adjusts Normal TP mode earrings when approaching delay cap
        if buffactive.Haste and buffactive.March == 2 then
            equip(sets.misc.DualWieldMarch)
        end
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
    if (spell.name == 'Chant du Cygne' or spell.name == 'Requiescat') and not buffactive.Berserk and not buffactive.Amnesia and not buffactive.Obliviscence and not buffactive.Paralysis and player.sub_job == 'WAR' and windower.ffxi.get_ability_recasts()[1] < 1 then
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
    if spell.skill == 'Blue Magic' then
        equip(sets.precast.FastCast.BlueMagic)
    elseif spell.skill == 'Healing Magic' or spell.skill == 'Enhancing Magic' or spell.skill == 'Ninjutsu' then
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
        equip(sets.TP.Accuracy)
    end
end

function midcast(spell,arg)
    -- Magic spell gear handling(Midcast)
    if spell.skill == 'Blue Magic' then
        if bluSpellStats[spell.english] then
            equip(sets.midcast.BlueMagic[bluSpellStats[spell.english]])
            if buffactive['Chain Affinity'] then
                equip(sets.misc['Chain Affinity'])
            end
            if buffactive.Efflux then
                equip(sets.misc.Efflux)
            end
        elseif bluSpells[spell.english] then
            equip(sets.midcast.BlueMagic[bluSpells[spell.english]])
        else
            equip(sets.midcast.BlueMagic)
        end
    elseif spell.skill == 'Healing Magic' or spell.skill == 'Enhancing Magic' then
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
    elseif (spell.name == 'Monomi: Ichi' or spell.name == 'Sneak') and buffactive.Sneak and spell.target.type == 'SELF' then
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