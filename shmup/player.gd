extends Actor


func _unhandled_input(event):
	if event.is_action_pressed("action_0"):
		on_action.emit()


func _process(delta):
	velocity.x = Input.get_axis("ui_left", "ui_right") * speed
	velocity.y = Input.get_axis("ui_up", "ui_down") * speed

