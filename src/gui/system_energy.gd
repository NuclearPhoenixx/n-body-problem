extends Label

var c = 299792458

func lorentz(v):
	return 1 / sqrt(1 - pow( v.length()/c ,2))

func _process(delta):
	if get_tree().paused: #if paused calculate potential energy
		show()
		var energy = 0
		
		for o in get_tree().get_nodes_in_group("objects"):
			energy += o.mass * c * sqrt( pow(c,2) + pow(o.v.dot(o.v) * lorentz(o.v), 2))
			#+ CALCULATE POTENTIAL ENERGY. ONLY KINETIC AND REST ENERGY RIGHT NOW
		
		text = "Total System Energy = " + str(stepify(energy/1e30,1)) + " [ 1e30 J ]"
	else:
		hide()
