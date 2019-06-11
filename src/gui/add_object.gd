extends Button

onready var main = get_tree().get_root().get_node("Control/Spacetime")

func _unhandled_input(event):
	if pressed && event.is_action_pressed("ui_select"): #if button is toggled and user clicks on the screen, spawn object
		get_tree().set_input_as_handled()
		var position = main.get_local_mouse_position()
		
		# RANDOM PLACEHOLDER STUFF
		var r = rand_range(0,1)
		var g = rand_range(0,1)
		var b = rand_range(0,1)
		var mass = rand_range(1e20,1e28)
		
		#spawn an object at the event location
		main.spawn(position, Vector2(rand_range(-400000,400000),rand_range(-400000,400000)), 1e26, Color(r,g,b,1), 10)