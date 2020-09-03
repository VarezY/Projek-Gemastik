extends Path2D
class_name CarD
export(int) var SPEED = 15
var tween

func _ready():
	tween = Tween.new()
	add_child(tween)
	tween.interpolate_property($PathFollow2D, "unit_offset", 0, 1, SPEED, tween.TRANS_LINEAR, tween.EASE_IN_OUT)
	tween.set_repeat(false)

func startTweeen():
	tween.start()
