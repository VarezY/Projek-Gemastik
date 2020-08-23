extends Control

onready var dict = $"/root/Rambu".rambu_dict
onready var left = $NinePatchRect/VBoxContainer/HBoxContainer/Left
onready var middle = $NinePatchRect/VBoxContainer/HBoxContainer/Main
onready var right = $NinePatchRect/VBoxContainer/HBoxContainer/Right
onready var text = $NinePatchRect/VBoxContainer/CenterContainer/TextureRect/Info

var pointer = 3
var size

func _ready():
	size = dict.size() - 1
	rambuChange()

func _on_Kembali_pressed():
	get_tree().change_scene("res://MainMenu.tscn")


func _on_RightButton_pressed():
	pointer += 1
	rambuChange()


func _on_LeftButton_pressed():
	pointer -= 1
	rambuChange()

func rambuChange():
	left.texture = dict[(pointer-1) % size]["Texture"]
	middle.texture = dict[pointer % size]["Texture"]
	right.texture = dict[(pointer+1) % size]["Texture"]
	text.text = dict[pointer % size]["Text"]
