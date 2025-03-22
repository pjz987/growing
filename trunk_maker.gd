extends Node
class_name TrunkMaker

const TREE_TRUNK_SCENE = preload("res://tree_trunk.tscn")

func make_trunk(position_param: Vector2, tree_base: StaticBody2D):
	print(typeof(position_param))
	var new_trunk := Utils.instantiate_scene_on_level(TREE_TRUNK_SCENE, position_param)
	new_trunk.tree_base = tree_base
	new_trunk.grow()
	return new_trunk
