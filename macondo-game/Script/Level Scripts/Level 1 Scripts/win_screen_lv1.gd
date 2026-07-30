extends Control

func _on_return_to_world_pressed() -> void:
	get_tree().change_scene_to_file("res://macondo-game/Scenes/main_menu.tscn")


func _on_retry_pressed() -> void:
	get_tree().change_scene_to_file("res://macondo-game/Scenes/Level Scenes/Level 1 Scenes/level_1_collect.tscn")



func _on_quit_pressed() -> void:
	get_tree().quit()
