extends RigidBody

onready var world = get_parent()
onready var camera = get_viewport().get_camera()

var initial_transform

func _ready():
	initial_transform = transform

func _physics_process(_delta):
	
	add_central_force(Vector3(world.global_translation - global_translation).normalized() * 9.8 * 3)

func hit_ball(vec: Vector3) -> void:
	apply_central_impulse(vec)


func _input(event):
	if event.is_action_pressed('shoot'):
		hit_ball(Vector3.FORWARD * 10)
	elif event.is_action_pressed("reset"):
		transform = initial_transform
