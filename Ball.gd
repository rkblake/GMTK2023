extends RigidBody

onready var world = get_parent()
onready var camera = get_viewport().get_camera()

func get_input() -> Vector3:
	var input := Vector3.ZERO
#	var cam_forward = -camera.transform.basis.z.normalized()
	
	if Input.is_action_pressed('ui_right'):
		input.x = -1
	if Input.is_action_pressed('ui_left'):
		input.x = 1
	if Input.is_action_pressed('ui_up'):
		input.z = 1
	if Input.is_action_pressed('ui_down'):
		input.z = -1

	return input

func _physics_process(_delta):
#	var input = get_input().normalized()
#	var cam_forward = -camera.transform.basis.z.normalized()
#	add_central_force(input * 10)
	
	add_central_force(Vector3(world.global_translation - global_translation).normalized() * 9.8 * 3)

func hit_ball(vec: Vector3) -> void:
	print('ball hit')
	apply_central_impulse(vec)


func _input(event):
	if event.is_action_pressed('shoot'):
		hit_ball(Vector3.FORWARD * 10)
