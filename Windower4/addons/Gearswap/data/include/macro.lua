-- Macros.lua
-- Created: 1/29/2017
-- Last Modified: 1/29/2017





-- By Job - Defines Macro Sets By Main Job. 
                                                                     
if player.main_job == "WAR" then
	function select_default_macro_book()
	-- sets Macros off = 0  on = 1
		automacroset = 1
		if automacroset == 1 then
			if player.sub_job =='NIN' then
				set_macro_page(1,11)
			elseif player.sub_job =='SAM' then
				set_macro_page(2,11)
			elseif player.sub_job =='DNC' then
				set_macro_page(3,11)
			elseif player.sub_job =='MNK' then 
				set_macro_page(4,11)
			elseif player.sub_job =='DRK' then 
				set_macro_page(5,11)
			else
				set_macro_page(2,11)
			end
		else
			set_macro_page(2,11)
		end
	end
end

if player.main_job == "MNK" then
	function select_default_macro_book()
		-- sets Macros off = 0  on = 1
		automacroset = 1
		if automacroset == 1 then
			if player.sub_job == 'WAR' then
				set_macro_page(1,6)
			elseif player.sub_job == 'NIN' then
				set_macro_page(2,6)
			elseif player.sub_job == 'DNC' then
				set_macro_page(3,6)
			elseif player.sub_job == 'DRG' then 
				set_macro_page(4,6)
			elseif player.sub_job == 'WHM' then 
				set_macro_page(5,6)
			elseif player.sub_job == 'RUN' then 
				set_macro_page(6,6)
			else
				set_macro_page(1,6)
			end
		else
			set_macro_page(1,6)
		end
	end
end

if player.main_job == "WHM" then
	function select_default_macro_book()
		-- sets Macros off = 0  on = 1
		automacroset = 1
		if automacroset == 1 then
			if player.sub_job == 'RDM' then
				set_macro_page(1,1)
			elseif player.sub_job == 'SCH' then
				set_macro_page(2,1)
			elseif player.sub_job == 'SMN' then
				set_macro_page(3,1)
			elseif player.sub_job == 'BLM' then 
				set_macro_page(4,1)
			else
				set_macro_page(2,1)
			end
		else
			set_macro_page(1,1)
		end
	end
end

if player.main_job == "BLM" then
	function select_default_macro_book()
			-- sets Macros off = 0  on = 1
			automacroset = 1
			if automacroset == 1 then
				if player.sub_job == 'RDM' then
					set_macro_page(1,2)
				elseif player.sub_job == 'WHM' then
					set_macro_page(2,2)
				elseif player.sub_job == 'SCH' then
					set_macro_page(3,2)
				elseif player.sub_job == 'BRD' then
					set_macro_page(4,2)
				elseif player.sub_job == 'NIN' then 
					set_macro_page(5,2)
				else
					set_macro_page(1,2)
				end
			else
				set_macro_page(1,2)
			end
		end
end

if player.main_job == "RDM" then
	function select_default_macro_book()
		-- sets Macros off = 0  on = 1
		automacroset = 1
		if automacroset == 1 then
			if player.sub_job =='WHM' then
				set_macro_page(1,3)
			elseif player.sub_job =='BLM' then
				set_macro_page(2,3)
			elseif player.sub_job =='NIN' then
				set_macro_page(3,3)
			elseif player.sub_job =='DNC' then
				set_macro_page(4,3)
			elseif player.sub_job =='SCH' then 
				set_macro_page(5,3)
			else
				set_macro_page(1,3)
			end
		else
			set_macro_page(1,3)
		end
	end
end

if player.main_job == "THF" then
	function select_default_macro_book()
		-- sets Macros off = 0  on = 1
		automacroset = 1
		if automacroset == 1 then
			if player.sub_job == 'NIN' then
				set_macro_page(1,5)
			elseif player.sub_job == 'WAR' then
				set_macro_page(2,5)
			elseif player.sub_job == 'DNC' then
				set_macro_page(3,5)
			elseif player.sub_job == 'DRK' then 
				set_macro_page(4,5)
			else
				set_macro_page(1,5)
			end
		else
			set_macro_page(1,5)
		end
	end
end

if player.main_job == "PLD" then
	function select_default_macro_book()
	-- sets Macros: 0ff = 0  On = 1
		automacroset = 1
		if automacroset == 1 then
			if player.sub_job =='NIN' then
				set_macro_page(1,16)
			elseif player.sub_job =='DNC' then
				set_macro_page(2,16)
			elseif player.sub_job =='WAR' then
				set_macro_page(3,16)
			elseif player.sub_job =='BLU' then 
				set_macro_page(4,16)
			elseif player.sub_job =='RDM' then 
				set_macro_page(5,16)
			elseif player.sub_job =='RUN' then 
				set_macro_page(6,16)
			else
				set_macro_page(3,16)
			end
		else
			set_macro_page(3,16)
		end
	end	
end

