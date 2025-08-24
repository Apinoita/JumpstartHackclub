extends Node

var points:int
# Called when the node enters the scene tree for the first time.
func addpoint() -> void:
	points += 1

func getandclearpoints() -> int:
	var p = points
	points = 0
	return p
	


func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
