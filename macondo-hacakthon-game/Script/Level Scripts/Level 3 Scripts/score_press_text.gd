extends Control

#Perfect color: d3b039
#Great Color: 9c2bd8
#Good Color: 58a6fa
#Ok color: 63d876
#Miss color: 858684

func SetTextInfo(text: String):
	$ScoreLevelText.text = "[center]" + text
	
	match text:
		"PERFECT":
			$ScoreLevelText.set("theme_override_colors/default_color", Color("e0bc43ff"))
		"GREAT":
			$ScoreLevelText.set("theme_override_colors/default_color", Color("b859f3ff"))
		"GOOD":
			$ScoreLevelText.set("theme_override_colors/default_color", Color("58a6fa"))
		"OK":
			$ScoreLevelText.set("theme_override_colors/default_color", Color("75ef88ff"))
		_:
			$ScoreLevelText.set("theme_override_colors/default_color", Color("a9aaa8ff"))
