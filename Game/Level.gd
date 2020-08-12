extends Node
class_name Level

export(String, FILE, "*.tscn") var level

onready var Circle = $GUI/Circle
onready var Layout = $GUI/Layout
onready var Pause = $GUI/Layout/Pause

func _ready():
	get_tree().paused = false
	Circle.visible = true
	Layout.visible = false
	Circle.loadLevel()
	
func _on_GUI_ButtonPause():
	get_tree().paused = true
	Layout.visible = true
	Pause.visible = true
	
func _on_GUI_ButtonContinue():
	get_tree().paused = false
	Layout.visible = false
	Pause.visible = false

func _on_GUI_ButtonRestart():
	get_tree().reload_current_scene()

func _on_GUI_ButtonHome():
	print("Go Home")

func _on_GUI_ButtonNext():
	Circle.nextLevel()
	
func _on_GUI_CircleNext():
	get_tree().change_scene(level)

func _on_GUI_ButtonSign():
	$GUI/Layout/Sign/AnimationPlayer.play("Down")
	get_tree().paused = false

func _on_GUI_SignDown():
	$GUI/Layout.visible = false
