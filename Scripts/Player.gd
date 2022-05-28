extends Area2D
signal hit

var offsetX
var offsetY
var drag_offsetX
var drag_offsetY

export (PackedScene) var bullet_node
var touch_pos = Vector2()
var screen_size = Vector2.ZERO

func _ready():
	screen_size = get_viewport_rect().size
	print(screen_size)

func _input(event):
	if event is InputEventScreenTouch and event.is_pressed():
		touch_pos = event.get_position()
		offsetX = touch_pos.x - position.x
		offsetY = touch_pos.y - position.y
		Input.action_press("shoot")
	elif event is InputEventScreenDrag:
		touch_pos = event.get_position()
		drag_offsetX = touch_pos.x - offsetX
		drag_offsetY = touch_pos.y - offsetY
		set_position(Vector2(drag_offsetX, drag_offsetY))
		Input.action_press("shoot")
	else:
		if Input.is_action_pressed("move_up"):
			Input.action_press("shoot")
		else:
			Input.action_release("shoot")
	
	
func _process(_delta):
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)

func _on_Player_area_entered(area):
	if area.is_in_group("Enemies"):
		emit_signal("hit")
		queue_free()

