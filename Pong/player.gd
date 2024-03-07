extends Actor


@export var speed := 1.0


func _process(delta):
	velocity.y = Input.get_axis("ui_up", "ui_down") * speed
