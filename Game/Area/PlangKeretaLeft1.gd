extends Sprite



func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Down":
		$Timer.start()
	if anim_name == "Up":
		#$AnimationPlayer.play("Idle")
		$AnimationPlayer.stop()


func _on_Timer_timeout():
	$AnimationPlayer.play("Up")
	$Danger2/CollisionPolygon2D.disabled = true
