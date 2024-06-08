--Copyright (c) 2020, Lili
--All rights reserved.

--Redistribution and use in source and binary forms, with or without
--modification, are permitted provided that the following conditions are met:

--    * Redistributions of source code must retain the above copyright
--      notice, this list of conditions and the following disclaimer.
--    * Redistributions in binary form must reproduce the above copyright
--      notice, this list of conditions and the following disclaimer in the
--      documentation and/or other materials provided with the distribution.
--    * Neither the name of silttracker nor the
--      names of its contributors may be used to endorse or promote products
--      derived from this software without specific prior written permission.

--THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
--ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
--WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
--DISCLAIMED. IN NO EVENT SHALL LILI BE LIABLE FOR ANY
--DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
--(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
--LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
--ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
--(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
--SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

texts = require 'texts'
config = require 'config'
require 'tables'
packets = require('packets')
require('logger')

_addon.name = 'silttracker'
_addon.author = 'Lili'
_addon.version = '0.3.0'
_addon.command = 'strack'

combat_buffs = S{ 276, 603 } -- calculate silt/beads gain after these buffs drop
                             -- 276 is Confrontation (eschan NMs) and 603 is Elvorseal (Domain Invasion).
escha_zones = S{ 288, 289, 291}

--settings = config.load('data\\settings.xml',default_settings)
--config.register(settings,initialize)

text_box_settings = {
    pos = {x = 30, y = 30,},
    bg = {
        alpha = 255,
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

function initialize()
    frame_count = 0
    current_silt = 0
    previous_silt = 0
    current_beads = 0
    previous_beads = 0
    current_dp = 0
    previous_dp = 0
    total_dp = 0
    daily_dp = 0
    earned_dp = 0
    please_update = false
    update_on_zone = true
    first_check = true
    earnings = T{}
    content = ''
    coroutine.schedule(get_points,0.5)
end

function get_points()
    if not windower.ffxi.get_info().logged_in then
        return
    end
    
    local packet = packets.new('outgoing', 0x115, {})
    packets.inject(packet)
end

initialize()

windower.register_event('incoming chunk',function(id,org,modi,is_injected,is_blocked)
    if is_injected then return end
    if id ~= 0x118 then
        return
    end
    
    p = packets.parse('incoming',org)
    current_silt = p["Escha Silt"]
    current_beads = p["Escha Beads"]

    if first_check then
        earnings[#earnings+1] = string.format('Started with: %s silt and %s beads',current_silt,current_beads)
        previous_silt = current_silt
        previous_beads = current_beads
        first_check = false

    elseif please_update then
        local earned_silt = current_silt - previous_silt
        local earned_beads = current_beads - previous_beads
        
        if earned_silt > 0 or earned_beads > 0 or earned_dp > 0 then
            local now = os.date('%X')
            local capped = current_beads == 50000 and ' (capped)' or ''
            local di_points = earned_dp > 0 and ', %s DI points':format(earned_dp) or ''
            earnings[#earnings+1] = '%s - Earned: %s silt, %s beads%s':format(now,earned_silt,earned_beads..capped,di_points)
            previous_silt = current_silt
            previous_beads = current_beads
            earned_dp = 0
        end

        please_update = false
    end

    update_box()

end)

windower.register_event('zone change',function(new,old)
    if not update_on_zone then
        return
    end
    please_update = true
    coroutine.schedule(get_points,15)
end)

windower.register_event('lose buff', function(buff)
    if buff == 276 and escha_zones[windower.ffxi.get_info().zone] then
        please_update = true
        coroutine.schedule(get_points,3)
    end
end)

windower.register_event('incoming text',function(original,modified,original_mode,modified_mode)

    -- 121 for yellow text "<name> obtained <number> Domain Points!"
    -- 148 for white text "Domain Points Acquired: <number> <newline> Domain points Held: <number>"
    local text,mode = modified, tonumber(original_mode)
    
    if mode ~= 121 and mode ~= 148 then
        return
    end

    if string.find(text,_addon.name) or not string.find(text,'Domain Points') then
        return
    end
    
    local obtained = text:match('obtained (%d+)')
    if obtained then
        earned_dp = tonumber(obtained)
    end
    
    local acquired = text:match('Acquired: (%d+)')
    if acquired then
        daily_dp = tonumber(acquired)
    end
    
    local held = text:match('Held: (%d+)')
    if held then
        total_dp = tonumber(held)
    end
    
    -- log('obtained:',obtained or '--','acquired:',acquired or '--','held:',held or '--')
    
end)

windower.register_event('addon command',function(cmd,...)
    if not cmd then
        return
    end
    local args = {...}
    if cmd == 'reload' or cmd == 'r' then
        windower.send_command('lua r silttracker')
    elseif cmd == 'unload' or cmd == 'u' then
        windower.send_command('lua u silttracker')
    elseif cmd == 'check' or cmd == 'c' then
        log('Manual check...')
        please_update = true
        get_points()
    
    elseif cmd == 'reset' then
        initialize()
    end
end)

windower.register_event('prerender',function()
    if frame_count%30 == 0 and box:visible() then
        frame_count = 0
        update_box()
    end
    frame_count = frame_count + 1
end)

function update_box()

    content = ''

    if not windower.ffxi.get_info().logged_in or not windower.ffxi.get_player() then
        box.content = ''
        return
    end

    if #earnings > 0 then
        if #earnings > 5 then
            earnings = earnings:slice(#earnings-4,#earnings)
        end
        content = earnings:concat('\n')..'\n'
    end

    local now = os.date('%X')
    local di_points = current_dp > 0 and ' - %s DI points':format(current_dp) or ''
    content = content .. string.format('%s - Current: %s silt - %s beads.',now,current_silt,current_beads)
    if total_dp > 0 then
        content = content .. string.format('\n     Domain Points: %s daily, %s total',daily_dp,total_dp)
    end

    if box.content ~= content then
        box.content = content
    end

end
