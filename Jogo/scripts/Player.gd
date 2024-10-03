extends Area2D

@export var speed = 400 # How fast the player will move (pixels/sec).

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position.x = get_viewport().get_visible_rect().size.x / 2
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity = Vector2.ZERO # The player's movement vector.
	
	##Player Movement change
	if Input.is_action_pressed("move_right"): 
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if velocity.length() > 0 :
		velocity *= speed
	
	var visible_rect = get_viewport().get_visible_rect()
	position += velocity * delta
	position.x = clamp(position.x, visible_rect.position.x+106, visible_rect.position.x + visible_rect.size.x-232)
	position.y = clamp(position.y, visible_rect.position.y, visible_rect.position.y + visible_rect.size.y)
	#position.x = clamp(position.x, 0, screen_size.x)
	#position.y = clamp(position.y, 0, screen_size.y)
	
	pass
