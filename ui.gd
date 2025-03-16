extends Label

func _physics_process(delta: float) -> void:
	text = "Acorns: " + str(Globals.acorns) + "  Water: " + str(Globals.water)
