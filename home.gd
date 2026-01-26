extends Control

@onready var create_btn = $Button
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	create_btn.pressed.connect(_on_create_btn_pressed)
	pass # Replace with function body.

func _on_create_btn_pressed():
	get_tree().change_scene_to_file("res://add_quiz.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
