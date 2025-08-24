extends RigidBody2D


const SPEED = 3000.0
const JUMP_VELOCITY = -400.0

var spawnpos
var spawndir

func _ready() -> void:
	
	var direction := Input.get_axis("Left", "Right")
	global_position = spawnpos
	apply_central_force(Vector2(cos(spawndir)*SPEED, -sin(spawndir)*SPEED))
