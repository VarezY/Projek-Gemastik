extends Level

onready var SS = $GUI/Circle
onready var Sign1 = $Node2D/Sign1
onready var Sign2 = $Node2D/YSort/Sign2
onready var Sign3 = $Node2D/YSort/Sign3
onready var Sign4 = $Node2D/Sign4
onready var AndyCar = $Node2D/YSort/Andy
onready var showcase = $GUI/Layout/Sign/HBoxContainer/TextureRect


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
