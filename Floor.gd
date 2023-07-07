extends RigidBody


const SPEED = 50


func _physics_process(delta):
	if Input.is_action_pressed('ui_right'):
		add_torque(Vector3(0,0,-SPEED))
	if Input.is_action_pressed('ui_left'):
		add_torque(Vector3(0,0,SPEED))
	if Input.is_action_pressed('ui_up'):
		add_torque(Vector3(-SPEED,0,0))
	if Input.is_action_pressed('ui_down'):
		add_torque(Vector3(SPEED,0,0))
