extends CharacterBody2D

@export var speed := 300.0
@export var jump_speed := -1000.0
@export var gravity := 2500.0
@export var box : PackedScene
@onready var jump_sound := $Jump

@onready var sprite := $PlayerSprite
#@onready var box := preload("res://objects/box.tscn")

signal jumped # indica que o jogador pulou

func animate_side():
	if velocity.x > 0:
		sprite.play("right")
	elif velocity.x < 0:
		sprite.play("left")
	else:
		sprite.stop()
		
func get_side_input():
	velocity.x = 0
	var vel := Input.get_axis("left", "right")
	var jump := Input.is_action_pressed('ui_select')

	if is_on_floor() and jump:
		velocity.y = jump_speed
		# Aumentar o score em 1 ponto
		#jumped.emit(5) # emite o sinal (notificação)
		get_tree().call_group("HUD", "updateScore", 10)
		var b := box.instantiate()
		b.position = global_position
		owner.add_child(b)
		# Emite o som de pulo
		#if not jump_sound.playing:
		jump_sound.play()
		
	if Input.is_action_just_pressed("filter"):
		print("Ativa/desativa filtro de áudio")
		print(AudioServer.get_bus_name(1))
		var filtro : AudioEffectLowPassFilter = AudioServer.get_bus_effect(1, 0)		
		if filtro.cutoff_hz == 2000:
			filtro.cutoff_hz = 200
		else:
			filtro.cutoff_hz = 2000
		
	velocity.x = vel * speed

func move_side(delta):
	#print(velocity.y)
	velocity.y += gravity * delta
	get_side_input()
	animate_side()
	move_and_slide()	

func _physics_process(delta):
#   move_8way(delta)
	move_side(delta)
