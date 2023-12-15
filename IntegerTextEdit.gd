extends TextEdit
class_name IntegerTextEdit


signal update

# make it so no text can be added that isnt a number
func _on_text_changed():
	if not text.is_valid_int() and text != "":
		text[-1] = ''
		set_caret_column(len(text))
	else:
		emit_signal("update")
