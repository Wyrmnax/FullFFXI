-- Utility's include
-- Created: 01/29/2014
-- Last Update: 7/29/2014
-- To Do List
--


-- Called when the player's subjob changes.
function sub_job_change(newSubjob, oldSubjob)
	-- Macros 
    if select_default_macro_book() then
        select_default_macro_book()
    end
    
    if job_sub_job_change then
        job_sub_job_change(newSubjob, oldSubjob)
    end
end

-- Macros 
function set_macro_page(set,book)
    if not tonumber(set) then
        add_to_chat(123,'Error setting macro page: Set is not a valid number ('..tostring(set)..').')
        return
    end
    if set < 1 or set > 10 then
        add_to_chat(123,'Error setting macro page: Macro set ('..tostring(set)..') must be between 1 and 10.')
        return
    end

    if book then
        if not tonumber(book) then
            add_to_chat(123,'Error setting macro page: book is not a valid number ('..tostring(book)..').')
            return
        end
        if book < 1 or book > 20 then
            add_to_chat(123,'Error setting macro page: Macro book ('..tostring(book)..') must be between 1 and 20.')
            return
        end
        send_command('@input /macro book '..tostring(book)..';wait .1;input /macro set '..tostring(set))
		add_to_chat(123,'Macro Set')
            
    else
        send_command('@input /macro set '..tostring(set))
		add_to_chat(123,'Macro book Set')
    end
end
