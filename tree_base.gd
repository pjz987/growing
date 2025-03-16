class_name TreeBase
extends AbstractTree

static var tree_shape: Array[Vector2] = [
	Vector2(0, -1),
	Vector2(0, -1),
	Vector2(0, -1),
	Vector2(1, -1),
	Vector2(0, 1),
	Vector2(1, -1),
]
var tree_index := 0
var tree_trunks: Array[StaticBody2D] = []
var my_trunk_maker = TrunkMaker.new()

func get_grow_vector():
	tree_index += 1
	if tree_index > tree_shape.size() - 1:
		return Vector2(0, 0)
	else:
		return tree_shape[tree_index]

func _ready():
	_create_trunk()

func _create_trunk():
	var new_trunk = my_trunk_maker.make_trunk(position, self)
	new_trunk.grow()
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
