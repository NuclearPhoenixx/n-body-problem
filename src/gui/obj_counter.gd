extends Label

onready var tree = get_tree()

func _process(delta): # get all nodes in object group and then print the number
	set_text("Objects: " + String(tree.get_nodes_in_group("objects").size()))
