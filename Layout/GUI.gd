extends CanvasLayer

onready var SFXButtons = $"/root/SfxButton"

signal ButtonPause
signal ButtonCarStop
signal ButtonCarGo
signal ButtonContinue
signal ButtonRestart
signal ButtonHome
signal ButtonNext
signal ButtonSign
signal CircleLoad
signal CircleNext
signal SignDown

func _ready():
	SFXButtons.CallGroup()

func _on_CarButton_toggled(button_pressed):
	if button_pressed:
		emit_signal("ButtonCarStop")
	else:
		emit_signal("ButtonCarGo")


func _on_PauseButton_pressed():
	emit_signal("ButtonPause")


func _on_ContinueButton_pressed():
	emit_signal("ButtonContinue")


func _on_RestartButton_pressed():
	emit_signal("ButtonRestart")


func _on_HomeButton_pressed():
	emit_signal("ButtonHome")


func _on_NextButton_pressed():
	emit_signal("ButtonNext")
	

func _on_ContinueSignButton_pressed():
	emit_signal("ButtonSign")

func _on_Circle_loadLevel():
	emit_signal("CircleLoad")

func _on_Circle_next():
	emit_signal("CircleNext")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Down":
		emit_signal("SignDown")
