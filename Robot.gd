extends Spatial

onready var anim_player = $robot_PuttIntro1.find_node("AnimationPlayer")
export var ball_path: NodePath; onready var ball = get_node(ball_path)

func _ready():
	play()

func play(anim: String = "Take 001") -> void:
	anim_player.play(anim)
	yield(get_tree().create_timer(1.2), "timeout")
	if ball:
		ball.hit_ball(Vector3.FORWARD * 20)

func hit_ball():
	ball.hit_ball(Vector3.UP * 20)
