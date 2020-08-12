extends Path2D

export(int) var SPEED = 300

onready var trainHead = $TrainFollow/Train/YSort/Head
onready var trainHeadAnime = $TrainFollow/Train/YSort/Head/AnimatedSprite
onready var trainBody1 = $TrainFollow/Train/YSort/Body1
onready var trainBodyAnime1 = $TrainFollow/Train/YSort/Body1/AnimatedSprite
onready var trainBody2 = $TrainFollow/Train/YSort/Body2
onready var trainBodyAnime2 = $TrainFollow/Train/YSort/Body2/AnimatedSprite
onready var trainBody3 = $TrainFollow/Train/YSort/Body3
onready var trainBodyAnime3 = $TrainFollow/Train/YSort/Body3/AnimatedSprite

var curves
var points
var tujuan_kereta
var direction

var kereta = [trainHead, trainBody1]
var velocity = Vector2()
var i = 0

func _ready():
	curves = get_curve()
	points = curves.get_point_count()

func _process(delta):
	if i < points:
		var point_position = curves.get_point_position(i)
		Moving(trainHead, point_position)
		trainBody1.move_and_slide(velocity)
		trainBody2.move_and_slide(velocity)
		trainBody3.move_and_slide(velocity)
		trainHead.move_and_slide(velocity)
		AnimeTrain()
	trainHeadAnime.play(direction)

func Moving(bagiankereta, position : Vector2):
	tujuan_kereta = bagiankereta.global_position.direction_to(position)
	velocity = tujuan_kereta * SPEED
	if bagiankereta.global_position.distance_to(position) < 20:
		i += 1
	
	
func AnimeTrain():
	if tujuan_kereta.x > 0 and tujuan_kereta.y > 0:
		direction = "SE"
	elif tujuan_kereta.x < 0 and tujuan_kereta.y < 0:
		direction = "NW"
	elif tujuan_kereta.x > 0 and tujuan_kereta.y < 0:
		direction = "NE"
	elif tujuan_kereta.x < 0 and tujuan_kereta.y > 0:
		direction = "SW"
	else:
		direction = "SW"
