extends Node


@export var scene: PackedScene


func _on_scene_changed():
	get_tree().change_scene_to_packed(scene)
