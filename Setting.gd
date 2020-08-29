extends Control

onready var Music = $"/root/BackgroundMusic"
onready var Effect = $"/root/SoundEffect"
onready var SFXButtons = $"/root/SfxButton"

onready var SaveLoad = $"/root/SaveLoad"
onready var BGMSlide = $NinePatchRect/VBoxContainer/BGMContainer/CenterContainer/BGMSlider
onready var SFXSlide = $NinePatchRect/VBoxContainer/SFXContainer/CenterContainer/SFXSlider
onready var CarFrame = $NinePatchRect/VBoxContainer/CarContainer/Car

var settings : Dictionary
var index = 0
var BGMValue
var SFXValue
var carColor
var color = [
	{
		"Code" : "White",
		"Texture" : preload("res://Assets/Car/white_front.png")
	},
	{
		"Code" : "Red",
		"Texture" : preload("res://Assets/Car/red_front.png")
	},
	{
		"Code" : "Green",
		"Texture" : preload("res://Assets/Car/green_front.png")
	},
	{
		"Code" : "Blue",
		"Texture" : preload("res://Assets/Car/blue_front.png")
	}
]

func _ready():
	settings = SaveLoad.load_setting()
	BGMSlide.value = settings.Audio.BGM
	SFXSlide.value = settings.Audio.SFX
	SFXValue = settings.Audio.SFX
	BGMValue = settings.Audio.BGM
	carColor = settings.Car.color
	for i in range(color.size()):
		if carColor == color[i]["Code"]:
			CarFrame.texture = color[i]["Texture"]
			index = i
			pass
	SFXButtons.CallGroup()

func _on_SFXSlider_value_changed(value):
	SFXValue = value
	$NinePatchRect/VBoxContainer/SFXContainer/Label.set_text(str(value))
	Effect.setVolume((100 / value - 1) * -10)


func _on_BGMSlider_value_changed(value):
	if value == 0:
		return
	BGMValue = value
	$NinePatchRect/VBoxContainer/BGMContainer/Label.set_text(str(value))
	Music.volume_db = (100 / value - 1) * -10
	print((100 / value - 1 )* -10 )

func _on_Ok_pressed():
	SaveLoad.save_setting(false, BGMValue, SFXValue, carColor)
	get_tree().change_scene("res://MainMenu.tscn")


func _on_Next_pressed():
	index += 1
	CarFrameChange()


func CarFrameChange():
	index %= 4
	CarFrame.texture = color[index]["Texture"]
	carColor = color[index]["Code"]
	pass


func _on_Previous_pressed():
	index -= 1
	CarFrameChange()
	pass # Replace with function body.


func _on_TextureButton_pressed():
	get_tree().change_scene("res://MainMenu.tscn")


func _on_Credit_pressed():
	get_tree().change_scene("res://Credit.tscn")
