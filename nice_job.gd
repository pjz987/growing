extends Label

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("quit"):
		visible = false
