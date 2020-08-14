extends Node
class_name Level

export(int) var Points 
export(String, FILE, "*.tscn") var level

onready var Circle = $GUI/Circle
onready var CarAndy = $Node2D/YSort/Andy/AndyPath/AndyCar
onready var Layout = $GUI/Layout
onready var Pause = $GUI/Layout/Pause
onready var StarProggress = $GUI/Layout/NextLevel/TextureProgress
onready var labelPoints = $GUI/Layout/NextLevel/Label

var totalPoints : float
var proggress = 50

func _ready():
	totalPoints = Points
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
	get_tree().paused = false
	get_tree().change_scene("res://MainMenu.tscn")

func _on_GUI_ButtonNext():
	Circle.nextLevel()
	
func _on_GUI_CircleNext():
	get_tree().change_scene(level)

func _on_GUI_ButtonSign():
	$GUI/Layout/Sign/AnimationPlayer.play("Down")
	get_tree().paused = false

func _on_GUI_SignDown():
	$GUI/Layout.visible = false

func _on_Finish_Finish():
	CarAndy.set_collision_layer_bit(0, false)
	CarAndy.set_collision_mask_bit(0, false)
	var proggress = round((Points / totalPoints) * 100)
	StarProggress.value = proggress
	$Node2D/YSort/Andy/AndyPath/AndyCar/Pivot/CameraOffset/Camera2D._set_current(false)
	labelPoints.set_text(str(proggress ," / 100"))

func _on_Finish_TimeOut():
	showLayout()
	$GUI/Layout/NextLevel.visible = true
	$GUI/Layout/Kecelakaan.visible = false
	
func showLayout():
	$GUI/Layout.visible = true
