extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var button = Button.new()
	button.text = "Click Me to Go To the Shop!"
	button.pressed.connect(_button_pressed)
	add_child(button)
	
func _button_pressed():
#	var scene = load("res://scenes/shop.tscn")
	#var scene_instance = scene.instantiate()
	#scene_instance.set_name("shop")
	#add_child(scene_instance)
	get_tree().change_scene_to_file("res://scenes/shop.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
