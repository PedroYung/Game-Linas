extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -400.0

var is_jumping := false

@onready var animation := $anim as AnimatedSprite2D

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta


	# Handle jump.
	if Input.is_action_just_pressed("MV_Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		is_jumping = true
	elif is_on_floor():
		is_jumping = false


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("MV_Esquerda", "MV_Direita")
	
	if direction:
		velocity.x = direction * SPEED
		animation.scale.x = direction
		if !is_jumping:
			animation.play("Run")
		
	elif is_jumping:
		animation.play("Jump")
		
	
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animation.play("Idle")

	move_and_slide()
