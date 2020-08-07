extends TextureButton

export(String, FILE, "*.tscn") var scene_to_load
export(String) var level

func _ready():
	$Level.set_text(level)

