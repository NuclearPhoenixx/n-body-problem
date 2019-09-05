extends Label

func _process(delta): # show pause text if the simulation has been paused
	visible = get_tree().paused
