extends CharacterBody2D


const SPEED = 3000.0
const JUMP_VELOCITY = -400.0

var spawnpos

func _ready() -> void:
	
	var direction := Input.get_axis("Left", "Right")
	global_position = Vector2(spawnpos.x+(direction*100),spawnpos.y)
	velocity.x = direction * SPEED

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta * 1/2

	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY

	
# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	move_and_slide()
