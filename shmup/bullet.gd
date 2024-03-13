extends RigidBody2D


@export var damage := 1


func _on_body_entered(body: Node):
	$Health.damage(damage)
	if body.has_signal("damaged"):
		body.emit_signal("damaged", damage)
