-- Feary's RDM LUA
-- Created 2/18/2014
-- Last Updated: 
-- To do list
-- 
--
--
--includes
	include('include/functions.lua')
	-- Global Buffs
	include('include/status.lua')
	
-- Gear Sets 
function get_sets()
--includes
	--include('include/autoexec.lua')
	include('include/binds.lua')
	include('include/utility.lua')
	include('include/macro.lua')
	
-- Get RDM gearsets
	include('Gearsets/'..player.name..'/RDM_Gearsets.lua')
	
-- Define Default Values for Variables
	Mode = 0
	PDT = 0
	MDT = 0
	Skill = 0
	ShadowType = 'None'
end 

-- Called when this job file is unloaded (eg: job change)
function file_unload()
	clear_binds()
end

-- Rules
function self_command(command)
-- Lock PDT
	if command == 'PDT' then
		if PDT == 1 then
			windower.add_to_chat(121,'PDT Unlocked')
			-- make sure other values are set to default
			PDT = 0
			-- Unlock MDT set and equip Current TP set
			MDT = 0
			-- Place Me in my previous set.
			if player.status == 'Engaged' then
				previous_set()
			else
				equip(sets.idle.Standard)
			end
		else
		-- Make sure other values are set to default
			MDT = 0
		-- Set PDT set and equip it
			PDT = 1
			equip(sets.idle.PDT)
			windower.add_to_chat(121,'PDT Set Locked')
		end
--  Lock MDT
	elseif command == 'MDT' then
		if MDT == 1 then
		-- make sure other values are set to default
			PDT = 0
		-- Unlock MDT set and equip Current TP set
			MDT = 0
			windower.add_to_chat(121,'MDT Unlocked')
		-- Place Me in my previous set.
			if player.status == 'Engaged' then
				previous_set()
			else
				equip(sets.idle.Standard)
			end
		else
		-- make sure other values are set to default
			PDT = 0
		-- lock MDT set and equip it
			MDT = 1
			equip(sets.idle.MDT)
			windower.add_to_chat(121,'MDT Set Locked')
		end
-- Reset	
	elseif command == 'TP' then
		if PDT == 1 or MDT == 1 then
			-- Reset to Default
			PDT = 0
			MDT = 0
			-- Place me in previous set
			if player.status == 'Engaged' then
				previous_set()
			else
				equip(sets.idle.Standard)
			end
		else
			if Mode >= 1 then
			-- Reset to 0
				Mode = 0
			else
			-- Increment by 1
				Mode = Mode + 1
			end
			-- Place me in previous set
			if player.status == 'Engaged' then
				previous_set()
			else
				equip(sets.idle.Standard)
			end
		end
	elseif command == 'Skill' then
	-- toggle
		if skill == 0 then
			-- set it on
			skill = 1
		else
			-- set if off
			skill = 0
		end
	elseif command == "t" then
		if twilight == 0 then
			twilight = twilight + 1
			-- Twilight Gear
			equip({head="Empty",body="Twilight Cloak"})
			disable('head,body')
			windower.add_to_chat(121,"Twilight Cloak Locked")
		else
			enable('head,body')
		end		
	end
end

function status_change(new,old)
-- Auto set
    if T{'Idle','Resting'}:contains(new) then
		slot_lock()
		if areas.Town:contains(world.zone) then
			windower.add_to_chat(121, "Town Gear")
			equip(sets.misc.Town)
		else
			if new == "Resting" then
				equip(sets.Resting)
			else
				if PDT == 1 or buffactive['Weakness'] or player.hpp < 30 then
					equip(sets.idle.PDT)
				elseif MDT == 1 then
					equip(sets.idle.MDT)
				else
					equip(sets.idle.Standard)
				end
			end
		end
	elseif new == 'Engaged' then
		slot_lock()
		if PDT == 1 or MDT == 1 then
			if PDT == 1 and MDT == 0 then
				windower.add_to_chat(121,'PDT Locked')
				equip(sets.idle.PDT)
			elseif MDT == 1 and PDT == 0 then
				windower.add_to_chat(121,'MDT Locked')
				equip(sets.idle.MDT)
			else
				MDT = 0
				PDT = 0
			end
		else
			-- Equip previous TP set 
				previous_set()
		end
	end
