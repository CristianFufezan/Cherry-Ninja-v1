extends CharacterBody2D


const SPEED = 400.0
const JUMP_VELOCITY = -700.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var jump_count = 0

func _physics_process(delta: float) -> void:
	# Animation
	if (velocity.x > 1 || velocity.x < -1):
		animated_sprite_2d.animation = "run"
	else:
		animated_sprite_2d.animation = "idle"
	
	# Add the gravity.
	if is_on_floor():
		jump_count = 0
	else:
		velocity += get_gravity() * delta
		animated_sprite_2d.animation = "jump"

	# Handle jump.
	if Input.is_action_just_pressed("jump") and jump_count < 2:
		velocity.y = JUMP_VELOCITY
		jump_count += 1

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 50)

	move_and_slide()
	
	var isLeft = velocity.x < 0
	animated_sprite_2d.flip_h = isLeft
