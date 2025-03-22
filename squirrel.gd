extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var left_the_ground = false
var stepping = false
#var xvel = velocity.x

@export var acceleration = 512
@export var jump_force = -256
@export var max_speed = 128
@export var friction = 0.2
@onready var sprite_2d: Sprite2D = $Sprite2D


func _physics_process(delta: float) -> void:
	#xvel = velocity.x
	#print(xvel)

	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		left_the_ground = true
		
	if (is_on_floor() and left_the_ground):
		left_the_ground = false
		$LandSound.play()
		#print("landsound!")
		pass

	# Handle jump.
	if Input.is_action_just_pressed('jump') and is_on_floor():
		$JumpPlayer.play()
		velocity.y = jump_force
		#print(coyote_jump_timer.time_left)
		#if is_on_floor() or coyote_jump_timer.time_left > 0.0:
			#print(coyote_jump_timer.time_left)

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis('move_left', 'move_right')
	if direction:
		velocity.x += direction * acceleration * delta
	else:
		velocity.x = lerp(velocity.x, 0.0, friction)
	velocity.x = clamp(velocity.x, -max_speed, max_speed)
	
	if direction:
		sprite_2d.scale.x = direction
	
	move_and_slide()
	
	if (velocity.x != 0 and is_on_floor()):
		if not stepping:
			$StepSound.play()
		stepping = true
	
	if stepping and (not direction or not is_on_floor()):
		stepping = false
		$StepSound.stop()
		#print("stepping as stopped")
		
