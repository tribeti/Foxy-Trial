extends Area2D

@onready var panel = $CanvasLayer/Panel

func _on_body_entered(body):
	if body.name == "Player":
		panel.show()
		$AudioStreamPlayer2D.play()
		await get_tree().create_timer(5.0).timeout
		panel.hide()
		queue_free()
