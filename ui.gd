extends Label

func _ready() -> void:
	text = "Acorns: " + str(Globals.acorns) + "  Water: " + str(WaterManager.water)
	WaterManager.water_updated.connect(refresh_text)
	
func refresh_text() -> void:
	text = "Acorns: " + str(Globals.acorns) + "  Water: " + str(WaterManager.water)
