extends Control

onready var Circle = $Circle
var buttons = []
var scene_path_to_load

func _ready():
	buttons = $Center/ButtonsTop.get_children() + $Center/ButtonsDown.get_children()
	
	for button in buttons:
		button.connect("pressed", self, "_on_Button_pressed", [button.scene_to_load])
	
func Animate():
	Circle.visible = true
	Circle.fade_in()

func _on_Button_pressed(scene_to_load):
	scene_path_to_load = scene_to_load
	Animate()

func _on_Circle_fade_finished():
	get_tree().change_scene(scene_path_to_load)

