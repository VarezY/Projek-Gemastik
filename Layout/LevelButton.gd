extends TextureButton

export(String, FILE, "*.tscn") var levelTujuan

onready var proggressBar = $TextureProgress

export(int) var proggressLevel = 0

func _ready():
	proggressBar.value = proggressLevel
	pass

