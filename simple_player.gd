extends CharacterBody2D

@export var speed : int = 400
@export var rotation_speed = 2

var rotation_direction : float = 0
var target : Vector2 = position

func get_8way_input():
	var input_direction := Input.get_vector("left", "right", "up", "down")
	#print(input_direction)
	velocity = input_direction * speed
	print(velocity)

func get_rotation_input():
	# Pega o deslocamento lateral (setas) para definir a direção
	# da rotação
	rotation_direction = Input.get_axis("left", "right")
	#print(rotation_direction)
	# Calcula o vetor velocidade usando o eixo X local do objeto
	# e deslocamento vertical (setas)
	velocity = transform.x * Input.get_axis("down", "up") * speed
	#print(transform.x)
	
func get_mouse_input():
	look_at(get_global_mouse_position())
	velocity = transform.x * Input.get_axis("down", "up") * speed

func _input(event: InputEvent) -> void:
	if(event.is_action_pressed("click")):
		target = get_global_mouse_position()
	
func _physics_process(delta: float) -> void:
	# 1. Movimento pelas setas nas 8 direções
	#get_8way_input()
	#move_and_slide()
	#position.x += velocity.x * delta
	#position.y += velocity.y * delta
	#position += velocity * delta
	
	# 2. Gira com as setas laterais, avança/volta com up/down
	#get_rotation_input()
	# Atualiza o ângulo de rotação do objeto em função da direção
	#rotation += rotation_direction * rotation_speed * delta
	#move_and_slide()
	
	# 3.  Gira com o mouse, avança/volta com up/down
	#get_mouse_input()
	#move_and_slide()
	
	# 4. Clica com o mouse e movimenta o objeto até lá (automaticamente)	
	velocity = position.direction_to(target) * speed
	if position.distance_to(target) > 10:
		move_and_slide()
