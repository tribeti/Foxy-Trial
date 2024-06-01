extends Area2D

signal tele

func _on_body_entered(body):
	if body.name == "Player":
		emit_signal('tele')
