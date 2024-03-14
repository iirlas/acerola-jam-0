extends Control


func _on_help_pressed():
	SceneManager.goto_child(0)


func _on_options_pressed():
	SceneManager.goto_child(1)


func _on_credits_pressed():
	SceneManager.goto_child(2)
