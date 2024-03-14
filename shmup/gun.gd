extends Node2D


@export var bullet: PackedScene
@export var force := 1.0
@export var limit := 1
@export_flags_2d_physics var collision_layer := 0
@export_flags_2d_physics var collision_mask := 0
@onready var bullets := Node.new()


func _ready():
	add_child(bullets)


func _on_action():
	if bullets.get_child_count() >= limit:
		bullets.get_child(0).queue_free()
	var instance := bullet.instantiate() as RigidBody2D
	bullets.add_child(instance)
	instance.global_position = global_position
	instance.global_rotation = global_rotation
	instance.collision_layer = collision_layer
	instance.collision_mask = collision_mask
	instance.apply_impulse(global_transform.x * force)
