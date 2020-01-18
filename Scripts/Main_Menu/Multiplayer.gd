extends BaseButton

func _pressed():
	global.single = false
	get_tree().change_scene("res://Scenes/World.tscn")