extends Node

var shell_button = Button.new()
var upgrade_button = Button.new()
var item_button = Button.new()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	_make_buttons()
	
	add_child(shell_button)
	add_child(upgrade_button)
	add_child(item_button)
			
	# NOTICE we can clean this up later, but I'm gonna do this for now
	
	shell_button.pressed.connect(_shop_start.bind("shell_scene"))
	upgrade_button.pressed.connect(_shop_start.bind("upgrade_scene"))
	item_button.pressed.connect(_shop_start.bind("item_scene"))
			
func _shop_start(shop: String):
	get_tree().change_scene_to_file("res://scenes/shop_scenes/buy_"+shop+".tscn")

func _make_buttons() -> void:
	
	shell_button.position = Vector2(0, 0)
	shell_button.text = "Buy Shell."
	
	
	upgrade_button.position = Vector2(0, 40)
	upgrade_button.text = "Buy Upgrade."
	
	
	item_button.position = Vector2(0, 80)
	item_button.text = "Buy Item."
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
