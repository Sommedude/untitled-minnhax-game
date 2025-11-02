extends Control

func _ready() -> void:
	print("Placeholder scene ready")


func _process(_delta: float) -> void:
	get_player_input()

func get_player_input() -> void:
	if Input.is_action_just_pressed("Choice1"):
		print("Player chose 1")
	if Input.is_action_just_pressed("Choice2"):
		print("Player chose 2")
	if Input.is_action_just_pressed("Pause"):
		print("Player paused")
