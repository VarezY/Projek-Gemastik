extends Level



#======[ SIGN ]======#
#======[ AREA ]======#
#======[ TRIGGER ]======#


func _ready():
	
	pass # Replace with function body.


func _on_GUI_ButtonCarGo():
	SFX.StartEngine()
	Andy.start = 0
	Andy.rem = false
	pass

func _on_GUI_ButtonCarStop():
	SFX.StopEngine()
	Andy.rem = true

func _on_GUI_CircleLoad():
	#SFX.Crusing()
	pass




func _on_Andy_Tabrakan():
	pass # Replace with function body.
