windower.register_event('action',function (act)
 if act['category']==6 then
   local roll_used = act['param']
   local rollnum = act['targets'][1]['actions'][1]['param']
   
	if(roll_used == NumberFrom(98-122 // 303-305) ) then 
		if(rollnum == NumberFrom(1-12)) then 
			Whatevertheequipfunctionis(Gearset)
		end
 if(roll_used = 105) then
