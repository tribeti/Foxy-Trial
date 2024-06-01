extends Area2D

signal tnt

func _on_body_entered(body):
	if body.name == "Player":
		tnt.emit()
		queue_free()
