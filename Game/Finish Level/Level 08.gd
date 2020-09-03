extends Level

var reload = true
var Signs

func _ready():
	
	Signs = get_tree().get_nodes_in_group("Sign")
	for S in Signs:
		S.connect("pressed", self, "_on_Button_pressed", [S.PenjelasanRambu, S.get_normal_texture()])
	
	var Lampu = get_tree().get_nodes_in_group("LampuLL")
	for L in Lampu:
		L.play()
	

	
func _on_GUI_ButtonCarGo():
	#Stop.disabled = true
	SFX.StartEngine()
	Andy.start = 0
	Andy.rem = false


func _on_GUI_ButtonCarStop():
	#Stop.disabled = false
	SFX.StopEngine()
	Andy.rem = true


func _on_GUI_CircleLoad():
	pass # Replace with function body.

func _on_Button_pressed(penjelasan, textur):
	$GUI/Layout/Sign/HBoxContainer/Label.set_text(penjelasan)
	showLayout()
	$GUI/Layout/Sign.visible = true
	$GUI/Layout/Sign/AnimationPlayer.play("Up")
	get_tree().paused = true
	showcase.set_texture(textur)


func _on_Trigger_Trigger():
	$Node2D/Plang1/AnimationPlayer.play("Down")
	$Node2D/Plang2/AnimationPlayer.play("Down")
	var trains = get_tree().get_nodes_in_group("Train")
	for train in trains:
		train.startTweeen()


func _on_Plang1_pelanggaran():
	pass # Replace with function body.
