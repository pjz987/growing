class_name TreeBase
extends AbstractTree

var tree_trunks: Array[StaticBody2D] = []
var my_trunk_maker = TrunkMaker.new()

func _create_trunk():
	var new_trunk = my_trunk_maker.make_trunk(position, self)
	tree_trunks.append(new_trunk)
	input_pickable = false

func _input(event: InputEvent) -> void:
	super._input(event)
	
func _on_mouse_entered() -> void:
	super._on_mouse_entered()

func _grow_finished():
	super._grow_finished()

func _on_mouse_exited() -> void:
	super._on_mouse_exited()
