extends Area2D


func _on_body_entered(body):
	if body.name == "Player":
		$CanvasLayer/Panel.show()

func _on_body_exited(body):
	if body.name == "Player":
		$CanvasLayer/Panel.hide()
