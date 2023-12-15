extends Control

var character:PackedScene = preload("res://character.tscn")
@onready var char_holder = $ScrollContainer/CharacterHolder

func _add_character(name_:String, initiative:int, health:int):
	var character_node:Character = character.instantiate()
	
	character_node.name_ = name_
	
	character_node.initiative = initiative
	
	character_node.health = health
	
	char_holder.add_child(character_node)
	
	character_node.connect("remove_me", _remove_character)
	


func _remove_character(node):
	node.queue_free()


# Sort in descending order from top (highest) to bottom (lowest)
func _on_sort_button_pressed():
	var children = char_holder.get_children()
	
	# Sort the array based on insitiative
	#children.sort_custom(_sort_initiative)
	for x in range(len(children)):
		
		for y in range(x+1, len(children)):
			if not await _sort_initiative(char_holder.get_children()[x], char_holder.get_children()[y]):
				char_holder.move_child(char_holder.get_children()[y], x)
				
			else:
				char_holder.move_child(char_holder.get_children()[x], x)
	
	
	# Move where the elements are at
	#for i in range(len(children)):
	#	$ScrollContainer/CharacterHolder.move_child(children[i], i)


func _sort_initiative(a, b) -> bool:
	# if the first initiative is greater than the second return true
	if a.initiative > b.initiative:
		return true
	elif a.initiative == b.initiative:
		var x = await ask_for_dexterity(a, b)
		$DexterityInput/Dex2.text = ""
		$DexterityInput/Dex1.text = ""
		return x
	return false


func ask_for_dexterity(a, b) -> bool:
	
	if a.dexterity != -1 and b.dexterity != -1:
		return a.dexterity > b.dexterity
	
	var name_text1 = RichTextLabel.new()
	var name_text2 = RichTextLabel.new()
	name_text1.text = a.name_
	name_text2.text = b.name_
	name_text1.size = Vector2(100, 40)
	name_text1.position = Vector2(-70, 40)
	name_text2.size = Vector2(100, 40)
	name_text2.position = Vector2(70, 40)
	
	if a.dexterity != -1:
		$DexterityInput/Dex1.text = str(a.dexterity)
	if b.dexterity != -1:
		$DexterityInput/Dex2.text = str(b.dexterity)
	$DexterityInput.add_child(name_text1)
	$DexterityInput.add_child(name_text2)
	
	$DexterityInput.show()
	
	await $DexterityInput/Button.pressed
	
	$DexterityInput.hide()
	
	a.dexterity = int($DexterityInput/Dex1.text)
	b.dexterity = int($DexterityInput/Dex2.text)
	
	$DexterityInput.remove_child(name_text1)
	$DexterityInput.remove_child(name_text2)
	
	return int($DexterityInput/Dex1.text) > int($DexterityInput/Dex2.text)
	
	
	

