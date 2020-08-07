extends Control

signal reset

func _on_Button_pressed():
	print("Reset")
	emit_signal("reset")

