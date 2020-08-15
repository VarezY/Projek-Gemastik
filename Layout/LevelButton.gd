extends TextureButton

export(String, FILE, "*.tscn") var levelTujuan

onready var proggressBar = $TextureProgress

export(int) var proggressLevel = 0

func _ready():
	proggressBar.value = proggressLevel
	pass

func save():
	var save_dict = {
		"filename" : get_filename()
		
	}
	pass
