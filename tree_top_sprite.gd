extends Sprite2D

@export var falling_leaves := true

@onready var gpu_particles_2d: GPUParticles2D = $GPUParticles2D

func _ready() -> void:
	gpu_particles_2d.material.emitting = true
