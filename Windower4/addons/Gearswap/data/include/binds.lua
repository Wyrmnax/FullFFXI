-- Feary's Bind Lua
-- Date Created: 4/10/2014
-- Last Updated: 8/11/2014
-- To Do
--
--
--
-- Notes
-- ALT = ^
-- Ctrl = !
-- windows key = @
-- right click menu/ Apps  = #

function basic_binds()
	windower.send_command('bind sysrq screenshot png hide')
	windower.send_command('bind ^v paste')
end

function clear_binds()
	windower.send_command('clearbinds')
	windower.add_to_chat(8,'Clearing All Binds - Setting to Defaults')
	windower.send_command('bind !f10 drawdistance set 10')
	windower.send_command('bind ^f10 drawdistance set 1')
	windower.send_command('bind f11 game_forceambientlight')
	windower.send_command('bind f12 showfps')
	basic_binds()
	windower.send_command('bind ^f1 input /ta <a10>')
	windower.send_command('bind ^f2 input /ta <a11>')
	windower.send_command('bind ^f3 input /ta <a12>')
	windower.send_command('bind ^f4 input /ta <a13>')
	windower.send_command('bind ^f5 input /ta <a14>')
	windower.send_command('bind ^f6 input /ta <a15>')
	windower.send_command('bind !f1 input /ta <a20>')
	windower.send_command('bind !f2 input /ta <a21>')
	windower.send_command('bind !f3 input /ta <a22>')
	windower.send_command('bind !f4 input /ta <a23>')
	windower.send_command('bind !f5 input /ta <a24>')
	windower.send_command('bind !f6 input /ta <a25>')
	windower.send_command('lua unload autocor')
	windower.send_command('lua unload autopup')
	windower.send_command('lua unload autocontrol')
	windower.send_command('lua unload singer')
end

if player.main_job == "WAR" then
	basic_binds()
	-- set binds
	windower.send_command('@bind f10 gs c DW')
	windower.send_command('@bind f11 gs c DT')
	windower.send_command('@bind f12 gs c ATK')
	
elseif player.main_job == "MNK" then
	basic_binds()
	-- set binds
	windower.send_command('@bind f10 gs c MDT')
	windower.send_command('@bind f11 gs c PDT')
	windower.send_command('@bind f12 gs c TP')
	
elseif player.main_job == "BST" then
	basic_binds()
	-- set binds
	windower.send_command('@bind f10 gs c MDT')
	windower.send_command('@bind f11 gs c PDT')
	windower.send_command('@bind f12 gs c master')
	
elseif player.main_job == "WHM" then
	basic_binds()
--	windower.send_command('bind f1 input /ma "Cure IV" <p0>')
--	windower.send_command('bind f2 input /ma "Cure IV" <p1>')
--	windower.send_command('bind f3 input /ma "Cure IV" <p2>')
--	windower.send_command('bind f4 input /ma "Cure IV" <p3>')
--	windower.send_command('bind f5 input /ma "Cure IV" <p4>')
--	windower.send_command('bind f6 input /ma "Cure IV" <p5>')
	
--	windower.send_command('bind f7 input /ma "Haste" <stpc>')
--	windower.send_command('bind f8 input /ma "Regen IV" <stpc>')
--	windower.send_command('bind f9 input /ma "Erase" <stpc>')
	windower.send_command('bind f10 gs c MDT')
	windower.send_command('bind f11 gs c PDT')
	windower.send_command('bind f12 input /ma "Sacrifice" <stpc>')
	
	-- ALT
	windower.send_command('bind !f1 input /ma "Curaga III" <p0>')
	windower.send_command('bind !f2 input /ma "Curaga III" <p1>')
	windower.send_command('bind !f3 input /ma "Curaga III" <p2>')
	windower.send_command('bind !f4 input /ma "Curaga III" <p3>')
	windower.send_command('bind !f5 input /ma "Curaga III" <p4>')
	windower.send_command('bind !f6 input /ma "Curaga III" <p5>')
	
	-- Ctrl
	windower.send_command('bind ^f1 input /ma "Cure IV" <p0>')
	windower.send_command('bind ^f2 input /ma "Cure IV" <p1>')
	windower.send_command('bind ^f3 input /ma "Cure IV" <p2>')
	windower.send_command('bind ^f4 input /ma "Cure IV" <p3>')
	windower.send_command('bind ^f5 input /ma "Cure IV" <p4>')
	windower.send_command('bind ^f6 input /ma "Cure IV" <p5>')
	
	-- Mouse Menu key - JA
	windower.send_command('bind #f1 input /ma "Divine Caress" <me>;wait 1;input /ja "Accession" <me>')
	windower.send_command('bind #f2 input /ma "Divine Caress" <me>;wait 1;input /ja "Accession" <me>')
	windower.send_command('bind #f3 input /ma "Divine Caress" <me>;wait 1;input /ja "Accession" <me>')
	windower.send_command('bind #f4 input /ma "Divine Caress" <me>;wait 1;input /ja "Accession" <me>')
	windower.send_command('bind #f5 input /ma "Divine Caress" <me>;wait 1;input /ja "Accession" <me>')
	windower.send_command('bind #f6 input /ma "Divine Caress" <me>;wait 1;input /ja "Accession" <me>')
	
	-- Windows Key - Status Effects
	windower.send_command('bind @1 input /ma "Paralyna" <stpc>')
	windower.send_command('bind @2 input /ma "Stona" <stpc>')
	windower.send_command('bind @3 input /ma "Silena" <stpc>')
	windower.send_command('bind @4 input /ma "Erase" <stpc>')
	windower.send_command('bind @5 input /ma "Viruna" <stpc>')
	windower.send_command('bind @6 input /ma "Poisona" <stpc>')

