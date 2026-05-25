extends Control

var is_open: bool = false


func _ready() -> void:
	close()


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
