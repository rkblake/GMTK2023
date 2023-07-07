extends RigidBody

onready var world = get_parent().find_node("World")

func _physics_process(delta):
	add_central_force(Vector3(world.global_translation - global_translation).normalized() * 9.8)
