extends CollisionObject2D


@export var damage := 1


func _on_body_entered(body: Node):
	print(body)
	$Health.damage(damage)
	if body.has_signal("damaged"):
		body.emit_signal("damaged", damage)
