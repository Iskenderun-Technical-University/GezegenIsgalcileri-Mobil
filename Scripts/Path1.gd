extends Path2D

var en1 = load("res://Nodes/Enemies/enemy_1.tscn")
var t = 0
export var speed = 250

func _ready():
	var enemy_1 = en1.instance()
	$PathFollow2D.add_child(enemy_1)
	
	var enemy_2 = en1.instance()
	$PathFollow2D_2.add_child(enemy_2)

	var enemy_3 = en1.instance()
	$PathFollow2D_3.add_child(enemy_3)

func _process(delta):
	t += delta
	$PathFollow2D.offset = t * speed * -1
	$PathFollow2D_2.offset = -1 * t * speed - 50
	$PathFollow2D_3.offset = -1 * t * speed - 100
