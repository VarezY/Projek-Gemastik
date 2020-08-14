extends Area2D
class_name Danger

signal Pelanggaran
var entered = false

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "AndyCar" and !entered:
			emit_signal("Pelanggaran")
			entered = true
