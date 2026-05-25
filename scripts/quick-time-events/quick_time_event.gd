class_name QuickTimeEvent extends Node

var speed: float
var pebble_size: float
var green_size: float

var pebble: ColorRect

var pebble_bound_left: float
var pebble_bound_right: float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_load_QTE()
	
	

# NOTE Eventually, this will contain fields for sprites and such (pebble sprite, bar sprite, shells, etc.)
## takes speed (fl), Peb_size(fl), green_size(fl), pbl(Vec2), and pbr(Vec2)
func create(s: float, ps: float, gs: float, pbl: float, pbr: float) -> QuickTimeEvent:
	print("Is it spawned yet?")
	var QTE = QuickTimeEvent.new()
	
	QTE.speed = s
	QTE.pebble_size = ps
	QTE.green_size = gs
	
	QTE.pebble_bound_left = pbl
	QTE.pebble_bound_right = pbr
	
	pebble = ColorRect.new()
	pebble.color = Color(1, 0, 0) # Red color
	pebble.size = Vector2(ps, ps) # Size in pixels
	pebble.position = Vector2(pbl, 100) # Position on screen
	add_child(pebble)
	
	return QTE
	
func _load_QTE() -> void:
	pass
	
func _move_pebble() -> void:
	#if pebble.position.x >
	#pebble.position.x += speed
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
