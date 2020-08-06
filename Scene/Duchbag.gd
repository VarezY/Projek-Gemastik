extends Path2D

onready var follow = $PathFollow2D
var tween
var mobil_state = true

func _ready():
	set_process(true)
	tween = Tween.new()
	add_child(tween)
	tween.interpolate_property(follow, "unit_offset", 0, 1, 12,
	 tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
