extends CharacterBody2D

@export var thrust_force: float = 200.0
@export var gravity: float = 80.0
@export var lift_multiplier: float = 10.5
@export var drag_coefficient: float = 0.002
@export var turn_speed: float = 3 
@export var direction: Vector2 = Vector2(1,0)

func _physics_process(delta: float) -> void:
	#ROTATION
	if Input.is_action_pressed("down"):
		direction=direction.rotated(turn_speed*delta)
		rotate(turn_speed*delta)
	if Input.is_action_pressed("up"):
		direction=direction.rotated(-turn_speed*delta)
		rotate(-turn_speed*delta)
	#THRUST
	if Input.is_action_pressed("thrust"):
		velocity += direction * thrust_force*delta
	#LIFT NEEDS TWEAKING
	velocity+=direction.rotated(-1.5708)*lift_multiplier*delta
	#GRAVITY
	print(velocity.y)
	if velocity.y<=200:
		velocity.y += gravity * delta
	#DRAG
	velocity.x -= sign(velocity.x)*drag_coefficient*(pow(velocity.x,2)/2)*delta
	velocity.y -= sign(velocity.y)*drag_coefficient*(pow(velocity.y,2)/2)*delta
	move_and_slide()
