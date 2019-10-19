extends Control

func spawn(pos, v, m, c, r): # spawn an object with given detail
	var inst = load("res://scenes/object.tscn").instance()
	var shape
	
	inst.position = pos
	inst.v = v
	inst.mass = m
	inst.color = c
	inst.radius = r
	shape = CircleShape2D.new()
	shape.radius = r
	inst.get_node("CollisionShape").set_shape(shape)
	
	add_child(inst)
	return inst # return node

func _ready():
	# SPAWN CHAOS!
	var i = 0
	var max_p = 500
	var min_p = -500
	var max_v = 400000
	var min_v = -400000
	
	while i < 19: # spawn some random objects
		i += 1
		randomize()
		spawn(Vector2(rand_range(min_p,max_p),rand_range(min_p,max_p)), Vector2(rand_range(min_v,max_v),rand_range(min_v,max_v)), 1e26, Color(0.5,0.5,0.5,1), 10)
