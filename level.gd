extends Node2D

const ACORN_SCENE = preload("res://acorn.tscn")

@export var number_of_acorns := 0
@export var number_of_water := 0

func _ready() -> void:
	Globals.acorns = number_of_acorns
	Globals.water = number_of_water

func _input(event: InputEvent) -> void:
	if (event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT
		and event.pressed == true and Globals.acorns > 0):
		print(event.position)
		print(event)
		Globals.acorns -= 1
		Utils.instantiate_scene_on_level(ACORN_SCENE, event.position)
