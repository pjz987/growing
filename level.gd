extends Node2D

const ACORN_SCENE = preload("res://acorn.tscn")

@export var number_of_acorns := 0
@export var number_of_water := 0

@onready var goal_label: Label = $Goal/GoalLabel

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


#func _on_goal_area_entered(area: Area2D) -> void:
	#goal_label.visible = true
#
#
func _on_goal_body_entered(body: Node2D) -> void:
	goal_label.visible = true


func _on_goal_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	goal_label.visible = true
