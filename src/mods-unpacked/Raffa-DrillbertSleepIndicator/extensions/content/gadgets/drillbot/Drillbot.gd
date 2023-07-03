extends "res://content/gadgets/drillbot/Drillbot.gd"

func _ready():
	for drillbert in get_tree().get_nodes_in_group("drillbots"):
		if drillbert.state == State.SLEEPING:
			return
	Data.apply("drillbert.sleeping", false)

func deserialize(data: Dictionary):
	.deserialize(data)
	if state == State.SLEEPING:
		Data.apply("drillbert.sleeping", true)

func setState(to):
	.setState(to)
	if to == State.SLEEPING:
		Data.apply("drillbert.sleeping", true)
	else:
		for drillbert in get_tree().get_nodes_in_group("drillbots"):
			if drillbert.state == State.SLEEPING:
				return
		Data.apply("drillbert.sleeping", false)
