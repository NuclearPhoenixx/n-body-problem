extends Control

func spawn(pos, v, m, c, r): # spawn an object with given detail
	var inst = load("res://obj.tscn").instance()
	var shape
	
	inst.position = pos
	inst.v = v
	inst.mass = m
	inst.set_priority(m)
	inst.color = c
	inst.radius = r
	shape = CircleShape2D.new()
	shape.radius = r
	inst.get_node("CollisionShape").set_shape(shape)
	
	add_child(inst)

func _ready():
	spawn(Vector2(0,100), Vector2(400000,0), 3.3e20, Color(0.1,0.2,0.1,1), 10)
