extends Level


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	#$Node2D/YSort/Andy/AndyPath/AndyCar.set_collision_layer_bit(0, false)
	#$Node2D/YSort/Andy/AndyPath/AndyCar.set_collision_mask_bit(0, false)
	
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_GUI_ButtonCarGo():
	$Node2D/Area2D/Stop.disabled = true
	$Node2D/YSort/Andy.set_process(true)


func _on_GUI_ButtonCarStop():
	$Node2D/YSort/Andy.set_process(false)


func _on_GUI_CircleLoad():
	print("Anime LoadLevel Selesai")

func _on_Andy_Tabrakan():
	print("Tabrakan")
