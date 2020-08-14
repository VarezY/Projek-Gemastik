extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Down":
		$Timer.start()
	if anim_name == "Up":
		#$AnimationPlayer.play("Idle")
		$AnimationPlayer.stop()


func _on_Timer_timeout():
	$AnimationPlayer.play("Up")
