extends BaseButton

func _pressed():
	global.single = true
	get_tree().change_scene("res://Scenes/World.tscn")