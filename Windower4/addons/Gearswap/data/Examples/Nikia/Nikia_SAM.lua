--[[
    !! Special thanks to everyone that helped me with the code and to better understand it !!
]]

function get_sets()
    windower.send_command('input /macro book 3; wait .1; input /macro set 1; input /echo [ Job Changed to SAM ]')
    windower.send_command('@bind f10 gs c tryweaponskill')
    windower.send_command('input /blockhelp on')


    -- Automated events similar to events in the AutoExec plugin
    windower.register_event('hpp change', function(new, old)
        if new == 100 and player.status == 'Idle' then
            windower.send_command('wait 1;gs c FullHP')
        elseif new < 35 then
            equip(sets.misc.Twilight)
            slot_disabling()
        end
    end)


    -- Start defining actual gear sets to be used below --
    -- Miscellaneous sets
    sets.misc = {}
    sets.misc.DT = {}
    sets.misc.DT.None = {}
    sets.misc.DT.Active = {
                head="Otronif Mask", neck="Twilight Torque",
                body="Otronif Harness", hands="Otronif Gloves", lring="Dark Ring", rring="Defending Ring",
                back="Mollusca Mantle", waist="Flume Belt", legs="Otronif Brais", feet="Otronif Boots"}

    sets.misc.Movement = {
                feet="Danzo Sune-Ate"}

    sets.misc['Meikyo Shisui'] = {
                feet="Sak. Sune-Ate +1"}

    sets.misc.Sekkanoki = {
                hands="Unkai Kote +2"}

    sets.misc.Sengikori = {
                feet="Unkai Sune-Ate +2"}

    sets.misc.SM = {
                back="Shadow Mantle"}

    sets.misc.Twilight = {
                head="Twilight Helm",
                body="Twilight Mail"}

    sets.misc.VIT = {
                head="Yaoyotl Helm", neck="Tjukurrpa Medal", lear="Terra's Pearl", rear="Terra's Pearl",
                body="Otronif Harness", hands="Otronif Gloves", lring="Terrasoul Ring", rring="Terrasoul Ring",
                back="Iximulew Cape", waist="Caudata Belt", legs="Miki. Cuisses", feet="Sak. Sune-Ate +1"}


    -- Precast sets --
    sets.precast = {}
    sets.precast.JA = {}
    sets.precast.JA['Blade Bash'] = {
                hands="Sakonji Kote +1"}
    sets.precast.JA.Meditate = {
                head="Wakido Kabuto +1", hands="Sakonji Kote +1"}
    sets.precast.JA['Warding Circle'] = {
                head="Wakido Kabuto +1"}

    sets.precast.WS = {
                head="Otomi Helm", neck="Light Gorget", lear="Brutal Earring", rear="Moonshade Earring",
                body="Phorcys Korazin", hands="Miki. Gauntlets", lring="Rajas Ring", rring="Pyrosoul Ring",
                back="Buquwik Cape", waist="Light Belt", legs="Miki. Cuisses", feet="Sak. Sune-Ate +1"}
    sets.precast.WS['Namas Arrow'] = set_combine(sets.precast.WS, {
                head="Sakonji Kabuto +1", lear="Vulcan's Pearl", rear="Vulcan's Pearl",
                hands="Unkai Kote +2",
                legs="Wakido Haidate +1", feet="Waki. Sune-Ate +1"})
    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {ammo="Aqua Sachet",
                neck="Shadow Gorget",
                lring="Aquasoul Ring",
                waist="Shadow Belt"})
    sets.precast.WS['Tachi: Kaiten'] = set_combine(sets.precast.WS, {
                lear="Bladeborn Earring", rear="Steelflash Earring",
                hands="Boor Bracelets", lring="Pyrosoul Ring",
                legs="Wakido Haidate +1"})
    sets.precast.WS['Tachi: Shoha'] = set_combine(sets.precast.WS, {
                neck="Asperity Necklace",
                waist="Windbuffet Belt"})


    -- Midcast sets (none needed in this file) --
    sets.midcast = {}


    -- Aftercast sets labeled to show either melee or idle --
    sets.melee = {}
    sets.melee.TP = {}
    sets.melee.TP.Normal = {
                head="Otomi Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Wakido Domaru +1", hands="Wakido Kote +1", lring="Rajas Ring", rring="K'ayres Ring",
                back="Misuuchi Kappa", waist="Windbuffet Belt", legs="Otronif Brais", feet="Otronif Boots"}
    sets.melee.TP.Accuracy = set_combine(sets.melee.TP.Normal, {
                })

    sets.idle = {}
    sets.idle.DT = set_combine(sets.misc.Twilight, {
                neck="Twilight Torque", lear="Terra's Pearl", rear="Terra's Pearl",
                hands="Otronif Gloves", lring="Dark Ring", rring="Defending Ring",
                back="Shadow Mantle", waist="Flume Belt", legs="Otronif Brais",feet="Otronif Boots"})
    sets.idle.Regen = set_combine(sets.idle.DT,    {
                neck="Wiglen Gorget",
                lring="Paguroidea Ring", rring="Sheltered Ring"})

    DTMode = 'None'
    TPMode = 'Normal'
    WSBind = 'Tachi: Kaiten'
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
    -- Use an in game macro "/con gs c TPMode" to cycle through Normal and Accuracy sets
    elseif str == 'TPMode' then
        if TPMode == 'Normal' then
            TPMode = 'Accuracy'
        else
            TPMode = 'Normal'
        end
        windower.add_to_chat(8,'Engaged melee set mode: '..TPMode)
        gear_modes()
    -- Used with windower.register_event to automatically change to Idle DT set once 100% HP is reached
    elseif str == 'FullHP' then
        gear_modes()
    end

    -- Allows you to change the WeaponSkill that will be used when F10 is pressed,
    -- use in game macro "/con gs c WSBind"
    if str == 'WSBind' then
        if WSBind == 'Tachi: Kaiten' then
            WSBind = 'Tachi: Shoha'
        elseif WSBind == 'Tachi: Shoha' and player.equipment.range == 'Yoichinoyumi' then
            WSBind = 'Namas Arrow'
        elseif (WSBind == 'Tachi: Shoha' or WSBind == 'Namas Arrow') and player.equipment.main == 'Forefront Blade' then
            WSBind = 'Requiescat'
        else
            WSBind = 'Tachi: Kaiten'
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
    slot_disabling()
    -- Sequential gear sets used to easier allow for changing player needs
    if player.status == 'Engaged' then
        equip(sets.melee.TP[TPMode], sets.misc.DT[DTMode])
    else
        equip(sets.idle.DT, sets.misc.DT[DTMode], sets.misc.Movement)
        if player.hpp < 100 then
            equip(sets.idle.Regen, sets.misc.DT[DTMode], sets.misc.Movement)
        end
    end
