extends Control

@onready var identification_input := $MarginContainer/VBoxContainer/IdentificationInput
@onready var mc_answer_input := $MarginContainer/VBoxContainer/MCAnswerInput
@onready var question_input := $MarginContainer/VBoxContainer/VBoxContainer/QuestionInput
@onready var option_a := $MarginContainer/VBoxContainer/GridContainer/VBoxContainer4/OptionAInput
@onready var option_b := $MarginContainer/VBoxContainer/GridContainer/VBoxContainer3/OptionBInput
@onready var option_c := $MarginContainer/VBoxContainer/GridContainer/VBoxContainer2/OptionCInput
@onready var option_d := $MarginContainer/VBoxContainer/GridContainer/VBoxContainer/OptionDInput
@onready var question_type := $MarginContainer/VBoxContainer/HBoxContainer/QuestionTypeInput
@onready var quiz_name := $MarginContainer/VBoxContainer/HBoxContainer2/QuizName

var questions = []

func add_identification_question(text, answer):
	var q = {
		"question_type": 1,
		"question_text": text,
		"identification_answer": answer,
		"options": [],
		"correct_option": -1
	}
	
	questions.append(q)
	
func add_multiple_choice_question(text, option_array, correct_index):
	var q = {
		"question_type": 0,
		"question_text": text,
		"identification_answer": "",
		"options": option_array,
		"correct_option": correct_index
	}
	questions.append(q)


func add_question():
	if (question_type.selected == 0):
		var question = question_input.text
		var options = [option_a.text, option_b.text, option_c.text, option_d.text]
		var correct_index = mc_answer_input.selected
		add_multiple_choice_question(question,options,correct_index)
	else:
		var question = question_input.text
		var answer = identification_input.text
		add_identification_question(question, answer)


func save_questions_to_file():
	var filename = quiz_name.text.strip_edges()
	var file = FileAccess.open("user://"+ filename + ".json", FileAccess.WRITE)
	var json_string = JSON.stringify(questions, "\t")
	file.store_string(json_string)
	file.close()

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
	mc_answer_input.show()
	$MarginContainer/VBoxContainer/MCAnswerText.show()

func disable_multiple_choice():
	$MarginContainer/VBoxContainer/GridContainer.hide()
	mc_answer_input.hide()
	$MarginContainer/VBoxContainer/MCAnswerText.hide()

func enable_identification():
	$MarginContainer/VBoxContainer/IdentificationText.show()
	identification_input.show()

func disable_identification():
	$MarginContainer/VBoxContainer/IdentificationText.hide()
	identification_input.hide()


func _on_save_btn_pressed() -> void:
	add_question()
	save_questions_to_file()
