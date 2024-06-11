extends Node2D

@onready var player = %Player
@onready var bounce = %bounce

func _bounce_process():
	player.velocity.y = -1300
	bounce.play()
