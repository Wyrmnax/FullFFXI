--[[
    !! Special thanks to everyone that helped me with the code and to better understand it !!
]]

function get_sets()
    windower.send_command('input /macro book 5; wait .1; input /macro set 1; input /echo [ Job Changed to NIN ]')
    windower.send_command('@bind f10 gs c tryweaponskill')
    windower.send_command('input /blockhelp on')


    -- Automated events similar to events in the AutoExec plugin
    windower.register_event('hpp change', function(new, old)
        if new == 100 and player.status == 'Idle' then
            windower.send_command('wait 1;gs c FullHP')
        end
    end)
    windower.register_event('time change', function(time)
        if (time == 7*60+1 or time == 17*60+1) and player.status == 'Idle' then
            windower.send_command('wait 1;gs c Movement')
            windower.add_to_chat(8,'TIME TRIGGGER')
        end
    end)


    -- Maps Ninja spell nukes for the midcast function, can change mapping as needed
    ninjaNuke = S{'Doton: Ichi', 'Huton: Ichi', 'Hyoton: Ichi', 'Katon: Ichi', 'Raiton: Ichi', 'Suiton: Ichi',
                'Doton: Ni', 'Huton: Ni', 'Hyoton: Ni', 'Katon: Ni', 'Raiton: Ni', 'Suiton: Ni',
                'Doton: San', 'Huton: San', 'Hyoton: San', 'Katon: San', 'Raiton: San', 'Suiton: San'}


    -- Start defining actual gear sets to be used below --
    -- Miscellaneous sets
    sets.misc = {}
    sets.misc.DT = {}
    sets.misc.DT.None = {}
    sets.misc.DT.Active = {
                head="Otronif Mask", neck="Twilight Torque",
                body="Otronif Harness", hands="Otronif Gloves", lring="Dark Ring", rring="Defending Ring",
                back="Mollusca Mantle", waist="Flume Belt", legs="Otronif Brais", feet="Otronif Boots"}

    sets.misc.MovementDay = {
                feet="Danzo Sune-ate"}
    sets.misc.MovementNight = {
                feet="Hachi. Kyahan +1"}

    sets.misc.SM = {
                back="Shadow Mantle"}

    sets.misc.Utsusemi = {
                neck="Magoraga Beads",
                waist="Twilight Belt", feet="Iga Kyahan +2"}

    sets.misc.VIT = {
                head="Uk'uxkaj Cap",
                body="Otronif Harness", hands="Otronif Gloves",
                legs="Hachi. Hakama +1", feet="Thur. Boots +1"}


    -- Precast sets --
    sets.precast = {}
    sets.precast.JA = {}

    sets.precast.WS = {}
    sets.precast.WS['Blade: Hi'] = {ammo="Qirmiz Tathlum",
                head="Uk'uxkaj Cap", neck="Hope Torque", lear="Brutal Earring", rear="Moonshade Earring",
                body="Hachi. Chain. +1", hands="Thur. Gloves +1", lring="Dumakulem's ring", rring="Epona's Ring",
                back="Rancorous Mantle", waist="Caudata Belt", legs="Hachi. Hakama +1", feet="Daihanshi Habaki"}

    sets.precast.FastCast = {
                head="Athos's Chapeau", neck="Orunmila's Torque", lear="Loquac. Earring",
                body="Mirke Wardecors", hands="Thaumas Gloves", lring="Prolix Ring"}


    -- Midcast sets  --
    sets.midcast = {}
    sets.midcast.Ninjutsu = {
                head="Hachi. Hatsu. +1", neck="Ninjutsu Torque", lear="Stealth Earring", rear="Ninjutsu Earring",
                hands="Kog. Tekko +2",
                back="Astute Cape", waist="Cimmerian Sash", feet="Kog. Kyahan +2"}
    sets.midcast.Ninjutsu.Nuke = set_combine(sets.midcast.Ninjutsu, {
                head="Kog. Hatsuburi +2",
                hands="Iga Tekko +2",
                feet="Hachi. Kyahan +1"})
    sets.midcast.Recast = {
                }


    -- Aftercast sets labeled to show either melee or idle --
    sets.melee = {}
    sets.melee.TP = {}
    sets.melee.TP.Normal = {ammo="Qirmiz Tathlum",
                head="Iga Zukin +2", neck="Asperity Necklace", lear="Dudgeon Earring", rear="Heartseeker Earring",
                body="Hachi. Chain. +1", hands="Otronif Gloves", lring="Rajas Ring", rring="Epona's Ring",
                back="Atheling Mantle", waist="Patentia Sash", legs="Hachi. Hakama +1", feet="Manibozho Boots"}
    sets.melee.TP.Accuracy = set_combine(sets.melee.TP.Normal, {ammo="Jukukik Feather",
                head="Whirlpool Mask", neck="Ziel Charm",
                body="Manibozho Jerkin", hands="Buremte Gloves",
                back="Letalis Mantle", waist="Anguinus Belt", legs="Manibozho Brais", feet="Daihanshi Habaki"})

    sets.idle = {}
    sets.idle.DT = {
                head="Otronif Mask", neck="Twilight Torque",
                body="Otronif Harness", hands="Otronif Gloves", lring="Dark Ring", rring="Defending Ring",
                back="Shadow Mantle", waist="Flume Belt", legs="Otronif Brais", feet="Otronif Boots"}
    sets.idle.Regen = set_combine(sets.idle.DT, {
                neck="Wiglen Gorget",
                lring="Paguroidea Ring", rring="Sheltered Ring"})

    DTMode = 'None'
    TPMode = 'Normal'
    ShadowType = 'None'
    WSBind = 'Blade: Hi'
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
    elseif str == 'Movement' then
        gear_modes()
    end

    -- Allows you to change the WeaponSkill that will be used when F10 is pressed,
    -- use in game macro "/con gs c WSBind"
    if str == 'WSBind' then
        if WSBind == 'Blade: Hi' then
            WSBind = 'Blade: Shun'
        else
            WSBind = 'Blade: Hi'
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
    else
        equip(sets.idle.DT, sets.misc.DT[DTMode], sets.misc.MovementDay)
        if player.hpp < 100 then
            equip(sets.idle.Regen, sets.misc.DT[DTMode], sets.misc.MovementDay)
        end
        -- world.time is given in minutes into each day
        -- 0700 would be 420 minutes, 1700 would be 1020 minutes
        if world.time >= 1020 or world.time <= 420 then
            equip(sets.misc.MovementNight)
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
    if player.equipment.range == 'Aliyat Chakram' then
        disable('range','ammo')
    else
        enable('range','ammo')
    end
