extends Position2D

export var speed = 3

var motion = Vector2()

func _physics_process(delta):
	#If Multiplayer
	if(!global.single):
		#Controlls
		if Input.is_key_pressed(KEY_DOWN) and position.y < 504:
			motion.y = speed
		elif Input.is_key_pressed(KEY_UP) and position.y > 96:
			motion.y = -speed
		else:
			motion.y = 0
	#If Singleplayer
	else:
		#AI
		var ball = get_node("/root/World/Ball/Position2D").get_global_position()
		if ball.y < position.y and position.y > 96:
			motion.y = -speed
		elif ball.y > position.y and position.y < 504:
			motion.y = speed
		else:
			motion.y = 0
	
	#Apply motion
	translate(motion)