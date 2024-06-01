extends Area2D

signal back

func _on_body_entered(body):
	if body.name == "Player":
		$CanvasLayer/panel.show()

func _on_duh_pressed():
	emit_signal('back')
	$CanvasLayer/panel.hide()	

func _on_nah_pressed():
	$CanvasLayer/panel.hide()

func _on_body_exited():
	$CanvasLayer/panel.hide()
