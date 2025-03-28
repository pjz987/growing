extends RigidBody2D

const TREE_SCENE = preload("res://tree_base.tscn")
var bounce_counter = 0
var impacted = false
@export var pause_before_sprouting := 1.0

func _on_body_entered(body: Node) -> void:
	#print(body.is_class("GroundTileMapLayer"))
	#print(body)
	#print("GroundTileMap" in str(body))
	if bounce_counter == 0:
		$Impact.play()
		$PlantTimer.start()
		impacted = true
	bounce_counter += 1
	if bounce_counter > 2 and "GroundTileMap" in str(body):
		await get_tree().create_timer(pause_before_sprouting).timeout
		#global_position.x = round(global_position.x / 50) * 50
		#print(global_position.x)
		Utils.instantiate_scene_on_level(TREE_SCENE, Vector2(global_position.x, global_position.y))
		queue_free()

func _physics_process(delta: float) -> void:
	if $PlantTimer.time_left == 0 and impacted:
		#print("acorn timeout")
		Utils.instantiate_scene_on_level(TREE_SCENE, Vector2(global_position.x, global_position.y))
		queue_free()
