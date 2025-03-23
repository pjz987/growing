extends Level


var main_ost = MasterAudio.get_child(0)
var victory_ost = MasterAudio.get_child(3)

func _ready() -> void:
	super._ready()
	main_ost.stop()
	victory_ost.play()
