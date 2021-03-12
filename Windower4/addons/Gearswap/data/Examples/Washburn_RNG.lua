    --[[**********************************************************
    ==========Annihilator Ranger GearSwap===========
    Based off of the Ranger gearswap file for Suji.Phoenix.
     
    Save this file as RNG.lua or Yourname_RNG.lua and place it in:
        Windower4.1\addons\GearSwap\data
     
    **************************************************************]]
     
    -- Configure sets below.
    function get_sets(...)
        sets.idle = {}
        sets.idle.standing = {
            head = "Orion Beret +1",
            neck = "Twilight Torque",
            lear = "Merman's Earring",
            rear = "Merman's Earring",
            body = "Orion jerkin",
            hands = "Orion Bracers +1",
            lring = "Sheltered Ring",
            rring = "Defending Ring",
            back = "Lutian cape",
            legs = "Orion Braccae +1",
            waist = "Flume Belt",
            feet = "Fajin Boots"
        }
        sets.idle.shooting = {
            head = "Orion Beret +1",
            neck = "Twilight Torque",
            lear = "Merman's Earring",
            rear = "Merman's Earring",
            body = "Khepri jacket",
            hands = "Orion Bracers",
            lring = "Sheltered Ring",
            rring = "Defending Ring",
            back = "Mollusca mantle",
            legs = "Orion Braccae +1",
            waist = "Flume Belt",
            feet = "Orion socks +1"    
        }
       
        sets.pdt = {
            head = "Iuitl headgear",
            neck = "twilight torque",
            body = "Orion Jerkin +1",
            hands = "Iuitl Wristbands",
            lring = "Defending Ring",
            rring = "Dark Ring",
            back = "Mollusca mantle",
            waist = "Flume Belt",
            legs = "Osmium Cuisses",
            feet = "Orion Socks +1"
        }
        sets.mdt = set_combine(sets.pdt, {
            head = "Orion beret +1",
            lear = "Merman's Earring",
            rear = "Merman's Earring",
            hands = "Orion Bracers +1",
        })
       
        sets.tp = {}
        sets.tp.annihilator = {}
        sets.tp.annihilator.low_acc = {
            head  = "Orion Beret +1",
            neck  = "Sylvan Scarf",
            lear  = "flame pearl",
            rear  = "Volley Earring",
            body  = "Orion jerkin",
            hands = "Sigyn's bazubands",
            lring = "Rajas Ring",
            rring = "K'ayres Ring",
            back  = "Sylvan Chlamys",
            waist = "Elanid Belt",
            legs  = "Nahtirah trousers",
            feet  = "Iuitl gaiters"
        }
        sets.tp.annihilator.med_acc = {
            head  = "Orion Beret +1",
            neck  = "Peacock amulet",
            lear  = "Clearview Earring",
            rear  = "Volley earring",
            body  = "Kyujutsugi",
            hands = "Sigyn's bazubands",
            lring = "Rajas Ring",
            rring = "Hajduk Ring +1",
            back  = "Sylvan Chlamys",
            waist = "Elanid Belt",
            legs  = "Nahtirah trousers",
            feet  = "Sylvan bottillons +2"
        }
        sets.tp.annihilator.high_acc = {
            head  = "Orion Beret +1",
            neck  = "Peacock amulet",
            lear  = "Clearview Earring",
            rear  = "Volley earring",
            body  = "Orion Jerkin",
            hands = "Sigyn's bazubands",
            lring = "Hajduk Ring",
            rring = "Hajduk Ring +1",
            back  = "Lutian Cape",
            waist = "Elanid Belt",
            legs  = "Thurandaut tights",
            feet  = "Sylvan bottillons +2"
        }
     
        local barrage_layer = {
            hands = "Orion Bracers",
            legs  = "Desultor Tassets"
        }
        sets.tp.annihilator.barrage = {}
        sets.tp.annihilator.barrage.low_acc  = set_combine(sets.tp.annihilator.low_acc,  barrage_layer)
        sets.tp.annihilator.barrage.med_acc  = set_combine(sets.tp.annihilator.med_acc,  barrage_layer)
        sets.tp.annihilator.barrage.high_acc = set_combine(sets.tp.annihilator.high_acc, barrage_layer)
     
        sets.tp.dualwield = {}
        local hybrid_dt = {
            neck = "Twilight Torque",
            back = "Mollusca Mantle",
            waist = "Flume Belt",
            lring = "Defending Ring"
        }
        sets.tp.dualwield.low_acc = {
            head  = "Iuitl Headgear",
            neck  = "Asperity Necklace",
            lear  = "Brutal Earring",
            rear  = "Suppanomimi",
            body  = "Thaumas Coat",
            hands = "Iuitl Wristbands",
            lring = "Rajas Ring",
            rring = "Epona's Ring",
            back  = "Atheling Mantle",
            waist = "Patentia Sash",
            legs  = "Manibozho Brais",
            feet  = "Manibozho Boots"
        }
        sets.tp.dualwield.low_acc.hybrid = set_combine(sets.tp.dualwield.low_acc, hybrid_dt)
       
        sets.tp.dualwield.med_acc  = {
            head  = "Whirlpool mask",
            neck  = "Asperity Necklace",
            lear  = "Heartseeker earring",
            rear  = "Dudgeon Earring",
            body  = "Thaumas Coat",
            hands = "Iuitl Wristbands",
            lring = "Rajas Ring",
            rring = "Epona's Ring",
            back  = "Letalis Mantle",
            waist = "Patentia Sash",
            legs  = "Manibozho Brais",
            feet  = "Manibozho Boots"
        }
        sets.tp.dualwield.med_acc.hybrid = set_combine(sets.tp.dualwield.med_acc, hybrid_dt)
        sets.tp.dualwield.high_acc = sets.tp.dualwield.med_acc
        sets.tp.dualwield.high_acc.hybrid = set_combine(sets.tp.dualwield.high_acc, hybrid_dt)
        sets.tp.singlewield = {}
        sets.tp.singlewield = dualwield
     
        sets.ws = {}
        sets.ws.coronach = {}
        sets.ws.coronach.low_acc = {
            head  = "Orion Beret +1",
            neck  = "Breeze Gorget",
            lear  = "Sylvan earring",
            rear  = "flame pearl",
            body  = "Orion Jerkin",
            hands = "Orion Bracers",
            lring = "Rajas Ring",
            rring = "Pyrosoul Ring",
            back  = "Terebellum mantle",
            waist = "Thunder Belt",
            legs  = "Nahtirah Trousers",
            feet  = "Iuitl gaiters"
        }
       
        sets.ws.coronach.med_acc = {
            head  = "Orion Beret +1",
            neck  = "Breeze Gorget",
            lear  = "Sylvan earring",
            rear  = "flame pearl",
            body  = "Orion Jerkin",
            hands = "Orion Bracers",
            lring = "Rajas Ring",
            rring = "Hajduk Ring +1",
            back  = "Lutian Cape",
            waist = "Thunder Belt",
            legs  = "Nahtirah Trousers",
            feet  = "Iuitl gaiters"
        }
       
        sets.ws.coronach.high_acc = {
            head  = "Orion Beret +1",
            neck  = "Breeze Gorget",
            lear  = "Clearview earring",
            rear  = "Volley earring",
            body  = "Orion Jerkin",
            hands = "Sigyn's bazubands",
            lring = "Hajduk Ring",
            rring = "Hajduk Ring +1",
            back  = "Lutian Cape",
            waist = "Thunder Belt",
            legs  = "Thurandaut tights",
            feet  = "Sylvan bottillons"
        }
     
        sets.ws.laststand = {}
        sets.ws.laststand.low_acc = {
            head  = "Orion Beret +1",
            neck  = "Breeze Gorget",
            lear  = "Sylvan earring",
            rear  = "flame pearl",
            body  = "Orion Jerkin",
            hands = "Orion Bracers",
            lring = "Rajas Ring",
            rring = "Pyrosoul Ring",
            back  = "Terebellum mantle",
            waist = "Thunder Belt",
            legs  = "Nahtirah Trousers",
            feet  = "Iuitl gaiters"
        }
       
        sets.ws.laststand.med_acc = {
            head  = "Orion Beret +1",
            neck  = "Light Gorget",
            lear  = "Sylvan earring",
            rear  = "flame pearl",
            body  = "Orion Jerkin",
            hands = "Orion Bracers",
            lring = "Rajas Ring",
            rring = "Hajduk Ring +1",
            back  = "Lutian Cape",
            waist = "Light Belt",
            legs  = "Nahtirah Trousers",
            feet  = "Iuitl gaiters"
        }
        sets.ws.laststand.high_acc = sets.ws.laststand.med_acc
       
        sets.snapshot = {
            head  = "Orion beret +1",
            body  = "Sylvan Caban +2",  
            hands = "Iuitl Wristbands",
            waist = "Impulse belt",
            feet  = "Wurrukatte Boots"
        }
     
        sets.jobability = {}
        sets.jobability['Scavenge'] = {
            feet = "Hunter's Socks"
        }
        sets.jobability['Camouflage'] = {
            body = "Orion Jerkin"
        }
        sets.jobability['Sharpshot'] = {
            legs = "Orion Braccae"
        }
       
        sets.jobability['Eagle Eye Shot'] = T{}
        sets.jobability['Eagle Eye Shot'].low_acc = {
            head  = "Orion Beret +1",
            neck  = "Sylvan Scarf",
            rear  = "Flame pearl",
            lear  = "Flame pearl",
            body  = "Orion Jerkin",
            hands = "Sigyn's bazubands",
            lring = "Pyrosoul Ring",
            rring = "Pyrosoul Ring",
            back  = "terebellum mantle",
            waist = "Elanid Belt",
            legs  = "Nahtirah trousers",
            feet  = "Iuitl gaiters"
        }
        sets.jobability['Eagle Eye Shot'].med_acc = set_combine(sets.jobability['Eagle Eye Shot'].low_acc, {
            lear  = "Clearview Earring",
            rring = "Hajduk Ring +1",
        })
        sets.jobability['Eagle Eye Shot'].high_acc = set_combine(sets.jobability['Eagle Eye Shot'].med_acc, {
            back = "Lutian Cape",
            legs = "Scout's braccae +2"
        })
     
        sets.jobability['Shadowbind'] = {
            hands = "Orion Bracers"
        }
        sets.jobability['Bounty Shot'] = {
            hands = "Sylvan Glvltte. +2",
        }
		
		sets.jobability['Velocity Shot'] = {
            hands = "Sylvan Caban +2",
        }
     
        notice('Ranger Binding Interface:')
        notice('  F9         Cycles accuracy level')
        notice('  F9+Ctrl    Cycles combat style')
        notice('  F9+Alt     Cycles hybrid level')
        notice('  F10        Enables PDT layer')
        notice('  F11        Enables MDT layer')
        notice('  F12        Resets to current best set.')
        notice('  F12+Alt    Reset and clears PDT/MDT.')
        windower.send_command('bind F9  gs c cycle accuracy')
        windower.send_command('bind ^F9 gs c cycle style')
        windower.send_command('bind !F9 gs c cycle hybrid')
        windower.send_command('bind F10 gs c defense pdt')
        windower.send_command('bind F11 gs c defense mdt')
        windower.send_command('bind F12 gs c reset')
        windower.send_command('bind !F12 gs c hardreset')
    end
     
    function notice(msg, color)
        if color == nil then
            color = 158
        end
        windower.add_to_chat(color, msg)
    end
     
    function file_unload()
        windower.send_command('unbind F9')
        windower.send_command('unbind ^F9')
        windower.send_command('unbind !F9')
        windower.send_command('unbind F10')
        windower.send_command('unbind F11')
        windower.send_command('unbind F12')
        windower.send_command('unbind !F12')
        notice('Unbinding Interface.')
    end
     
    --[[******************************************************************************************]]
    --[[ Configuration variables. More options can be added here and wired into sets accordingly. ]]
     
    local AccuracyLevels = T{'low', 'med', 'high'}
    local AccuracyLevel = AccuracyLevels[1]
     
    local CombatStyles = T{'annihilator', 'dualwield'}
    local CombatStyle = CombatStyles[1]
     
    local HybridStyles = T{'normal', 'low'}
    local HybridStyle = HybridStyles[1]
    --[[******************************************************************************************]]
    --[[******************************************************************************************]]
     
    local PDTEnabled = false;
    local MDTEnabled = false;
     
     
    function precast(spell, action)
        if spell.type == 'JobAbility' then
            if spell.name == 'Eagle Eye Shot' then
                equip(sets.jobability[spell.name][AccuracyLevel .. '_acc'])
            else
                equip(sets.jobability[spell.name])
            end
        elseif spell.type == 'WeaponSkill' then
            if spell.name == "Coronach" then
                equip(sets.ws.coronach[AccuracyLevel .. '_acc'])
            elseif spell.name == "Last Stand" then
                equip(sets.ws.laststand[AccuracyLevel .. '_acc'])
            end
        elseif spell.name == 'Ranged' then
            equip(sets.snapshot)
        end
    end
     
    function midcast(spell,action)
        if spell.name == 'Ranged' then
            if buffactive['Barrage'] then
                -- Barrage in one acc level higher than we currently use.
                local acc = S{AccuracyLevel, AccuracyLevel % #AccuracyLevels +1}:max()
                equip(sets.tp.annihilator.barrage[acc .. '_acc'])
            else
                equip(sets.tp.annihilator[AccuracyLevel .. '_acc'])
            end
        end
    end
     
    function update_current_set(status)
        if status == nil then
            status = player.status
        end
       
        local current = nil
        if status == 'Idle' then
            current = sets.idle.standing
        elseif status == 'Engaged' and CombatStyle == 'annihilator' then
            current = sets.idle.shooting
        elseif status == 'Engaged' and CombatStyle == 'dualwield' then
            current = sets.tp.dualwield[AccuracyLevel .. '_acc']
        end
       
        if current then
            if PDTEnabled then
                current = set_combine(current, sets.pdt)
            elseif MDTEnabled then
                current = set_combine(current, sets.mdt)
            elseif HybridStyle ~= HybridStyles[1] then
                if current['hybrid'] ~= nil then
                    current = current.hybrid
                end
            end
            equip(current)
        end
           
    end
     
    function aftercast(spell,action)
        update_current_set()
    end
     
    function status_change(new,old)
        update_current_set(new)
    end
     
    function buff_change(status,gain_or_loss)
    end
     
    function self_command(command)
        local params = command:psplit('%s')
     
        if params[1] == 'cycle' then
            if params[2] == 'accuracy' then
                local next = cycle(AccuracyLevels, AccuracyLevel)
                AccuracyLevel = AccuracyLevels[next]
                notice('Accuracy Level: ' .. AccuracyLevel:ucfirst())
                update_current_set()
            elseif params[2] == 'style' then
                local next = cycle(CombatStyles, CombatStyle)
                CombatStyle = CombatStyles[next]
                notice('Combat Style: ' .. CombatStyle:ucfirst())
                update_current_set()
            elseif params[2] == 'hybrid' then
                local next = cycle(HybridStyles, HybridStyle)
                HybridStyle = HybridStyles[next]
                notice('Hybrid level: ' .. HybridStyle:ucfirst())
                update_current_set()
            end
        elseif params[1] == 'reset' then
            update_current_set()
        elseif params[1] == 'hardreset' then
            PDTEnabled = false
            MDTEnabled = false
            notice('PDT/MDT reset.')
            update_current_set()
        elseif params[1] == 'defense' then
            if params[2] == 'pdt' then
                PDTEnabled = true
                notice('PDT enabled.')
                update_current_set()
            elseif params[2] == 'mdt' then
                MDTEnabled = true
                notice('MDT enabled.')
                update_current_set()
            end
        end
    end
     
    -- Finds current in possible and returns the index to the
    -- next element in the table, circularly.
    function cycle(possibles, current)
        local c = 0
        for k, v in ipairs(possibles) do
            if v == current then
                c = k
            end
        end
        return c % #possibles +1
    end