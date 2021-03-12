-- DRG Gear_sets
-- Created:
-- Last Modified:
--
--

if player.name == 'Feary' then
-- includes
	include('include/utility.lua')
	include('include/mappings.lua')
	include('include/equipment.lua')
	-- include('../include/autoexec.lua')
	
-- sets Macros off = 0  on = 1
		automacroset = 1
		if automacroset == 1 then
			if player.sub_job == 'SAM' then
				set_macro_page(12,1)
			elseif player.sub_job == 'NIN' then
				set_macro_page(12,2)
			elseif player.sub_job == 'DNC' then
				set_macro_page(12,3)
			elseif player.sub_job == 'WAR' then 
				set_macro_page(12,4)
			elseif player.sub_job == 'BLU' then 
				set_macro_page(12,5)
			elseif player.sub_job == 'RDM' then 
				set_macro_page(12,6)
			elseif player.sub_job == 'WHM' then 
				set_macro_page(12,7)	
			elseif player.sub_job == 'SCH' then 
				set_macro_page(12,8)	
			elseif player.sub_job == 'PLD' then 
				set_macro_page(12,9)	
			end
		else
			set_macro_page(12,1)
		end
		
-- Auto Sets
-- Standard/idle
sets.idle.PDT = { 
				head="Yaoyotl Helm", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
                body="Mekira Meikogai", hands="Cizin Mufflers", lring=Aug.Darkring1, rring="Defending Ring",
                back="Repulse Mantle", waist="Flume Belt", legs="Cizin Breeches +1", feet="Cizin Greaves"}

sets.idle.MDT = { 
				head="Yaoyotl Helm", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
                body="Mekira Meikogai", hands="Cizin Mufflers", lring=Aug.Darkring1, rring="Defending Ring",
                back="Engulfer Cape", waist="Nierenschutz", legs="Cizin Breeches +1", feet="Cizin Greaves"}

sets.misc.Town = set_combine(sets.idle.PDT, {legs="Blood Cuisses"})
				
sets.idle.Standard = set_combine(sets.idle.PDT, {
				lear="Merman's Earring", rear="Merman's Earring", legs="Blood Cuisses"})
-- Melee TP 
sets.TP = { ammo="Hagneia Stone",
			head="Otomi Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
            body="Lncr. Plackart +2", hands="Cizin Gauntlets", lring="Rajas Ring", rring="K'ayres Ring",
            back="Atheling Mantle", waist="Cetl Belt", legs="Cizin Breeches +1", feet="Mikinaak Greaves"}

sets.TP.Ionis = { ammo="Hagneia Stone",
			head="Otomi Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
            body="Lncr. Plackart +2", hands="Cizin Gauntlets", lring="Rajas Ring", rring="K'ayres Ring",
            back="Atheling Mantle", waist="Cetl Belt", legs="Cizin Breeches +1", feet="Mikinaak Greaves"}

-- Melee Accuracy TP
sets.TP.Acc = {	ammo="Hagneia Stone",
				head="Yaoyotl Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
				body="Lncr. Plackart +2", hands="Cizin Gauntlets", lring="Rajas Ring", rring="K'ayres Ring",
				back="Atheling Mantle", waist="Cetl Belt", legs="Cizin Breeches +1", feet="Mikinaak Greaves"}
-- Ionis Haste +2% Save TP 25+
sets.TP.Acc.Ionis = {ammo="Hagneia Stone",
				head="Yaoyotl Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
				body="Lncr. Plackart +2", hands="Cizin Gauntlets", lring="Rajas Ring", rring="K'ayres Ring",
				back="Atheling Mantle", waist="Cetl Belt", legs="Cizin Breeches +1", feet="Mikinaak Greaves"}

-- Pet
sets.precast.HealingBreath = {
				head="Vishap Armet", 
				body="Pteroslaver Mail", hands="Ogier's Gauntlets", lring="Meridian Ring", rring="K'ayres Ring",
				back="Strendu Mantle", waist="Glassblower's Belt", legs="Gorney Brayettes", feet="Gorney Sollerets"}
sets.midcast.HealingBreath = {
				head="Ptero. Armet", neck="Lancer's Torque", lear="Lancer's Earring", rear="",
				body="Wyvern Mail", hands="Buremte Gloves", lring="", rring="",
				back="Updraft Mantle", waist="Glassblower's Belt", legs="Pteroslaver Brais", feet="Ptero. Greaves"}
sets.midcast.Breath = {	
				head="Ptero. Armet", neck="Lancer's Torque", lear="Lancer's Earring", rear="",
				body="Wyvern Mail", hands="Buremte Gloves", lring="", rring="",
				back="Updraft Mantle", waist="Glassblower's Belt", legs="Pteroslaver Brais", feet="Ptero. Greaves"}

