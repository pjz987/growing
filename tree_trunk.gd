class_name TreeTrunk
extends AbstractTree

@onready var tree_top_sprite: Sprite2D = $TreeTopSprite
@onready var tree_trunk_sprite: Sprite2D = $TreeTrunkSprite

var tree_base: StaticBody2D
var my_trunk_maker = TrunkMaker.new()
#const TREE_TRUNK = preload("res://assets/tree-trunk.png")
#const TREE_TOP = preload("res://assets/tree-top.png")
func _ready() -> void:
	$Sprout.play()
	tree_top_sprite.visible = true
	tree_trunk_sprite.visible = false
	grow()
	$Sprout.play()

func _create_trunk():
	tree_top_sprite.visible = false
	tree_trunk_sprite.visible = true
	var new_trunk = my_trunk_maker.make_trunk(position, tree_base)
	input_pickable = false
	tree_base.tree_trunks.append(new_trunk)
	$Sprout.play()

func _input(event: InputEvent) -> void:
	super._input(event)

func _on_mouse_entered() -> void:
	super._on_mouse_entered()

func _grow_finished():
	super._grow_finished()

func _on_mouse_exited() -> void:
	super._on_mouse_exited()
