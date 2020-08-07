extends Sprite


signal fade_finished

func fade_in():
	$AnimationPlayer.play("Load_level")

func _on_AnimationPlayer_animation_finished(anim_name):
	emit_signal("fade_finished")



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
