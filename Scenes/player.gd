extends CharacterBody2D

@onready var animation = $AnimatedSprite2D
const SPEED = 100

var last_direction := Vector2.DOWN


func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("left", "right", "up", "down")
	velocity = direction * SPEED
	move_and_slide()
	# update last movement direction
	if direction != Vector2.ZERO:
		last_direction = direction

		# WALK animations
		if abs(direction.x) > abs(direction.y):
			if direction.x < 0:
				animation.play("walk_left")
			else:
				animation.play("walk_right")
		else:
			if direction.y < 0:
				animation.play("walk_up")
			else:
				animation.play("walk_down")

	else:
		# IDLE animations (based on last direction)
		if last_direction.x < 0:
			animation.play("idle_left")
		elif last_direction.x > 0:
			animation.play("idle_right")
		elif last_direction.y < 0:
			animation.play("idle_up")
		else:
			animation.play("idle_down")
		
