extends Control

@onready var inventory: Inventory = preload("res://data/inventory/player_inventory.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()

var is_open: bool = false


func _ready() -> void:
	update_slots()
	close()


func update_slots() -> void:
	for i in range(min(inventory.items.size(), slots.size())):
		slots[i].update(inventory.items[i])


func _process(_delta) -> void:
	if Input.is_action_just_pressed("i"):
		if is_open:
			close()
		else:
			open()


func open() -> void:
	self.visible = true
	is_open = true


func close() -> void:
	visible = false
	is_open = false
