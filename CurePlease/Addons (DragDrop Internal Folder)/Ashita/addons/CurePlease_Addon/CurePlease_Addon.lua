_addon.name = 'CurePlease_addon'
_addon.author = 'Daniel_H'
_addon.version = '1.3 Ashita'
_addon_description = 'Allows for PARTY DEBUFF Checking and Casting Data'
_addon.commands = {'cpaddon'}

local socket = require("socket")

local port = 19769
local ip = "127.0.0.1"

require 'common'

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end


function Run_Buff_Function(id, data)
  for k = 0, 4 do
    local Uid = struct.unpack('H', data, 8 + 1 + (k * 0x30))
    if Uid ~= 0 and Uid ~= nil then
      userIndex = Uid
    else
      userIndex = nil
    end
    -- FOR EACH MEMBER REMOVE PREVIOUS CHARACTERS DATA
    Buffs = {}
    CharacterName = nil
    formattedString = nil
    intIndex = 1
    -- GRAB THE MEMBERS NAME
    if userIndex ~= nil then
      CharacterName = AshitaCore:GetDataManager():GetEntity():GetName(userIndex)
    end
    if CharacterName ~= nil then
      for i = 1, 32 do
        current_buff = data:byte(k * 48 + 5 + 16 + i - 1) + 256 * (math.floor(data:byte(k * 48 + 5 + 8 + math.floor((i - 1) / 4)) / 4 ^ ((i - 1) % 4)) % 4)
        if current_buff ~= 255 and current_buff ~= 0 then
          table.insert(Buffs, current_buff)
        end
      end
      -- COUNT TOTAL NUMBER OFF BUFFS LOCATED AND BUILD THE BUFF STRING
      formattedString = "CUREPLEASE_buffs_"..CharacterName.."_"
      for index, value in pairs(Buffs) do
        formattedString = formattedString .. value
        if intIndex ~= tablelength(Buffs) then
          formattedString = formattedString ..","
        end
        intIndex = intIndex + 1
      end
      -- COMPLETED BUILDING THE BUFFS TABLE AND GRABBING THE CHARACTER NAME, SEND THE DATA VIA THE LOCAL NETWORK USING SOCKETS
      local CP_connect = assert(socket.udp())
      CP_connect:settimeout(1)
      assert(CP_connect:sendto(formattedString, ip, port))
      CP_connect:close()
    else
      return
    end
  end
end

function SendConfirmation()
  local CP_connect = assert(socket.udp())
  CP_connect:settimeout(1)
  assert(CP_connect:sendto("CUREPLEASE_confirmed", ip, port))
  CP_connect:close()
end

ashita.register_event('incoming_packet', function(id, size, data)

  casting = nil

  if id == 0xB then
    zoning_bool = true
  elseif id == 0xA and zoning_bool then
    zoning_bool = false
  end
  if not zoning_bool then

    if id == 0x28 then
      local actor = struct.unpack('I', data, 6);
      local category = ashita.bits.unpack_be(data, 82, 4);
      if actor == AshitaCore:GetDataManager():GetParty():GetMemberServerId(0) then
        if category == 4 then
          casting = 'CUREPLEASE_casting_finished'
        elseif category == 8 then
          if ashita.bits.unpack_be(data, 86, 16) == 28787 then
            casting = 'CUREPLEASE_casting_interrupted'
          elseif ashita.bits.unpack_be(data, 86, 16) == 24931 then
            casting = 'CUREPLEASE_casting_blocked'
          end
        end

        if casting ~= nil then
          local CP_connect = assert(socket.udp())
          CP_connect:settimeout(1)
          assert(CP_connect:sendto(casting, ip, port))
          CP_connect:close()
        end

      end
    elseif id == 0x076 then
      Run_Buff_Function(id, data)
    end
  end
  return false;
end);

ashita.register_event('command', function(command, ntype)
  -- Get the arguments of the command..
  local args = command:args();
  if (args[1]:lower() ~= '/cpaddon') then
    return false;
  end

  if (#args >= 4 and args[2] == 'settings') then
    ip = args[3]
    port = args[4]
    print('\31\200[\31\05Cure Please Addon\31\200]\31\207 '.. "NETWORK UPDATE:  IP address: " .. ip .. " / Port number: " .. port)
    SendConfirmation()
  elseif (#args == 2 and args[2] == 'check') then
    print('\31\200[\31\05Cure Please Addon\31\200]\31\207 '.. " IP address: " .. ip .. " / Port number: " .. port)
  elseif args[2] == "verify" then
    SendConfirmation()
  elseif args[2] == "cmd" then
    local CP_connect = assert(socket.udp())
    CP_connect:settimeout(1)
    assert(CP_connect:sendto("CUREPLEASE_command_"..args[1]:lower(), ip, port))
    CP_connect:close()
  end
  return true;
end);
