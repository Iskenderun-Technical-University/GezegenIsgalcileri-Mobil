extends Node2D

#exporting needed nodes
export (PackedScene) var bullet_node
export (PackedScene) var point_small
export (PackedScene) var path1Node
export (PackedScene) var path2Node
export (PackedScene) var path3aNode
var meteor = load("res://Nodes/Enemies/Meteor.tscn")

class Meteor:
	var speedX
	var speedY
	var pos
	var degree

#Bullet spawn points
export var bullet0SpawnOffset = Vector2(10, -20)
export var bullet1SpawnOffset = Vector2(-10, -20)

var is_hit = false
var controlling = false
var point_pos = Vector2.ZERO

#Function to create paths, takes 4 parameters
func pathLoader(pathFile, enemyOnPath,pos, rot, destroyDelay):
	var path2d = pathFile.instance()
	var enemy = enemyOnPath.instance()
	
	path2d.rotation = deg2rad(rot)
	path2d.position = pos
	$paths.add_child(path2d)
	path2d.add_child(enemy)
	
	yield(get_tree().create_timer(destroyDelay), "timeout")
	path2d.call_deferred("queue_free")

func callMeteor(pos, spdX, spdY):
	var en = meteor.instance()
	en.speedX = spdX
	en.speedY = spdY
	en.position = pos
	get_parent().add_child(en)
	
	
	
	
func _ready():
	wave1()

func _on_Player_hit():
	is_hit = true

#Make player be able to shoot on fixed times
func _on_ShootCooldown_timeout():
	if (Input.is_action_pressed("shoot") || controlling) && !is_hit:
		var bullet = bullet_node.instance()
		bullet.position = $Player.position
		$bullets.add_child(bullet)

func _on_Player_on_control():
	controlling = true
	
func wave1():
	yield(get_tree().create_timer(1), "timeout")
	callMeteor(Vector2(100, 100), 0, 200)
