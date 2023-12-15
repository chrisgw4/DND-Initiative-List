extends Control
class_name Character

@onready var name_label:RichTextLabel = $Name
@onready var initiative_text_edit:IntegerTextEdit = $Initiative
@onready var health_text_edit:IntegerTextEdit = $Health

var name_:String
var initiative:int
var health:int
var dexterity:int = -1:
	set(val):
		$Dex.text = "D: " + str(val)
		dexterity = val

signal remove_me(node)

# Called when the node enters the scene tree for the first time.
func _ready():
	name_label.text = name_
	initiative_text_edit.text = str(initiative)
	health_text_edit.text = str(health)
	initiative_text_edit.connect("update", _initiative_update)


func _initiative_update():
	initiative = int(initiative_text_edit.text)


func _on_button_pressed():
	emit_signal("remove_me", self)
	#queue_free()
