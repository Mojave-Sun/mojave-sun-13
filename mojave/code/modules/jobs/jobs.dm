GLOBAL_LIST_INIT(wasteland_positions, list(
	"Wastelander",
	"New Canaanite",
	"Hubologist"))

GLOBAL_LIST_INIT(town_positions, list(
	"Snowcrest Mayor",
	"Snowcrest Citizen",
	"Snowcrest Squatter",
	"Snowcrest Worker",
	"Snowcrest Bartender",
	"Snowcrest Doctor",
	"Snowcrest Nurse",
	"Town Deputy",
	"Snowcrest Bodyguard",
	"Town Sheriff"))

GLOBAL_LIST_INIT(ncr_positions, list(
	"NCR Trooper",
	"NCR Military Police",
	"NCR Radioman",
	"NCR MP Medic",
	"NCR Medic",
	"NCR Engineer",
	"NCR Sergeant",
	"NCR MP Sergeant",
	"NCR Staff Sergeant",
	"NCR Lieutenant"))

GLOBAL_LIST_INIT(bos_positions, list(
	"BoS Initiate",
	"BoS Knight",
	"BoS Paladin",
	"BoS Head Paladin",
	"BoS Scribe",
	"BoS Head Scribe"))

GLOBAL_LIST_INIT(raiders_positions, list(
	"Raider",
	"Raider Enforcer",
	"Raider Sawbone",
	"Raider Boss",
	"Slickback Cook",
	"Slickback",
	"Slickback Underboss",
	"Mon City Grunt",
	"Mon City Marksman",
	"Mon City Pointman",
	"Mon City Captain"))

GLOBAL_LIST_INIT(legion_positions, list(
	"Legion Praetorian",
	"Legion Centurion",
	"Legion Veteran Decanus",
	"Legion Prime Decanus",
	"Legion Recruit Decanus",
	"Legion Veteran",
	"Legion Prime ",
	"Legion Recruit",
	"Legion Vexillarius",
	"Legion Speculatore",
	"Legion Explorer",
	"Legion Scout",
	"Legion Blacksmith",))

GLOBAL_LIST_INIT(ranger_positions, list(
	"Desert Ranger Deputy-Chief",
	"Desert Ranger Elite",
	"Desert Ranger",
	"Desert Ranger Sharpshooter",
	"Desert Ranger Doctor",))

GLOBAL_LIST_INIT(drought_town_positions, list(
	"The Baron",
	"Barony Denizen",
	"Barony Laborer",
	"Barony Barkeep",
	"Barony Clinician",
	"Barony Enforcer"))

GLOBAL_LIST_INIT(drylander_positions, list(
	"Drylander Chieftain",
	"Drylander Shaman",
	"Drylander Headtaker",
	"Drylander Hunter",
	"Drylander Folk"))

GLOBAL_LIST_INIT(goldman_positions, list(
	"Goldman Ringleader",
	"Goldman Quartermaster",
	"Goldman Road Runner",
	"Goldman",
	"Goldman Unproven"))

GLOBAL_LIST_INIT(combattest_positions, list(
	"Blue ganger",
	"Red ganger",))

// job categories for rendering the late join menu
GLOBAL_LIST_INIT(ms13_position_categories, list(
	EXP_TYPE_WASTELAND = list("jobs" = wasteland_positions, "color" = "#eec66f"),
	EXP_TYPE_TOWN= list("jobs" = town_positions, "color" = "#4feb64"),
	EXP_TYPE_NCR = list("jobs" = ncr_positions, "color" = "#cfd1ba"),
	EXP_TYPE_BOS = list("jobs" = bos_positions, "color" = "#737592"),
	EXP_TYPE_RAIDERS = list("jobs" = raiders_positions, "color" = "#30389c"),
	EXP_TYPE_RANGERS = list("jobs" = ranger_positions, "color" = "#bdbc76"),
	EXP_TYPE_DROUGHTTOWN = list("jobs" = drought_town_positions, "color" = "#12491a"),
	EXP_TYPE_DRYLANDERS = list("jobs" = drylander_positions, "color" = "#4e2e04"),
	EXP_TYPE_COMBATTEST = list("jobs" = combattest_positions, "color" = "#4e2e04"),
	EXP_TYPE_GOLDMAN = list("jobs" = goldman_positions, "color" = "#4e2e04")
))

GLOBAL_LIST_INIT(ms13_exp_jobsmap, list(
	EXP_TYPE_WASTELAND = list("titles" = wasteland_positions),
	EXP_TYPE_TOWN = list("titles" = town_positions),
	EXP_TYPE_NCR = list("titles" = ncr_positions),
	EXP_TYPE_BOS = list("titles" = bos_positions),
	EXP_TYPE_RAIDERS = list("titles" = raiders_positions),
	EXP_TYPE_RANGERS = list("titles" = ranger_positions),
	EXP_TYPE_DROUGHTTOWN = list("titles" = drought_town_positions),
	EXP_TYPE_DRYLANDERS = list("titles" = drylander_positions),
	EXP_TYPE_COMBATTEST = list("titles" = combattest_positions),
	EXP_TYPE_GOLDMAN = list("titles" = goldman_positions)
))

GLOBAL_PROTECT(ms13_exp_jobsmap)
