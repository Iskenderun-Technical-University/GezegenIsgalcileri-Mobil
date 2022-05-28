extends Area2D

signal point_s_received
export var speed = -125

func _ready():
	speed = -125
	yield(get_tree().create_timer(1.0), "timeout")
	speed *= -1

func _process(delta):
	position.y += speed * delta
	speed += 0.1

func _on_point_s_area_entered(area):
	if area.is_in_group("Player"):
		emit_signal("point_s_received")
		queue_free()
