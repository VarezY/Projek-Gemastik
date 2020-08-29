extends Control

onready var SFXButtons = $"/root/SfxButton"

var LeveltoLoad
var Buttons 
var levelObject = []

func _ready():
	Buttons = get_tree().get_nodes_in_group("Buttons")
	load_game()
	for button in Buttons:
		button.connect("pressed", self, "_on_Button_pressed", [button.levelTujuan])
	changeLevel()
	SFXButtons.CallGroup()

func _on_Button_pressed(level):
	get_tree().change_scene(level)

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

func changeLevel():
	for index in range(levelObject.size()):
		Buttons[index].get_node("TextureProgress").value = levelObject[index]["point"]
		Buttons[index].disabled = false
