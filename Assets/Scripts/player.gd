extends CharacterBody2D

var mouse_position : Vector2

func _physics_process(delta: float) -> void:
	# Define a posição global do mouse e a direção que o player olha
	mouse_position = get_global_mouse_position()
	look_at(mouse_position)
	
