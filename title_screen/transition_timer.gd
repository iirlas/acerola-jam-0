extends Timer


@export var child_index := 0


func _on_timeout():
	SceneManager.goto_child(child_index)
