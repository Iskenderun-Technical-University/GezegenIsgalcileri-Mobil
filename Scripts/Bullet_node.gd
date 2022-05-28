extends Area2D

export var speed = 1000.0

func _process(delta):
	position.y -= speed * delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
