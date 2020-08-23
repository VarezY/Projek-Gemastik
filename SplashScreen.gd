extends Control

onready var Music = $"/root/BackgroundMusic"
onready var SaveLoad = $"/root/SaveLoad"
onready var Anime = $AnimationPlayer

var settings

func _ready():
	Anime.play("Splash")
	settings = SaveLoad.load_setting()
	Music.volume_db = settings["Audio"]["BGM"] - 100

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Splash":
		Music.play()
		Anime.play("Splash2")
	elif anim_name == "Splash2":
		get_tree().change_scene("res://MainMenu.tscn")
