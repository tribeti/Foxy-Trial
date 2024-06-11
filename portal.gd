extends Area2D

@onready var player = $"../Player"

func _on_body_entered(body):
	if body.name == "Player":
		$CanvasLayer/Panel.show()

func _on_duh_pressed():
	player.position = Vector2(881, -19319)
	$CanvasLayer/Panel.hide()	

func _on_nah_pressed():
	$CanvasLayer/Panel.hide()

func _on_body_exited():
	$CanvasLayer/Panel.hide()