sets.precast.JA["Steady Wing"] = {
				head="Ptero. Armet", neck="Lancer's Torque", lear="Lancer's Earring", rear="",
				body="Wyvern Mail", hands="", lring="", rring="",
				back="Updraft Mantle", waist="", legs="Pteroslaver Brais", feet="Ptero. Greaves"}

-- JA
sets.precast.JA["Spirit Surge"] = {body="Pteroslaver Mail"}
sets.precast.JA["Fly High"] = {}

sets.precast.JA["Call Wyvern"] = {body="Pteroslaver Mail"}
sets.precast.JA["Angon"] = {ammo="Angon", hands="Ptero. Fin. Gaunt."}
sets.precast.JA["Deep Breathing"] = {head="Ptero. Armet"}
sets.precast.JA["Strafe"] = {legs="Pteroslaver Brais"}
sets.precast.JA["Empathy"] = {feet="Ptero. Greaves"}
sets.precast.JA["Ancient Circle"] = {legs="Vishap Brais"}
sets.precast.JA["Spirit Link"] = {head="Vishap Armet"}

-- Jumps 
sets.precast.JA["Jump"] = {ammo="Hagneia Stone",
				head="Yaoyotl Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
				body="Lncr. Plackart +2", hands="Lncr. Vmbrc. +2", lring="Rajas Ring", rring="K'ayres Ring",
				back="Atheling Mantle", waist="Windbuffet Belt", legs="Lncr. Cuissots +2", feet="Lncr. Schynbld +2"}

sets.precast.JA["High Jump"] = {ammo="Hagneia Stone",
				head="Yaoyotl Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
				body="Lncr. Plackart +2", hands="Ogier's Gauntlets", lring="Rajas Ring", rring="K'ayres Ring",
				back="Atheling Mantle", waist="Windbuffet Belt", legs="Phorcys Dirs", feet="Mikinaak Greaves"}

sets.precast.JA["Super Jump"] = {}

sets.precast.JA["Spirit Jump"] = {ammo="Hagneia Stone",
				head="Yaoyotl Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
				body="Lncr. Plackart +2", hands="Lncr. Vmbrc. +2", lring="Rajas Ring", rring="K'ayres Ring",
				back="Atheling Mantle", waist="Windbuffet Belt", legs="Lncr. Cuissots +2", feet="Lncr. Schynbld +2"}

sets.precast.JA["Soul Jump"] = {ammo="Hagneia Stone",
				head="Yaoyotl Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
				body="Lncr. Plackart +2", hands="Ogier's Gauntlets", lring="Rajas Ring", rring="K'ayres Ring",
				back="Atheling Mantle", waist="Windbuffet Belt", legs="Phorcys Dirs", feet="Mikinaak Greaves"}

-- Weaponskills
sets.precast.WS = {ammo="Hagneia Stone",
				head="Yaoyotl Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Miki. Breastplate", hands="Miki. Gauntlets", lring="Rajas Ring", rring="Pyrosoul Ring",
                back="Atheling Mantle", waist="Wanion Belt", legs="Miki. Cuisses", feet="Mikinaak Greaves"}

sets.precast.WS["Stardiver"] = {ammo="Hagneia Stone",
				head="Yaoyotl Helm", neck="Light Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Miki. Breastplate", hands="Miki. Gauntlets", lring="Rajas Ring", rring="Pyrosoul Ring",
                back="Atheling Mantle", waist="Light Belt", legs="Cizin Breeches +1", feet="Iuitl Gaiters"}

sets.precast.WS["Drakesbane"] = {ammo="Hagneia Stone",
				head="Yaoyotl Helm", neck="Light Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Miki. Breastplate", hands="Miki. Gauntlets", lring="Rajas Ring", rring="Pyrosoul Ring",
                back="Atheling Mantle", waist="Light Belt", legs="Miki. Cuisses", feet="Mikinaak Greaves"}

sets.precast.WS["Camlann's Torment"] = {ammo="Hagneia Stone",
				head="Yaoyotl Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Miki. Breastplate", hands="Miki. Gauntlets", lring="Rajas Ring", rring="Pyrosoul Ring",
                back="Atheling Mantle", waist="Wanion Belt", legs="Miki. Cuisses", feet="Mikinaak Greaves"}

-- Midcast Sets

-- Aftercast

-- Misc Sets
sets.precast.Fastcast = set_combine(sets.idle.PDT, {head="Cizin Helm", lear="Loquac. Earring", rring="Prolix Ring",})

sets.precast.Utsusemi = set_combine(sets.precast.Fastcast, {neck="Magoraga Beads"})

sets.misc.Waltz = {hands="Buremte Gloves", waist="Chuq'aba Belt"}
sets.misc.Steps = set_combine(sets.TP.ACC)
sets.misc.flourish = {}


elseif player.name == 'Derion' then

elseif player.name == 'Aniyah' then

elseif player.name == 'Firetoplay' then

end