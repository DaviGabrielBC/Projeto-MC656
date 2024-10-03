extends Area2D

@export var speed = 400 # How fast the player will move (pixels/sec).

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
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
	
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, get_viewport().get_visible_rect().size)
	#position.x = clamp(position.x, 0, screen_size.x)
	#position.y = clamp(position.y, 0, screen_size.y)
	
	pass

func _on_area_2d_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if area.get_parent().name == "Lixo":
		get_parent().take_damage()
		area.get_parent().queue_free()
	pass
