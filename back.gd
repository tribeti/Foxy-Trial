extends Area2D

@onready var player = $"../Player"

func _on_body_entered(body):
	if body.name == "Player":
		$CanvasLayer/panel.show()

func _on_duh_pressed():
	player.position = Vector2(1942, -2165)
	$CanvasLayer/panel.hide()	

func _on_nah_pressed():
	$CanvasLayer/panel.hide()

func _on_body_exited():
	$CanvasLayer/panel.hide()
