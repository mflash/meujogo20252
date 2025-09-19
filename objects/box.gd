extends Area2D

func _ready() -> void:
	$AnimationPlayer.play("scale")
	#var tween = get_tree().create_tween().set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_IN_OUT)
	#tween.tween_property(self, "scale", Vector2(1.2, 1.2), 0)
	#tween.tween_property(self, "scale", Vector2(1.5, 1.5), 0.5)
	#tween.tween_property(self, "scale", Vector2(1, 1), 0.5)
		

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	print("Saiu da tela!")
	queue_free()
	
func apareceu():
	print("Apareceu!")
