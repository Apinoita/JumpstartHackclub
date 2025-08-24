extends RigidBody2D


const SPEED = 10000.0
const JUMP_VELOCITY = -400.0

var spawnpos
var spawndir

func _ready() -> void:
	set_contact_monitor(true)
	set_max_contacts_reported(5)
	
	var direction := Input.get_axis("Left", "Right")
	global_position = spawnpos
	apply_central_force(Vector2(cos(spawndir)*SPEED, -sin(spawndir)*SPEED))
	global_rotation = -spawndir


func _on_body_entered(body: Node) -> void:
	if not body.is_in_group("map") and not body.is_in_group("dontdestrou"):
		Global.addpoint()
		body.call_deferred("queue_free")
	call_deferred("queue_free")
