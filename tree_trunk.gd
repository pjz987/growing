class_name TreeTrunk
extends AbstractTree

var tree_base: StaticBody2D
const TREE_TRUNK_SCENE = preload("res://tree_trunk.tscn")

func _ready() -> void:
	grow()

func _create_trunk():
	var new_trunk := Utils.instantiate_scene_on_level(TREE_TRUNK_SCENE, global_position)
	new_trunk.tree_base = tree_base
	input_pickable = false
	tree_base.silly()
	tree_base.tree_trunks.append(new_trunk)

func _input(event: InputEvent) -> void:
	super._input(event)

func _on_mouse_entered() -> void:
	super._on_mouse_entered()

func _grow_finished():
	super._grow_finished()

func _on_mouse_exited() -> void:
	super._on_mouse_exited()
