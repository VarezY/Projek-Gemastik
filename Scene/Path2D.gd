extends Path2D


onready var follow = $PathFollow2D
var tween
var mobil_state = true

func _ready():
	set_process(true)
	tween = Tween.new()
	add_child(tween)
	tween.interpolate_property(follow, "unit_offset", 0, 1, 10,
	 tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	
func _process(delta):
	print($PathFollow2D/Andy.global_rotation_degrees)
	
	if mobil_state:
		tween.resume_all()
	elif !mobil_state:
		tween.stop_all()
	
func _on_TextureButton_toggled(button_pressed):
	if button_pressed:
		mobil_state = false
	else:
		mobil_state = true
