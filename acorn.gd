extends RigidBody2D

const TREE_SCENE = preload("res://tree_base.tscn")
var bounce_counter = 0
@export var pause_before_sprouting := 1.0

func _on_body_entered(body: Node) -> void:
	if bounce_counter == 0:
		$Impact.play()
	bounce_counter += 1
	if bounce_counter > 2:
		await get_tree().create_timer(pause_before_sprouting).timeout
		Utils.instantiate_scene_on_level(TREE_SCENE, Vector2(global_position.x, global_position.y))
		queue_free()
		
 
 
