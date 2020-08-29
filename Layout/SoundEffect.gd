extends Node

onready var Setting = $"/root/SaveLoad"

# Called when the node enters the scene tree for the first time.
func _ready():
	var settings = Setting.load_setting()
	var SFXValue = settings.Audio.SFX - 106
	setVolume(SFXValue)

func setVolume(value):
	var SFXs = get_children()
	for sfx in SFXs:
		sfx.volume_db = value
		pass
	pass

func StartEngine():
	$CarStart.stream_paused = false
	$CarStart.play()

func StopEngine():
	$CarStart.stream_paused = true
	$CarCrusing.stop()
	$CarStop.play()

func Crusing():
	$CarCrusing.play()

func FinishAll():
	$CarCrusing.stop()
	$CarStop.stream_paused = true

func _on_CarStart_finished():
	$CarCrusing.play()
