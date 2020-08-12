extends Area2D

signal Finish

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "AndyCar":
			$Timer.start()
			emit_signal("Finish")
