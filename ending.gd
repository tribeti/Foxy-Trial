extends Control

@onready var end_cutscen = $CanvasLayer/end_cutscene

func _ready():
	Music.stop()
	await end_cutscen.animation_finished
	get_tree().change_scene_to_file("res://assets2/menu.tscn")
