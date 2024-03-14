extends Node


@export var target: Node


func _on_scene_changed():
	SceneManager.current = target
