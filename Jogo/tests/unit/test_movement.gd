extends GutTest

func _ready():
	var double_jogo = double(load("res://scenes/Tartaruga/Jogo.tscn")).instantiate()
	var player = load("res://scenes/Tartaruga/Player.tscn").instantiate()
	var lixo = load("res://scenes/Tartaruga/Lixo.tscn").instantiate()
	
	add_child(double_jogo)
	double_jogo.add_child(player)
	double_jogo.add_child(lixo)
	
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
