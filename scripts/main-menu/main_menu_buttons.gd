extends Node

const QuickTimeEvent = preload("res://scripts/quick-time-events/quick_time_event.gd")
var QTE: quick_time_event
var x: ColorRect
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var button = Button.new()
	button.text = "Click Me to Go To the Shop!"
	button.pressed.connect(_button_pressed)
	add_child(button)
	
	var spwnpb = Button.new()
	spwnpb.position = Vector2(20,40)
	spwnpb.text = "spawn pebble"
	add_child(spwnpb)
	
	QTE = quick_time_event.new()
	
	spwnpb.pressed.connect(_spawn_pebble)
	
func _spawn_pebble():
	print("should spawn pebble")
	var node = get_node("Control")
	
	x = QTE.create(100, 10, 10, 10, 200, node)
	#QTE.set_pebble(x)
	
	
	#add_child(x)
	
func _button_pressed():
	get_tree().change_scene_to_file("res://scenes/shop_scenes/shop.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (x != null):
		QTE.move_pebble(x, delta)
