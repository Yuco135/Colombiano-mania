extends Node2D


func _on_level_1_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Level Scenes/Level 1 Scenes/level_1_collect.tscn")


func _on_level_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Level Scenes/Level 2 Scenes/level_2_football.tscn")


func _on_level_3_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Level Scenes/Level 3 Scenes/level_3_dance.tscn")


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
