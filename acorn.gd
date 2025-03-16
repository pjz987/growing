extends RigidBody2D

const TREE_SCENE = preload("res://tree.tscn")
var bounce_counter = 0
@export var pause_before_sprouting := 1.0

func _on_body_entered(body: Node) -> void:
	bounce_counter += 1
	print(bounce_counter)
	print(linear_velocity)
	if bounce_counter > 2:
		await get_tree().create_timer(pause_before_sprouting).timeout
		Utils.instantiate_scene_on_level(TREE_SCENE, Vector2(global_position.x, global_position.y + 40))
		queue_free()
		
