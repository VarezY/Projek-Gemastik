extends Node
class_name Level

export(int) var currentLevel
export(int) var Points 
export(String, FILE, "*.tscn") var level

onready var SFX = $"/root/SoundEffect"
onready var SaveLoad = $"/root/SaveLoad"
onready var Andy = $Node2D/YSort/Andy
onready var Circle = $GUI/Circle
onready var CarAndy = $Node2D/YSort/Andy/AndyPath/AndyCar
onready var Layout = $GUI/Layout
onready var Pause = $GUI/Layout/Pause
onready var StarProggress = $GUI/Layout/NextLevel/TextureProgress
onready var showcase = $GUI/Layout/Sign/HBoxContainer/TextureRect
onready var labelPoints = $GUI/Layout/NextLevel/Label
onready var starTween = $GUI/Layout/NextLevel/Tween

var config 
var levelCompleted = []
var levelObject = []
var playable
var totalPoints : float
var proggress = 0
var currentPoints = 0

func _ready():
	playable = true
	totalPoints = Points
	get_tree().paused = false
	Circle.visible = true
	Layout.visible = false
	Circle.loadLevel()
	SFX.Crusing()
	load_game()
	get_point()
	save_game()
	config = SaveLoad.load_setting()
	Andy.color = config["Car"]["color"]



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
	SFX.StopEngine()
	SFX.FinishAll()
	get_tree().change_scene("res://MainMenu.tscn")
	#SFX.FinishAll()

func _on_GUI_ButtonNext():
	Circle.nextLevel()
	

func _on_Andy_Tabrakan():
	get_tree().paused = true
	showLayout()
	$GUI/Layout/Kecelakaan.visible = true
	
func _on_GUI_CircleNext():
	if level == "res://LevelSelect.tscn":
		get_tree().paused = false
		SFX.StopEngine()
		SFX.FinishAll()
		get_tree().change_scene("res://MainMenu.tscn")
		get_tree().change_scene("res://LevelSelect.tscn")
	get_tree().change_scene(level)

func _on_GUI_ButtonSign():
	$GUI/Layout/Sign/AnimationPlayer.play("Down")
	get_tree().paused = false
	
func _on_GUI_SignDown():
	$GUI/Layout/Sign.visible = false
	$GUI/Layout.visible = false
	pass

func _on_Finish_Finish():
	CarAndy.set_collision_layer_bit(1, false)
	CarAndy.set_collision_mask_bit(1, false)
	proggress = round((Points / totalPoints) * 100)
	$Node2D/YSort/Andy/AndyPath/AndyCar/Pivot/CameraOffset/Camera2D._set_current(false)
	labelPoints.set_text(str(proggress ," / 100"))

func _on_Finish_TimeOut():
	if proggress >= currentPoints:
		save_game()
	showLayout()
	$GUI/Layout/NextLevel.visible = true
	starTween.interpolate_property(StarProggress, 'value', 0, proggress, 2, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	starTween.start()
	yield(starTween, "tween_completed")
	
func showLayout():
	$GUI/Layout.visible = true

func get_point():
	for index in range(levelObject.size()):
		if levelObject[index]["level"] == currentLevel:
			proggress = levelObject[index]["point"]
			currentPoints = levelObject[index]["point"]

func convertObject():
	var level_dict = {
				"level" : currentLevel,
				"point" : proggress,
				"playable" : playable
			}
	for index in range(levelObject.size()):
		if levelObject[index]["level"] == currentLevel:
			levelObject[index] = level_dict
			return
	levelObject.append(level_dict)

func save():
	convertObject()
	var save_dict = {
		"levels" : levelObject
	}
	return save_dict

func save_game():
	var save_game = File.new()
	save_game.open("user://savegame.save", File.WRITE)
	#save_game.open_encrypted_with_pass("user://savegame.save", File.WRITE, "OS.get_unique_id()")
	var save_nodes = get_tree().get_nodes_in_group("Level")
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
	#save_game.open_encrypted_with_pass("user://savegame.save", File.WRITE, "OS.get_unique_id()")
	while save_game.get_position() < save_game.get_len():
		var node_data = parse_json(save_game.get_line())
		levelObject = node_data["levels"]
	save_game.close()
