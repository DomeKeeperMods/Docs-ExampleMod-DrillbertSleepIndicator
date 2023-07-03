extends Node

const MYMODNAME_MOD_DIR = "Raffa-DrillbertSleepIndicator/"
const MYMODNAME_LOG = "Raffa-DrillbertSleepIndicator"

var dir = ""
var ext_dir = ""

func _init(modLoader = ModLoader):
	ModLoaderLog.info("Init", MYMODNAME_LOG)
	dir = ModLoaderMod.get_unpacked_dir() + MYMODNAME_MOD_DIR
	ext_dir = dir + "extensions/"
	
	# Add extensions
	ModLoaderMod.install_script_extension(ext_dir + "content/gadgets/drillbot/Drillbot.gd")

func _ready():
	ModLoaderLog.info("Done", MYMODNAME_LOG)
	add_to_group("mod_init")
	StageManager.connect("level_ready", self, "listenToDrillbot")

func listenToDrillbot():
	Data.listen(self, "drillbot.headcount")

func propertyChanged(property:String, oldValue, newValue):
	match property:
		# ONLY LOWERCASE HERE
		"drillbot.headcount":
			if newValue == 1:
				addDrillbertHud()

func addDrillbertHud():
	var _hud = Level.hud.addHudElement({"hud": "mods-unpacked/Raffa-DrillbertSleepIndicator/extensions/content/hud/DrillbertSleepingIndicator.tscn"})

func modInit():
	pass
	
