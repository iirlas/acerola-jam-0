extends Node


enum State {
	START,
	CONTINUE,
	INTERRUPT,
	END
}

@export var actor: CharacterBody2D
@export var height_max := 1.0
@export var height_min := 1.0
@export var fall_speed := 1.0
@export var gravity_scale := 1.0
@export var count := 1
@onready var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var gravity_vector: Vector2 = ProjectSettings.get_setting("physics/2d/default_gravity_vector")
@onready var left := count
@onready var _gravity_scale := gravity_scale
var current_state := State.END


func _process(delta):
	if current_state == State.START and left > 0:
		# Replace motion aligned to gravity direction
		var motion: Vector2 = -gravity_vector * sqrt(2.0 * height_max * gravity * gravity_scale)
		var influence: float = actor.velocity.dot(gravity_vector) / (gravity_vector.length() ** 2)
		actor.velocity += motion - gravity_vector * influence
		gravity_scale = _gravity_scale
		left -= 1
		current_state = State.CONTINUE
	if current_state == State.INTERRUPT:
		# Increase gravity for variable jump height
		gravity_scale = _gravity_scale * (height_max / height_min)
		current_state = State.END
	if gravity_vector.dot(actor.velocity) > 0:
		gravity_scale = _gravity_scale * fall_speed
	pass


func _physics_process(delta):
	# Apply gravity
	actor.velocity += gravity_vector * (gravity * gravity_scale * delta)
	if actor.is_on_floor():
		left = count
	if left == count and $Timer.is_stopped():
		$Timer.start()
	pass


func _on_timer_timeout():
	if left == count:
		left = count - 1


func _on_jump():
	current_state = State.START
