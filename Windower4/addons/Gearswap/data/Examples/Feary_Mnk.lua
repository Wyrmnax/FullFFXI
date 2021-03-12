-- Feary's MNK LUA
-- 1/18/2014
--
--

--function file_unload()
-- unload Gearswap

-- load spellcast for other jobs.
--windower.send_command("load spellcast")
--end

-- Gear Sets 
function get_sets()
-- Define Default Values for Variables
boostCount = 0
Mode = 0
PDT = 0
MDT = 0
ShadowType = 'None'


-- Augmented Gear
Aug.Darkring1 = {name="Dark Ring",augments={"Physical Damage Taken -5%, Magical Damage Taken -3%"}}
Aug.Darkring2 = {name="Dark Ring",augments={"Physical Damage Taken -4%, Magical Damage Taken -4%"}}

sets.misc = {}
sets.misc.Town = set_combine(sets.idle.PDT, {
				feet="Hermes' Sandals"})
-- Auto Sets
-- Standard/Idle
sets.idle = set_combine(sets.idle.PDT, {
				lear="Merman's Earring", rear="Merman's Earring", feet="Hermes' Sandals"})
sets.idle.PDT = { 
				head="Otronif Mask", neck="Twilight Torque",
                body="Otronif Harness", hands="Otronif Gloves", lring="Aug.Darkring1", rring="Aug.Darkring2",
                back="Repulse Mantle", waist="Black Belt", legs="Otronif Brais", feet="Otronif Boots"}

sets.idle.MDT = { 
				head="Whirlpool Mask", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
                body="Manibozho Jerkin", hands="Otronif Gloves", lring="Dark Ring", rring="Dark Ring",
                back="Engulfer Cape", waist="Black Belt",  legs="Nahtirah Trousers", feet="Manibozho Boots"}

sets.Idle.Regen = set_combine(sets.idle.PDT, {})
sets.Idle.Evasion = {
				head="Uk'uxkaj Cap", neck="Torero Torque", lear="Musical earring", rear="Novia Earring",
                body="Manibozho Jerkin", hands="Otronif Gloves", lring="Aug.Darkring1", rring="Aug.Darkring2",
                back="Boxer's Mantle", waist="Scouter's Rope",  legs="Otronif Brais", feet="Manibozho Boots"}
-- Hundred Fists
sets.HF = set_combine(sets.TP,{body="Tantra Cyclas +2"})
-- TP 
sets.TP = { ammo="Hagneia Stone",
				head="Uk'uxkaj Cap", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Thaumas Coat", hands="Otronif Gloves", lring="Rajas Ring", rring="Epona's Ring",
                back="", waist="Windbuffet Belt",  legs="Manibozho Brais", feet="Manibozho Boots"}
-- Accuracy TP
sets.TP.MidACC = { ammo="Honed Tathlum",
				head="Uk'uxkaj Cap", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Thaumas Coat", hands="Otronif Gloves", lring="Rajas Ring", rring="Epona's Ring",
                back="Atheling Mantle", waist="Hurch'lan Sash",  legs="Manibozho Brais", feet="Manibozho Boots"}
-- High Accuracy TP
sets.TP.HighACC = { ammo="Honed Tathlum",
				head="Whirlpool Mask", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Thaumas Coat", hands="Otronif Gloves", lring="Rajas Ring", rring="Epona's Ring",
                back="Atheling Mantle", waist="Hurch'lan Sash",  legs="Manibozho Brais", feet="Manibozho Boots"}

-- Hybrid PDT/TP
sets.TP.Hybrid = {ammo="",
				head="", neck="", lear="", rear="",
                body="", hands="", lring="", rring="",
                back="", waist="",  legs="", feet=""}

-- Impetus Sets
sets.TP.Impetus = set_combine(sets.TP, { ammo="Hagneia Stone",
                body="Tantra Cyclas +2", waist="Twilight Belt"})
sets.TP.MidAcc.Impetus = set_combine(sets.TP.MidACC, {ammo="Honed Tathlum", body="Tantra Cyclas +2",
				waist="Hurch'lan Sash"})
sets.TP.HighACC.Impetus =  set_combine(sets.TP.HighACC, { ammo="Honed Tathlum",
				head="Whirlpool Mask", body="Tantra Cyclas +2", waist="Hurch'lan Sash"})

-- JA
sets.precast.JA = {}
sets.precast.JA.FormlessStrikes = {body="Mel. Cyclas +2"}
sets.precast.JA.Chakra = set_combine(sets.idle.PDT, { ammo="Tantra Tahtlum",
				head="Whirlpool Mask",
				body="Manibozho Jerkin", hands="Mel. Gloves +2", 
				legs="Nahtirah Trousers"})
sets.precast.JA.ChiBlast = set_combine(sets.idle.PDT, {
				head="Uk'uxkaj Cap", neck="Morgana's Choker",
                body="Manibozho Jerkin", hands="Otronif Gloves", lring="Aquasoul Ring", rring="Aquasoul Ring",
                back="", waist="",  legs="Nahtirah Trousers"})
sets.precast.JA.Impetus = {body="Tantra Cyclas +2"}
sets.precast.JA.HundredFists = {legs="Mel. Hose +2"}
sets.precast.JA.Focus = {head="Temple Crown")
sets.precast.JA.Dodge = {feet="Temple Gaiters"}
sets.precast.JA.Boost = {hands="Temple Gloves"}
sets.precast.JA.Counterstance = {feet="Mel. Gaiters +2"}
sets.precast.JA.Mantra = {feet="Mel. Gaiters +2"}

