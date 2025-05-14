extends CharacterBody2D


var speed = 200


func _physics_process(delta: float) -> void:
	
	
	if Input.is_action_pressed("left"):
		velocity.x = - speed
	
	elif Input.is_action_pressed("right"):
		velocity.x = speed
	
	else:
		velocity.x = 0
	
	if Input.is_action_pressed("up"):
		velocity.y = - speed
	
	elif Input.is_action_pressed("down"):
		velocity.y = speed
	
	else:
		velocity.y = 0
	
	
	
	
	
	
	move_and_slide()
