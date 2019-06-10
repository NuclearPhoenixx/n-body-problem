extends Area2D

onready var force_vector = get_node("ForceVector")
onready var camera = get_tree().get_root().get_node("Control/Spacetime/Camera2D")

# CONSTANTS AND INITIAL VALUES
var G = 6.67408e-11 # gravitational constant
var fvs = 20 # force vector scale
var fv_on = true # enable force vectors
var color = Color(1,1,1,1) # object color
var scale_m = 20000 # scale multiplier for one pixel in meter
var mass = 1e28 # object mass
var v = Vector2(0,0) # initial vector of velocity
var radius = 10 # object radius

func collision(area): # impact detection to prevent division by zero, heavy obj process before light ones
	if area.mass <= mass:
		#area.set_monitoring(false) # disable impact detection of deleted body
		v = (mass * v + area.mass * area.v) / (area.mass + mass) # correct collision and conservation of momentum
		mass += area.mass # take all the mass
		if camera.follow_node == area: # change fixed camera to the "winner" object
			camera.follow_node = self
		area.queue_free() # delete other lighter body
	
	#elif area.mass == mass: # if masses are equal
	#	area.set_monitoring(false) # disable impact detection of the second collision partner
	#	queue_free()
	#	pass # TODO: Spawn new object with correct velocity, mass and color, etc.

func _draw(): # draw object as a custom circle
	draw_circle(Vector2(0,0), radius, color)

func get_new_accel(m, x): # compute acceleration vector based on newtons law of gravitation
	var r = x - position
	r *= scale_m
	
	return G * m * r / pow(r.length(), 3)

func grav_accel():
	var accel = Vector2(0,0)
	
	for o in get_tree().get_nodes_in_group("objects"): # add up all individual accelerations
		if o != self:
			accel += get_new_accel(o.mass, o.position)
		
	return accel

func get_lorentz(): # make the speed of light the absolute speed limit in this simulation
	return ( sqrt(1 - pow( v.length() / 299792458, 2)) )

func _physics_process(delta):
	position += v * delta / scale_m #* get_lorentz() # update position with given velocity and correct for scale
	update() # re-draw circle
	
	var a = grav_accel() # compute new acceleration vector
	v += a * delta * get_lorentz() # add new acceleration to the existing velocity vector
	
	if fv_on: # draw resulting force vector
		force_vector.set_point_position(1, a / a.length() * fvs)

func _mouse_click(viewport, event, shape_idx): # upon selection the camera will follow this node
	if event.is_action_pressed("ui_select"):
		camera.follow_node = self
		get_tree().set_input_as_handled()
