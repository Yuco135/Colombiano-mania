extends Area2D

signal coin_collected

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		emit_signal("coin_collected")
		queue_free()
