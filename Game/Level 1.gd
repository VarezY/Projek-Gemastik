extends Level

onready var SS = $GUI/Circle
onready var Sign1 = $Node2D/Sign1
onready var Sign2 = $Node2D/Sign2
onready var Sign3 = $Node2D/Sign3
onready var Sign4 = $Node2D/Sign4
onready var AndyCar = $Node2D/YSort/Andy
onready var showcase = $GUI/Layout/Sign/HBoxContainer/TextureRect
onready var Danger1 = $Node2D/Danger1/CollisionPolygon2D

func _ready():
	$Node2D/Lampu1.play()
	$Node2D/Lampu2.play()
	$Node2D/YSort/TrainPath2.tween.stop_all()
	$GUI/Layout/NextLevel/TextureProgress.get_value()

func _on_GUI_CircleLoad():
	
	print("Anime LoadLevel Selesai")

func _on_GUI_ButtonCarStop():
	AndyCar.rem = true

func _on_GUI_ButtonCarGo():
	AndyCar.start = 0
	AndyCar.rem = false
	pass

func _on_Sign1_pressed():
	SignExplanation(Sign1.PenjelasanRambu)
	changeTexture(Sign1.get_normal_texture())

func _on_Sign2_pressed():
	SignExplanation(Sign2.PenjelasanRambu)
	changeTexture(Sign2.get_normal_texture())

func SignExplanation(text : String):
	$GUI/Layout/Sign/HBoxContainer/Label.set_text(text)
	showLayout()
	$GUI/Layout/Sign.visible = true
	$GUI/Layout/Sign/AnimationPlayer.play("Up")
	get_tree().paused = true

func changeTexture(signTexture : Texture):
	showcase.set_texture(signTexture)

func _on_Andy_Tabrakan():
	get_tree().paused = true
	showLayout()
	$GUI/Layout/Kecelakaan.visible = true
	

func _on_Sign3_pressed():
	SignExplanation(Sign3.PenjelasanRambu)
	changeTexture(Sign3.get_normal_texture())


func _on_Sign4_pressed():
	SignExplanation(Sign4.PenjelasanRambu)
	changeTexture(Sign4.get_normal_texture())


func _on_Danger1_Pelanggaran():
	Points -= 1


func _on_Lampu1_frame_changed():
	if $Node2D/Lampu1.get_frame() < 6:
		Danger1.disabled = true
		$Node2D/Danger1.visible = false
	else:
		Danger1.disabled = false
		$Node2D/Danger1.visible = true


func _on_Trigger_Trigger():
	$Node2D/PlangKereta/AnimationPlayer.play("Down")
	$Node2D/PlangKereta2/AnimationPlayer.play("Down")
	$Node2D/YSort/TrainPath2.tween.resume_all()


func _on_Danger2_Pelanggaran():
	Points -= 1


