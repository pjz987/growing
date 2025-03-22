class_name TreeBase
extends AbstractTree

var tree_trunks: Array[StaticBody2D] = []
var my_trunk_maker = TrunkMaker.new()
const TREE_BASE = preload("res://assets/tree-base.png")
const TREE_SPROUT = preload("res://assets/sprout.png")
const FULL_TRUNK = preload("res://assets/tree-trunk.png")
const HALF_TRUNK = preload("res://assets/half-trunk.png")
var is_sprout := true

func _ready() -> void:
	set_collision_layer_value(1, false)
	set_collision_layer_value(2, true)
	$Sprite2D.texture = TREE_SPROUT
	$Sprout.play()

func set_full_trunk(idx:int) -> void:
	if tree_trunks.size() > 1 and idx == 0:
		var active_sprite: Sprite2D = tree_trunks[-2].get_child(1)
		active_sprite.position.y -= 8
		active_sprite.texture = FULL_TRUNK

func set_half_trunk() -> void:
	if tree_trunks.size() > 1:
		var active_sprite: Sprite2D = tree_trunks[-2].get_child(1)
		active_sprite.position.y += 8
		active_sprite.texture = HALF_TRUNK

func _create_trunk() -> void:
	var new_trunk = my_trunk_maker.make_trunk(position, self)
	tree_trunks.append(new_trunk)
	input_pickable = false
	$Sprout.play()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and is_mouse_over and not is_growing:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if is_sprout:
				set_collision_layer_value(1, true)
				set_collision_layer_value(2, false)
				is_growing = true
				is_sprout = false
				$Sprite2D.texture = TREE_BASE
				$Sprout.play()
				await get_tree().create_timer(0.2).timeout
				is_growing = false
			else:
				_create_trunk()
	
func _on_mouse_entered() -> void:
	super._on_mouse_entered()

func _grow_finished():
	super._grow_finished()

func _on_mouse_exited() -> void:
	super._on_mouse_exited()
