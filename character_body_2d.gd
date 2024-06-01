extends CharacterBody2D

const SPEED = 380.0

@onready var animation = $AnimatedSprite2D

var JUMP_VEL = 800
var is_jumping = false
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var last_direction = 1

func _physics_process(delta):
	if (velocity.x > 1 || velocity.x < -1):
		animation.play("run")
		last_direction = sign(velocity.x)
	else:
		animation.play("idle")
		pass

	if not is_on_floor():
		velocity.y += gravity * delta

	if is_jumping:
		animation.play("jump")
	elif velocity.y > 0:
		animation.play("fall")

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -JUMP_VEL
		is_jumping = true
		$jmp.play()

	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 100)

	move_and_slide()

	# Sử dụng last_direction để flip animation khi không di chuyển
	var is_left = last_direction < 0
	animation.flip_h = is_left

	if is_on_floor() and is_jumping:
		is_jumping = false

func _on_spring_jumpboost():
	velocity.y = -1300
	$Jump.play()

func _on_boot_tele():
	position = Vector2(1314, -1465)

func _on_portal_minigame():
	position = Vector2(881, -19319)

func _on_back_back():
	position = Vector2(1942, -2165)
