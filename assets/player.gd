extends CharacterBody2D
var speed = 150
var jumb = 250
var gravity = 14

@onready var sprite_2d = $Sprite2D
@onready var jump_sound: AudioStreamPlayer = $"jump sound"
@onready var label_coins = $CanvasLayer/Label2




func _physics_process(delta):
	label_coins.text = str(Global.coins)
	
	Move()
	Jumb()
	Gravity()
	
	if (velocity.x > 1 ||  velocity.x < -1):
		sprite_2d.animation = "running"
	else:
		sprite_2d.animation = "default"
	move_and_slide()
	
	var isleft = velocity.x < 0
	sprite_2d.flip_h = isleft
	pass
	
	
func Move():
	if Input.is_action_pressed("left"):
		$"particels move".emitting =true
		velocity.x = -speed
	elif Input.is_action_pressed("right"):
		$"particels move".emitting =true
		velocity.x = speed
	else:
		$"particels move".emitting =false
		velocity.x = move_toward(velocity.x, 0,10)
	pass
	
	
func Jumb():
	if Input.is_action_just_pressed("jumb") and is_on_floor():
		jump_sound.play()
		$"particels move".emitting =false
		velocity.y = -jumb
	pass
	
	
func Gravity():
	if not is_on_floor():
		$"particels move".emitting =false
		velocity.y += gravity
		sprite_2d.animation = "jumping"
	pass
