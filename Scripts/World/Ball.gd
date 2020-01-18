extends KinematicBody2D

export var speed = Vector2(100, 100)
export var addSpeed = Vector2(4, 4)

var dir = Vector2()
var motion = Vector2()
var collider = ""

func _ready():
	#Random x
	if randi()%11+1 > 5:
		dir.x = -1
	else:
		dir.x = 1
	
	#Random y
	if randi()%11+1 > 4:
		dir.y = -1
	else:
		dir.y = 1

func _physics_process(delta):
	#Check if it is reset collision
	if get_slide_count() - 1 >= 0:
		if get_slide_collision(0) != null:
			collider = get_slide_collision(0).collider.get_name()
	
	if collider == "Wall3":
		global.score2 += 1
		get_tree().change_scene("res://Scenes/World.tscn")
	elif collider == "Wall4":
		global.score1 += 1
		get_tree().change_scene("res://Scenes/World.tscn")
	
	#Bounce
	if is_on_wall():
		speed += addSpeed
		dir.x = -dir.x
	elif is_on_floor() or is_on_ceiling():
		speed += addSpeed
		dir.y = -dir.y
		
	#Change direction
	motion = speed * dir
	
	collider = ""
	move_and_slide(motion, Vector2(0, -1))