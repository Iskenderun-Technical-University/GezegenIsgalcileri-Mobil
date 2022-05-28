extends Area2D

signal died
export (PackedScene) var point_small
export var hp = 4

func destroy(areaEnteredObject):
	if areaEnteredObject.is_in_group("Bullets") or areaEnteredObject.is_in_group("Player"):
		hp -= 1
		areaEnteredObject.call_deferred("queue_free")
		if hp <= 0:
			emit_signal("died")
			call_deferred("queue_free")

func _ready():
	print(get_name())

func _on_enemy_1_area_entered(area):
	destroy(area)

# Queue free when screen exited
func _on_VisibilityNotifier2D_screen_exited():
	call_deferred("queue_free")
	print(get_name() + "has exited of screen")

