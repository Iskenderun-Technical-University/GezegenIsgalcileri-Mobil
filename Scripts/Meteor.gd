extends Area2D

var speedX
var speedY

func _process(delta):
	position += Vector2(speedX * delta, speedY * delta)

func _on_Area2D_area_entered(area):
	if area.is_in_group("Bullets"):
		queue_free()
	
	elif area.is_in_group("Player"):
		queue_free()
		area.queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
