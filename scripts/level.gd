class_name Level
extends Node


@export var lives := 1


func _ready():
	LevelManager.lives = lives


func _on_win():
	SceneManager.goto_child(0)
	pass


func _on_loss():
	LevelManager.lives -= 1
	if LevelManager.lives <= 0:
		SceneManager.goto_child(1)
	pass
