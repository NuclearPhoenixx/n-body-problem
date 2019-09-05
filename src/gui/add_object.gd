extends Button

onready var main = get_tree().get_root().get_node("Main/Spacetime")

func _unhandled_input(event):
	if pressed && event.is_action_pressed("ui_select"): #if button is toggled and user clicks on the screen, spawn object
		get_tree().set_input_as_handled()
		var position = main.get_local_mouse_position()
		
		# RANDOM PLACEHOLDER STUFF
		var r = rand_range(0,1)
		var g = rand_range(0,1)
		var b = rand_range(0,1)
		var mass = rand_range(1e22,1e26)
		var velocity = Vector2(rand_range(-400000,400000),rand_range(-400000,400000))
		
		#spawn an object at the event location
		main.spawn(position, velocity, mass, Color(r,g,b,1), 10)

func _toggled(button_pressed):
	if button_pressed:
		Input.set_default_cursor_shape(Input.CURSOR_CROSS)
	else:
		Input.set_default_cursor_shape(0)
