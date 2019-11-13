extends Label

func _on_TimeScale_value_changed(value):
	var scale = pow(20, value)
	
	text = "Timescale: " + str(stepify(scale, .001))
	Engine.set_time_scale(scale) #adjust the engine clock tick
