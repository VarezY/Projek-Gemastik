extends Path2D

class_name Ambulance

export(int) var MaksimalKecepatan = 150

onready var car = $AmbulancePath/Ambulance
onready var caranime = $AmbulancePath/Ambulance/AnimatedSprite
onready var carRay = $AmbulancePath/Ambulance/RayCast2D

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
	set_process(true)
	curves = get_curve()
	points = curves.get_point_count()

func _process(delta):
	if carRay.is_colliding():
		rem = true
	else:
		rem = false
	if !rem:
		if i < points:
			var point_position = curves.get_point_position(i)
			start += ACC
			Moving(point_position)
			AnimeCar()
		else:
			set_process(false)
	else:
		start = 0
		velocity.x = lerp(velocity.x, 0, 0.2)
		velocity.y = lerp(velocity.y, 0, 0.2)
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
		carRay.rotation_degrees = 30
	elif tujuan_Mobil.x < 0 and tujuan_Mobil.y < 0:
		direction = "NW"
		carRay.rotation_degrees = -150
	elif tujuan_Mobil.x > 0 and tujuan_Mobil.y < 0:
		direction = "NE"
		carRay.rotation_degrees = -30
	elif tujuan_Mobil.x < 0 and tujuan_Mobil.y > 0:
		direction = "SW"
		carRay.rotation_degrees = 150
	else:
		direction = "SW"
