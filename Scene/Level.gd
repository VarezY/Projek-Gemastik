extends Node2D

onready var car1 = $YSort/Car1
onready var Andy = $"YSort/Andy'sPath"

func _ready():
	$Circle_out.visible = true
	$Circle_out.fade_in()
	car1.set_process(false)
	Andy.set_process(false)
	
	
func _on_Circle_out_fade_finished():
	car1.Animate(car1.Speed)
	Andy.set_process(true)


func _on_Cars_Tabrakan():
	$Pause.visible = true
	get_tree().paused = true


func _on_Pause_reset():
	print("Reset again")
	get_tree().reload_current_scene()
