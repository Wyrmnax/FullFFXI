-- Feary's THF LUA
-- Created: 4/5/2014
-- Last Modified: 04/12/2016
-- To Do:
--	Account for Hide + SA or TA
-- 	account for SATA?
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
	
	-- Get THF Gearsets
	include('Gearsets/'..player.name..'/THF_Gearsets.lua')
	
-- Define Default Values for Variables
	TH = 0
	Mode = 0
	PDT = 0
	MDT = 0
	ShadowType = 'None'
end -- End gear sets

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
				if Mode == 4 then
					equip(sets.idle.Standard,sets.idle.Evasion)
				else
					equip(sets.idle.Standard)
				end
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
				if Mode == 4 then
					equip(sets.idle.Standard,sets.idle.Evasion)
				else
					equip(sets.idle.Standard)
				end
			end
		else
		-- make sure other values are set to default
			PDT = 0
		-- lock MDT set and equip it
			MDT = 1
			equip(sets.idle.MDT)
			windower.add_to_chat(121,'MDT Set Locked')
		end
	elseif command == 'TP' then
		if PDT == 1 or MDT == 1 then
			-- Reset to Default
			PDT = 0
			MDT = 0
			-- Place me in previous set
			if player.status == 'Engaged' then
				previous_set()
			else
				if Mode == 4 then
					equip(sets.idle.Standard,sets.idle.Evasion)
				else
					equip(sets.idle.Standard)
				end
			end
		else
			if Mode >= 4 then
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
				if Mode == 4 then
					equip(sets.idle.Standard,sets.idle.Evasion)
				else
					equip(sets.idle.Standard)
				end
			end
		end
	elseif command == 'TH' then
		if TH == 0 then
			TH = 1
			windower.add_to_chat(121,'Treasure Hunter Locked')
			if player.status == 'Engaged' then
				previous_set()
			else
				equip(sets.idle.Standard,sets.TH)	
			end
		else
			TH = 0
			windower.add_to_chat(121,'Treasure Hunter Unlocked')
			if player.status == 'Engaged' then
				previous_set()
			else
				equip(sets.idle.Standard)	
			end
		end
	end
end
	
function status_change(new,old)
-- Autoset
    if T{'Idle','Resting'}:contains(new) then
		windower.add_to_chat(121,'Idle/Resting Set')
		if areas.Town:contains(world.zone) then
			windower.add_to_chat(121, "Town Gear")
			equip(sets.misc.Town)
		else
			if TH == 1 then
				if Mode == 4 then
					equip(sets.idle.Standard,sets.idle.Evasion,sets.TH)
				else
					equip(sets.idle.Standard,sets.TH)
				end
			else
				if Mode == 4 then
					equip(sets.idle.Standard,sets.idle.Evasion)
				else
					equip(sets.idle.Standard)
				end
			end
		end
	elseif new == 'Engaged' then
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
			previous_set()
		end
	end
end

