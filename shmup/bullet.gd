extends RigidBody2D


@export var damage := 1


func _on_body_entered(body: Node):
	$Health.damage(damage)
	body.emit_signal("on_damage", damage)
