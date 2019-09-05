extends Button

onready var camera = get_tree().get_root().get_node("Main/Spacetime/Camera")

func _process(delta):
	if camera.follow_node == null: #if camera is fixed then show delete button
		hide()
	else:
		show()

func _on_DeleteButton_pressed(): # delete the selected node and stop camera follow
	camera.follow_node.queue_free()
	camera.follow_node = null
