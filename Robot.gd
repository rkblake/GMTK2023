extends Spatial

onready var anim_player = $robot_PuttIntro1.find_node("AnimationPlayer")
onready var ball = get_parent().find_node("Ball")

func _ready():
	play()

func play(anim: String = "Take 001") -> void:
	anim_player.play(anim)
	yield(get_tree().create_timer(1.2), "timeout")
	ball.hit_ball(Vector3.FORWARD * 20)

func hit_ball():
	ball.hit_ball(Vector3.UP * 20)
