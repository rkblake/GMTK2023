extends Spatial

const SPEED = 5000

var dragging = false

var rotating = false
var initial_mouse_position
var last_mouse_position

#func get_input() -> Vector3:
#	var input := Vector3.ZERO
#	if Input.is_action_pressed('ui_right') and angular_velocity.z > -1:
#		input.z = -1
#	if Input.is_action_pressed('ui_left') and angular_velocity.z < 1:
#		input.z = 1
#	if Input.is_action_pressed('ui_up') and angular_velocity.x > -1:
#		input.x = -1
#	if Input.is_action_pressed('ui_down') and angular_velocity.x < 1:
#		input.x = 1
#
#	return input
#
#func _physics_process(delta):
#	return
#	var input = get_input().normalized()
#	if input != Vector3.ZERO:
#		add_torque(input * SPEED)
#	else:
##		print(angular_velocity)
#		angular_velocity = angular_velocity.move_toward(Vector3.ZERO, 0.1 * delta)



func _input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_RIGHT:
		if event.pressed:
			rotating = true
			initial_mouse_position = event.position
			last_mouse_position = event.position
		else:
			rotating = false

func _physics_process(_delta):
	if rotating:
		var delta = get_viewport().get_mouse_position() - last_mouse_position
		if delta == Vector2.ZERO:
			return
		rotate_y(deg2rad(delta.x * 0.05))
		rotate_x(deg2rad(-delta.y * 0.05))
		last_mouse_position = get_viewport().get_mouse_position()
