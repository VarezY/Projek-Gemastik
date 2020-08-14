extends Area2D

signal Finish
signal TimeOut

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "AndyCar":
			$Timer.start()
			emit_signal("Finish")


func _on_Timer_timeout():
	emit_signal("TimeOut")
