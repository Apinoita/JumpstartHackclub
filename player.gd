extends CharacterBody2D


const SPEED = 400.0
const JUMP_VELOCITY = -900.0
@onready var main = get_tree().get_root().get_node("Node")
@onready var projectile = load("res://projectile.tscn")


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	
		
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SPEED
		if Input.is_action_just_pressed("Shoot"):
			var instance = projectile.instantiate()
			instance.spawnpos = global_position
			main.add_child.call_deferred(instance)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
