extends CharacterBody2D

@export var speed := 300.0
@export var jump_speed := -1000.0
@export var gravity := 2500.0

@onready var sprite := $PlayerSprite

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
	velocity.x = vel * speed

func move_side(delta):
	print(velocity.y)
	velocity.y += gravity * delta
	get_side_input()
	animate_side()
	move_and_slide()

func _physics_process(delta):
#   move_8way(delta)
	move_side(delta)
