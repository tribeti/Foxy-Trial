extends Area2D

signal bomb

func _on_body_entered(body):
	if body.name == "Player":
		bomb.emit()
		queue_free()
