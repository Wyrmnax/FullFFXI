eval require('packets'); eval windower.register_event('incoming chunk', function(id, data) if id == 0x06F then local p = packets.incoming(id, data) windower.add_to_chat(107, 'Synth result: ' .. p['Quality']) end end

 eval require('packets'); eval windower.register_event('incoming chunk', function(id, data) if id == 0x06F then local p = packets.incoming(id, data) windower.add_to_chat(107, 'Synth result: ' .. p['Quality']) end end)

  eval require('packets'); eval windower.register_event('incoming chunk', function(...) if ... == 0x06F then windower.add_to_chat(107, 'Synth result: ' .. packets.incoming(...)['Quality']) end end)