end


----------- Start of ----------
------ built in functions -----
function status_change(new,old)
    if T{'Idle','Engaged'}:contains(new) then
        if player.status == 'Engaged' then
            -- Gear info each time you Engage, useful if using DressUp or BlinkMeNot
            windower.add_to_chat(8,player.name..':   Melee = '..TPMode..'   |   Damage Taken = '..DTMode)
            -- Automatically activate Yonin when engaging if Innin isn't active
            if not buffactive.Yonin and not buffactive.Innin and not buffactive.Amnesia and not buffactive.Obliviscence and not buffactive.Paralysis and windower.ffxi.get_ability_recasts()[146] < 1 then
                windower.send_command('yonin')
            end
        end
        gear_modes()
        slot_disabling()
    end
end

function precast(spell,arg)
    slot_disabling()
    -- Situational spell logic for Warrior sub job
    if (spell.name == 'Blade: Hi' or spell.name == 'Blade: Shun') and not buffactive.Berserk and not buffactive.Amnesia and not buffactive.Obliviscence and not buffactive.Paralysis and player.sub_job == 'WAR' and windower.ffxi.get_ability_recasts()[1] < 1 then
        windower.send_command('berserk; wait 1; warcry; wait 1; '..spell.name..' '..spell.target.raw)
        cancel_spell()
        return
    end

    -- Generic equip command for all Job Abilities and Weaponskills
    if sets.precast.JA[spell.name] then
        equip(sets.precast.JA[spell.name])
    elseif sets.precast.WS[spell.name] then
        equip(sets.precast.WS[spell.name])
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
    if spell.skill == 'Ninjutsu' then
        if ninjaNuke[spell.english] then
            equip(sets.midcast.Ninjutsu.Nuke)
        elseif spell.name == 'Migawari: Ichi' then
            equip(sets.misc.DT.Active)
        else
            equip(sets.midcast.Ninjutsu)
        end
    end

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
    end
end