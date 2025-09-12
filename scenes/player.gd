extends CharacterBody2D

@export var speed : int = 400
@onready var sprite := $PlayerSprite

#func _ready() -> void:
#	sprite = $PlayerSprite

func animate():
	if velocity.x > 0:
		sprite.play("right")
	elif velocity.x < 0:
		sprite.play("left")
	elif velocity.y > 0:
		sprite.play("down")
	elif velocity.y < 0:
		sprite.play("up")
	else:
		sprite.stop()

func get_8way_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	
func move_8way(delta):
	get_8way_input()
	animate()
	#move_and_slide()
	var collision_info := move_and_collide(velocity*delta)
	if collision_info:
		#print(collision_info.get_normal())
		velocity = velocity.bounce(collision_info.get_normal())
		move_and_collide(velocity * delta * 10)
	
	
func _physics_process(delta: float) -> void:
	move_8way(delta)	


func _on_area_2d_body_entered(body: Node2D) -> void:
	print("Entrei no Area2D")
