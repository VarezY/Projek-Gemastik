extends Control

onready var showcase = $TextureRect
onready var rambu = $TextureButton
# Called when the node enters the scene tree for the first time.
func _ready():
	showcase.set_texture(rambu.get_normal_texture())


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
