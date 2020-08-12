extends Level

onready var SS = $GUI/Circle
onready var Sign1 = $Node2D/YSort/Sign1
onready var Sign2 = $Node2D/YSort/Sign2
onready var AndyCar = $Node2D/YSort/Andy

func _ready():
	pass

func _on_GUI_CircleLoad():
	print("Anime LoadLevel Selesai")

func _on_GUI_ButtonCarStop():
	AndyCar.rem = true
	pass

func _on_GUI_ButtonCarGo():
	AndyCar.start = 0
	AndyCar.rem = false
	pass

func _on_Sign1_pressed():
	SignExplanation(Sign1.PenjelasanRambu)

func _on_Sign2_pressed():
	SignExplanation(Sign2.PenjelasanRambu)

func SignExplanation(text : String):
	$GUI/Layout/Sign/HBoxContainer/Label.set_text(text)
	showLayout()
	$GUI/Layout/Sign.visible = true
	$GUI/Layout/Sign/AnimationPlayer.play("Up")
	get_tree().paused = true


func _on_Finish_Finish():
	$Node2D/YSort/Andy/AndyPath/AndyCar/Pivot/CameraOffset/Camera2D._set_current(false)

func showLayout():
	$GUI/Layout.visible = true


func _on_Timer_timeout():
	showLayout()
	$GUI/Layout/NextLevel.visible = true
	
