extends Level

var Signs
var Buttons

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_GUI_ButtonCarGo():
	#Stop.disabled = true
	SFX.StartEngine()
	Andy.start = 0
	Andy.rem = false


func _on_GUI_ButtonCarStop():
	#Stop.disabled = false
	SFX.StopEngine()
	Andy.rem = true
