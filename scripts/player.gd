extends CharacterBody2D


var speed = 250
var jump = 350
var gravity = 15

@onready var animated: AnimatedSprite2D = $AnimatedSprite2D



func _physics_process(delta: float) -> void:
	
	
	
	if not is_on_floor(): 
		velocity.y += gravity
		animated.play("jump")

		
	
	if is_on_floor():
		if Input.is_action_just_pressed("up"):
			velocity.y = -jump
			
	
	
	
	
	
	
	if Input.is_action_pressed("left"):
		velocity.x = - speed
		animated.play("run")
	elif Input.is_action_pressed("right"):
		velocity.x = speed
		animated.play("run")
	else:
		velocity.x = 0
		animated.play("idle")

	
	
			
		
	
	move_and_slide()
	
	
	
