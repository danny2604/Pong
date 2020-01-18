extends Position2D

export var speed = 3

var motion = Vector2()

func _physics_process(delta):
	#Controlls
	if Input.is_key_pressed(KEY_S) and position.y < 504:
		motion.y = speed
	elif Input.is_key_pressed(KEY_W) and position.y > 96:
		motion.y = -speed
	else:
		motion.y = 0
	
	#Apply motion
	translate(motion)