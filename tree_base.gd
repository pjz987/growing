class_name TreeBase
extends AbstractTree

var tree_trunks: Array[StaticBody2D] = []
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
	Globals.decrement_water()
	var new_trunk = TrunkMaker.make_trunk(position, self)
	tree_trunks.append(new_trunk)
	input_pickable = false
	$Sprout.play()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and is_mouse_over and not is_growing:
		if event.button_index == MOUSE_BUTTON_LEFT and Globals.check_water():
			if tree_trunks.size() == 0:
				if is_sprout:
					Globals.decrement_water()
					set_collision_layer_value(1, true)
					set_collision_layer_value(2, false)
					is_growing = true
					is_sprout = false
					$Sprite2D.texture = TREE_BASE
					$Sprout.play()
					await get_tree().create_timer(0.2).timeout
					is_growing = false
				else:
					set_collision_layer_value(1, false)
					set_collision_layer_value(2, true)
					_create_trunk()
			else:
				grow_on_top()
				input_pickable = false

func grow_on_top() -> void:
	var top_trunk: AbstractTree = tree_trunks[-1]
	if not top_trunk.is_growing:
		top_trunk._create_trunk()
	
func _on_mouse_entered() -> void:
	super._on_mouse_entered()

func _grow_finished() -> void:
	super._grow_finished()

func refresh_pickable() -> void:
	self.input_pickable = true
	for i in range(0, tree_trunks.size() - 1):
		pass
		#tree_trunks[i].input_pickable = true
		#tree_trunks[i].is_growing = false
	

func _on_mouse_exited() -> void:
	super._on_mouse_exited()
