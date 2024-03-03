extends Node


@export var amount := 1


func _process(delta):
	if amount <= 0:
		get_parent().queue_free()


func damage(amount: int):
	self.amount -= amount


func _on_body_entered(body):
	damage(1)
