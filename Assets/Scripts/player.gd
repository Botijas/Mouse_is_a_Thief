extends CharacterBody2D

var mouse_position : Vector2

var direction : Vector2
var speed : float = 235

func _physics_process(delta: float) -> void:
	# Define a posição global do mouse e a direção que o player olha e vai
	mouse_position = get_global_mouse_position()
	direction = position.direction_to(mouse_position)
	look_at(mouse_position)
	
	# Movimenta o player 
	if position.distance_to(mouse_position) > 16:
		velocity = speed * direction
	else:
		velocity = Vector2.ZERO
	
	# A PORRA do move and slide
	move_and_slide()
