extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@export var acceleration = 512
@export var jump_force = -290
@export var max_speed = 128
@export var friction = 0.2
@onready var sprite_2d: Sprite2D = $Sprite2D


func _physics_process(delta: float) -> void:

	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

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
