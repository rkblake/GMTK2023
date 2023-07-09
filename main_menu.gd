extends Control



func _on_Start_pressed():
	get_tree().change_scene("res://World1.tscn")


func _on_Quit_pressed():
	get_tree().quit(0)


func _on_Options_pressed():
	$Options.popup()


func _on_Credits_pressed():
	$Credits.popup()


func _on_MuteCheckbox_toggled(button_pressed):
	AudioServer.set_bus_mute(0, button_pressed)
