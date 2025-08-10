extends CharacterBody2D

var change = false

func _ready():
	$Label.text = 'so cold'

func _on_interaction_area_entered(area):
	change = true
	
func _process(delta):
	if change == true and Global.lit == true:
		if Input.is_action_just_pressed('x'):
			$Label.scale = Vector2(1,1)
			$Label.text = 'hi'
			await get_tree().create_timer(2.0).timeout
			
			$Label.scale = Vector2(.5,.5)
			$Label.text = 'thanks for the fire'
			await get_tree().create_timer(2.0).timeout
			
			$Label.scale = Vector2(1,1)
			$Label.text = 'bye'
			await get_tree().create_timer(2.0).timeout
			$Label.hide()
			$ColorRect.hide()
