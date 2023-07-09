extends Spatial

export var next_scene : String

func _on_Area_body_entered(_body):
	$Confetti.play()
	$BallDrop.play()
	yield(get_tree().create_timer(1), "timeout")
#	$YaySound.play()
	$Win.play()
	yield(get_tree().create_timer(3), "timeout")
	get_tree().change_scene("res://" + next_scene + ".tscn")
