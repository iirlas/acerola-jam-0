extends Level


var player_1_score := 0
var player_2_score := 0


func _ready():
	var angle := snappedf(randf() * 2 * PI, PI / 2.0) + PI / 4.0
	PhysicsServer2D.body_set_state(
		$Ball.get_rid(),
		PhysicsServer2D.BODY_STATE_TRANSFORM,
		Transform2D.IDENTITY.translated(get_viewport().get_visible_rect().size / 2.0)
	)
	PhysicsServer2D.body_set_state(
		$Ball.get_rid(),
		PhysicsServer2D.BODY_STATE_LINEAR_VELOCITY,
		Vector2.RIGHT.rotated(angle)
	)


func _process(delta):
	$UI/Label.text = str(player_1_score)
	$UI/Label2.text = str(player_2_score)


func _on_goal_body_entered(body):
	player_2_score += 1
	_ready()



func _on_goal_2_body_entered(body):
	player_1_score += 1
	_ready()