function precast(spell,arg)
	-- Ranged Attack
	if spell.name == "Ranged" then
		equip(sets.precast.Snapshot)
	-- Generic equip command for all Job Abilities and Weaponskills
	elseif spell.type == 'JobAbility' then
		if sets.precast.JA[spell.name] then
			if S{'Sneak Attack', 'Trick Attack'}:contains(spell.english) then
				if spell.english == "Sneak Attack" then
					if TH == 1 then
						if buffactive['Feint'] then
							equip(sets.precast.JA["Sneak Attack"],sets.TH,{legs="Plunderer's Culottes"})
						else
							equip(sets.precast.JA["Sneak Attack"],sets.TH)
						end
					else
						if buffactive['Feint'] then
							equip(sets.precast.JA["Sneak Attack"],{legs="Plunderer's Culottes"})
						else
							equip(sets.precast.JA["Sneak Attack"])
						end
					end
				end
				if spell.english == "Trick Attack" then
					if TH == 1 then
						if buffactive['Feint'] then
							equip(sets.precast.JA["Trick Attack"],sets.TH,{legs="Plunderer's Culottes"})
						else
							equip(sets.precast.JA["Trick Attack"],sets.TH)
						end
					else
						if buffactive['Feint'] then
							equip(sets.precast.JA["Trick Attack"],{legs="Plunderer's Culottes"})
						else
							equip(sets.precast.JA["Trick Attack"])
						end
					end
				end
			else
				equip(sets.precast.JA[spell.name])
			end
		end
	elseif spell.type == 'Weaponskill' then
		if  player.status == 'Engaged' then
			if player.tp >= 1000 then
				if spell.target.distance <= 5 then
					if spell.english:wcmatch("Mercy Stroke|Rudra's Storm") then
						if buffactive["Sneak Attack"] then
							if Mode == 1 or Mode == 2 then
								equip(sets.precast.WS.Acc.SA[spell.name])
							else
								equip(sets.precast.WS.SA[spell.name])
							end
						elseif buffactive["Trick Attack"] then
							if Mode == 1 or Mode == 2 then
								equip(sets.precast.WS.Acc.TA[spell.name])
							else
								equip(sets.precast.WS.TA[spell.name])
							end
						else
							cancel_spell()
							windower.add_to_chat(121,'Cancelled - '..spell.name..' - Need to Stack with Sneak Attack or Trick Attack')
						end
					else
						if Mode >= 1 then
							if sets.precast.WS.Acc[spell.name] then
								equip(sets.precast.WS.Acc[spell.name])
							else
								equip(sets.precast.WS)
							end
						else
							if sets.precast.WS[spell.name] then
								equip(sets.precast.WS[spell.name])
							else
								equip(sets.precast.WS)
							end
						end
					end
				else
					cancel_spell()
					windower.add_to_chat(121, 'Canceled '..spell.name..'.'..spell.target.name..' is Too Far')
				end
			else 
				cancel_spell()
				windower.add_to_chat(121, ''..player.tp..'tp is Not enough to WS')
			end
		else
			cancel_spell()
			windower.add_to_chat(121, 'You must be Engaged to WS')
		end
 -- Ninjutsu spell gear handling(Precast)
    elseif spell.skill == 'Ninjutsu' then
        equip(sets.precast.Fastcast)
        if windower.wc_match(spell.name,'Utsusemi*') then
            equip(sets.precast.Utsusemi)
        end
	else
	 -- Special handling to remove Dancer sub job Sneak effect
		if spell.name == 'Spectral Jig' and buffactive.Sneak then
			windower.ffxi.cancel_buff(71)
			cast_delay(0.3)
		elseif windower.wc_match(spell.name,'Curing*') then
			equip(sets.misc.Waltz)
		elseif windower.wc_match(spell.name,'*Step') then
			equip(sets.TP.Acc)
		end
	end
end

function midcast(spell,arg)
	-- Ranged Attack
	if spell.name == 'Ranged' then
		equip(sets.RA)
	end
	
	-- Utsusemi
	if windower.wc_match(spell.name,'Utsusemi*') then
		-- Equip PDT then Utsusemi Gear sets
        equip(sets.idle.PDT, sets.precast.Utsusemi)
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

function aftercast(spell,arg)
-- Autoset
	if areas.Town:contains(world.zone) then
		windower.add_to_chat(121, "Town Gear")
		if buffactive['Flee'] or spell.name == 'Flee' then
				windower.add_to_chat(121,'Flee active')
				equip(sets.misc.Town, {feet="Pillager's Poulaines"})
		else
			equip(sets.misc.Town)
		end
	else
		if player.status == 'Engaged' then
			if S{'Sneak Attack', 'Trick Attack', 'Feint'}:contains(spell.english) then
				-- Do nothing 
			else
				-- Equip Previous TP set
				previous_set()
			end
		else
			if buffactive['Flee'] or spell.name == "Flee" then
				windower.add_to_chat(121,'Flee')
				equip(sets.idle.Standard,{feet="Pillager's Poulaines"})
			else
				if not S{'Sneak Attack', 'Trick Attack', 'Feint'}:contains(spell.english) then
					if Mode == 4 then
						equip(sets.idle.Standard,sets.idle.Evasion)
					else
						equip(sets.idle.Standard)
					end
				end
			end
		end
	end
