-- Feary's Lua Mappings
-- Purpose: Define Basic and command tables for Gearsets.
-- Created:
-- Last Updated:


-- Basic Tables
	
	sets.idle = {}
	sets.idle.Avatar = {}
	sets.misc = {}
	
	-- Precast
	sets.precast = {}
	sets.precast.JA = {}
	sets.precast.WS = {}
	
	-- Midcast
	sets.midcast = {}
	sets.midcast.Pet = {}
	-- Aftercast
	sets.aftercast = {}	


-- Spell Mappings 
-------------------------------------------------------------------------------------------------------------------
-- Mappings, lists and sets to describe game relationships that aren't easily determinable otherwise.
-------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------
-- Elemental mappings for element relationships and certian types of spells.
-------------------------------------------------------------------------------------------------------------------

elements = {}

elements.list = S{'Light','Dark','Fire','Ice','Wind','Earth','Lightning','Water'}

elements.weak_to = {['Light']='Dark', ['Dark']='Light', ['Fire']='Ice', ['Ice']='Wind', ['Wind']='Earth', ['Earth']='Lightning',
['Lightning']='Water', ['Water']='Fire'}

elements.strong_to = {['Light']='Dark', ['Dark']='Light', ['Fire']='Water', ['Ice']='Fire', ['Wind']='Ice', ['Earth']='Wind',
['Lightning']='Earth', ['Water']='Lightning'}

elements.storm_of = {['Light']="Aurorastorm", ['Dark']="Voidstorm", ['Fire']="Firestorm", ['Earth']="Sandstorm",
['Water']="Rainstorm", ['Wind']="Windstorm", ['Ice']="Hailstorm", ['Lightning']="Thunderstorm"}, 
{['Light']="Aurorastorm II", ['Dark']="Voidstorm II", ['Fire']="Firestorm II", ['Earth']="Sandstorm II",
['Water']="Rainstorm II", ['Wind']="Windstorm II", ['Ice']="Hailstorm II", ['Lightning']="Thunderstorm II"}



elements.spirit_of = {['Light']="Light Spirit", ['Dark']="Dark Spirit", ['Fire']="Fire Spirit", ['Earth']="Earth Spirit",
['Water']="Water Spirit", ['Wind']="Air Spirit", ['Ice']="Ice Spirit", ['Lightning']="Thunder Spirit"}



storms = S{"Aurorastorm", "Voidstorm", "Firestorm", "Sandstorm", "Rainstorm", "Windstorm", "Hailstorm", "Thunderstorm"}


skillchain_elements = {}
skillchain_elements.Light = S{'Light','Fire','Wind','Lightning'}
skillchain_elements.Dark = S{'Dark','Ice','Earth','Water'}
skillchain_elements.Fusion = S{'Light','Fire'}
skillchain_elements.Fragmentation = S{'Wind','Lightning'}
skillchain_elements.Distortion = S{'Ice','Water'}
skillchain_elements.Gravitation = S{'Dark','Earth'}
skillchain_elements.Transfixion = S{'Light'}
skillchain_elements.Compression = S{'Dark'}
skillchain_elements.Liquification = S{'Fire'}
skillchain_elements.Induration = S{'Ice'}
skillchain_elements.Detonation = S{'Wind'}
skillchain_elements.Scission = S{'Earth'}
skillchain_elements.Impaction = S{'Lightning'}
skillchain_elements.Reverberation = S{'Water'}

		ranged_weaponskills = S{"Flaming Arrow", "Piercing Arrow", "Dulling Arrow", "Sidewinder", "Arching Arrow", "Blast Arrow",
						"Empyreal Arrow", "Refulgent Arrow", "Apex Arrow", "Namas Arrow", "Jishnu's Radiance",
						"Hot Shot", "Split Shot", "Sniper Shot", "Slug Shot", "Blast Shot", "Heavy Shot", "Detonator", "Numbing Shot", "Last Stand",
						"Coronach", "Trueflight", "Leaden Salute", "Wildfire",
						"Myrkr"}
		ranged_weaponskills_Distance = T{["Sidewinder"] = 24, ["Refulgent Arrow"] = 24, ["Apex Arrow"] = 24, ["Namas Arrow"] = 24, ["Jishnu's Radiance"] = 24,
						["Heavy Shot"] = 24, ["Last Stand"] = 24,
						["Coronach"] = 24, ["Trueflight"] = 24, ["Leaden Salute"] = 24, ["Wildfire"] = 24}

-- Equipment Mappings

	ranged_Bow = T{"Yoichinoyumi", "Echidna's Bow"}
	ranged_Gun = T{"Annihilator", "Eminence Gun", "Armageddon", "Malison", "Fomalhaut"}
	
-- Areas based Equipment
	areas = {}
-- Adoulin areas, where Ionis will grant special stat bonuses.
	areas.Adoulin = S{
		"Yahse Hunting Grounds",
		"Ceizak Battlegrounds",
		"Foret de Hennetiel",
		"Morimar Basalt Fields",
		"Yorcia Weald",
		"Yorcia Weald [U]",
		"Cirdas Caverns",
		"Cirdas Caverns [U]",
		"Marjami Ravine",
		"Kamihr Drifts",
		"Sih Gates",
		"Moh Gates",
		"Dho Gates",
		"Woh Gates",
		"Rala Waterways",
		"Rala Waterways [U]",
		"Outer Ra'Kaznar",
		"Outer Ra'Kaznar [U]"
		}

-- City areas for town gear behavior.
	areas.Town = S{
			"Ru'Lude Gardens",
			"Upper Jeuno",
			"Lower Jeuno",
			"Port Jeuno",
			"Port Windurst",
			"Windurst Waters",
			"Windurst Woods",
			"Windurst Walls",
			"Heavens Tower",
			"Port San d'Oria",
			"Northern San d'Oria",
			"Southern San d'Oria",
			"Port Bastok",
			"Bastok Markets",
			"Bastok Mines",
			"Metalworks",
			"Aht Urhgan Whitegate",
			"Tavanazian Safehold",
			"Nashmau",
			"Selbina",
			"Mhaura",
			"Norg",
			"Eastern Adoulin",
			"Western Adoulin",
			"Kazham",
			"Rabao",
			"Mog Garden"
					}
