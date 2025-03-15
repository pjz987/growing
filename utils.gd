extends Node

func instantiate_scene_on_level(scene: PackedScene, position: Vector2) -> Node:
	var node = scene.instantiate()
	var main = get_tree().current_scene
	node.position = position
	main.add_child(node)
	return node