-- Utsusemi Variable Sets
	if spell and spell.name == 'Utsusemi: Ni' then
        ShadowType = 'Ni'
    elseif spell and spell.name == 'Utsusemi: Ichi' then
        ShadowType = 'Ichi'
	end
end

function previous_set(spell)
	if TH == 1 then
		if buffactive["Feint"] then
			if Mode == 0 then
				equip(sets.TP,sets.TH,{legs="Plunderer's Culottes"})
				windower.add_to_chat(121,'TH locked - TP Set')
			elseif Mode == 1 then 
				equip(sets.TP.Acc,sets.TH,{legs="Plunderer's Culottes"})
				windower.add_to_chat(121,'TH locked - Acc Set')
			elseif Mode == 2 then
				equip(sets.TP.Buffed,sets.TH,{legs="Plunderer's Culottes"})
				windower.add_to_chat(121,'TH locked - Alliance Buff Set')
			elseif Mode == 3 then
				equip(sets.TP.Hybrid,sets.TH,{legs="Plunderer's Culottes"})
				windower.add_to_chat(121,'TH locked - Hybrid Evasion Set')
			elseif Mode == 4 then
					equip(sets.idle.Evasion,sets.TH,{legs="Plunderer's Culottes"})
				windower.add_to_chat(121,'TH locked - Full Evasion Lock')
			end	
		else
			if Mode == 0 then
				equip(sets.TP,sets.TH)
				windower.add_to_chat(121,'TH locked - TP Set')
			elseif Mode == 1 then 
				equip(sets.TP.Acc,sets.TH)
				windower.add_to_chat(121,'TH locked - Acc Set')
			elseif Mode == 2 then
				equip(sets.TP.Buffed,sets.TH)
				windower.add_to_chat(121,'TH locked - Alliance Buff Set')
			elseif Mode == 3 then
				equip(sets.TP.Hybrid,sets.TH)
				windower.add_to_chat(121,'TH locked - Hybrid Evasion Set')
			elseif Mode == 4 then
				equip(sets.idle.Evasion,sets.TH)
				windower.add_to_chat(121,'TH locked - Full Evasion Set')
			end	
		end
	else
		if buffactive["Feint"] then
			if Mode == 0 then
				equip(sets.TP,{legs="Plunderer's Culottes"})
				windower.add_to_chat(121,'Feint - TP Set')
			elseif Mode == 1 then 
				equip(sets.TP.Acc,{legs="Plunderer's Culottes"})
				windower.add_to_chat(121,'Feint - Acc Set')
			elseif Mode == 2 then
				equip(sets.TP.Buffed,{legs="Plunderer's Culottes"})
				windower.add_to_chat(121,'Feint - Alliance Buff Set')
			elseif Mode == 3 then
				equip(sets.TP.Hybrid,{legs="Plunderer's Culottes"})
				windower.add_to_chat(121,'Fient - Hybrid Evasion Set')
			elseif Mode == 4 then
				equip(sets.idle.Evasion,{legs="Plunderer's Culottes"})
				windower.add_to_chat(121,'Fient - Full Evasion Set')
			end		
		else
			if Mode == 0 then
				equip(sets.TP)
				windower.add_to_chat(121,'TP Set')
			elseif Mode == 1 then 
				equip(sets.TP.Acc)
				windower.add_to_chat(121,'Acc Set')
			elseif Mode == 2 then
				equip(sets.TP.Buffed)
				windower.add_to_chat(121,'Alliance Buff Set')
			elseif Mode == 3 then
				equip(sets.TP.Hybrid)
				windower.add_to_chat(121,'Hybrid Evasion Set')
			elseif Mode == 4 then
				equip(sets.idle.Evasion)
				windower.add_to_chat(121,'Full Evasion Set')
			end		
		end
	end	
end

