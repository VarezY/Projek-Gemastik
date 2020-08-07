extends Path2D

export var Speed : int
onready var follow = $Cars
var tween
var start = false

func Animate(Time):
	tween = Tween.new()
	add_child(tween)
	tween.interpolate_property(follow, "unit_offset", 0, 1, Time,
	 tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()

