extends Camera

onready var world = get_parent().find_node("World")
export var ball_path: NodePath; onready var ball = get_node(ball_path)

var ball_last_position
var ball_initial_height
var initial_position

var dragging = false

func _ready():
	ball_last_position = ball.global_translation
	ball_initial_height = ball_last_position.length()
	initial_position = global_translation

func _process(_delta):
	var ball_height = ball.global_translation.length() - ball_initial_height
	global_translation = initial_position + (transform.basis.z * (ball_height))

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().change_scene("res://main_menu.tscn")
