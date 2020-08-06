extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		print(body.name)
