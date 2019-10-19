extends Label

var G = 6.67408e-11 # gravitational constant

func _process(delta):
	#if get_tree().paused: #if paused calculate potential energy
	#	show()
		var energy = 0
		
		for o in get_tree().get_nodes_in_group("objects"):
			energy = 0
			# kinetic energy
			energy += o.mass * o.v.length_squared() / 2
			# gravitational potential
			for a in get_tree().get_nodes_in_group("objects"):
				if a != o:
					var r = ( a.position - o.position ) * o.scale_m
					energy += - G * a.mass * o.mass / r.length()
		
		text = "Total Mechanical Energy = " + str(energy) #str(stepify(energy/1e40,1)) + " [ 1e40 J ]"
	#else:
	#	hide()
