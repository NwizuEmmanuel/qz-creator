extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	disable_identification()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_question_type_input_item_selected(index: int) -> void:
	if index == 0:
		disable_identification()
		enable_multiple_choice()
	else:
		disable_multiple_choice()
		enable_identification()

func enable_multiple_choice():
	$MarginContainer/VBoxContainer/GridContainer.show()
	$MarginContainer/VBoxContainer/MCAnswerInput.show()
	$MarginContainer/VBoxContainer/MCAnswerText.show()

func disable_multiple_choice():
	$MarginContainer/VBoxContainer/GridContainer.hide()
	$MarginContainer/VBoxContainer/MCAnswerInput.hide()
	$MarginContainer/VBoxContainer/MCAnswerText.hide()

func enable_identification():
	$MarginContainer/VBoxContainer/IdentificationText.show()
	$MarginContainer/VBoxContainer/IdentificationInput.show()

func disable_identification():
	$MarginContainer/VBoxContainer/IdentificationText.hide()
	$MarginContainer/VBoxContainer/IdentificationInput.hide()
