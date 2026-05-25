extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	const QuickTimeEvent = preload("res://scripts/quick-time-events/quick_time_event.gd")
	
	var QTE = QuickTimeEvent.new()
	var x = QTE.create(5, 10, 10, 10, 50)
	x._load_QTE()
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
