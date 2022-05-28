extends Path2D

var en1 = load("res://Nodes/Enemies/enemy_2.tscn")
export var speed = 250

#t will be eqal to path offset point
var t = 0

#backup the path 
var backup_t = 0

#direction
var offsetDirection = 1

func _ready():
	var enemy_1 = en1.instance()
	enemy_1.rotation += deg2rad(90)
	$PathFollow2D.add_child(enemy_1)


func _process(delta):
	t += delta * offsetDirection
	$PathFollow2D.offset = t * speed
	if $PathFollow2D.offset >= 318.5:
		backup_t = t
		offsetDirection = 0
		yield(get_tree().create_timer(0.75), "timeout")
		t = backup_t
		offsetDirection = 1

