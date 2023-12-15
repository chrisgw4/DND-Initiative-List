extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	$Input.connect("add_character", $Output._add_character)
	#$Input.emit_signal("add_character", "Jerry", 19, 50)
	#$Input.emit_signal("add_character", "Matt", 20, 50)
	#$Input.emit_signal("add_character", "Joe", 20, 50)
	#$Input.emit_signal("add_character", "Pet", 18, 50)
	#$Input.emit_signal("add_character", "Scold", 18, 50)
	#for i in range(120):
	#	$Input.emit_signal("add_character", "Matt" + str(i), randi_range(1,20), 50)
	
	get_tree().get_root().connect("size_changed", resize_output)
	resize_output()

func resize_output():
	print("Resizing")
	print(get_viewport().size)
	var container:ScrollContainer = $Output/ScrollContainer
	container.size.y = get_viewport().size.y - $Output.position.y

