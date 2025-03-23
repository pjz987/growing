extends Node2D


const ACORN_SCENE = preload("res://acorn.tscn")

@export var number_of_acorns := 0
@export var number_of_water := 0
@export var fade_in_out_time := 1.0
@export var next_level_path := "res://level.tscn"
var fanfare = true
var fanfare_sound = MasterAudio.get_child(2)
var main_ost = MasterAudio.get_child(0)
var victory_ost = MasterAudio.get_child(3)

@onready var goal_label: Label = $Goal/GoalLabel
@onready var blackout_layer: ColorRect = $BlackoutLayer
@onready var blackout_layer_2: ColorRect = $BlackoutLayer2

var next_level_scene: PackedScene

func _ready() -> void:
	main_ost.stop()
	victory_ost.play()
	
	Globals.acorns = number_of_acorns
	Globals.water = number_of_water
	Globals.refresh_text.emit()
	blackout_layer.visible = true
	blackout_layer.color.a = 1.0
	next_level_scene = load(next_level_path)
	await get_tree().create_tween().tween_property(blackout_layer, "color:a", 0.0, fade_in_out_time).finished
	blackout_layer.visible = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()
	if Input.is_action_just_pressed("quit"):
		blackout_layer.visible = true
		blackout_layer_2.visible = true
		await get_tree().create_tween().tween_property(blackout_layer, "color:a", 1.0, fade_in_out_time).finished
		await get_tree().create_timer(1.0).timeout
		await get_tree().create_tween().tween_property(blackout_layer_2, "color:a", 1.0, fade_in_out_time).finished
		await get_tree().create_timer(0.5).timeout
		get_tree().quit()

func _input(event: InputEvent) -> void:
	if (event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT
		and event.pressed == true and Globals.check_acorns()):
		Utils.instantiate_scene_on_level(ACORN_SCENE, event.position)

func _on_goal_body_entered(body: Node2D) -> void:
	if fanfare:
		fanfare_sound.play()
		#print("fanfare is playing")
		fanfare = false
	goal_label.visible = true
	blackout_layer.visible = true
	blackout_layer_2.visible = true
	await get_tree().create_tween().tween_property(blackout_layer, "color:a", 1.0, fade_in_out_time).finished
	await get_tree().create_timer(1.0).timeout
	await get_tree().create_tween().tween_property(blackout_layer_2, "color:a", 1.0, fade_in_out_time).finished
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_packed(next_level_scene)
