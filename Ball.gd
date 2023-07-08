extends RigidBody

onready var world = get_parent().find_node("World")

func get_input() -> Vector3:
	var input := Vector3.ZERO
	if Input.is_action_pressed('ui_right'):
		input.x = -1
	if Input.is_action_pressed('ui_left'):
		input.x = 1
	if Input.is_action_pressed('ui_up'):
		input.z = 1
	if Input.is_action_pressed('ui_down'):
		input.z = -1

	return input

func _physics_process(delta):
	var input = get_input().normalized()
	add_central_force(input * 10)
	
	add_central_force(Vector3(world.global_translation - global_translation).normalized() * 9.8 * 1.5)

func hit_ball(vec: Vector3) -> void:
	print('ball hit')
	apply_central_impulse(vec)
