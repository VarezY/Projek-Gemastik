extends Node
class_name KeretaApi
#=-=-=-=-=-=-=-=
var tween
#=-=-=-=-=-=-=-=

func _ready():
	tween = Tween.new()
	add_child(tween)
	tween.interpolate_property($TrainFollow, "unit_offset", 0, 1, 12, tween.TRANS_LINEAR, tween.EASE_IN_OUT)
	tween.set_repeat(false)
	tween.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
