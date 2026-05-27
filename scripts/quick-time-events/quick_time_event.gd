class_name quick_time_event extends Node

var speed: float
var pebble_size: float
var green_size: float

var pebble: ColorRect

var pebble_bound_left: float
var pebble_bound_right: float

var dir = "right" # Dictates which direction the pebble is moving. The pebble will start moving right by default

# Called when the node enters the scene tree for the first time.
func create(s: float, ps: float, gs: float, pbl: float, pbr: float, node: Node) -> ColorRect:
	print("Is it spawned yet?")
	
	var QTE = quick_time_event.new()
	pebble = ColorRect.new()
	
	QTE.speed = s
	speed = s
	QTE.pebble_size = ps
	QTE.green_size = gs
	
	QTE.pebble_bound_left = pbl
	pebble_bound_left = pbl
	QTE.pebble_bound_right = pbr
	pebble_bound_right = pbr
	
	pebble.color = Color(1, 0, 0) # Red color
	pebble.size = Vector2(ps, ps) # Size in pixels
	pebble.position = Vector2(pbl, 100) # Position on screen
	
	node.add_child(pebble) # Makes the pebble visible
	node.add_child(QTE) # Makes the QTE accessible from the scene and runs _ready() and technically _process()
	
	return pebble
	
func set_pebble(rect: ColorRect):
	print("set the pebble")
	pebble = rect
	
func move_pebble(x: ColorRect, delta: float) -> void:
	
#region New Code Region
	if (x.position.x >= pebble_bound_right):
		dir = "left"
		print("I Changed direction to left")
		
	if (x.position.x <= pebble_bound_left):
		dir = "right"
		print("I Changed direction to right")
#endregion
	
#region New Code Region
	if dir == "right":
		x.position.x += speed * delta
		print(speed)
	
	elif dir == "left":
		x.position.x -= speed * delta
		print("I moved left")
#endregion

func _process(delta: float) -> void:
	#move_pebble()
	pass
