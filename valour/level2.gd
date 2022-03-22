extends Node2D

func _on_player_add_one_apple():
	var node = get_node("UI/bar/counter")
	var old_value = int(node.text)
	var new_value = old_value + 1
	node.text = str(new_value)


func _on_Node2D_ready():
	get_node("SoundTheme").play()
