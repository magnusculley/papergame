extends CharacterBody2D
@onready var ray = $RayCast2D

func _ready():
	pass

func _process(delta):
	if Input.is_action_just_pressed("down"):
		self.ray.rotate(5)
	velocity=self.ray.target_position
	move_and_slide()
