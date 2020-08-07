extends Path2D

const SPEED = 150

onready var follow = $PathFollow2D
onready var Andy = $PathFollow2D/Andy
var tween
var mobil_state = true
var direction
var motion = Vector2()
var curves
var points
var car_Andy
var i = 0

func _ready():
	$PathFollow2D.set_offset(0)
	
	curves = get_curve()
	
	points = curves.get_point_count()
	#print(curves.get_point_position(9))
	
func _process(delta):
	#print($PathFollow2D/Andy.global_rotation_degrees)
	
	#if mobil_state:
	#	tween.resume_all()
	#elif !mobil_state:
	#	tween.stop_all()
	if i < points:
		var point_position = curves.get_point_position(i)
		car_Andy = $PathFollow2D/Andy.global_position.direction_to(point_position)
		motion = car_Andy * SPEED
		if $PathFollow2D/Andy.global_position.distance_to(point_position) < 20 :
			i += 1
		Andy.move_and_slide(motion)
		AnimationCar()
		#print(direction)
	$PathFollow2D/Andy/AnimatedSprite.play(direction)
	
func AnimationCar():
	if car_Andy.x  > 0 and car_Andy.y > 0:
		direction = "SE"
	elif car_Andy.x  < 0 and car_Andy.y < 0:
		direction = "NW"
	elif car_Andy.x > 0 and car_Andy.y < 0:
		direction ="NE"
	elif car_Andy.x < 0 and car_Andy.y > 0:
		direction = "SW"
	else:
		direction = "Idle"


func _on_Stop_toggled(button_pressed):
	if button_pressed:
		set_process(false)
	else:
		set_process(true)
