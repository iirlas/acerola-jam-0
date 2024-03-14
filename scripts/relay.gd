extends Node


signal reinvoke


func _on_invoke():
	reinvoke.emit()
