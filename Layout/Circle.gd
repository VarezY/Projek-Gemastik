extends TextureRect

signal loadLevel
signal next

onready var Anime = $AnimationPlayer

func loadLevel():
	Anime.play("load_Level")
	
func nextLevel():
	Anime.play("next_Level")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "load_Level":
		emit_signal("loadLevel")
	elif anim_name == "next_Level":
		emit_signal("next")
