extends Camera

onready var world = get_parent().find_node("World")
onready var ball = get_parent().find_node("Ball")

const SPHERE_RAD = 37

var ball_last_position

func _ready():
	ball_last_position = global_translation

func _process(_delta):
#	return
	var x = Vector3(ball_last_position - ball.global_translation).normalized()
	x *= 100
	var y = Vector3(world.global_translation - ball.global_translation).normalized()
	y *= -100
	look_at_from_position(y, ball.global_translation, Vector3.UP)
	
	
	ball_last_position = ball.global_translation
