extends Path2D
class_name Kereta
#=-=-=-=-=-=-=-=
var tween
#=-=-=-=-=-=-=-=

func followPath(time : int):
	tween = Tween.new()
	add_child(tween)
	tween.interpolate_property($TrainFollow, "unit_offset", 0, 1, time, tween.TRANS_LINEAR, tween.EASE_IN_OUT)
	tween.set_repeat(false)
	tween.start()



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
