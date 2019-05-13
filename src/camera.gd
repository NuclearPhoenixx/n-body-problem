extends Camera2D

var frame_speed = 20 # camera speed in px/frame
var zoom_depth = 0.1 # camera zoom depth
var max_zin = Vector2(0.1, 0.1) # max zoom in
var max_zout = Vector2(5, 5) # max zoom out

func check_camera(): # camera movement, wasd or arrow keys
	if Input.is_action_pressed("ui_down"):
		position += Vector2(0,1) * frame_speed
	
	if Input.is_action_pressed("ui_up"):
		position += Vector2(0,-1) * frame_speed
	
	if Input.is_action_pressed("ui_right"):
		position += Vector2(1,0) * frame_speed
	
	if Input.is_action_pressed("ui_left"):
		position += Vector2(-1,0) * frame_speed

func _process(delta):
	check_camera()

func _input(event): # check scroll wheel, camera zoom in and out
	if event.is_action_pressed("camera_zin"):
		if zoom > max_zin:
			zoom += Vector2(-1,-1) * zoom_depth
	
	if event.is_action_pressed("camera_zout"):
		if zoom < max_zout:
			zoom += Vector2(1,1) * zoom_depth
