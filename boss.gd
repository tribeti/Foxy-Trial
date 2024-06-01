extends Node2D

signal end
@onready var timer = $Timer
@onready var turret = $"../Turret"
@onready var turret_2 = $"../Turret2"
@onready var boss_vision = $boss_vision

@export var speed = 400
@export var bomb_spawn_rate = 3.0
@export var ammo : PackedScene
@export var bomb : PackedScene
@export var tnt : PackedScene
@export var end_bomb : PackedScene
@export var end_gem : PackedScene

var bomb_spawn_timer = 0.0
var target_position = Vector2.ZERO
var move_duration = 3.0
var move_timer = 0.0
var is_moving = true
var health = 50
var spawn_counter = 0
var check = false

func _physics_process(_delta):
	_move(_delta)
	_handle_death()

func _process(delta):
	%TextureProgressBar.value = health
	# phase 1
	if health in range(11, 100):
		bomb_spawn_timer += delta
		if bomb_spawn_timer >= bomb_spawn_rate and spawn_counter < 10:
			_spawn()
			bomb_spawn_timer = 0.0
		elif spawn_counter == 10:
			return
	# phase 2
	elif health in range(1, 11):
		$start.hide()
		$"2nd".show()
		turret.timer.wait_time = 0.4
		turret_2.timer.wait_time = 0.4
		bomb_spawn_timer += delta
# time to spawn end bomb
		if bomb_spawn_timer >= 30.0:
			_end_bomb()
			return
	
	elif health <= 0:
		boss_vision.enabled = false
		$"2nd".hide()
		$end.show()
		set_physics_process(false)
		await get_tree().create_timer(3).timeout
		%TextureProgressBar.hide()
		$end.hide()
		
	_handle_death()

func _handle_death():
	if health <= 0 and !check:
		check = true
		print("check = " , check)
		get_parent().get_node("Turret2").queue_free()
		get_parent().get_node("Turret").queue_free()
		await get_tree().create_timer(3).timeout
		var eg = end_gem.instantiate()
		eg.position = Vector2(576, 392)
		get_tree().current_scene.add_child(eg)

func _move(delta):
	if is_moving:
		position = position.lerp(target_position, delta / move_duration)
		move_timer += delta
		if move_timer >= move_duration:
			is_moving = false
			move_timer = 0.0

			target_position = Vector2.ZERO
			var wait_time = randi_range(2, 5)
			await get_tree().create_timer(wait_time).timeout

			target_position = Vector2(randf_range(-440, 440),randf_range(-30, 280))
			is_moving = true
	else:
		target_position = Vector2.ZERO
		var wait_time = randi_range(2, 5)
		await get_tree().create_timer(wait_time).timeout
		target_position = Vector2(randf_range(-440, 440),randf_range(-30, 280))
		is_moving = true

	timer.start()

func _spawn():
	for i in range(1,2):
#load item
		var b = bomb.instantiate()
		var t = tnt.instantiate()
#random position
		b.position = Vector2(randi_range(60,1100) , randi_range(400,550))
		t.position = Vector2(randi_range(60,1100) , randi_range(400,550))
#connect to signal
		b.connect("bomb", _on_bomb)
		t.connect("tnt", _on_tnt)
#add to scene
		get_tree().current_scene.add_child(b)
		get_tree().current_scene.add_child(t)
		timer.stop()
		spawn_counter += 1

func _end_bomb():
	var eb = end_bomb.instantiate()
	eb.position = Vector2(576, 440)
	eb.connect("end_b", _on_end_bomb)
	get_tree().current_scene.add_child(eb)

# signal func
func _on_bomb():
	health -= 3

func _on_tnt():
	health -= 1

func _on_end_bomb():
	health -= 10
