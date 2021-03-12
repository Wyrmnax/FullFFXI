--[[
    !! Special thanks to everyone that helped me with the code and to better understand it !!

    Use for troubleshooting
    print(spell.name, player.sub_job)
    print(hp, player.max_hp, player.status)
]]

function get_sets()
    windower.send_command('input /macro book 1; wait .1; input /macro set 1; input /echo [ Job Changed to MNK ]')
    windower.send_command('@bind f10 gs c tryweaponskill')
    windower.send_command('input /blockhelp on')


    -- Automated events similar to events in the AutoExec plugin
    windower.register_event('hpp change', function(new, old)
        if new == 100 and player.status == 'Idle' then
            windower.send_command('wait 1;gs c FullHP')
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
                back="Mollusca Mantle", waist="Black Belt", legs="Otronif Brais", feet="Otronif Boots"}

    sets.misc.ImpetusSmite = {
                body="Tantra Cyclas +2"}

    sets.misc.Movement = {
                feet="Hermes' Sandals"}

    sets.misc.PC = {
                head="Tantra Crown +2"}

    sets.misc.SM = {
                back="Shadow Mantle"}

    sets.misc.Utsusemi = {
                neck="Magoraga Beads",}

    sets.misc.VIT = {ammo="Brigantia Pebble",
                head="Lithelimb Cap", neck="Tjukurrpa Medal", lear="Terra's Pearl", rear="Terra's Pearl",
                body="Anch. Cyclas +1", hands="Anch. Gloves +1", lring="Terrasoul Ring", rring="Terrasoul Ring",
                back="Iximulew Cape", waist="Caudata Belt", legs="Nahtirah Trousers", feet="Thur. Boots +1"}


    -- Precast sets --
    sets.precast = {}
    sets.precast.JA = {}
    sets.precast.JA.Boost = {
                hands="Anch. Gloves +1"}
    sets.precast.JA.Chakra = set_combine(sets.misc.VIT, {
                body="Anch. Cyclas +1", hands="Hes. Gloves +1"})
    sets.precast.JA.Counterstance = {
                feet="Mel. Gaiters +2"}
    sets.precast.JA.Dodge = {
                feet="Anch. Gaiters +1"}
    sets.precast.JA.Focus = {
                head="Anchor. Crown +1"}
    sets.precast.JA['Formless Strikes'] = {
                body="Hes. Cyclas"}
    sets.precast.JA['Hundred Fists'] = {
                legs="Hes. Hose"}
    sets.precast.JA.Mantra = {
                feet="Mel. Gaiters +2"}

    sets.precast.WS = {}
    sets.precast.WS['Final Heaven'] = {ammo="Tantra Tathlum",
                head="Lithelimb Cap", neck="Tjukurrpa Medal", lear="Brutal Earring", rear="Terra's Pearl",
                body="Anch. Cyclas +1", hands="Anch. Gloves +1", lring="Terrasoul Ring", rring="Epona's Ring",
                back="Iximulew Cape", waist="Caudata Belt", legs="Nahtirah Trousers", feet="Thur. Boots +1"}
    sets.precast.WS['Victory Smite'] = {ammo="Tantra Tathlum",
                head="Uk'uxkaj Cap", neck="Rancor Collar", lear="Brutal Earring", rear="Moonshade Earring",
                body="Anch. Cyclas +1", hands="Anch. Gloves +1", lring="Pyrosoul Ring", rring="Epona's Ring",
                back="Buquwik Cape", waist="Caudata Belt", legs="Manibozho Brais", feet="Manibozho Boots"}

    sets.precast.FastCast = {
                head="Athos's Chapeau", lear="Loquac. Earring",
                body="Mirke Wardecors", hands="Thaumas Gloves", lring="Prolix Ring"}


    -- Midcast sets (none needed in this file) --
    sets.midcast = {}


    -- Aftercast sets labeled to show either melee or idle --
    sets.melee = {}
    sets.melee.TP = {}
    sets.melee.TP.Normal = {ammo="Vanir Battery",
                head="Felistris Mask", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Thaumas Coat", hands="Otronif Gloves", lring="Rajas Ring", rring="Epona's Ring",
                back="Atheling Mantle", waist="Windbuffet Belt", legs="Otronif Brais", feet="Manibozho Boots"}
    sets.melee.TP.Accuracy = set_combine(sets.melee.TP.Normal, {ammo="Honed Tathlum",
                head="Whirlpool Mask", neck="Ziel Charm",
                body="Manibozho Jerkin", hands="Hes. Gloves +1",
                back="Letalis Mantle", waist="Anguinus Belt", legs="Manibozho Brais", feet="Daihanshi Habaki"})

    sets.idle = {}
    sets.idle.DT = {ammo="Brigantia Pebble",
                head="Otronif Mask", neck="Twilight Torque", lear="Terra's Pearl", rear="Terra's Pearl",
                body="Otronif Harness", hands="Otronif Gloves", lring="Dark Ring", rring="Defending Ring",
                back="Shadow Mantle", waist="Black Belt", legs="Otronif Brais", feet="Otronif Boots"}
    sets.idle.Regen = set_combine(sets.idle.DT, {
                neck="Wiglen Gorget",
                body="Hes. Cyclas", lring="Paguroidea Ring", rring="Sheltered Ring"})

    boostCount = 0
    DTMode = 'None'
    TPMode = 'Normal'
    ShadowType = 'None'
    WSBind = 'Victory Smite'
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
        if WSBind == 'Victory Smite' then
            WSBind = 'Final Heaven'
        elseif WSBind == 'Final Heaven' then
            WSBind = 'Shijin Spiral'
        else
            WSBind = 'Victory Smite'
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
    -- Sequential gear sets used to easier allow for changing player needs
    if player.status == 'Engaged' then
        equip(sets.melee.TP[TPMode], sets.misc.DT[DTMode])
        -- Perfect Counter
        if buffactive['Perfect Counter'] and DTMode == 'None' then
            equip(sets.misc.PC)
        end
    else
        equip(sets.idle.DT, sets.misc.DT[DTMode], sets.misc.Movement)
        if player.hpp < 100 then
            equip(sets.idle.Regen, sets.misc.DT[DTMode], sets.misc.Movement)
        end
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
        if player.status == 'Engaged' then
            -- Gear info each time you Engage, useful if using DressUp or BlinkMeNot
            windower.add_to_chat(8,player.name..':   Melee = '..TPMode..'   |   Damage Taken = '..DTMode)
            -- Automatically activate Impetus when engaging
            if not buffactive.Impetus and not buffactive.Amnesia and not buffactive.Obliviscence and not buffactive.Paralysis and windower.ffxi.get_ability_recasts()[31] < 1 then
                windower.send_command('impetus')
            end
        end
        gear_modes()
        slot_disabling()
    end
