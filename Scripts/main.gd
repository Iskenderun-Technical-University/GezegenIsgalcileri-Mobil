extends Node2D

#exporting needed nodes
export (PackedScene) var bullet_node
export (PackedScene) var point_small
export (PackedScene) var path1Node
export (PackedScene) var path2Node
export (PackedScene) var path3aNode
export (PackedScene) var enemy1
export (PackedScene) var enemy2
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
func pathLoader(pathFile,pos, rot, destroyDelay):
	var path2d = pathFile.instance()
	
	path2d.rotation = deg2rad(rot)
	path2d.position = pos
	$paths.add_child(path2d)
	
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
	yield(get_tree().create_timer(2), "timeout")
	callMeteor(Vector2(100, 0), 0, 400)
	yield(get_tree().create_timer(0.8), "timeout")
	callMeteor(Vector2(150, 0), 10, 500)
	callMeteor(Vector2(300, 0), 10, 600)
	yield(get_tree().create_timer(0.8), "timeout")
	callMeteor(Vector2(200, 0), -20, 550)
	yield(get_tree().create_timer(0.8), "timeout")
	callMeteor(Vector2(150, 0), 10, 460)
	yield(get_tree().create_timer(0.8), "timeout")
	callMeteor(Vector2(400, 0), -30, 380)
	callMeteor(Vector2(150, 0), 10, 500)
	callMeteor(Vector2(40, 0), 50, 400)
	yield(get_tree().create_timer(0.8), "timeout")
	callMeteor(Vector2(370, 0), 5, 360)
	yield(get_tree().create_timer(0.8), "timeout")
	callMeteor(Vector2(260, 0), 8, 480)
	yield(get_tree().create_timer(0.8), "timeout")
	callMeteor(Vector2(460, 0), -8, 430)
	callMeteor(Vector2(150, 0), 10, 460)
	yield(get_tree().create_timer(0.8), "timeout")
	callMeteor(Vector2(250, 0), 15, 270)
	yield(get_tree().create_timer(1), "timeout")
	pathLoader(path2Node, Vector2(-200, 0), 0, 10)
	yield(get_tree().create_timer(0.5), "timeout")
	pathLoader(path2Node, Vector2(-150, 0), 0, 10)
	pathLoader(path2Node, Vector2(100, 0), 0, 10)
	yield(get_tree().create_timer(0.3), "timeout")
	pathLoader(path2Node, Vector2(-20, 0), 0, 10)
	pathLoader(path2Node, Vector2(150, 0), 0, 10)
	yield(get_tree().create_timer(0.3), "timeout")
	pathLoader(path2Node, Vector2(-20, 0), 0, 10)
	yield(get_tree().create_timer(0.5), "timeout")
	pathLoader(path2Node, Vector2(-150, 0), 0, 10)
	pathLoader(path2Node, Vector2(100, 0), 0, 10)
	yield(get_tree().create_timer(0.3), "timeout")
	pathLoader(path2Node, Vector2(-20, 0), 0, 10)
	yield(get_tree().create_timer(1), "timeout")
	pathLoader(path1Node, Vector2(0, 0), 0, 10)
	
