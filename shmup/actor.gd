class_name Actor
extends CharacterBody2D


@export var speed := 1.0
@export_flags("X", "Y") var axis_lock := 0
var colliders: Dictionary # (collider: should delete next check)
signal on_action
signal on_damage(amount:int)
signal body_entered(body: Node)
signal body_exited(body: Node)


func _physics_process(delta):
	if (axis_lock & (1 << Vector2.AXIS_X)) != 0:
		velocity.x = 0
	if (axis_lock & (1 << Vector2.AXIS_Y)) != 0:
		velocity.y = 0
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
