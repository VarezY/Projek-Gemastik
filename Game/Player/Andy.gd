extends Path2D

export(int) var MaksimalKecepatan = 150

onready var AndyCar = $AndyPath/AndyCar
onready var CarAnime = $AndyPath/AndyCar/AnimatedSprite
onready var CameraAndy = $AndyPath/AndyCar/Pivot

signal Tabrakan

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
	if not rem:
		if i < points:
			var point_position = curves.get_point_position(i)
			start += ACC
			Moving(point_position)
			AnimeCar()
		CarAnime.play(direction)
	else:
		velocity.x = lerp(velocity.x, 0, 0.05)
		velocity.y = lerp(velocity.y, 0, 0.05)
	AndyCar.move_and_slide(velocity)
	for slide in AndyCar.get_slide_count():
			var collision = AndyCar.get_slide_collision(slide)
			if collision.collider.name == "Car":
				print("Tabrakan")
				emit_signal("Tabrakan")
			#print("I collided with ", collision.collider.name)
	
func Moving(position : Vector2):
	tujuan_Mobil = AndyCar.global_position.direction_to(position)
	
	velocity = tujuan_Mobil * min(MaksimalKecepatan, start)
	if AndyCar.global_position.distance_to(position) < 20:
		i += 1
	
	
func AnimeCar():
	if tujuan_Mobil.x > 0 and tujuan_Mobil.y > 0:
		direction = "SE"
		CameraAndy.rotation_degrees = 30
	elif tujuan_Mobil.x < 0 and tujuan_Mobil.y < 0:
		direction = "NW"
		CameraAndy.rotation_degrees = -150
	elif tujuan_Mobil.x > 0 and tujuan_Mobil.y < 0:
		direction = "NE"
		CameraAndy.rotation_degrees = -30
	elif tujuan_Mobil.x < 0 and tujuan_Mobil.y > 0:
		direction = "SW"
		CameraAndy.rotation_degrees = 150
	else:
		direction = "SW"