end

function pretarget(spell)
	
end

function precast(spell,arg)
-- Job Abilities
	if spell.type == 'JobAbility' then
		if sets.precast.JA[spell.name] then
			equip(sets.precast.JA[spell.name])
		end
-- Weaponskills
	elseif spell.type == 'WeaponSkill' then
		if player.status == 'Engaged' then
			if player.tp >= 100 then
				if spell.target.distance <= 5 then
					if sets.precast.WS[spell.name] then
						equip(sets.precast.WS[spell.name])
					else
						equip(sets.precast.WS)
					end
				else
					cancel_spell()
					windower.add_to_chat(121, 'Canceled '..spell.name..'.'..spell.target.name..' is Too Far')
				end
			else 
				cancel_spell()
				windower.add_to_chat(121, ''..player.tp..'TP is not enough to WS')
			end
		else
			cancel_spell()
			windower.add_to_chat(121, 'You must be Engaged to WS')
		end
-- Magic
	elseif spell.type:endswith('Magic') then
		-- Chainspell
		if buffactive.Chainspell or buffactive.Spontaneity then
			-- Don't need Fastcast
			if spell.name == 'Stun' then
				equip(sets.midcast.Stun)
			elseif spell.skill:startswith('Elemental') then
				equip(sets.midcast.Nuke)
			else
				equip(sets.midcast.Macc)
			end
		else
			if spell.skill:startswith("Healing") then
				-- Cure casting time
				if spell.english:wcmatch('Cure*') or spell.english:wcmatch("Curaga*") then
					equip(sets.precast.Cure)
				else
					-- Magian Staff
					if Fastcast.Staff[spell.element] and (player.inventory[Fastcast.Staff[spell.element]] or player.wardrobe[Fastcast.Staff[spell.element]] or player.wardrobe2[Fastcast.Staff[spell.element]]) then
						equip(sets.precast.Fastcast, {main=Fastcast.Staff[spell.element]})
					else
						equip(sets.precast.Fastcast)
					end	
				end
			elseif spell.skill:startswith("Enhancing") then
				-- Magian Staff
				if Fastcast.Staff[spell.element] and (player.inventory[Fastcast.Staff[spell.element]] or player.wardrobe[Fastcast.Staff[spell.element]] or player.wardrobe2[Fastcast.Staff[spell.element]]) then
					equip(sets.precast.Enhancing, {main=Fastcast.Staff[spell.element]})
				else
					equip(sets.precast.Enhancing)
				end	
				if spell.name == "Stoneskin" then
					equip(sets.precast.Stoneskin)
				end
				-- Cancel Sneak
				if spell.name == 'Sneak' and buffactive.Sneak and spell.target.type == 'SELF' then
					windower.ffxi.cancel_buff(71)
					cast_delay(0.3)
				end
			elseif spell.name == "Impact" or player.equipment.body == "Twilight Cloak" then
				equip(sets.midcast.Macc, {head="Empty", body="Twilight Cloak"})
			else
				-- Magian Staff
				if Fastcast.Staff[spell.element] and (player.inventory[Fastcast.Staff[spell.element]] or player.wardrobe[Fastcast.Staff[spell.element]] or player.wardrobe2[Fastcast.Staff[spell.element]]) then
					equip(sets.precast.Fastcast, {main=Fastcast.Staff[spell.element]})
				else
					equip(sets.precast.Fastcast)
				end	
			end
		end
-- Ninjutsu
	elseif spell.type == 'Ninjutsu' then
		-- Magian Staff
		if Fastcast.Staff[spell.element] and (player.inventory[Fastcast.Staff[spell.element]] or player.wardrobe[Fastcast.Staff[spell.element]] or player.wardrobe2[Fastcast.Staff[spell.element]]) then
			equip(sets.precast.Fastcast, {main=Fastcast.Staff[spell.element]})
		else
			equip(sets.precast.Fastcast)
		end	
