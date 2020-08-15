extends Node
class_name Level

export(int) var currentLevel
export(int) var Points 
export(String, FILE, "*.tscn") var level

onready var Circle = $GUI/Circle
onready var CarAndy = $Node2D/YSort/Andy/AndyPath/AndyCar
onready var Layout = $GUI/Layout
onready var Pause = $GUI/Layout/Pause
onready var StarProggress = $GUI/Layout/NextLevel/TextureProgress
onready var labelPoints = $GUI/Layout/NextLevel/Label
onready var starTween = $GUI/Layout/NextLevel/Tween

var totalPoints : float
var proggress = 0
var state
enum STATE {LOCKED, UNLOCKED}
enum STATELEVEL {FINISH, NOTFINISH}
var currentPoints = 0

func _ready():
	totalPoints = Points
	get_tree().paused = false
	Circle.visible = true
	Layout.visible = false
	Circle.loadLevel()
	load_game()
	print(currentPoints)
	
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
	proggress = round((Points / totalPoints) * 100)
	#StarProggress.value = proggress
	$Node2D/YSort/Andy/AndyPath/AndyCar/Pivot/CameraOffset/Camera2D._set_current(false)
	labelPoints.set_text(str(proggress ," / 100"))

func _on_Finish_TimeOut():
	showLayout()
	$GUI/Layout/NextLevel.visible = true
	#var i = 0
	starTween.interpolate_property($GUI/Layout/NextLevel/TextureProgress, 'value', 0, proggress, 2, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	starTween.start()
	yield(starTween, "tween_completed")
	state = STATELEVEL.FINISH
	if proggress > currentPoints:
		save_game()
	
func showLayout():
	$GUI/Layout.visible = true

func save():
	var save_dict = {
		"level" : currentLevel,
		"proggress" : proggress,
		"status" : state
	}
	return save_dict

func save_game():
	var save_game = File.new()
	save_game.open("user://savegame.save", File.WRITE)
	var save_nodes = get_tree().get_nodes_in_group("Persist")
	for node in save_nodes:
		#node.queue_free()
		if node.filename.empty():
			print("persistent node '%s' is not an instanced scene, skipped" % node.name)
			continue
		var node_data = node.call("save")
		save_game.store_line(to_json(node_data))
	save_game.close()

func load_game():
	var save_game = File.new()
	if not save_game.file_exists("user://savegame.save"):
		print("Save Files do not Exist!")
		return
	save_game.open("user://savegame.save", File.READ)
	while save_game.get_position() < save_game.get_len():
		var node_data = parse_json(save_game.get_line())
		if node_data["level"] == currentLevel:
			currentPoints = node_data["proggress"]
		pass
	save_game.close()
