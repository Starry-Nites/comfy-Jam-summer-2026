extends Node

const QuickTimeEvent = preload("res://scripts/quick-time-events/quick_time_event.gd")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var button = Button.new()
	button.text = "Click Me to Go To the Shop!"
	button.pressed.connect(_button_pressed)
	add_child(button)
	
	var spwnpb = Button.new()
	spwnpb.position = Vector2(20,20)
	spwnpb.text = "spawn pebbl"
	add_child(spwnpb)
	
	spwnpb.pressed.connect(_spawn_pebble)
	
	
	
func _spawn_pebble():
	print("should spawn pebble")
	var node = get_node("Control")
	var QTE = QuickTimeEvent.new()
	var x = QTE.create(5, 10, 10, 10, 50, node)
	#add_child(x)
	
func _button_pressed():
	get_tree().change_scene_to_file("res://scenes/shop_scenes/shop.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
