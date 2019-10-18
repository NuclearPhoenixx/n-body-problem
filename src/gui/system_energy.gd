extends Label

var c = 299792458
var G = 6.67408e-11 # gravitational constant

func lorentz(v):
	return 1 / sqrt(1 - pow( v.length()/c ,2))

func _process(delta):
	if get_tree().paused: #if paused calculate potential energy
		show()
		var energy = 0
		
		for o in get_tree().get_nodes_in_group("objects"):
			# kinetic and rest energy
			energy += o.mass * c * sqrt(pow(c,2) + o.v.length_squared() * pow(lorentz(o.v), 2))
			# gravitational potential
			for a in get_tree().get_nodes_in_group("objects"):
				if a != o:
					var r = ( a.position - o.position ) * o.scale_m
					energy += - G * a.mass * o.mass / r.length()
		
		text = "Total System Energy = " + str(stepify(energy/1e40,1)) + " [ 1e40 J ]"
	else:
		hide()
