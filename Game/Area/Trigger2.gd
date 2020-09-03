extends Area2D


# Declare member variables here. Examples:

signal Trigger

var masuk : bool = true

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "AndyCar" and masuk:
			emit_signal("Trigger")
			masuk = false
