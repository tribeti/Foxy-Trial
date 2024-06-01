extends Node2D

@onready var ray_cast_2d = $RayCast2D
@onready var timer = $Timer
@export var ammo : PackedScene

var player
func _ready():
	player = get_node("../Player")
	
func _physics_process(_delta):
	await get_tree().create_timer(2.0).timeout
	_aim()
	_check()

func _aim():
	ray_cast_2d.target_position = to_local(player.position)

func _check():
	if ray_cast_2d.get_collider() == player and timer.is_stopped():
		timer.start()
	elif ray_cast_2d.get_collider() != player and timer.is_stopped():
		timer.stop()

func _on_timer_timeout():
	if ray_cast_2d.enabled == true:
		_shoot()

func _shoot():
	var bullet = ammo.instantiate()
	bullet.position = position
	bullet.direction = (ray_cast_2d.target_position).normalized()
	get_tree().current_scene.add_child(bullet)

func _on_zone_body_entered(_body):
	ray_cast_2d.enabled = true
	
func _on_zone_body_exited(_body):
	ray_cast_2d.enabled = false
