-- Feary's DNC LUA
-- Created: 4/26/2014
-- Updated: 4/26/2014
-- To Do:
--
--
--includes
	include('include/functions.lua')
	-- Global Buffs
	include('include/status.lua')
	

texts = require 'texts'
config = require 'config'
	
-- Gear Sets 
function get_sets()
--includes
	--include('include/autoexec.lua')
	include('include/binds.lua')
	include('include/utility.lua')
	include('include/macro.lua')
	
	-- Get DNC gearsets
	include('Gearsets/'..player.name..'/DNC_Gearsets.lua')
	
-- Define Default Values for Variables
	ShadowType = 'None'
	
	
	Waltzes = T{"Curing Waltz","Divine Waltz","Curing Waltz II","Healing Waltz","Curing Waltz III","Curing Waltz IV","Divine Waltz II","Curing Waltz V"}
	Sambas = T{"Drain Samba","Aspir Samba","Drain Samba II","Haste Samba","Aspir Samba II","Drain Samba III"}
	Steps = T{"Quickstep","Box Step","Stutter Step","Feather Step"}
	Jigs = T{"Spectral Jig","Chocobo Jig","Chocobo Jig II"}
	Flourish = T{"Animated Flourish","Desperate Flourish","Violent Flourish","Reverse Flourish","Building Flourish","Wild Flourish","Climactic Flourish","Striking Flourish","Ternary Flourish"}

end 

local Autos = 'Off'
local Defensive = 'Offense'
local Waltz = 'Off'
frame_count = 0
nexttime = os.clock()	
del = 0
boxstep = 0
featherstep = 0

local waltz_tp_cost = {['Curing Waltz'] = 200, ['Curing Waltz II'] = 350, ['Curing Waltz III'] = 500, ['Curing Waltz IV'] = 650, ['Curing Waltz V'] = 800}
local cancel_spells_to_check = S{'Sneak', 'Stoneskin', 'Spectral Jig', 'Trance', 'Monomi: Ichi', 'Utsusemi: Ichi'}
local cancel_types_to_check = S{'Waltz', 'Samba'}

-- Display


--settings = config.load('data\\settings.xml',default_settings)
--config.register(settings,initialize)

text_box_settings = {
    pos = {x = 1400, y = 300,},
    bg = {
        alpha = 100,
        red = 0,
        green = 0,
        blue = 0,
        visible = true
    },
    flags = {
        right = false,
        bottom = false,
        bold = false,
        italic = false
    },
    padding = 0,
    text = {
        size = 11,
        font = 'Consolas',
        fonts = {},
        alpha = 255,
        red = 255,
        green = 255,
        blue = 255
    }
}

box = texts.new('${content}',text_box_settings)
box.content = ''
box:show()
--end display

windower.register_event("zone change", function()
    Autos = 'Off'
	Waltz = 'Off'
end)

--Update Display
windower.register_event('prerender',function()
	local curtime = os.clock()
    if frame_count%15 == 0 and box:visible() then
        frame_count = 0
        update_box()
    end
    frame_count = frame_count + 1
	
    if nexttime + del <= curtime then
        nexttime = curtime
        del = 1.3
        local play = windower.ffxi.get_player()
        local abil_recasts = windower.ffxi.get_ability_recasts()
		
		if Waltz == 'On' and play.vitals.hpp < 35 then
			Defensive = 'Defense'
			windower.send_command('input /ja "Curing Waltz V" <me>')
		end
		
		-- Defensive - Saber or Fan dance always up
		if player.status == 'Engaged' then
			if Defensive == 'Defense' and abil_recasts[224] == 0 then 
				windower.send_command('Fan Dance')		
			elseif Defensive == 'Offense' then
				if abil_recasts[219] == 0 then 
					windower.send_command('Saber Dance')
				elseif not buffactive['Haste Samba'] and not buffactive['Fan Dance']and player.tp > 350 then
					windower.send_command('Haste Samba')
				end
			end
        end
		
		-- Auto Step / Flourish
		
		if Autos == 'On' then
			if abil_recasts[223] == 0 and not buffactive['Finishing Move (6+)'] then
				windower.send_command('No Foot Rise')
			end
			if abil_recasts[222] == 0 and player.tp < 700 and (buffactive['Finishing Move 5'] or buffactive['Finishing Move (6+)']) then
				windower.send_command('Reverse Flourish')			
			end
			if player.status == 'Engaged' then
				if abil_recasts[226] == 0 and buffactive['Finishing Move (6+)'] then
					windower.send_command('Climactic Flourish')	
				elseif abil_recasts[236] == 0 then
					windower.send_command('Presto')	
				elseif abil_recasts[220] == 0 and player.tp >= 100 then
					if buffactive['Presto'] and boxstep < 2 then
						windower.send_command('Box Step')
						boxstep = boxstep + 1
					elseif buffactive['Presto'] and featherstep < 2 then
						windower.send_command('Feather Step')
						featherstep = featherstep + 1
					else
						--windower.send_command('Stutter Step')
					end
				end
			end
			if featherstep >1 then
				boxstep = 0
				featherstep = 0
			end
		end
    end
end)


