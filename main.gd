extends Node2D

var isMatch = false
func _ready():
	$Player/fire.emitting = false
	$Player/fire/PointLight2D.hide()
	$chest/Sprite2D.region_rect = Rect2(204, 14, 41, 28)

func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and isMatch == false:
		$Player/fire.emitting = true
		$matchTimer.start()
		Global.matches -= 1
		isMatch = true
		if $Player/fire.emitting == true:
			$Player/fire/PointLight2D.show()
		else:
			$Player/fire/PointLight2D.hide()
		
	
	if Global.matches == 0:
		get_tree().paused = true


func _on_match_timer_timeout():
	$Player/fire.emitting = false
	$Player/fire/PointLight2D.hide()
	isMatch = false
