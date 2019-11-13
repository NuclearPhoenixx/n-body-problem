extends Camera2D

var frame_speed = 15 # camera speed in px/frame
var zoom_depth = 0.1 # camera zoom depth
var max_zin = Vector2(0.1, 0.1) # max zoom in
var max_zout = Vector2(5, 5) # max zoom out

var follow_node = null setget new_node

signal reset #reset camera

func new_node(node):
	follow_node = node
	emit_signal("reset")

func check_camera(): # camera movement, wasd or arrow keys
	var goto = Vector2(0,0)
	
	if Input.is_action_pressed("ui_down"):
		goto += Vector2(0,1)
	if Input.is_action_pressed("ui_up"):
		goto += Vector2(0,-1)
	if Input.is_action_pressed("ui_right"):
		goto += Vector2(1,0)
	if Input.is_action_pressed("ui_left"):
		goto += Vector2(-1,0)
	
	if goto.length() != 0:
		position += goto * frame_speed

func _process(delta):
	if follow_node != null:
		set_position(follow_node.get_position())
	else:
		check_camera()

func _unhandled_input(event):
	if event.is_action_pressed("camera_zin"): # check scroll wheel, camera zoom in and out
		get_tree().set_input_as_handled()
		if zoom > max_zin:
			zoom += Vector2(-1,-1) * zoom_depth
	
	if event.is_action_pressed("camera_zout"):
		get_tree().set_input_as_handled()
		if zoom < max_zout:
			zoom += Vector2(1,1) * zoom_depth
	
	if event.is_action_pressed("ui_cancel"): # free fixed camera from node
		get_tree().set_input_as_handled()
		new_node(null)
	
	if event.is_action_pressed("pause"): # pause simulation
		var tree = get_tree()
		tree.set_input_as_handled()
		tree.paused = !tree.paused
