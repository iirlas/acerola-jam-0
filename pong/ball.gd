extends RigidBody2D


@export var speed := 1.0


func _integrate_forces(state: PhysicsDirectBodyState2D):
	var velocity := state.linear_velocity
	state.linear_velocity = velocity.normalized() * speed
	pass
