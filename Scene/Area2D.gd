extends Area2D

signal tabrak

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Andy":
			emit_signal("tabrak")
