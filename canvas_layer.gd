extends CanvasLayer

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed('Controls'):
		self.show()
	else:
		self.hide()