-- Utility function for automatically adjusting the waltz spell being used to match HP needs and TP limits.
-- Handle spell changes before attempting any precast stuff.
function refine_waltz(spell, action, spellMap, eventArgs)
	if spell.type ~= 'Waltz' then
		return
	end
	
	-- Don't modify anything for Healing Waltz or Divine Waltzes
	if spell.english == "Healing Waltz" or spell.english == "Divine Waltz" or spell.english == "Divine Waltz II" then
		return
	end

	local newWaltz = spell.english
	local waltzID
	
	local missingHP
	
	-- If curing ourself, get our exact missing HP
	if spell.target.type == "SELF" then
		missingHP = player.max_hp - player.hp
	-- If curing someone in our alliance, we can estimate their missing HP
	elseif spell.target.isallymember then
		local target = find_player_in_alliance(spell.target.name)
		local est_max_hp = target.hp / (target.hpp/100)
		missingHP = math.floor(est_max_hp - target.hp)
	end
	
	-- If we have an estimated missing HP value, we can adjust the preferred tier used.
	if missingHP ~= nil then
		if player.main_job == 'DNC' then
			if missingHP < 40 and spell.target.name == player.name then
				-- Not worth curing yourself for so little.
				-- Don't block when curing others to allow for waking them up.
				add_to_chat(122,'Full HP!')
				cancel_spell()
				return
			elseif missingHP < 200 then
				newWaltz = 'Curing Waltz'
				waltzID = 190
			elseif missingHP < 600 then
				newWaltz = 'Curing Waltz II'
				waltzID = 191
			elseif missingHP < 1100 then
				newWaltz = 'Curing Waltz III'
				waltzID = 192
			elseif missingHP < 1500 then
				newWaltz = 'Curing Waltz IV'
				waltzID = 193
			else
				newWaltz = 'Curing Waltz V'
				waltzID = 311
			end
		elseif player.sub_job == 'DNC' then
			if missingHP < 40 and spell.target.name == player.name then
				-- Not worth curing yourself for so little.
				-- Don't block when curing others to allow for waking them up.
				add_to_chat(122,'Full HP!')	
				cancel_spell()
				return
			elseif missingHP < 150 then
				newWaltz = 'Curing Waltz'
				waltzID = 190
			elseif missingHP < 300 then
				newWaltz = 'Curing Waltz II'
				waltzID = 191
			else
				newWaltz = 'Curing Waltz III'
				waltzID = 192
			end
		else
			-- Not dnc main or sub; bail out
			return
		end
	end

	local tpCost = waltz_tp_cost[newWaltz]

	local downgrade
	
	
	-- Downgrade the spell to what we can afford
	if player.tp < tpCost and not buffactive.trance then
		--[[ Costs:
			Curing Waltz:     200 TP
			Curing Waltz II:  350 TP
			Curing Waltz III: 500 TP
			Curing Waltz IV:  650 TP
			Curing Waltz V:   800 TP
			Divine Waltz:     400 TP
			Divine Waltz II:  800 TP
		--]]
		
		if player.tp < 200 then
			add_to_chat(122, 'Insufficient TP ['..tostring(player.tp)..']. Cancelling.')
			cancel_spell()
			return
		elseif player.tp < 350 then
			newWaltz = 'Curing Waltz'
		elseif player.tp < 500 then
			newWaltz = 'Curing Waltz II'
		elseif player.tp < 650 then
			newWaltz = 'Curing Waltz III'
		elseif player.tp < 800 then
			newWaltz = 'Curing Waltz IV'
		end
		
		downgrade = 'Insufficient TP ['..tostring(player.tp)..']. Downgrading to '..newWaltz..'.'
	end

	
	if newWaltz ~= spell.english then
		send_command('@input /ja "'..newWaltz..'" '..tostring(spell.target.raw))
		if downgrade then
			add_to_chat(122, downgrade)
		end		
		cancel_spell()
		return
	end

	if missingHP and missingHP > 0 then
		add_to_chat(122,'Trying to cure '..tostring(missingHP)..' HP using '..newWaltz..'.')
	end
end



