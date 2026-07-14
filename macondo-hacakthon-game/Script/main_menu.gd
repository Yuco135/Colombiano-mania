extends Node2D

func _on_start_pressed():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")

func _on_levels_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Levels/level_1_collect.tscn")

func _on_quit_pressed():
	get_tree().quit()
