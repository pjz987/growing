class_name TreeTrunk
extends AbstractTree

var tree_base: StaticBody2D
var my_trunk_maker = TrunkMaker.new()
var finished_growing := false

func grow():
	var next_pos: Vector2 = tree_base.get_grow_vector()
	print(next_pos)
	if next_pos != Vector2(0, 0):
		is_growing = true
		var tween = get_tree().create_tween()
		tween.connect("finished", _grow_finished)
		tween.tween_property(self, "position", next_pos * 12 + position, 1)
	else:
		finished_growing = true
	print("finished")
	
func _create_trunk():
	var new_trunk = my_trunk_maker.make_trunk(position, tree_base)
	input_pickable = false
	tree_base.tree_trunks.append(new_trunk)
	new_trunk.grow()

func _input(event: InputEvent) -> void:
	pass

func _on_mouse_entered() -> void:
	super._on_mouse_entered()

func _grow_finished():
	super._grow_finished()
	if not finished_growing:
		_create_trunk()

func _on_mouse_exited() -> void:
	super._on_mouse_exited()
