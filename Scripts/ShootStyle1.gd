extends Area2D

var speedY
var speedX
var slowdown_time
var speedY_slowed

func _process(delta):
	var direction = Vector2(speedX * delta, speedY * delta)
	direction.normalized()
	position += direction
	
	#position.y += delta * speedY
	#position.x += delta * speedX
	
func _ready():
	yield(get_tree().create_timer(slowdown_time), "timeout")
	speedY = speedY / 2
	speedX = speedX / 2

func _on_ShootStyle1_area_entered(area):
	if area.is_in_group("Player"):
		area.queue_free()
		queue_free()
