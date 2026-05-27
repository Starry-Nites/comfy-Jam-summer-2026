extends Node

const QuickTimeEvent = preload("res://scripts/quick-time-events/quick_time_event.gd")
var QTE: quick_time_event
var x: ColorRect
var node: Node
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var button = Button.new()
	button.text = "Click Me to Go To the Shop!"
	button.pressed.connect(_button_pressed)
	add_child(button)
	
	node = get_node("Control")
	QTE = quick_time_event.new(100, 10, 10, 10, 200, node)
	
	

func _button_pressed():
	get_tree().change_scene_to_file("res://scenes/shop_scenes/shop.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (QTE.pebble != null):
		QTE.move_pebble(QTE.pebble, delta)