-- BardSongs
	elseif spell.type == 'BardSong' then
		-- Magian Staff
		if Fastcast.Staff[spell.element] and (player.inventory[Fastcast.Staff[spell.element]] or player.wardrobe[Fastcast.Staff[spell.element]] or player.wardrobe2[Fastcast.Staff[spell.element]]) then
			equip(sets.precast.Fastcast, {main=Fastcast.Staff[spell.element]})
		else
			equip(sets.precast.Fastcast)
		end	
	else
	-- Special handling to remove Dancer sub job Sneak effect
		if spell.name == 'Spectral Jig' and buffactive.Sneak then
			windower.ffxi.cancel_buff(71)
			cast_delay(0.3)
		elseif windower.wc_match(spell.name,'Curing*') then
			equip(sets.misc.Waltz)
		elseif windower.wc_match(spell.name,'*Step') then
			equip(sets.misc.Steps)
		elseif windower.wc_match(spell.name,'*Flourish') then
			equip(sets.misc.flourish)
		end
	end
end

function midcast(spell,arg)
	-- Healing Magic
		if spell.skill == 'Healing Magic' then
			-- Add Light Obi Twilight Cape and Chatoyant Staff
			-- Cure Curaga Cura
			if spell.english:startswith('Cure') then
				equip(sets.midcast.Cure)
			elseif spell.english:startswith("Curaga") then
				equip(sets.midcast.Curaga)	
			elseif spell.english:startswith('Reraise') then
				equip(sets.midcast.ConserveMP)
			else
				equip(sets.midcast.Recast)
			end
	-- Enhancing Magic
		elseif spell.skill == 'Enhancing Magic' then
			-- Composure
			if buffactive['Composure'] and spell.target.type == "SELF" then
				if spell.name == 'Phalanx' or spell.name == "Phalanx II" then
					equip(sets.midcast.Enhancing.Self, sets.midcast.Phalanx)
				elseif spell.english:contains("Refresh") then
					equip(sets.midcast.ConserveMP, sets.midcast.Enhancing.Refresh)
				elseif spell.name:wcmatch("Haste*") then
					equip(sets.midcast.Enhancing.SELf, sets.midcast.Hastespell)
				elseif spell.english:wcmatch('Regen*') then
					equip(sets.midcast.Enhancing.SELF, sets.midcast.Regen)	
				elseif spell.name:wcmatch("Gain*") then
					equip(sets.midcast.Enhancing)
				elseif spell.name == "Temper" then
					equip(sets.midcast.Enhancing)
				elseif spell.english:contains("Spikes") then
					equip(sets.midcast.INT, {legs="Vitivation Tights"})
				elseif spell.name == 'Stoneskin' then
					equip(sets.midcast.Stoneskin)
					if buffactive.Stoneskin then
						windower.ffxi.cancel_buff(36)
					end
				elseif spell.name == 'Blink' then
					equip(sets.midcast.Blink)
				elseif spell.name == 'Aquaveil' then
					equip(sets.midcast.Aquaveil)
				end
			else
				if spell.name == 'Phalanx' or spell.name == "Phalanx II" then
					equip(sets.midcast.Phalanx) 
				elseif spell.english:contains("Refresh") then
					equip(sets.midcast.ConserveMP, sets.midcast.Enhancing.Refresh)
				elseif spell.name:wcmatch("Haste*") then
					equip(sets.midcast.Enhancing.Party)
				elseif spell.english:wcmatch('Regen*') then
					equip(sets.midcast.Enhancing.Self, sets.midcast.Regen)
				-- Everything Else Needs Skill
				elseif spell.name:wcmatch("Gain*") then
					equip(sets.midcast.Enhancing)
				elseif spell.name == "Temper" then
					equip(sets.midcast.Enhancing)
				elseif spell.english:contains("Spikes") then
					equip(sets.midcast.INT, {legs="Vitivation Tights"})
				elseif spell.name == 'Stoneskin' then
					equip(sets.midcast.Stoneskin)
					if buffactive.Stoneskin then
						windower.ffxi.cancel_buff(36)
					end
				elseif spell.name == 'Blink' then
					equip(sets.midcast.Blink)
				elseif spell.name == 'Aquaveil' then
					equip(sets.midcast.Aquaveil)
				end
			end			
	-- Enfeebling Magic
		elseif spell.skill == 'Enfeebling Magic' then
			-- Maybe account for saboteur
			if spell.english:startswith('Dia') then
				equip(sets.midcast.Dia)
			-- MND
			elseif spell.english:wcmatch('Paralyze*') then
				equip(sets.midcast.enfeebling)
			elseif spell.english:wcmatch('Slow*') then
				equip(sets.midcast.Slow)
			elseif spell.english:startswith('Addle') then
				equip(sets.midcast.Addle)
			-- INT
			elseif spell.english:wcmatch('Blind') then
				equip(sets.midcast.Blind)
			elseif spell.english:startswith('Bind') then
				equip(sets.midcast.Bind)
			-- Skill
			elseif spell.english:startswith('Distract') then
				equip(sets.midcast.Enfeebling)
			elseif spell.english:startswith("Frazzle") then
				equip(sets.midcast.Enfeebling)
			else
				equip(sets.midcast.Macc)
			end
	-- Divine Magic
		elseif spell.skill == 'Divine Magic' then
			if spell.english:startswith('Banish') then
				equip(sets.midcast.Nuke)
			elseif spell.english:startswith('Holy') then
				equip(sets.midcast.Nuke)
			elseif spell.name == 'Repose' then
				equip(sets.midcast.Macc)
			elseif spell.name == 'Flash' then
				equip(sets.midcast.Macc)
			end
		elseif spell.skill == 'Dark Magic' then
			if spell.name == "Drain" then
				equip(sets.midcast.Aspir) 
			elseif spell.english:startswith('Aspir') then
				equip(sets.midcast.Aspir)
			elseif spell.name == "Stun" then
				equip(sets.midcast.Stun)
			elseif spell.english:wcmatch('Bio*') then
				equip(sets.midcast.Bio)
			else
				equip(sets.midcast.Macc)
			end
	-- Elemental Magic
	elseif spell.skill == 'Elemental Magic' then
			if spell.name == "Impact" or player.equipment.body == "Twilight Cloak" then
				equip(sets.midcast.Macc, {head="Empty", body="Twilight Cloak"})
			elseif spell.english:wcmatch('Frost|Drown|Rasp|Burn|Shock|Choke') then
				equip(sets.midcast.Elemental)
			else
				-- accounts for obis staffs cape ring
				if Skill == 1 then
					equip(sets.midcast.Elemental) 
				else
					-- Zodiac Ring Check
					if spell.element == world.day_element and (player.inventory["Zodiac Ring"] or player.wardrobe["Zodiac Ring"]) then
						-- Weather Check
						if spell.element == world.weather_element or spell.element == buffactive[elements.storm_of[spell.element]] then
							-- Inventory Checks
							if player.inventory[elemental.Obi[spell.element]] or player.wardrobe[elemental.Obi[spell.element]] then
								-- yes ring yes obi Yes Cape 
								if player.inventory["Twilight Cape"] or player.wardrobe["Twilight Cape"] then
									if not spell.english:wcmatch('*IV') then
										-- Nuke Staff
										equip(sets.midcast.Nuke, {waist=elemental.Obi[spell.element],back="Twilight Cape",rring="Zodiac Ring"})
									else
										-- Magian Staves
										equip(sets.midcast.Nuke,{main=Fastcast.Staff[spell.element],waist=elemental.Obi[spell.element],back="Twilight Cape",rring="Zodiac Ring"})
									end
								else
								-- yes ring yes obi no cape
									if not spell.english:wcmatch('*IV') then
										-- Nuke Staff
										equip(sets.midcast.Nuke,{waist=elemental.Obi[spell.element],rring="Zodiac Ring"})
									else
										-- Magian Staves
										equip(sets.midcast.Nuke,{main=Fastcast.Staff[spell.element],waist=elemental.Obi[spell.element],rring="Zodiac Ring"})
									end
								end
							else
								-- yes ring no obi yes cape
								if player.inventory["Twilight Cape"] or player.wardrobe["Twilight Cape"] then
									if not spell.english:wcmatch('*IV') then
										-- Nuke Staff
										equip(sets.midcast.Nuke,{back="Twilight Cape",rring="Zodiac Ring"})
									else
										-- Magian Staves
										equip(sets.midcast.Nuke,{main=Fastcast.Staff[spell.element],back="Twilight Cape",rring="Zodiac Ring"})
									end
								else
								-- yes ring no obi no cape
									if not spell.english:wcmatch('*IV') then
										-- Nuke Staff
										equip(sets.midcast.Nuke,{rring="Zodiac Ring"})
									else
										-- Magian Staves
										equip(sets.midcast.Nuke,{main=Fastcast.Staff[spell.element],rring="Zodiac Ring"})
									end
								end							
							end
						else
						-- yes ring no obi no cape
							if not spell.english:wcmatch('*IV') then
								-- Nuke Staff
								equip(sets.midcast.Nuke,{rring="Zodiac Ring"})
							else
								-- Magian Staves
								equip(sets.midcast.Nuke,{main=Fastcast.Staff[spell.element],rring="Zodiac Ring"})
							end
						end	
					-- Day Match No Ring 
					elseif spell.element == world.day_element then
						-- Weather Check
						if spell.element == world.weather_element or spell.element == buffactive[elements.storm_of[spell.element]] then
							-- Inventory checks
							if player.inventory[elemental.Obi[spell.element]] or player.wardrobe["Inventory"] then
								-- no ring yes obi Yes Cape 
								if player.inventory["Twilight Cape"] or player.wardrobe["Twilight Cape"] then
									if not spell.english:wcmatch('*IV') then
										-- Nuke Staff
										equip(sets.midcast.Nuke,{waist=elemental.Obi[spell.element],back="Twilight Cape"})
									else
										-- Magian Staves
										equip(sets.midcast.Nuke,{main=Fastcast.Staff[spell.element],waist=elemental.Obi[spell.element],back="Twilight Cape"})
									end
								else
							-- no ring yes obi no cape
									if not spell.english:wcmatch('*IV') then
										-- Nuke Staff
										equip(sets.midcast.Nuke,{waist=elemental.Obi[spell.element]})
									else
										-- Magian Staves
										equip(sets.midcast.Nuke,{main=Fastcast.Staff[spell.element],waist=elemental.Obi[spell.element]})
									end
								end
							else
								-- no ring no obi yes cape
								if player.inventory["Twilight Cape"] or player.wardrobe["Twilight Cape"] then
									if not spell.english:wcmatch('*IV') then
										-- Nuke Staff
										equip(sets.midcast.Nuke,{back="Twilight Cape"})
									else
										-- Magian Staves
										equip(sets.midcast.Nuke,{main=Fastcast.Staff[spell.element],back="Twilight Cape"})
									end
								else
								-- no ring no obi no cape
									if not spell.english:wcmatch('*IV') then
										-- Nuke Staff
										equip(sets.midcast.Nuke)
									else
										-- Magian Staves
										equip(sets.midcast.Nuke,{main=Fastcast.Staff[spell.element]})
									end
								end							
							end
						-- No Weather Match
						else
						-- no ring no obi no cape
							if not spell.english:wcmatch('*IV') then
								-- Nuke Staff
								equip(sets.midcast.Nuke)
							else
								-- Magian Staves
								equip(sets.midcast.Nuke,{main=Fastcast.Staff[spell.element]})
							end
						end				
					-- NO Day Match and no Ring 
					else
						-- Weather Check
						if spell.element == world.weather_element or spell.element == buffactive[elements.storm_of[spell.element]] then
							-- Inventory checks
							if player.inventory[elemental.Obi[spell.element]] or player.wardrobe[elemental.Obi[spell.element]] then
								-- no ring yes obi Yes Cape 
								if player.inventory["Twilight Cape"] or player.wardrobe["Twilight Cape"] then
									if not spell.english:wcmatch('*IV') then
										-- Nuke Staff
										equip(sets.midcast.Nuke,{waist=elemental.Obi[spell.element],back="Twilight Cape"})
									else
										-- Magian Staves
										equip(sets.midcast.Nuke,{main=Fastcast.Staff[spell.element],waist=elemental.Obi[spell.element],back="Twilight Cape"})
									end
								else
							-- no ring yes obi no cape
									if not spell.english:wcmatch('*IV') then
										-- Nuke Staff
										equip(sets.midcast.Nuke,{waist=elemental.Obi[spell.element]})
									else
										-- Magian Staves
										equip(sets.midcast.Nuke,{main=Fastcast.Staff[spell.element],waist=elemental.Obi[spell.element]})
									end
								end
							else
								-- no ring no obi yes cape
								if player.inventory["Twilight Cape"] or player.wardrobe["Twilight Cape"] then
									if not spell.english:wcmatch('*IV') then
										-- Nuke Staff
										equip(sets.midcast.Nuke,{back="Twilight Cape"})
									else
										-- Magian Staves
										equip(sets.midcast.Nuke,{main=Fastcast.Staff[spell.element],back="Twilight Cape"})
									end
								else
								-- no ring no obi no cape
									if not spell.english:wcmatch('*IV') then
										-- Nuke Staff
										equip(sets.midcast.Nuke)
									else
										-- Magian Staves
										equip(sets.midcast.Nuke,{main=Fastcast.Staff[spell.element]})
									end
								end							
							end
						else
						-- no ring no obi no cape
							if not spell.english:wcmatch('*IV') then
								-- Nuke Staff
								equip(sets.midcast.Nuke)
							else
								-- Magian Staves
								equip(sets.midcast.Nuke,{main=Fastcast.Staff[spell.element]})
							end
						end				
					end
				end
			end
	-- Ninjutsu
	elseif spell.skill == "Ninjutsu" then
			equip(sets.midcast.Recast)
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
			elseif spell.name == 'Monomi: Ichi' and buffactive.Sneak and spell.target.type == 'SELF' then
				windower.ffxi.cancel_buff(71)
			end
	else
		-- Songs
		if spell.skill == "Singing" then
			equip(sets.midcast.Macc)
		end
	end
