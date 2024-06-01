extends Area2D

func _on_body_entered(body):
	if body.name == "Player":
		Music.stop()
		get_tree().change_scene_to_file("res://assets2/ending.tscn")
