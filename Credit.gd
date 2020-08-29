extends Control

onready var SFXButton = $"/root/SfxButton"


func _ready():
	SFXButton.CallGroup()
	pass

func _on_TextureButton_pressed():
	get_tree().change_scene("res://Setting.tscn")
