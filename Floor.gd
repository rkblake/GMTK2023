extends RigidBody


const SPEED = 5000

func get_input() -> Vector3:
	var input := Vector3.ZERO
	if Input.is_action_pressed('ui_right') and angular_velocity.z > -1:
		input.z = -1
	if Input.is_action_pressed('ui_left') and angular_velocity.z < 1:
		input.z = 1
	if Input.is_action_pressed('ui_up') and angular_velocity.x > -1:
		input.x = -1
	if Input.is_action_pressed('ui_down') and angular_velocity.x < 1:
		input.x = 1
		
	return input

func _physics_process(delta):
	return
	var input = get_input().normalized()
	if input != Vector3.ZERO:
		add_torque(input * SPEED)
	else:
#		print(angular_velocity)
		angular_velocity = angular_velocity.move_toward(Vector3.ZERO, 0.1 * delta)
