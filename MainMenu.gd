extends Control

func _ready():
	$Camera2D._set_current(true)

func _on_ButtonMulai_pressed():
	get_tree().change_scene("res://LevelSelect.tscn")

func _on_ButtonKeluar_pressed():
	get_tree().quit()

func _on_ButtonSetting_pressed():
	#get_tree().change_scene("res://Setting.tscn")
	pass

func _on_ButtonInfo_pressed():
	#get_tree().change_scene("res://Info.tscn")
	pass
