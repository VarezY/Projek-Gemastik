extends Node2D


signal pelanggaran

func _on_Danger2_Pelanggaran():
	emit_signal("pelanggaran")
	
func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Down":
		$Timer.start()
		$Danger2/CollisionPolygon2D.disabled = false
	if anim_name == "Up":
		#$Danger2/CollisionPolygon2D.disabled = true
		$AnimationPlayer.stop()
		$Danger2/CollisionPolygon2D.disabled = true


func _on_Timer_timeout():
	$AnimationPlayer.play("Up")