-- Weaponskills
sets.precast.ws = {ammo="Honed Tathlum",
				head="Uk'uxkaj Cap", neck="Justiciar's Torque", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Manibozho Jerkin", hands="Manibozho Gloves", lring="Rajas Ring", rring="Pyrosoul Ring",
                back="Atheling Mantle", waist="Anguinus Belt",  legs="Manibozho Brais", feet="Manibozho Boots"}
sets.precast.WS['Victory Smite'] = { ammo="Honed Tathlum",
				head="Uk'uxkaj Cap", neck="Light Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Manibozho Jerkin", hands="Manibozho Gloves", lring="Rajas Ring", rring="Pyrosoul Ring",
                back="Atheling Mantle", waist="Wanion Belt",  legs="Manibozho Brais", feet="Manibozho Boots"}

sets.precast.WS.Impetus['Victory Smite'] = { ammo="Honed Tathlum",
				head="Uk'uxkaj Cap", neck="Light Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Tantra Cyclas +2", hands="Manibozho Gloves", lring="Rajas Ring", rring="Pyrosoul Ring",
                back="Atheling Mantle", waist="Wanion Belt",  legs="Manibozho Brais", feet="Manibozho Boots"}

sets.precast.WS['Final Heaven'] = set_combine(sets.precast.ws)

sets.precast.WS['Shijin Spiral'] = set_combine(sets.precast.ws, {ammo="Potestas Bomblet",
				head="Uk'uxkaj Cap", neck="Justiciar's Torque", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Manibozho Jerkin", hands="Otronif Gloves", lring="Thundersoul Ring", rring="Epona's Ring",
                back="Atheling Mantle", waist="Wanion Belt",  legs="Manibozho Brais", feet="Manibozho Boots"})
sets.precast.WS.MidAcc['Shijin Spiral'] = set_combine(sets.precast.ws['Shijin Spiral'], {
				head="Uk'uxkaj Cap", neck="Justiciar's Torque", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Manibozho Jerkin", hands="Otronif Gloves", lring="Thundersoul Ring", rring="Epona's Ring",
                back="Atheling Mantle", waist="Anguinus Belt",  legs="Manibozho Brais", feet="Manibozho Boots"})
sets.precast.WS.HighAcc['Shijin Spiral'] = set_combine(sets.precast.ws['Shijin Spiral'], {ammo="Potestas Bomblet",
				head="Whirlpool Mask", neck="Light Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Manibozho Jerkin", hands="Otronif Gloves", lring="Mars's Ring", rring="Epona's Ring",
                back="Atheling Mantle", waist="Anguinus Belt",  legs="Manibozho Brais", feet="Manibozho Boots"})

sets.precast.WS["Ascetic's Fury"] = set_combine(sets.precast.WS, {
				head="Uk'uxkaj Cap", neck="Light Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Manibozho Jerkin", hands="Manibozho Gloves", lring="Rajas Ring", rring="Pyrosoul Ring",
                back="Atheling Mantle", waist="Wanion Belt",  legs="Manibozho Brais", feet="Manibozho Boots"})
sets.precast.WS["Asuran Fists"] = set_combine(sets.precast.WS, {neck="Shadow Gorget", waist="Anguinus Belt"})

-- Midcast Sets
sets.midcast = ()

-- Aftercast
sets.Aftercast = {}

-- Misc Sets
sets.Misc.Fastcast = set_combine(sets.idle.PDT, {
				head="Athos's Chapeau", neck="Magoraga Beads", lear="Loquac. Earring", rear="Novia Earring",
                body="Manibozho Jerkin", hands="Otronif Gloves", lring="", rring="Prolix Ring",
                back="Repulse Mantle", waist="Black Belt",  legs="", feet=""})
sets.Misc.Utsusemi = set_combine(sets.misc.Fastcast, {neck="Magoraga Beads"})

end -- End gear sets

-- Rules

function aftercast(spell,arg)
-- Autoset
	if player.status == 'Engaged' then
		equip(sets.TP)
	else
		equip(sets.Idle)
	end
-- Utsusemi Variable Sets
	if spell and spell.name == 'Utsusemi: Ni' then
        ShadowType = 'Ni'
    elseif spell and spell.name == 'Utsusemi: Ichi' then
        ShadowType = 'Ichi'
    elseif spell and spell.name == 'Boost' then
        boostCount = boostCount +1
        windower.add_to_chat(8,'Boost Count - [ '..boostCount..' / 12 ] ('..math.floor(100*boostCount/12)..'% Boosted!)')
    end
end

function precast(spell)
 -- Generic equip command for all Job Abilities and Weaponskills
    if sets.precast.JA[spell.name] then
        equip(sets.precast.JA[spell.name])
    elseif sets.precast.WS[spell.name] then
        equip(sets.precast.WS[spell.name])
    end

 -- Ninjutsu spell gear handling(Precast)
    if spell.skill == 'Ninjutsu' then
        equip(sets.precast.FastCast)
        if windower.wc_match(spell.name,'Utsusemi*') then
            equip(sets.misc.Utsusemi)
        end
    end


 -- Special handling to remove Dancer sub job Sneak effect
    if spell.name == 'Spectral Jig' and buffactive.Sneak then
        windower.ffxi.cancel_buff(71)
        cast_delay(0.3)
    elseif windower.wc_match(spell.name,'Curing*') then
        equip(sets.misc.Waltz)
    elseif windower.wc_match(spell.name,'*Step') then
        equip(sets.TP.HighAcc)
    end
end

function midcast(spell,arg)
	if windower.wc_match(spell.name,'Utsusemi*') then
		-- Equip PDT then Utsusemi Gear sets
        equip(sets.Idle.PDT, sets.misc.Utsusemi)
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
    end
end

