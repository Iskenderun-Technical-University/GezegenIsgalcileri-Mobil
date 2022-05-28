extends Path2D

var t = 1
export var speed = 400
	
func _process(delta):
	t += delta
	$PathFollow2D.offset = t * speed
