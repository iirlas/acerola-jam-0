extends Actor


@export var target: Node2D
@export var speed := 1.0
@onready var raycast2D := $RayCast2D


func _process(delta):
	if target != null:
		velocity = (target.global_position - global_position).normalized() * speed
	raycast2D.target_position = axis_matrix * -velocity


func _physics_process(delta):
	if raycast2D.is_colliding():
		velocity = Vector2.ZERO
	super._physics_process(delta)
	


func _on_body_entered(body: Node):
	if body.has_signal('damaged'):
		body.emit_signal('damaged', 1)
	damaged.emit(1)
