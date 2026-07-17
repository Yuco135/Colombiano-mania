extends Node2D

var score = 0 
var total_coins = 0
@onready var score_label = $Player/Label

var time_left = 30

func _ready():
	for child in $Coins.get_children():
		if child.has_signal("coin_collected"):
			child.coin_collected.connect(_on_coin_collected)
			total_coins += 1 
			
func _on_coin_collected():
	score += 1 
	if score == total_coins: 
		print("You win")
		get_tree().change_scene_to_file("res://Scenes/Level Scenes/win_screen_lv1.tscn")
	score_label.text = "Coffee: %d/10" % score 


func _on_game_timer_timeout() -> void:
	$Player/Timer.text = "Time Left: %d" % time_left
	if time_left == 0:
		get_tree().change_scene_to_file("res://lose_screen_lv_1.tscn")
	print(time_left)
	time_left -= 1
