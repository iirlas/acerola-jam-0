extends Actor


@export var speed := Vector2.ONE
signal action_0
signal action_1


func _unhandled_input(event):
	if event.is_action_pressed("action_0"):
		action_0.emit()
	if event.is_action_pressed("action_1"):
		action_1.emit()


func _process(delta):
	velocity.x = Input.get_axis("ui_left", "ui_right") * speed.x
	velocity.y = Input.get_axis("ui_up", "ui_down") * speed.y



func _on_body_entered(body):
	damaged.emit(1)