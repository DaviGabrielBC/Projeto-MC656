extends GutTest

var PlayerScene = preload("res://scenes/Tartaruga/Jogo.tscn") 
var player 

func before_each():
	# Create a new instance of the Player scene before each test
	player = PlayerScene.instantiate()

# Test if the player takes damage correctly
func test_player_takes_damage():
	# Set initial health
	player.player_hp = 100
	
	# Call the take_damage function with 10 damage
	player.take_damage(10)
	
	# Assert that health decreased by 10
	assert_eq(player.player_hp, 90, "Player health should be 90.")
	
# Test if the player hp doesn't gets below zero when they die
func test_hp_not_below_zero():
	# Set initial health
	player.player_hp = 100
	
	# Call the take_damage function with 110 damage
	player.take_damage(110)
	
	# Assert that health reseted to 0
	assert_eq(player.player_hp, 0, "Player health should be 0.")

# Test if the player dies when takes lethal damage
func test_player_dies():
	# Set health and player_alive
	player.player_hp = 10
	player.player_alive = true
	
	# Call the take_damage function with lethal damage
	player.take_damage(50)
	
	# Assert that the player dies
	assert_eq(player.player_alive, false, "Player shouldn't be alive.")
	
# Test if the HP label shows health correctly
func test_HP_label():
	# Set hp and max_hp
	player.player_hp = 100
	player.max_hp = 100
	player.get_node("Hud/hp_label").text = "HP: 100/100"
	
	# Call the take_damage function
	player.take_damage(50)
	
	# Assert that the player HP is showed correctly
	assert_eq(player.get_node("Hud/hp_label").text, "HP: 50/100", "Player HP should be 50/100")
