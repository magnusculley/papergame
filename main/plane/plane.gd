extends CharacterBody2D
var speed = 2
var direction=Vector2(100,0)
const ANGLE =.01
const GRAVITY = Vector2(0,2000)
const DRAG=.002
const LIFT=0

func _process(delta):
	#ROTATION
	if Input.is_action_pressed("down"):
		direction=direction.rotated(ANGLE)
		rotate(ANGLE)
	if Input.is_action_pressed("up"):
		direction=direction.rotated(-ANGLE)
		rotate(-ANGLE)
	#APPLYING DRAG TO SPEED
	var drag_force=DRAG*(pow(speed,2)/2)
	speed =speed-drag_force
	#PRE VELOCITY
	velocity=direction*speed
	#GRAVITY
	print(delta)
	velocity+=GRAVITY*delta
	print(velocity)
	move_and_slide()