end

function buff_change(buff,g_or_l)
    if buff == 'Perfect Counter' then
        gear_modes()
    elseif buff == 'Boost' and g_or_l == false then
        boostCount = 0
    end
end

function precast(spell,arg)
    slot_disabling()
    -- Situational spell logic for Warrior sub job
    if (spell.name == 'Final Heaven' or spell.name == 'Victory Smite' or spell.name == 'Shijin Spiral') and not buffactive.Berserk and not buffactive.Boost and not buffactive.Amnesia and not buffactive.Obliviscence and not buffactive.Paralysis and player.sub_job == 'WAR' and windower.ffxi.get_ability_recasts()[1] < 1 then
        windower.send_command('berserk; wait 1; warcry; wait 1; '..spell.name..' '..spell.target.raw)
        cancel_spell()
        return
    end

    -- Generic equip command for all Job Abilities and Weaponskills
    if sets.precast.JA[spell.name] then
        equip(sets.precast.JA[spell.name])
        if spell.name == 'Chakra' and world.day == 'Darksday' then
            equip(sets.misc.SM)
        end
    elseif sets.precast.WS[spell.name] then
        equip(sets.precast.WS[spell.name])
        if spell.name == 'Victory Smite' and buffactive.Impetus then
            equip(sets.misc.ImpetusSmite)
        end
    end

    -- Magic spell gear handling(Precast)
    if spell.skill == 'Ninjutsu' then
        equip(sets.precast.FastCast)
        if windower.wc_match(spell.name,'Utsusemi*') then
            equip(sets.precast.FastCast, sets.misc.Utsusemi)
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
    elseif windower.wc_match(spell.name,'*Step') then
        equip(sets.melee.TP.Accuracy)
    end
end

function midcast(spell,arg)
    -- Gear change to Damage Taken set when in midcast of Utsusemi
    -- Special handling to remove Utsusemi, Sneak, and Stoneskin effects if they are active
    if windower.wc_match(spell.name,'Utsusemi*') then
        equip(sets.misc.DT.Active, sets.misc.Utsusemi)
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
    end
end

function aftercast(spell,arg)
    gear_modes()
    -- Changes shadow type variable to allow cancel Copy Image if last cast was Utsusemi: Ni
    if spell and spell.name == 'Utsusemi: Ni' then
        ShadowType = 'Ni'
    elseif spell and spell.name == 'Utsusemi: Ichi' then
        ShadowType = 'Ichi'
    elseif spell and spell.name == 'Boost' then
        boostCount = boostCount +1
        windower.add_to_chat(8,'Boost Count - [ '..boostCount..' / 12 ] ('..math.floor(100*boostCount/12)..'% Boosted!)')
    end
end