extends Node2D


@export var bullet: PackedScene
@export var force := 1.0
@export_flags_2d_physics var collision_layer := 0
@export_flags_2d_physics var collision_mask := 0


func _on_action():
	var instance := bullet.instantiate() as RigidBody2D
	get_tree().root.add_child(instance)
	instance.global_position = global_position
	instance.collision_layer = collision_layer
	instance.collision_mask = collision_mask
	instance.apply_impulse(transform.x * force)
