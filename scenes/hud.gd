extends CanvasLayer

@onready var scoreLabel := $Score

var score : int = 0

func _ready() -> void:
	updateScore(0)
	
func updateScore(delta: int):
	score += delta
	scoreLabel.text = "Score: " + str(score)

func _on_player_jumped(delta: int) -> void:
	updateScore(delta)
