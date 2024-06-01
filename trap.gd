extends Area2D

func _on_body_entered(body):
	if body.name == "Player":
		var tree = get_tree()
		if tree:
			tree.paused = true
			await get_tree().create_timer(1).timeout
			tree.paused = false
			tree.reload_current_scene()
