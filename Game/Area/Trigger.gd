extends Area2D

signal Trigger

var masuk : bool = true

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if masuk:
			emit_signal("Trigger")
			masuk = false
