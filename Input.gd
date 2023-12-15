extends Control


# signal to emit to add a character
signal add_character(name:String, initiative:int, health:int)


func _on_add_button_pressed():
	emit_signal("add_character", $Name.text, int($Initiative.text), int($Health.text))
	$Name.text = ""
	$Initiative.text = ""
	$Health.text = ""


