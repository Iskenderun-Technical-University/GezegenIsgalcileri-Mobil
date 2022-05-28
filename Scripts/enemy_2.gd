extends "res://Scripts/enemy_1.gd"

var bullet = load("res://Nodes/ShootStyle1.tscn")

var bullet_speedY = 400.0
var bullet_speedX = 100.0
var bullet_speedX_slowed = 300.0
var bullet_slowdownTime = 0.25

func shoot(level):
	level = 1	#set level 1 for debugging

	#instance a bullet for 3 times
	if level == 1:
		for i in range(3):
			var en_bullet = bullet.instance()
			en_bullet.speedY = bullet_speedY
			en_bullet.speedX = bullet_speedX
			en_bullet.slowdown_time = bullet_slowdownTime
			
			if i == 1:
				en_bullet.speedY += 50
			 
			en_bullet.transform = $BulletSpawnPos.get_global_transform()
			get_parent().get_parent().get_parent().add_child(en_bullet)
			bullet_speedX -= 100.0

func _ready():
	yield(get_tree().create_timer(2), "timeout")
	shoot(1)

func _on_enemy_2_area_entered(area):
	destroy(area)
