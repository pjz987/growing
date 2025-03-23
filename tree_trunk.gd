class_name TreeTrunk
extends AbstractTree

@onready var tree_top_sprite: Sprite2D = $TreeTopSprite
@onready var tree_trunk_sprite: Sprite2D = $TreeTrunkSprite

var tree_base: StaticBody2D
var highest_part := true
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
	is_growing = false
	$Sprout.play()

func _create_trunk():
	Globals.decrement_water()
	is_growing = true
	highest_part = false
	set_collision_layer_value(1, false)
	set_collision_layer_value(2, true)
	tree_top_sprite.visible = false
	tree_trunk_sprite.visible = true
	var new_trunk = TrunkMaker.make_trunk(position, tree_base)
	# input_pickable = false
	tree_base.tree_trunks.append(new_trunk)
	tree_base.set_half_trunk()
	is_growing = false
	input_pickable = true
	$Sprout.play()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and is_mouse_over and not is_growing:
		if event.button_index == MOUSE_BUTTON_LEFT and Globals.check_water():
			if highest_part == true:
				_create_trunk()
			else:
				# input_pickable = false
				tree_base.grow_on_top()

func _on_mouse_entered() -> void:
	super._on_mouse_entered()

func _grow_finished():
	is_growing = false
	input_pickable = true
	tree_base.refresh_pickable()

func _on_mouse_exited() -> void:
	super._on_mouse_exited()
