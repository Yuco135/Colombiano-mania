extends Control




func _on_return_to_world_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_world.tscn")


func _on_retry_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Level Scenes/level_1_collect.tscn")
