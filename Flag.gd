extends Spatial

export var next_scene : String

func _on_Area_body_entered(body):
	$Confetti.play()
	yield(get_tree().create_timer(3), "timeout")
	get_tree().change_scene("res://" + next_scene + ".tscn")
