extends Area2D


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	print("Saiu da tela!")
	queue_free()
	
func apareceu():
	print("Apareceu!")
