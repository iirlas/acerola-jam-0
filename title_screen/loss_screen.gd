extends Control


func _ready():
	if LevelManager.lives <= 0:
		$Timer.child_index = 1