end 

function aftercast(spell,arg)
	if areas.Town:contains(world.zone) then
		windower.add_to_chat(121, "Town Gear")
		equip(sets.misc.Town)
	else
		if player.status == 'Engaged' then
			if PDT == 1 or MDT == 1 then
				if PDT == 1 and MDT == 0 then
					windower.add_to_chat(121,'PDT Locked')
					equip(sets.idle.PDT)
				elseif MDT == 1 and PDT == 0 then
					windower.add_to_chat(121,'MDT Locked')
					equip(sets.idle.MDT)
				else
					MDT = 0
					PDT = 0
				end
			else
				-- Equip previous TP set 
					previous_set()
			end
		else
			slot_lock()
			if PDT == 1 or buffactive['Weakness'] or player.hpp < 30 then
				equip(sets.idle.PDT)
			elseif MDT == 1 then
				equip(sets.idle.MDT)
			else
				equip(sets.idle.Standard)
			end
		end
	end
-- Sleep Timers
	if spell.name == "Sleep II" or spell.name == "Repose" then
		windower.send_command('wait 75;input /echo [ WARNING! '..spell.name..' : Will wear off within 0:15 ]')
        windower.send_command('wait 80;input /echo [ WARNING! '..spell.name..' : Will wear off within 0:10 ]')
        windower.send_command('wait 85;input /echo [ WARNING! '..spell.name..' : Will wear off within 0:05 ]')
	elseif spell.name == "Sleep" or spell.name == "Sleepga" then
		windower.send_command('wait 45;input /echo [ WARNING! '..spell.name..' : Will wear off within 0:15 ]')
        windower.send_command('wait 50;input /echo [ WARNING! '..spell.name..' : Will wear off within 0:10 ]')
        windower.send_command('wait 55;input /echo [ WARNING! '..spell.name..' : Will wear off within 0:05 ]')
	end
-- Convert
	if spell.name == 'Convert' then
	  windower.send_command('wait 2;input /ma "Cure IV" me')
	end
 -- Changes shadow type variable to allow cancel Copy Image if last cast was Utsusemi: Ni
    if spell and spell.name == 'Utsusemi: Ni' then
        ShadowType = 'Ni'
    elseif spell and spell.name == 'Utsusemi: Ichi' then
        ShadowType = 'Ichi'
	end
end

function previous_set()
	slot_lock()
	if Mode == 0 then
		equip(sets.TP)
		windower.add_to_chat(121,'TP Set')
	elseif Mode == 1 then
		equip(sets.TP.Acc)
		windower.add_to_chat(121,'Acc TP Set')
	end
end

function slot_lock()
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
