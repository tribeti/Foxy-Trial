extends Area2D

signal jumpboost

func _on_body_entered(body):
	if body.name == "Player":
		emit_signal('jumpboost')
