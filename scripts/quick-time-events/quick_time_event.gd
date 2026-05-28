class_name quick_time_event extends Node

var speed: float
var pebble_size: float
var green_size: float

var pebble: ColorRect

var pebble_bound_left: float
var pebble_bound_right: float

var interval: float

var dir = "right" # Dictates which direction the pebble is moving. The pebble will start moving right by default

var timer_num: float # Determines how long we will run the program before switching directions assuming base case.
var direction_num: int # Acts as a coinflip to decide if we are moving left or right.

# Called when the node enters the scene tree for the first time.

# INFO 
 ## TO CREATE A QUICK TIME EVENT:
 ## Float: SPEED; Used to determine how quickly the pebble moves across the screen, in pixels (per frame).
 ## Float: SIZE; Used to create the pebble's horizontal size, in pixels.
 ## Float: GREEN_SIZE; Determines how large the "green area" is inside the QTE, in pixels.
 ## Float: PEBBLE_BOUND_LEFT; Determines where on the left-hand side of the screen the pebble will "bounce" 
 	## back on. Creates an invisible wall at the specified x-value that sends the pebble the other direction, 
 	## when the pebble strikes it.
 ## Float: PEBBLE_BOUND_RIGHT; Same as Pebble_bound_left, but instead determines the right-hand side bound.
 ## Node: NODE; Determines which node the QTE and pebble should be children of.
func _init(s: float, ps: float, gs: float, pbl: float, pbr: float, i: float, node: Node) -> void:
	
	# Just creating a new rectangle and instantiating all of my variables
	pebble = ColorRect.new()
	speed = s
	pebble_size = ps
	green_size = gs
	
	pebble_bound_left = pbl
	pebble_bound_right = pbr
	
	interval = i
	
	pebble.color = Color(1, 0, 0)
	pebble.size = Vector2(40, ps)
	pebble.position = Vector2((pbl+pbr)/2, 100)
	
	node.add_child(pebble)
	node.add_child(self)
	
	timer_num = randf_range(1, interval) # Used later for pebble movement. See pebble_move_random.
	direction_num = 1
	
	
	# Moves the pebble. When it hits the X-Value from PBL, it will turn around and begin to move right, 
	#	 and vice versa.
	
	# Delta is sent from the _process() function from which this move_pebble() is called.
func move_pebble_linear(delta: float) -> void:
	
	# Checks if we have hit either bound. If so, switch to the other direction.
#region New Code Region
	if (pebble.position.x >= pebble_bound_right):
		dir = "left"
		print("I Changed direction to left")
		
	if (pebble.position.x <= pebble_bound_left):
		dir = "right"
		print("I Changed direction to right")
#endregion
	
	# Depending on whatever direction we are supposed to be going, we either add or subtract to or from 
	# 	the pebble's X-Coordinate. 
#region New Code Region
	if dir == "right":
		pebble.position.x += speed * delta # Delta here used in order to scale movement to the frame rate.
		print(speed)
	
	elif dir == "left":
		pebble.position.x -= speed * delta
		print("I moved left")
#endregion

# Should be called once every frame by a _process() function. Slides the pebble around in 
# 	alternating directions for random periods of time.
func move_pebble_random(delta: float) -> void:
	
	# Velocity includes the speed at which the pebble travels, direction it is traveling, and 
	# 	the delta to scale for the framerate. Instead of applying these values manually, we add this vector instead
	var velocity = (speed * direction_num * delta)
	
	# If the anticipated movement would put us at the bounds, turn the other direction instead.
	if (pebble.position.x + velocity >= pebble_bound_right || pebble.position.x + velocity <= pebble_bound_left):
		direction_num *= -1
		pebble.position.x += velocity
		return
	
	# Move the pebble. 
	pebble.position.x += velocity
	
	# If we have not yet run out of time, continue to keep the timer, and escape the function for now
	if (timer_num > 0):
		timer_num -= delta # Keeps track of how much real-world time has passed.
		return
	
	# Since we have obviously now run out of time, replenish the time to some random number.
	timer_num = randf_range(1, interval)
	
	# Once we have run out of time, change the pebble's direction as well.
	direction_num *= -1

	
	
	
	
	
	
	
	
	
	
	
	
