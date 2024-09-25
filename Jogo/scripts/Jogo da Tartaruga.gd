extends Node2D

var max_hp: int
var player_hp: int
var player_alive: bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	max_hp = 100
	player_hp = 100
	player_alive = true
	update_hp_label()
	pass

# Function to handle taking damage
func take_damage(damage):
	player_hp -= damage
	if player_hp <= 0:
		player_hp = 0
		game_over()
	update_hp_label()

# Function to handle the game over condition
func game_over():
	player_alive = false
	pass

# Utility function to update the HP label (use signal or direct reference to HUD)
func update_hp_label():
	$Hud/hp_label.text = "HP: " + str(player_hp) + "/" + str(max_hp)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
