extends Control


@export var scenes: Array
var current_page := 0
var is_dirty: bool


func _ready():
	is_dirty = true


func _process(delta):
	if not is_dirty:
		return
	var button_count := $GridContainer.get_child_count()
	for i in button_count:
		var button := $GridContainer.get_child(i) as Button
		var level_index := i + current_page * button_count
		for connection in button.pressed.get_connections():
			button.pressed.disconnect(connection['callable'])
		if level_index < scenes.size():
			button.pressed.connect(_on_select_level.bind(level_index))
			button.text = (scenes[level_index] as PackedScene).get_state().get_node_name(0)
			button.visible = true
		else:
			button.visible = false
	is_dirty = false


func _on_select_level(index: int):
	SceneManager.level.scene = scenes[index]
	SceneManager.goto_child(-1)
	pass


func _on_button_next_page_pressed():
	var pages: float = scenes.size() / float($GridContainer.get_child_count())
	if (current_page + 1) < pages:
		current_page += 1
		is_dirty = true


func _on_button_prev_page_pressed():
	if current_page > 0:
		current_page -= 1
		is_dirty = true
