extends Label

onready var camera = get_tree().get_root().get_node("Control/Spacetime/Camera2D")

func _physics_process(delta):
	var obj = camera.follow_node
	
	if typeof(obj) == 0: # if camera is fixed then show stats of that object
		self.hide()
	else:
		self.show()
		self.set_text("Velocity: (" + String(stepify(obj.v.x, 1)) + ", " + String(stepify(obj.v.y, 1)) + ") [m/s]")
