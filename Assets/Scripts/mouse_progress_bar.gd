extends Sprite2D

@export var over_texture : Sprite2D

var mouse_position : Vector2

var max_wait_time : float = 3
var wait_time : float = 3

func _physics_process(delta: float) -> void:
	# Define a posição global do mouse
	mouse_position = get_global_mouse_position()
	
	# Define a posição desse objeto
	position = mouse_position
	
	# Define a progressão da barra do filho
	over_texture.material.set_shader_parameter("progress", wait_time / max_wait_time)
	
	# Area para testes
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and wait_time > 0:
		wait_time -= 1 * delta
		print(wait_time / max_wait_time)
	elif wait_time <= 3:
		wait_time += 1 * delta
	
