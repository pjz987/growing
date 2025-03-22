class_name TreeTrunk
extends AbstractTree

@onready var tree_top_sprite: Sprite2D = $TreeTopSprite
@onready var tree_trunk_sprite: Sprite2D = $TreeTrunkSprite

var tree_base: StaticBody2D
var my_trunk_maker = TrunkMaker.new()
#const TREE_TRUNK = preload("res://assets/tree-trunk.png")
#const TREE_TOP = preload("res://assets/tree-top.png")

func grow():
	is_growing = true
	var start_y := global_position.y
	var tween = get_tree().create_tween()
	tween.connect("step_finished", tree_base.set_full_trunk)
	tween.connect("finished", _grow_finished)
	tween.tween_property(self, "position", Vector2(global_position.x, start_y - 10), .4)
	tween.tween_property(self, "position", Vector2(global_position.x, start_y - 25), .6)
	#$Sprout.play()



func _ready() -> void:
	$Sprout.play()
	tree_top_sprite.visible = true
	tree_trunk_sprite.visible = false
	$Sprout.play()

func _create_trunk():
	tree_top_sprite.visible = false
	tree_trunk_sprite.visible = true
	var new_trunk = my_trunk_maker.make_trunk(position, tree_base)
	input_pickable = false
	tree_base.tree_trunks.append(new_trunk)
	tree_base.set_half_trunk()
	$Sprout.play()

func _input(event: InputEvent) -> void:
	super._input(event)

func _on_mouse_entered() -> void:
	super._on_mouse_entered()

func _grow_finished():
	super._grow_finished()

func _on_mouse_exited() -> void:
	super._on_mouse_exited()
