class_name AbstractTree
extends StaticBody2D

var is_mouse_over := false
var is_growing := false

func grow():
	Globals.water -= 1
	is_growing = true
	var tween = get_tree().create_tween()
	tween.connect("finished", _grow_finished)
	tween.tween_property(self, "position", Vector2(global_position.x, global_position.y - 25), 1)
	
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and is_mouse_over and not is_growing:
		if event.button_index == MOUSE_BUTTON_LEFT:
			_create_trunk()

func _create_trunk():
	pass

func _on_mouse_entered() -> void:
	is_mouse_over = true

func _grow_finished():
	is_growing = false

func _on_mouse_exited() -> void:
	is_mouse_over = false
