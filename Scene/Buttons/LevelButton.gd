extends TextureButton

export(String, FILE, "*.tscn") var scene_to_load


func _on_TextureButton_pressed():
	get_tree().change_scene(scene_to_load)