end


-- Used to disable slots for items such as Reraise Earring among other things
function slot_disabling()
    -- Twilight Helm/Mail logic
    if (buffactive.Weakness or player.hpp < 35) and player.equipment.head == 'Twilight Helm' and player.equipment.body == 'Twilight Mail' then
        disable('head','body')
    else
        enable('head','body')
    end
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
        if player.status == 'Engaged' then
            -- Gear info each time you Engage, useful if using DressUp or BlinkMeNot
            windower.add_to_chat(8,player.name..':   Melee = '..TPMode..'   |   Damage Taken = '..DTMode)
            -- Automatically activate Hasso when engaging if Seigan isn't active
            if not buffactive.Hasso and not buffactive.Seigan and not buffactive.Amnesia and not buffactive.Obliviscence and not buffactive.Paralysis and windower.ffxi.get_ability_recasts()[138] < 1 then
                windower.send_command('hasso')
            end
        end
        gear_modes()
        slot_disabling()
    end
end

function buff_change(buff,g_or_l)
    if buff == 'weakness' and g_or_l then
        equip(sets.misc.Twilight)
        slot_disabling()
    end
end

function precast(spell,arg)
    slot_disabling()
    -- Situational spell logic for Warrior sub job
    if (spell.name == 'Namas Arrow' or spell.name == 'Requiescat' or spell.name == 'Tachi: Kaiten' or spell.name == 'Tachi: Shoha') and not buffactive.Berserk and not buffactive.Amnesia and not buffactive.Obliviscence and not buffactive.Paralysis and player.sub_job == 'WAR' and windower.ffxi.get_ability_recasts()[1] < 1 then
        windower.send_command('berserk; wait 1; warcry; wait 1; '..spell.name..' '..spell.target.raw)
        cancel_spell()
        return
    end

    -- Generic equip command for all Job Abilities and Weaponskills
    if sets.precast.JA[spell.name] then
        equip(sets.precast.JA[spell.name])
    elseif sets.precast.WS[spell.name] then
        equip(sets.precast.WS[spell.name])
        -- Layered this way to allow for proper equiping of gear when any combo of the below buffs are in effect
        if buffactive.Sekkanoki then
            equip(sets.misc.Sekkanoki)
            if buffactive.Sengikori then
                equip(sets.misc.Sengikori)
            end
        end
        if buffactive['Meikyo Shisui'] then
            equip(sets.misc['Meikyo Shisui'])
        end
    end


    -- Special handling to remove Dancer sub job Sneak effect
    if spell.name == 'Spectral Jig' and buffactive.Sneak then
        windower.ffxi.cancel_buff(71)
        cast_delay(0.3)
    elseif windower.wc_match(spell.name,'Curing*') then
        equip(sets.misc.VIT)
        if world.day == 'Darksday' then
            equip(sets.misc.SM)
        end
    end
end

function midcast(spell,arg)
-- Midcast (no instructions needed for this file) --
end

function aftercast(spell,arg)
    gear_modes()
end