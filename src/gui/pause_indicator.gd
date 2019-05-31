extends MarginContainer

func _process(delta): # show pause text if the simulation has been paused
	if get_tree().paused:
		show()
	else:
		hide()
