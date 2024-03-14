extends Node


@onready var level := $TitleScreen/LevelTitleScreen/Level
var _current: Node
var current: Node:
	get:
		return _current
	set(value):
		if self.is_ancestor_of(value):
			_current = value
			_on_scene_changed.call_deferred()


func goto_root():
	current = $TitleScreen


func goto_child(index: int):
	if index < current.get_child_count():
		current = current.get_child(index)


func goto_parent():
	if get_parent() != null:
		current = current.get_parent()


func _on_scene_changed():
	if current != null and current.has_method("_on_scene_changed"):
			current._on_scene_changed()