if player.main_job == "DRK" then
	function select_default_macro_book()
	-- sets Macros off = 0  on = 1
		automacroset = 1
		if automacroset == 1 then
			if player.sub_job == 'NIN' then
				set_macro_page(1,15)
			elseif player.sub_job == 'SAM' then
				set_macro_page(2,15)
			elseif player.sub_job == 'WAR' then
				set_macro_page(3,15)
			elseif player.sub_job == 'DNC' then
				set_macro_page(4,15)
			else
				set_macro_page(2,15)
			end
		else
			set_macro_page(2,15)
		end
	end
end

if player.main_job == "BST" then
	function select_default_macro_book()
		-- sets Macros off = 0  on = 1
		automacroset = 1
		if automacroset == 1 then
			if player.sub_job == 'NIN' then
				set_macro_page(1,14)
			elseif player.sub_job == 'WAR' then
				set_macro_page(2,14)
			elseif player.sub_job == 'DNC' then
				set_macro_page(3,14)
			elseif player.sub_job == 'SAM' then 
				set_macro_page(4,14)
			elseif player.sub_job == 'WHM' then 
				set_macro_page(5,14)
			else
				set_macro_page(3,14)
			end
		else
			set_macro_page(3,14)
		end
	end
end

if player.main_job == "BRD" then
	function select_default_macro_book()
		-- sets Macros off = 0  on = 1
		automacroset = 0
		if automacroset == 1 then
			if player.sub_job =='NIN' then
				set_macro_page(1,4)
			elseif player.sub_job =='WHM' then
				set_macro_page(2,4)
			elseif player.sub_job =='RDM' then
				set_macro_page(3,4)
			elseif player.sub_job =='SCH' then 
				set_macro_page(4,4)
			elseif player.sub_job =='DNC' then 
				set_macro_page(5,4)
			elseif player.sub_job =='BLM' then 
				set_macro_page(6,4)
			else
				set_macro_page(2,4)
			end
		else
			set_macro_page(2,4)
		end
	end
end

if player.main_job == "RNG" then
function select_default_macro_book()
		-- Auto macro sets off = 0  on = 1
		automacroset = 1
		if automacroset == 1 then
			if ranged_Bow:contains(player.equipment.range) then
				if player.sub_job == 'NIN' then
					set_macro_page(1,13)
				elseif player.sub_job == 'SAM' then
					set_macro_page(2,13)
				elseif player.sub_job == 'WAR' then
					set_macro_page(3,13)
				elseif player.sub_job == 'DRG' then 
					set_macro_page(4,13)
				else
					set_macro_page(3,13)
				end
			elseif ranged_Gun:contains(player.equipment.range) then
				if player.sub_job == 'NIN' then
					set_macro_page(5,13)
				elseif player.sub_job == 'SAM' then
					set_macro_page(6,13)
				elseif player.sub_job == 'WAR' then
					set_macro_page(7,13)
				elseif player.sub_job == 'DRG' then 
					set_macro_page(8,13)
				else
					set_macro_page(7,13)
				end
			end			
		else
			set_macro_page(3,13)
		end
	end
end

if player.main_job == "SAM" then
	function select_default_macro_book()
	-- sets Macros off = 0  on = 1
		automacroset = 1
		if automacroset == 1 then
			if player.sub_job =='DRK' then
				set_macro_page(1,13)
			elseif player.sub_job =='WAR' then
				set_macro_page(2,13)
			elseif player.sub_job =='DNC' then
				set_macro_page(3,13)
			elseif player.sub_job =='DRG' then 
				set_macro_page(4,13)
			elseif player.sub_job =='RNG' then 
				set_macro_page(5,13)
			elseif player.sub_job =='RUN' then 
				set_macro_page(6,13)
			elseif player.sub_job =='NIN' then
				set_macro_page(7,13)
			else
				set_macro_page(2,17)
			end
		else
			set_macro_page(2,17)
		end
	end
end

if player.main_job == "NIN" then
	function select_default_macro_book()
		-- sets Macros off = 0  on = 1
		automacroset = 1
		if automacroset == 1 then
			if player.sub_job == 'WAR' then
				set_macro_page(1,20)
			elseif player.sub_job == 'DNC' then
				set_macro_page(2,20)
			elseif player.sub_job == 'DRK' then
				set_macro_page(4,20)
			elseif player.sub_job == 'RDM' then 
				set_macro_page(3,20)
			else
				set_macro_page(1,20)
			end
		else
			set_macro_page(1,20)
		end
	end
end

if player.main_job == "DRG" then
	function select_default_macro_book()
		-- sets Macros off = 0  on = 1
		automacroset = 1
		if automacroset == 1 then
			if player.sub_job == 'SAM' then
				set_macro_page(1,12)
			elseif player.sub_job == 'NIN' then
				set_macro_page(2,12)
			elseif player.sub_job == 'DNC' then
				set_macro_page(3,12)
			elseif player.sub_job == 'WAR' then 
				set_macro_page(4,12)
			elseif player.sub_job == 'BLU' then 
				set_macro_page(5,12)
			elseif player.sub_job == 'RDM' then 
				set_macro_page(6,12)
			elseif player.sub_job == 'WHM' then 
				set_macro_page(7,12)	
			elseif player.sub_job == 'SCH' then 
				set_macro_page(8,12)	
			elseif player.sub_job == 'PLD' then 
				set_macro_page(9,12)	 
			else
				set_macro_page(1,12)
			end
		else
			set_macro_page(1,12)
		end
	end	
