extends Node

onready var SFX = $"/root/SoundEffect"

var Buttons

# Called when the node enters the scene tree for the first time.
func CallGroup():
	Buttons = get_tree().get_nodes_in_group("Buttons")
	for button in Buttons:
		button.connect("button_down", self, "_on_Button_button_down")
		button.connect("button_up", self, "_on_Button_button_up")

func _on_Button_button_up():
	SFX.get_node("ClickUp").play()


func _on_Button_button_down():
	SFX.get_node("ClickDown").play()
