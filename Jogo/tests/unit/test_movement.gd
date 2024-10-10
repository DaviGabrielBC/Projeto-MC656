extends GutTest

<<<<<<< Updated upstream
func _ready():
	var double_jogo = double(load("res://scenes/Tartaruga/Jogo.tscn")).instantiate()
	var player = load("res://scenes/Tartaruga/Player.tscn").instantiate()
	var lixo = load("res://scenes/Tartaruga/Lixo.tscn").instantiate()
=======
var Player_Script = load("res://scripts/Player.gd").new()
var elapsed_time = 2.88

var width
var player
var lixo
var double_jogo

func before_each():
	double_jogo = double(load("res://scenes/Tartaruga/Jogo.tscn")).instantiate()
	player = load("res://scenes/Tartaruga/Player.tscn").instantiate()
	lixo = load("res://scenes/Tartaruga/Lixo.tscn").instantiate()
>>>>>>> Stashed changes
	
	add_child(double_jogo)
	double_jogo.add_child(player)
	double_jogo.add_child(lixo)
	
<<<<<<< Updated upstream
	# Roda os testes
	test_player_movement()

func test_player_movement():
	var player = get_child(0) # Assuming the player is the only child
	
	# Initial position in the center of the viewport
	player.position.x = get_viewport().get_visible_rect().size.x / 2

	# Simulate moving right
	player.position.x += (400) * 2.88 # Simulate right movement
	player._process(2.88) # Simulate one frame
	var expected_position_right = clamp(player.position.x, player.position.x - (400 * 2.88), player.position.x + (400 * 2.88))
	assert_eq(player.position.x, expected_position_right, "Player should move right within bounds.")

	# Reset position for left movement test
	player.position.x = get_viewport().get_visible_rect().size.x / 2

	# Simulate moving left
	player.position.x -= (400) * 2.88 # Simulate left movement
	player._process(2.88) # Simulate frame
	var expected_position_left = clamp(player.position.x, player.position.x - (400 * 2.88), player.position.x + (400 * 2.88))
	assert_eq(player.position.x, expected_position_left, "Player should move left within bounds.")

	# Clean up - reset player position for potential future tests
	player.position.x = get_viewport().get_visible_rect().size.x / 2
=======
	width = get_viewport().get_visible_rect().size.x

func test_moves_left():
	# Simulate pressing the left arrow key
	Player_Script.test_pressed_left = 1
	player._process(elapsed_time) 
	Player_Script.test_pressed_left = 0

	assert_lt(int(player.position.x), int(width/2), "Player should have moved left.")
	
func test_moves_right():
	# Simulate pressing the right arrow key
	Player_Script.test_pressed_right = 1
	player._process(elapsed_time) 
	Player_Script.test_pressed_right = 0

	assert_gt(int(player.position.x), int(width/2), "Player should have moved right.")

func test_out_of_bounds_left():
	# Simulate pressing the left arrow key
	Player_Script.test_pressed_left = 1
	player._process(2 * elapsed_time) #Enough time for the player to supposedly exceed the bounds of the visible rectangle
	Player_Script.test_pressed_left = 0

	assert_lt(int(player.position.x), int(width), "Player is out of bounds on the left side.")
	
func test_out_of_bounds_right():
	# Simulate pressing the right arrow key
	Player_Script.test_pressed_right = 1
	player._process(2 * elapsed_time) #Enough time for the player to supposedly exceed the bounds of the visible rectangle
	Player_Script.test_pressed_right = 0

	assert_gt(int(player.position.x), int(0), "Player is out of bounds on the right side.")
>>>>>>> Stashed changes
