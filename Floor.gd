extends Spatial

const SPEED = 5000

var dragging = false

var rotating = false
var initial_mouse_position
var last_mouse_position
var initial_transform

func _ready():
	initial_transform = transform

func _input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if event.pressed:
			rotating = true
			initial_mouse_position = event.position
			last_mouse_position = event.position
		else:
			rotating = false
	elif event.is_action_pressed("reset"):
		transform = initial_transform

func _physics_process(_delta):
	if rotating:
		var delta = get_viewport().get_mouse_position() - last_mouse_position
		if delta == Vector2.ZERO:
			return
		rotate_y(deg2rad(delta.x * 0.05))
		rotate_x(deg2rad(-delta.y * 0.05))
		last_mouse_position = get_viewport().get_mouse_position()
