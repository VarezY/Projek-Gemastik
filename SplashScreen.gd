extends Control

onready var Anime = $AnimationPlayer

func _ready():
	Anime.play("Splash")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Splash":
		Anime.play("Splash2")
	elif anim_name == "Splash2":
		get_tree().change_scene("res://MainMenu.tscn")
