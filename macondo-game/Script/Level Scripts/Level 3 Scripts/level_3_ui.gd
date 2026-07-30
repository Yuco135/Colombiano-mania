extends Control

var score: int = 0
var combo_count: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	Level3Signals.IncrementScore.connect(IncrementScore)
	Level3Signals.IncrementCombo.connect(IncrementCombo)
	Level3Signals.ResetCombo.connect(ResetCombo)
	
	ResetCombo()

func IncrementScore(incr: int):
	score += incr
	%ScoreLabel.text = " " + str(score) + " pts"

func IncrementCombo():
	combo_count += 1
	%ComboLabel.text = " " + str(combo_count) + "x combo"

func ResetCombo():
	combo_count = 0
	%ComboLabel.text = ""




func _on_timer_timeout() -> void:
	var time_left = 155
	%RichTextLabel.text - "Time Left: %d" % time_left
	print(time_left)
	time_left -= 1
