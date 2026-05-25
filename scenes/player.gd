extends CharacterBody2D

@export var speed: float = 100.0
@export var inventory: Inventory

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var _last_direction := "walk_down"


func _physics_process(_delta: float) -> void:
	var direction := Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
	_update_animation(direction)


func _update_animation(direction: Vector2) -> void:
	if direction == Vector2.ZERO:
		animated_sprite.stop()
		return

	if absf(direction.x) > absf(direction.y):
		_last_direction = "walk_left" if direction.x > 0.0 else "walk_right"
	else:
		_last_direction = "walk_down" if direction.y > 0.0 else "walk_up"

	if animated_sprite.animation != _last_direction or not animated_sprite.is_playing():
		animated_sprite.play(_last_direction)
