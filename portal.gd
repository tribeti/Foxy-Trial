extends Area2D

signal minigame

func _on_body_entered(body):
	if body.name == "Player":
		$CanvasLayer/Panel.show()

func _on_duh_pressed():
	emit_signal('minigame')
	$CanvasLayer/Panel.hide()	

func _on_nah_pressed():
	$CanvasLayer/Panel.hide()

func _on_body_exited(body):
	$CanvasLayer/Panel.hide()
