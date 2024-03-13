extends Area2D


func _on_body_entered(body: Node2D):
	body.process_mode = Node.PROCESS_MODE_ALWAYS


func _on_body_exited(body: Node2D):
	body.process_mode = Node.PROCESS_MODE_DISABLED
