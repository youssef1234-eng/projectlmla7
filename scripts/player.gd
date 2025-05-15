extends CharacterBody2D


var speed = 250
var jump = 350
var gravity = 15

@onready var animation: AnimatedSprite2D = $Sprite2D



func _physics_process(delta: float) -> void:
	
	if (velocity.x > 1 and velocity.x > -1):
		animation.animation = "runing"
	else:
		animation.animation = "idle"
	move_and_slide()
	
	var isleft = velocity.x < 0
	animation.flip_h = isleft
	pass
	
	
	if Input.is_action_pressed("left"):
		velocity.x = - speed
	elif Input.is_action_pressed("right"):
		velocity.x = speed
	else:
		velocity.x = 0

	
	if not is_on_floor(): 
		velocity.y += gravity
		animation.animation = "jump"
		
	
	if is_on_floor():
		if Input.is_action_just_pressed("up"):
			velocity.y = -jump
			
		
	
	
	
	
	
