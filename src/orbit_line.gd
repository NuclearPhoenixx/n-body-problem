extends Line2D

onready var cam = get_node("../Camera")

var max_orbit_length = 400 #max number of points to draw on orbit
var min_step_length = 10 #min number of pixels moved for new orbit point

func _on_OrbitToggle_toggled(button_pressed):
	visible = button_pressed

func _process(delta):
	var node = cam.follow_node
	if node == null:
		return
	
	if points.size() == 0 or (node.position - points[points.size()-1]).length() >= min_step_length:
			add_point(node.position)
			if points.size() > max_orbit_length:
				remove_point(0)
	
	print(points.size())

func _on_Camera_reset():
	clear_points()
