extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -650.0
var hitboxsize = 105
var shooted = 0
var maxshoot = 6*2

@onready var main = get_tree().get_root().get_node("Node")
@onready var projectile = load("res://projectile.tscn")

func shoot(mouseloc) -> void:
	if Input.is_action_just_pressed("Shoot"):
		var viewportsize = get_viewport().get_visible_rect().size
		var dir
		if (-mouseloc.y+viewportsize.y/2) >= 0:
			dir = atan((-mouseloc.y+viewportsize.y/2)/(mouseloc.x-viewportsize.x/2))
			if (mouseloc.x-viewportsize.x/2) < 0:
				dir = PI+dir
		else:
			dir = atan((-mouseloc.y+viewportsize.y/2)/(mouseloc.x-viewportsize.x/2))
			if (mouseloc.x-viewportsize.x/2) < 0:
				dir = -PI+dir
		print(dir)
		var instance = projectile.instantiate()
		instance.spawnpos = Vector2(global_position.x+cos(dir)*hitboxsize, global_position.y-sin(dir)*hitboxsize)
		instance.spawndir = dir
		main.add_child.call_deferred(instance)
	shooted += 1
	print(shooted)

func _input(event):
	# Mouse in viewport coordinates.
	if event is InputEventMouseButton and maxshoot >= shooted:
		shoot(event.position)

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	if global_position.y >= 325:
		Global.getandclearpoints()
		get_tree().change_scene_to_file("res://node.tscn")
		
	if global_position.x < -3200:
		get_tree().change_scene_to_file("res://winscreen.tscn")
		
		
	
		
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	

	move_and_slide()
