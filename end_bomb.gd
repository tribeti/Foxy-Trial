extends Area2D

signal end_b
func _on_body_entered(body):
	if body.name == "Player":
		end_b.emit()
		queue_free()
