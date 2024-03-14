extends Node


@export var actor: CharacterBody2D
@export var speed: float = 1.0
var prev_direction: Vector2


func _physics_process(delta: float):
	# Remove previous motion's influence aligned by each axis
	for i in range(2):
		var aligned_direction := actor.transform[i] * prev_direction
		var motion := aligned_direction * speed
		if aligned_direction != Vector2.ZERO:
			var influence := actor.velocity.dot(motion) / (motion.length() ** 2)
			if influence > 0:
				actor.velocity -= motion * clamp(influence, 0, 1)
	# Apply next motion
	var next_direction: Vector2 = actor.direction
	actor.velocity += next_direction * speed
	prev_direction = next_direction
