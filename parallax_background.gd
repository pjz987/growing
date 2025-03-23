extends ParallaxBackground

@export var scroll_speed := 1.0

func _physics_process(delta: float) -> void:
	scroll_offset.x += scroll_speed * delta
