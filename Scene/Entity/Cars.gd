extends PathFollow2D
export(Texture) var car_image
signal Tabrakan

func _ready():
	$Sprite.set_texture(car_image)

func _on_Area2D_tabrak():
	emit_signal("Tabrakan")
