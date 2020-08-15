extends Control

var LeveltoLoad
var Buttons 

func _ready():
	for button in get_tree().get_nodes_in_group("Buttons"):
		button.connect("pressed", self, "_on_Button_pressed", [button.levelTujuan])
		

func _on_Button_pressed(level):
	get_tree().change_scene(level)
