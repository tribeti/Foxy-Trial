extends Area2D

var direction : Vector2 = Vector2.RIGHT
var speed : float = 300

func _physics_process(delta):
	position += speed * direction * delta 

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _on_body_entered(body):
	if body.name == "Player":
		get_tree().reload_current_scene()