-- Function to cancel buffs if they'd conflict with using the spell you're attempting.
-- Requirement: Must have Cancel addon installed and loaded for this to work.
function cancel_conflicting_buffs(spell, action, spellMap, eventArgs)
    if cancel_spells_to_check:contains(spell.english) or cancel_types_to_check:contains(spell.type) then
        if spell.action_type == 'Ability' then
            local abil_recasts = windower.ffxi.get_ability_recasts()
            if abil_recasts[spell.recast_id] > 0 then
                add_to_chat(123,'Abort: Ability waiting on recast.')
                cancel_spell()
                return
            end
        elseif spell.action_type == 'Magic' then
            local spell_recasts = windower.ffxi.get_spell_recasts()
            if spell_recasts[spell.recast_id] > 0 then
                add_to_chat(123,'Abort: Spell waiting on recast.')
                cancel_spell()
                return
            end
        end
        
        if spell.english == 'Spectral Jig' and buffactive.sneak then
            cast_delay(0.2)
            send_command('cancel sneak')
        elseif spell.english == 'Sneak' and spell.target.type == 'SELF' and buffactive.sneak then
            send_command('cancel sneak')
        elseif spell.english == ('Stoneskin') then
            send_command('@wait 1.0;cancel stoneskin')
        elseif spell.english:startswith('Monomi') then
            send_command('@wait 1.7;cancel sneak')
        elseif spell.english == 'Utsusemi: Ichi' then
            send_command('@wait 1.7;cancel copy image,copy image (2)')
        elseif (spell.english == 'Trance' or spell.type=='Waltz') and buffactive['saber dance'] then
            cast_delay(0.2)
            send_command('cancel saber dance')
        elseif spell.type=='Samba' and buffactive['fan dance'] then
            cast_delay(0.2)
            send_command('cancel fan dance')
        end
    end
end

function update_box()
	box.content = Defensive..' F11\nAutos '..Autos..' F10\nWaltz '..Waltz..' F9'
end
--End Update Display

-- Called when this job file is unloaded (eg: job change)
function file_unload()
	clear_binds()
end


-- Rules
function self_command(command)
	if command == 'DefenseMode' then
		if Defensive == 'Offense' then
			Defensive = 'Defense'
		else
			Defensive = 'Offense'
		end
	elseif command == 'Autos' then
		if Autos == 'Off' then
			Autos = 'On'
		else
			Autos = 'Off'
		end
	elseif command == 'Waltz' then
		if Waltz == 'Off' then
			Waltz = 'On'
		else
			Waltz = 'Off'
		end
	end
end

function status_change(new,old)
-- Auto set
    previous_set()
	if not player.status == 'Engaged' then
		boxstep = 0
		featherstep = 0
	end
end


function precast(spell,arg)	
    cancel_conflicting_buffs(spell, action, spellMap, eventArgs)
    refine_waltz(spell, action, spellMap, eventArgs)
-- Job Abilities	
	if spell.type == "JobAbility" then
		if sets.precast.JA[spell.name] then
			equip(sets.precast.JA[spell.name])
		end
-- Weaponskills
	elseif spell.type == "WeaponSkill" then
		if player.status == 'Engaged' then
			if player.tp >= 100 then
				if spell.target.distance <= 5 then		
					if buffactive['Climactic Flourish'] then
						if sets.precast.WS[spell.name] then
							equip(sets.precast.WS[spell.name], {head="Maculele Tiara +3"})
						else
							equip(sets.precast.WS, {head="Maculele Tiara +3"} )
						end
					else
						if sets.precast.WS[spell.name] then
							equip(sets.precast.WS[spell.name])
						else
							equip(sets.precast.WS)
						end
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
		equip(sets.precast.Fastcast)
-- Ninjutsu
	elseif spell.type == 'Ninjutsu' then
		equip(sets.precast.Fastcast)
-- Dancer Stuff
	elseif spell.type == "Samba" then
		if Sambas:contains(spell.name) then
			equip(sets.precast.JA["Sambas"])
		end
	elseif spell.type == "Waltz" then
		if Waltzes:contains(spell.name) then
			equip(sets.precast.JA["Waltz"])
		end
	elseif spell.type == "Jig" then
		if Jigs:contains(spell.name) then
			equip(sets.precast.JA["Jigs"])
		end
	elseif spell.type == "Step" then
		if Steps:contains(spell.name) then
			if spell.name == "Feather Step" then
				equip(sets.precast.JA[spell.name])
			else
				equip(sets.precast.JA["Step"])
			end
		end
	elseif spell.type == "Flourish1" or spell.type == "Flourish2" or spell.type == "Flourish3" then
		if Flourish:contains(spell.name) then
			equip(sets.precast.JA[spell.name])
		end
	else
		
	end
end

function midcast(spell,arg)
-- Ninjutsu
	if spell.skill == "Ninjutsu" then
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
	
    end
end 

function aftercast(spell,arg)
-- Autoset
	previous_set()
-- Utsusemi Variable Sets
	if spell and spell.name == 'Utsusemi: Ni' then
        ShadowType = 'Ni'
    elseif spell and spell.name == 'Utsusemi: Ichi' then
        ShadowType = 'Ichi'
	end
end

function previous_set()
	slot_lock()
	if player.status == 'Engaged' then
		equip(ModeWeapon, sets.TP)
	else
		equip(ModeWeapon, sets.idle)
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