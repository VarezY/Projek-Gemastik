extends Path2D
class_name Police

export(int) var MaksimalKecepatan = 150

onready var car = $PoliceCar/Police
onready var caranime = $PoliceCar/Police/AnimatedSprite

var curves
var points
var tujuan_Mobil
var direction

var start = MaksimalKecepatan + 1
var ACC = 4
var velocity = Vector2()
var i = 0
var rem : bool = false

func _ready():
	curves = get_curve()
	points = curves.get_point_count()

func _process(delta):
	if i < points:
		var point_position = curves.get_point_position(i)
		start += ACC
		Moving(point_position)
		AnimeCar()
	else:
		set_process(false)
	caranime.play(direction)
	car.move_and_slide(velocity)
	
func Moving(position : Vector2):
	tujuan_Mobil = car.global_position.direction_to(position)
	velocity = tujuan_Mobil * min(MaksimalKecepatan, start)
	if car.global_position.distance_to(position) < 20:
		i += 1
	
	
func AnimeCar():
	if tujuan_Mobil.x > 0 and tujuan_Mobil.y > 0:
		direction = "SE"
	elif tujuan_Mobil.x < 0 and tujuan_Mobil.y < 0:
		direction = "NW"
	elif tujuan_Mobil.x > 0 and tujuan_Mobil.y < 0:
		direction = "NE"
	elif tujuan_Mobil.x < 0 and tujuan_Mobil.y > 0:
		direction = "SW"
	else:
		direction = "SW"
