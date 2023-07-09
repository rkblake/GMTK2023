extends RigidBody

onready var world = get_parent()
onready var camera = get_viewport().get_camera()

export var stroke_label_path: NodePath; onready var stroke_label = get_node(stroke_label_path)

var initial_transform
var num_hits = 0
var ring_grav = false

func _ready():
	initial_transform = transform

func _physics_process(_delta):
	
	add_central_force(gravity())

func hit_ball(vec: Vector3) -> void:
	apply_central_impulse(vec)
	num_hits += 1
	stroke_label.text = "Strokes: " + str(num_hits)


func _input(event):
	if event.is_action_pressed('shoot'):
		hit_ball(Vector3.FORWARD * 10)
	elif event.is_action_pressed("reset"):
		transform = initial_transform
		ring_grav = false

func gravity() -> Vector3:
	var grav = -Vector3(-0.35, 3, 0.35).normalized() if ring_grav else Vector3(world.global_translation - global_translation).normalized()
	return grav * 9.8 * 3

func _on_DownGravTrigger_body_entered(_body):
	ring_grav = true


func _on_PlanetGravTrigger_body_entered(_body):
	ring_grav = false
