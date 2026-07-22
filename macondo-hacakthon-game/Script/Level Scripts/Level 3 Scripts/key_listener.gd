extends Sprite2D

@onready var falling_key = preload("res://Scenes/Level Scenes/Level 3 Scenes/falling_key.tscn")
@onready var score_text = preload("res://Scenes/Level Scenes/Level 3 Scenes/score_press_text.tscn")
@export var key_name: String = ""

var falling_key_queue = []

var perfect_press_threshold: float = 30
var great_press_threshold: float = 50
var good_press_threshold: float = 60
var ok_press_threshold: float = 80

var perfect_press_score = 250
var great_press_score = 100 
var good_press_score = 50
var ok_press_score = 20

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if falling_key_queue.size() > 0:
		if falling_key_queue.front().has_passed:
			falling_key_queue.pop_front()
			
			var st_inst = score_text.instantiate()
			get_tree().get_root().call_deferred("add_child", st_inst)
			st_inst.SetTextInfo("MISS")
			st_inst.global_position = global_position + Vector2(0, -20)
			
		if Input.is_action_just_pressed(key_name):
			var key_to_pop = falling_key_queue.pop_front()
			
			var distance_from_pass = abs(key_to_pop.pass_threshold - key_to_pop.global_position.y)
			
			var press_score_text: String = ""
			if distance_from_pass < perfect_press_threshold:
				Level3Signals.IncrementScore.emit(perfect_press_score)
				press_score_text = "PERFECT"
			elif distance_from_pass < great_press_threshold:
				Level3Signals.IncrementScore.emit(great_press_score)
				press_score_text = "GREAT"
			elif distance_from_pass < good_press_threshold:
				Level3Signals.IncrementScore.emit(good_press_score)
				press_score_text = "GOOD"
			elif distance_from_pass < ok_press_threshold:
				Level3Signals.IncrementScore.emit(ok_press_score)
				press_score_text = "OK"
			else:
				press_score_text = "MISS"
				
			
			key_to_pop.queue_free()
			
			var st_inst = score_text.instantiate()
			get_tree().get_root().call_deferred("add_child", st_inst)
			st_inst.SetTextInfo(press_score_text)
			st_inst.global_position = global_position + Vector2(0, -20)
	
	

func CreateFallingKey():
	var fk_inst = falling_key.instantiate()
	get_tree().get_root().call_deferred("add_child", fk_inst)
	fk_inst.Setup(position.x, frame + 4)

	falling_key_queue.push_back(fk_inst)


func _on_random_spawm_timer_timeout():
	CreateFallingKey()
	$RandomSpawmTimer.wait_time = randf_range(0.4, 3)
	$RandomSpawmTimer.start()
