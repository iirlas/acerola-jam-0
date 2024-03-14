extends Control


func _ready():
	$Title.text = (SceneManager.level.scene as PackedScene).get_state().get_node_name(0)
	if LevelManager.lives > 0:
		$Lives.text = "Lives: " + str(LevelManager.lives)
