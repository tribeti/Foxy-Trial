extends Area2D

@onready var jump_handle = %Jump_Handle

func _on_body_entered(body):
	if body.name == "Player":
		jump_handle._bounce_process()
