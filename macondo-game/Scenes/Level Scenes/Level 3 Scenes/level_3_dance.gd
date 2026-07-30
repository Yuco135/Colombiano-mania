extends Node2D

var time_remaining = 148

func _on_ending_timeout() -> void:
	if time_remaining == 0:
		get_tree().change_scene_to_file("res://macondo-game/Scenes/main_menu.tscn")
	print(time_remaining)
	time_remaining -= 1
