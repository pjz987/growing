extends StaticBody2D

const TREE_SCENE = preload("res://tree.tscn")
var is_mouse_over := false

func _ready() -> void:
	grow()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and is_mouse_over and Globals.water > 0:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed == true:
			Utils.instantiate_scene_on_level(TREE_SCENE, global_position)
			Globals.water -= 1
			input_pickable = false

func grow():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position", Vector2(global_position.x, global_position.y - 25), 1)


func _on_mouse_entered() -> void:
	is_mouse_over = true


func _on_mouse_exited() -> void:
	is_mouse_over = false