end

if player.main_job == "SMN" then

end

if player.main_job == "BLU" then
	--Dynamisa aoe dd ddwar ddrdm dddnc ddnin
	function select_default_macro_book()
		-- sets Macros off = 0  on = 1
		automacroset = 0
		if automacroset == 1 then
			if player.sub_job == 'NIN' then
				set_macro_page(1,8)
			elseif player.sub_job == 'WAR' then
				set_macro_page(2,8)
			elseif player.sub_job == 'RDM' then
				set_macro_page(3,8)
			elseif player.sub_job == 'DNC' then
				set_macro_page(4,8)
			elseif player.sub_job == 'NIN' then 
				set_macro_page(5,8)
			else
				set_macro_page(3,8)
			end
		end
	end
end

if player.main_job == "COR" then
	function select_default_macro_book()
	-- sets Macros off = 0  on = 1
		automacroset = 1
		if automacroset == 1 then
			if player.sub_job == 'DNC' then
				set_macro_page(1,10)
			elseif player.sub_job == 'NIN' then
				set_macro_page(2,10)
			elseif player.sub_job == 'RNG' then
				set_macro_page(3,10)
			elseif player.sub_job == 'WHM' then 
				set_macro_page(4,10)
			elseif player.sub_job == 'SCH' then 
				set_macro_page(6,10)
			elseif player.sub_job == 'BRD' then 
				set_macro_page(5,10)	
			else
				set_macro_page(1,10)
			end
		else
			set_macro_page(1,10)
		end
	end
end

if player.main_job == "PUP" then
	function select_default_macro_book()
		-- sets Macros off = 0  on = 1
		automacroset = 1
		if automacroset == 1 then
			if player.sub_job == 'WAR' then
				set_macro_page(1,15)
			end
		else
			set_macro_page(1,15)
		end
	end
end

if player.main_job == "DNC" then
	function select_default_macro_book()	
		-- sets Macros off = 0  on = 1
		automacroset = 1
		if automacroset == 1 then
			if player.sub_job == 'NIN' then
				set_macro_page(1,18)
			elseif player.sub_job == 'WAR' then
				set_macro_page(2,18)
			elseif player.sub_job == 'SAM' then
				set_macro_page(3,18)
			else
				set_macro_page(2,18)
			end
		else
			set_macro_page(2,18)
		end
	end
end

if player.main_job == "SCH" then
	function select_default_macro_book()
		-- sets Macros off = 0  on = 1
		automacroset = 1
		if automacroset == 1 then
			if player.sub_job == 'RDM' then
				set_macro_page(1,9)
			elseif player.sub_job =='WHM' then
				set_macro_page(2,9)
			elseif player.sub_job == 'BLM' then
				set_macro_page(3,9)
			elseif player.sub_job == 'DRK' then
				set_macro_page(4,9)
			elseif player.sub_job =='NIN' then 
				set_macro_page(5,9)
			else
				set_macro_page(1,9)
			end
		else
			set_macro_page(1,9)
		end
	end
end

if player.main_job == "GEO" then
function select_default_macro_book()
			-- sets Macros off = 0  on = 1
			automacroset = 0
			if automacroset == 1 then
				if player.sub_job == 'RDM' then
					set_macro_page(6,2)
				elseif player.sub_job =='BLM' then
					set_macro_page(7,2)
				elseif player.sub_job == 'WHM' then
					set_macro_page(9,2)
				elseif player.sub_job == 'SCH' then
					set_macro_page(9,2)
				elseif player.sub_job =='DNC' then 
					set_macro_page(8,2)
				elseif player.sub_job =='DRK' then 
					set_macro_page(7,2)
				elseif player.sub_job =='NIN' then 
					set_macro_page(10,2)
				else
					set_macro_page(6,2)
				end
			else
				set_macro_page(6,2)
			end
		end
end

if player.main_job == "RUN" then
	function select_default_macro_book()
	-- sets Macros off = 0  on = 1
		automacroset = 1
		if automacroset == 1 then
			if player.sub_job == 'NIN' then
				set_macro_page(5,15)
			elseif player.sub_job == 'SAM' then
				set_macro_page(6,15)
			elseif player.sub_job == 'DNC' then 
				set_macro_page(7,15)
			elseif player.sub_job == 'DRK' then 
				set_macro_page(8,15)
			elseif player.sub_job == 'BLU' then 
				set_macro_page(9,15)
			elseif player.sub_job == 'WHM' then 
				set_macro_page(10,15)
			else
				set_macro_page(5,15)
			end
		else
			set_macro_page(7,15)
		end
	end
end
