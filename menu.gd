extends Control

@onready var panel = $how/CanvasLayer/Panel
@onready var color_rect = $ColorRect
@onready var animation_player = $ColorRect/AnimationPlayer

func _ready():
	Music.play()

func _on_play_pressed():
	color_rect.show()
	animation_player.play("fade_out")
	await animation_player.animation_finished
	get_tree().change_scene_to_file("res://assets2/main.tscn")

func _on_quit_pressed():
	get_tree().quit()

func _on_how_pressed():
	panel.show()

func _on_x_pressed():
	panel.hide()
