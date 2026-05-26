extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	const QuickTimeEvent = preload("res://scripts/quick-time-events/quick_time_event.gd")
	
	#var QTE = QuickTimeEvent.new()
	#var x = QTE.create(5, 10, 10, 10, 50)
	#x._load_QTE()
	
	var pebble = ColorRect.new()
	pebble.color = Color(1, 0, 0) # Red color
	pebble.size = Vector2(10, 10) # Size in pixels
	pebble.position = Vector2(10, 100) # Position on screen
	add_child(pebble)
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
