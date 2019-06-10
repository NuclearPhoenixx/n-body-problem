extends Label

onready var camera = get_tree().get_root().get_node("Control/Spacetime/Camera2D")

var mass_prec = 5 # mass precision in places

func _process(delta):
	var obj = camera.follow_node
	
	if typeof(obj) == 0: # if camera is fixed then show stats of that object
		self.hide()
	else:
		self.show()
		var mass = obj.mass # get the mass in powers of ten
		var i = String(mass).length() - mass_prec
		self.set_text("Mass: " + String(stepify(mass / pow(10, i), 1)) + "e" + String(i) + " [kg]")
