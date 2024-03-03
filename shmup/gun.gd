extends Node2D


@export var bullet: PackedScene
@export var force := 1.0


func _on_action():
	var instance := bullet.instantiate() as RigidBody2D
	get_tree().root.add_child(instance)
	instance.global_position = global_position
	instance.apply_impulse(transform.x * force)
