extends HudElement

func _ready():
	Data.listen(self, "drillbert.sleeping", true)

func propertyChanged(property:String, oldValue, newValue):
	match property:
		# ONLY LOWERCASE HERE
		"drillbert.sleeping":
			print("mod drillbots:", newValue)
			if newValue == true:
				$Sleeping.show()
				$Awake.hide()
			elif newValue == false:
				$Sleeping.hide()
				$Awake.show()
