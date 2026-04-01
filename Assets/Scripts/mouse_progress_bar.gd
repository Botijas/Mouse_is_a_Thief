extends Sprite2D

@export var game_scene : Node
@export var over_texture : Sprite2D

var mouse_position : Vector2

var max_wait_time : float = 3
var wait_time : float = 3

@onready var player : CharacterBody2D = get_tree().get_first_node_in_group("Player")

func _physics_process(delta: float) -> void:
	# Define a posição global do mouse
	mouse_position = get_global_mouse_position()
	
	# Define a posição desse objeto
	position = mouse_position
	
	# Define o progresso da barra
	if player.position.distance_to(mouse_position) < 16:
		wait_time -= delta
	elif wait_time <= max_wait_time:
		wait_time += delta
	
	# Define a progressão da barra do filho
	var fade_velocity := 8.0 * delta
	
	if wait_time >= max_wait_time:
		material.set_shader_parameter("alpha", lerp(material.get_shader_parameter("alpha"), 0.0, fade_velocity))
		over_texture.material.set_shader_parameter("alpha", lerp(material.get_shader_parameter("alpha"), 0.0, fade_velocity))
	else:
		material.set_shader_parameter("alpha", lerp(material.get_shader_parameter("alpha"), 1.0, fade_velocity))
		over_texture.material.set_shader_parameter("alpha", lerp(material.get_shader_parameter("alpha"), 1.0, fade_velocity))
	
	over_texture.material.set_shader_parameter("progress", wait_time / max_wait_time)
	
	if wait_time <= 0:
		game_scene.emit_signal("lose", "wait_time")
