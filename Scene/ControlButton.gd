extends Control

signal status

var mobil_State = true

func _on_TextureButton_toggled(button_pressed):
	if button_pressed:
		mobil_State = false
	else:
		mobil_State = true
	emit_signal("status", mobil_State)
