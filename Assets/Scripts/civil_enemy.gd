extends CharacterBody2D

var horizontal_movement : bool
var positive_movement : bool

var initial_position : Vector2
var end_position : Vector2

var speed : float = 265
var speed_multiplier : float

func _ready() -> void:
	start_movement()

func _process(delta: float) -> void:
	# Define a velocidade e direção que o inimigo olha
	velocity = initial_position.direction_to(end_position) * speed * speed_multiplier
	look_at(end_position)
	
	# A porra do Move and Slide
	move_and_slide()

func start_movement() -> void:
	randomize()
	# Define os parametros do Movimento
	horizontal_movement = randi_range(0, 1)
	positive_movement = randi_range(0, 1)
	speed_multiplier = randf_range(0.75, 1.20)
	
	if horizontal_movement: 
		if positive_movement:
			initial_position.x = -32
			end_position.x = 640 + 32
			
			initial_position.y = randf_range(-32, 360 + 32)
			end_position.y = randf_range(-32, 360 + 32)
		else:
			initial_position.x = 640 + 32
			end_position.x = -32
			
			initial_position.y = randf_range(-32, 360 + 32)
			end_position.y = randf_range(-32, 360 + 32)
	else:
		if positive_movement:
			initial_position.y = -32
			end_position.y = 360 + 32
			
			initial_position.x = randf_range(-32, 640 + 32)
			end_position.x = randf_range(-32, 640 + 32)
		else:
			initial_position.y = 360 + 32
			end_position.y = -32
			
			initial_position.x = randf_range(-32, 640 + 32)
			end_position.x = randf_range(-32, 640 + 32)
	
	global_position = initial_position
	get_node("Coin").visible = true

func _on_visible_on_screen_screen_exited() -> void:
	start_movement()

func _on_hitbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		get_node_or_null("/root/Game Scene").emit_signal("lose", "civil")
