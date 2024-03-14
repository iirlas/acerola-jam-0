class_name BasePlayer
extends Actor


var direction := Vector2.ZERO
signal action_0
signal action_1


func _unhandled_input(event):
	if event.is_action_pressed("action_0"):
		action_0.emit()
	if event.is_action_pressed("action_1"):
		action_1.emit()


func _process(delta):
	direction = Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up", "ui_down")
	)
