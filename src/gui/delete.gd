extends Button

onready var camera = get_tree().get_root().get_node("Control/Spacetime/Camera2D")

func _process(delta):
	if typeof(camera.follow_node) == 0: # if camera is fixed then show delete button
		self.hide()
	else:
		self.show()

func _on_Button_pressed(): # delete the selected node and stop camera follow
	camera.follow_node.queue_free()
	camera.follow_node = null
