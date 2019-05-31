extends Camera2D

var frame_speed = 10 # camera speed in px/frame
var zoom_depth = 0.1 # camera zoom depth
var max_zin = Vector2(0.1, 0.1) # max zoom in
var max_zout = Vector2(5, 5) # max zoom out

func check_camera(): # camera movement, wasd or arrow keys
	if Input.is_action_pressed("ui_down"):
		position += Vector2(0,1) * frame_speed
		get_tree().set_input_as_handled()
	
	if Input.is_action_pressed("ui_up"):
		position += Vector2(0,-1) * frame_speed
		get_tree().set_input_as_handled()
	
	if Input.is_action_pressed("ui_right"):
		position += Vector2(1,0) * frame_speed
		get_tree().set_input_as_handled()
	
	if Input.is_action_pressed("ui_left"):
		position += Vector2(-1,0) * frame_speed
		get_tree().set_input_as_handled()

var follow_node = null

func _process(delta):
	if typeof(follow_node) != 0:
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
		follow_node = null
	
	if event.is_action_pressed("pause"): # pause simulation
		get_tree().set_input_as_handled()
		if get_tree().paused:
			get_tree().paused = false
		else:
			get_tree().paused = true
