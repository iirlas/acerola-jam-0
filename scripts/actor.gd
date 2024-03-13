class_name Actor
extends CharacterBody2D


@export_flags("X", "Y") var axis_lock := 0
var colliders: Dictionary # (collider: should delete next check)
var axis_matrix: Transform2D:
	get:
		var matrix := Transform2D()
		if (axis_lock & (1 << Vector2.AXIS_X)) != 0:
			matrix.x = Vector2.ZERO
		if (axis_lock & (1 << Vector2.AXIS_Y)) != 0:
			matrix.y = Vector2.ZERO
		return matrix
signal body_entered(body: Node)
signal body_exited(body: Node)
signal damaged(amount:int)


func _physics_process(delta):
	velocity = axis_matrix * velocity
	if move_and_slide():
		for index in get_slide_collision_count():
			var collision := get_slide_collision(index)
			var collider := collision.get_collider()
			body_entered.emit(collider)
			colliders[collider] = false
		for collider in colliders:
			if colliders[collider]:
				body_exited.emit(collider)
				colliders.erase(colliders)
			else:
				colliders[collider] = true
