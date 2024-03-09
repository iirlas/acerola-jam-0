extends Node


@export var scenes: Array


func load_at(index: int):
	get_tree().change_scene_to_packed(scenes[index])
