extends Button

onready var camera = get_tree().get_root().get_node("Control/Spacetime/Camera2D")

func _physics_process(delta):
	if typeof(camera.follow_node) == 0: # if camera is fixed then show delete button
		self.hide()
	else:
		self.show()

func delete_node(): # delete the selected node and stop camera follow
	camera.follow_node.queue_free()
	camera.follow_node = null

# ON DELETE BUTTON PRESS OR KEY INPUT TRIGGER DELETION
func _on_Button_pressed():
	delete_node()

func _unhandled_input(event):
	if event.is_action_pressed("delete") && typeof(camera.follow_node) != 0:
		get_tree().set_input_as_handled()
		delete_node()
