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
frame_count = 0
nexttime = os.clock()	
del = 0
boxstep = 0
featherstep = 0

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
		
		-- Defensive - Saber or Fan dance always up
		if player.status == 'Engaged' then
			if Defensive == 'Defense' and abil_recasts[224] == 0 then 
				windower.send_command('Fan Dance')		
			elseif Defensive == 'Offense' and abil_recasts[219] == 0 then 
				windower.send_command('Saber Dance')
			end
        end
		
		-- Auto Step / Flourish
		
		if Autos == 'On' then
			if abil_recasts[223] == 0  and not buffactive['Finishing Move 5'] then
				windower.send_command('No Foot Rise')
			end
			if abil_recasts[222] == 0 and player.tp < 3000 and (buffactive['Finishing Move 5'] or buffactive['Finishing Move 4']) then
				windower.send_command('Reverse Flourish')			
			end
			if player.status == 'Engaged' then
				if abil_recasts[226] == 0 and buffactive['Finishing Move 5'] then
					windower.send_command('Climactic Flourish')	
				elseif abil_recasts[236] == 0 then
					windower.send_command('Presto')	
				elseif abil_recasts[220] == 0 and player.tp >= 100 and not buffactive['Finishing Move 5'] then
					if buffactive['Presto'] and boxstep < 2 then
						windower.send_command('Box Step')
						boxstep = boxstep + 1
					elseif buffactive['Presto'] and featherstep < 2 then
						windower.send_command('Feather Step')
						featherstep = featherstep + 1
					else
						windower.send_command('Stutter Step')
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

function update_box()
	box.content = Defensive..' F11\nAutos '..Autos..' F10'
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
			windower.add_to_chat(121,'Mode '..Defensive)
		else
			Defensive = 'Offense'
			windower.add_to_chat(121,'Mode '..Defensive)
		end
	elseif command == 'Autos' then
		if Autos == 'Off' then
			Autos = 'On'
			windower.add_to_chat(121,'Mode '..Autos)
		else
			Autos = 'Off'
			windower.add_to_chat(121,'Mode '..Autos)
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
-- Job Abilities
	if spell.type == "JobAbility" then
		if sets.precast.JA[spell.name] then
			equip(sets.precast.JA[spell.name])
		end
-- Weaponskills
	elseif spell.type == 'Weaponskill' then
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
			if spell.name == "Violent Flourish" then
				equip(sets.precast.JA[spell.name])
			elseif spell.name == "Striking Flourish" then
				equip(sets.precast.JA[spell.name])
			else
				equip(sets.precast.JA["Flourish"])
			end
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