elseif player.main_job == "BLM" then
	basic_binds()
		-- set binds
	windower.send_command('@bind f10 gs c MDT')
	windower.send_command('@bind f11 gs c PDT')
	windower.send_command('@bind f12 gs c nuke cycle')
	windower.send_command('@bind ^f12 gs c nuke cycledown')

elseif player.main_job == "THF" then
	basic_binds()
		-- set binds
	windower.send_command('@bind f10 gs c MDT')
	windower.send_command('@bind f11 gs c PDT')
	windower.send_command('@bind f12 gs c TP')

elseif player.main_job == "RDM" then
	basic_binds()
	-- set binds
	windower.send_command('@bind f10 gs c MDT')
	windower.send_command('@bind f11 gs c PDT')
	windower.send_command('@bind f12 gs c TP')

elseif player.main_job == "PLD" then
	basic_binds()
	-- set binds
	windower.send_command('@bind f12 gs c Mode')
	windower.send_command('@bind ^f12 gs c ModeX')
	windower.send_command('@bind #g input /echo test')
--	windower.send_command('bind f1 input /ma "Cure IV" <p0>')
--	windower.send_command('bind f2 input /ma "Cure IV" <p1>')
--	windower.send_command('bind f3 input /ma "Cure IV" <p2>')
--	windower.send_command('bind f4 input /ma "Cure IV" <p3>')
--	windower.send_command('bind f5 input /ma "Cure IV" <p4>')
--	windower.send_command('bind f6 input /ma "Cure IV" <p5>')
	windower.send_command('bind ^f1 input /ma "Cure IV" <p0>')
	windower.send_command('bind ^f2 input /ma "Cure IV" <p1>')
	windower.send_command('bind ^f3 input /ma "Cure IV" <p2>')
	windower.send_command('bind ^f4 input /ma "Cure IV" <p3>')
	windower.send_command('bind ^f5 input /ma "Cure IV" <p4>')
	windower.send_command('bind ^f6 input /ma "Cure IV" <p5>')
	windower.send_command('bind !f1 input /ma "Cure IV" <p0>')
	windower.send_command('bind !f2 input /ma "Cure IV" <p1>')
	windower.send_command('bind !f3 input /ma "Cure IV" <p2>')
	windower.send_command('bind !f4 input /ma "Cure IV" <p3>')
	windower.send_command('bind !f5 input /ma "Cure IV" <p4>')
	windower.send_command('bind !f6 input /ma "Cure IV" <p5>')
	
elseif player.main_job == "BRD" then
	basic_binds()
	-- set binds
	windower.send_command('@bind f10 gs c MDT')
	windower.send_command('@bind f11 gs c PDT')
	windower.send_command('@bind f12 gs c Mode')
	windower.send_command('@bind ^f12 gs c ModeX')
	--windower.send_command('lua load singer')
	
elseif player.main_job == "SAM" then
	basic_binds()
	-- set binds
	windower.send_command('@bind f11 gs c Seigan')	
	windower.send_command('@bind f12 gs c Mode')
	windower.send_command('@bind ^f12 gs c ModeX')
	
elseif player.main_job == "NIN" then
	basic_binds()
	-- set binds
	windower.send_command('@bind f12 gs c Mode')
	windower.send_command('@bind ^f12 gs c ModeX')
	
	
elseif player.main_job == "DRG" then
	basic_binds()
	-- set binds
	windower.send_command('@bind f11 gs c Seigan')	
	windower.send_command('@bind f12 gs c Mode')
	windower.send_command('@bind ^f12 gs c ModeX')

elseif player.main_job == "RNG" then
	basic_binds()
	-- set binds	
	windower.send_command('@bind f11 gs c ModeRanged')
	windower.send_command('@bind ^f11 gs c ModeRangedX')
	windower.send_command('@bind f12 gs c ModeMelee')
	windower.send_command('@bind ^f12 gs c ModeMeleeX')
	windower.send_command('lua reload autora')
	
elseif player.main_job == "COR" then
	clear_binds()
	-- set binds
	windower.send_command('@bind f10 gs c KillTpRoll')
	windower.send_command('@bind f11 gs c PDT')
	windower.send_command('@bind f12 gs c Mode')
	windower.send_command('@bind ^f12 gs c ModeX')
	windower.send_command('lua reload autora')
	
elseif player.main_job == "RUN" then
	clear_binds()
	-- set binds	
	send_command('bind = input //gs c rune')
	send_command('bind f12 gs c cycleRunes')
	send_command('bind ^f12 gs c cyclebackRunes')
	send_command('bind !q input /ws Dimidiation <t>')
	send_command('bind !e input /ja "Vivacious Pulse" <me>')
	send_command('bind !r input /ja Lunge <t>')
	
elseif player.main_job == "SMN" then
	basic_binds()
	-- set binds
	windower.send_command('@bind f10 gs c MDT')
	windower.send_command('@bind f11 gs c PDT')
	windower.send_command('@bind f12 gs c TP')
else
	clear_binds()
		-- set binds
	windower.send_command('@bind f10 gs c MDT')
	windower.send_command('@bind f11 gs c PDT')
	windower.send_command('@bind f12 gs c TP')
end


