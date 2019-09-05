extends CheckBox

func _ready():
	for node in get_tree().get_nodes_in_group("objects"):
		pressed = node.get("fv_on")
		break

func _toggled(button_pressed):
	for node in get_tree().get_nodes_in_group("objects"):
		node.set("fv_on", button_pressed)
