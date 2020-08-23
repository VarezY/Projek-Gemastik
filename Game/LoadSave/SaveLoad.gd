extends Node

const SavePath = "res://config.cfg"

var FullScreen
var BGMValue
var SFXValue
var color

func _ready():
	load_setting()

func convDict():
	var config_dict = {
			"Window" : {
				"fullscreen" : FullScreen
			},
			
			"Audio" :{
				
				"BGM" : BGMValue,
				"SFX" : SFXValue
			
			},
			"Car" : {
			
				"color" : color
			
			}
		}
	return config_dict

func save_setting(fullScreen:bool, BGM:int, SFX:int, CarColor:String):
	var Fconfig = ConfigFile.new()
	var check = Fconfig.load("res://config.cfg")
	if check == OK:
		Fconfig.set_value("Window", "fullscreen", fullScreen)
		Fconfig.set_value("Audio", "BGM", BGM)
		Fconfig.set_value("Audio", "SFX", SFX)
		Fconfig.set_value("Car", "color", CarColor)
		Fconfig.save("res://config.cfg")
	else:
		print("Config Hilang")
		var newConfig = File.new()
		newConfig.open("res://config.cfg", File.WRITE)
		newConfig.close()
		save_setting(false, 100, 100, "White")
		pass

func load_setting():
	var Fconfig = ConfigFile.new()
	var check = Fconfig.load("res://config.cfg")
	if check == OK:
		FullScreen = Fconfig.get_value("Window", "Fullscreen", false)
		BGMValue = Fconfig.get_value("Audio", "BGM", 100)
		SFXValue = Fconfig.get_value("Audio", "SFX", 100)
		color = Fconfig.get_value("Car", "color", "Blue")
		return convDict()
	else:
		save_setting(false, 100, 100, "White")
