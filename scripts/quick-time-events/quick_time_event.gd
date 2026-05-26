class_name QuickTimeEvent extends Node

var speed: float
var pebble_size: float
var green_size: float

var pebble: ColorRect

var pebble_bound_left: float
var pebble_bound_right: float

var test = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_load_QTE()
	
	
# NOTE Eventually, this will contain fields for sprites and such (pebble sprite, bar sprite, shells, etc.)
## takes speed (fl), Peb_size(fl), green_size(fl), pbl(Vec2), and pbr(Vec2)
func create(s: float, ps: float, gs: float, pbl: float, pbr: float, node: Node) -> QuickTimeEvent:
	print("Is it spawned yet?")
	var QTE = QuickTimeEvent.new()
	
	QTE.speed = s
	QTE.pebble_size = ps
	QTE.green_size = gs
	
	QTE.pebble_bound_left = pbl
	QTE.pebble_bound_right = pbr
	
	pebble = ColorRect.new()
	test = true # If this is still true by the time that we get to _move_pebble(), then pebble should be instantiated.
	print("fsfds", test) # This prints true
	pebble.color = Color(1, 0, 0) # Red color
	pebble.size = Vector2(ps, ps) # Size in pixels
	pebble.position = Vector2(pbl, 100) # Position on screen
	
	node.add_child(pebble) # Makes the pebble visible
	node.add_child(QTE) # Makes the QTE accessible from the scene and runs _ready() and technically _process()
	
	return QTE
	
func _load_QTE() -> void:
	pass
	
func _move_pebble() -> void:
	
	print (test) # TESTING This prints false every frame
	
	var dir = "right" # Dictates which direction the pebble is moving. The pebble will start moving right by default
	
	#print(pebble.position) # TESTING
	
	# ALERT FIXME The following code throws an error. It claims that "pebble" is a nil field, 
	# but it should have been instantiated in create()
	
	# INFO these regions check if the pebble should be moving left or right 
	# and add or subtract to the position accordingly.
	
##region New Code Region
	#if (pebble.position[0] >= pebble_bound_right):
		#dir = "left"
			#
	#elif (pebble.position[0] <= pebble_bound_left):
		#dir = "right"
##endregion
	#
##region New Code Region
	#if dir == "right":
		#pebble.position[0] += speed
	#
	#elif dir == "left":
		#pebble.position[0] -= speed
##endregion
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_move_pebble()
