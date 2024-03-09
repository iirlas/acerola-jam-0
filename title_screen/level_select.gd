extends Control

@export var page_offset := 0
var current_page := 0
var is_dirty: bool


func _ready():
	is_dirty = true


func _on_select_level(index: int):
	SceneManager.load_at(index)


func _process(delta):
	if not is_dirty:
		return
	var level_count: int = SceneManager.scenes.size() - page_offset
	var button_count := $GridContainer.get_child_count()
	for i in button_count:
		var button := $GridContainer.get_child(i) as Button
		var level_index := i + current_page * button_count + page_offset
		for connection in button.pressed.get_connections():
			button.pressed.disconnect(connection['callable'])
		if level_index < SceneManager.scenes.size():
			button.pressed.connect(_on_select_level.bind(level_index))
			button.text = (SceneManager.scenes[level_index] as PackedScene).get_state().get_node_name(0)
			button.visible = true
		else:
			button.visible = false
	is_dirty = false
