extends Node2D

const ACORN_SCENE = preload("res://acorn.tscn")

@export var number_of_acorns := 0
@export var number_of_water := 0
@export var next_scene_path := "res://level.tscn"
@export var scene_transition_time := 1.0

@onready var goal_label: Label = $Goal/GoalLabel
@onready var blackout_layer: ColorRect = $BlackoutLayer

func _ready() -> void:
	Globals.acorns = number_of_acorns
	Globals.water = number_of_water
	blackout_layer.visible = true
	print(blackout_layer.color)
	blackout_layer.color.a = 1.0
	print(blackout_layer.color)
	await get_tree().create_tween().tween_property(blackout_layer, "color:a", 0.0, scene_transition_time).finished
	blackout_layer.visible = false

func _input(event: InputEvent) -> void:
	if (event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT
		and event.pressed == true and Globals.acorns > 0):
		Globals.acorns -= 1
		Utils.instantiate_scene_on_level(ACORN_SCENE, event.position)

func _on_goal_body_entered(body: Node2D) -> void:
	goal_label.visible = true
	blackout_layer.visible = true
	await get_tree().create_tween().tween_property(blackout_layer, "color:a", 1.0, scene_transition_time).finished
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file(next_scene_path)
