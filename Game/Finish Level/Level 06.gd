extends Level

var Signs
var Buttons

# Called when the node enters the scene tree for the first time.
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


func _on_Plang_Kereta_pelanggaran():
	get_tree().paused = true
	showLayout()
	$GUI/Layout/Kecelakaan.visible = true


func _on_Trigger_body_entered(body):
	pass

func _on_Trigger_Trigger():
	$"Node2D/Plang Kereta/PlangKereta3/AnimationPlayer".play("Down")
	var trains = get_tree().get_nodes_in_group("Train")
	for train in trains:
		train.startTweeen()




func _on_Node2D_pelanggaran():
	get_tree().paused = true
	showLayout()
	$GUI/Layout/Kecelakaan.visible = true


func _on_Lampu3_frame_changed():
	if $Node2D/Lampu3.get_frame() < 6:
		$Node2D/Danger/CollisionPolygon2D.disabled = true
		$Node2D/Danger/CollisionPolygon2D2.disabled = true
		$Node2D/Danger/CollisionPolygon2D3.disabled = false
		$Node2D/Danger.visible = false
		#======================================================
	else:
		$Node2D/Danger/CollisionPolygon2D.disabled = false
		$Node2D/Danger/CollisionPolygon2D2.disabled = false
		$Node2D/Danger/CollisionPolygon2D3.disabled = true
		$Node2D/Danger.visible = true
		#======================================================


func _on_Lampu4_frame_changed():
	if $Node2D/Lampu3.get_frame() < 6:
		$Node2D/Danger2/CollisionPolygon2D.disabled = true
	else:
		$Node2D/Danger2/CollisionPolygon2D.disabled = false


func _on_Danger_Pelanggaran():
	Points -= 1


func _on_Danger2_Pelanggaran():
	Points -= 1
