class_name TreeTrunk
extends AbstractTree

var tree_base: StaticBody2D
var my_trunk_maker = TrunkMaker.new()
const TREE_TRUNK = preload("res://assets/tree-trunk.png")
const TREE_TOP = preload("res://assets/tree-top.png")
func _ready() -> void:
	$Sprite2D.texture = TREE_TOP
	grow()

func _create_trunk():
	$Sprite2D.texture = TREE_TRUNK
	var new_trunk = my_trunk_maker.make_trunk(position, tree_base)
	input_pickable = false
	tree_base.tree_trunks.append(new_trunk)

func _input(event: InputEvent) -> void:
	super._input(event)

func _on_mouse_entered() -> void:
	super._on_mouse_entered()

func _grow_finished():
	super._grow_finished()

func _on_mouse_exited() -> void:
	super._on_mouse_exited()
