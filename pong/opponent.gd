extends Actor


@export var target: RigidBody2D
@export var speed := 1.0


func _process(delta):
	if abs(target.global_position.y - global_position.y) > 32:
		if target.global_position.y > global_position.y:
			velocity.y = speed
		else:
			velocity.y = -speed
