extends Label

func _ready() -> void:
	text = "Acorns: " + str(Globals.acorns) + "  Water: " + str(Globals.water)
	text += "\nF1 for Controls"
	Globals.refresh_text.connect(refresh_text)

func refresh_text() -> void:
	text = "Acorns: " + str(Globals.acorns) + "  Water: " + str(Globals.water)
	text += "\nF1 for Controls"
