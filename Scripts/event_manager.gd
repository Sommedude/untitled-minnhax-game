extends Node2D

var event_scene = preload("res://Scenes/event.tscn")

#var event0 = {"name":"Birthday", "type":"personal", "description":"It's my birthday, get me a present!", "choice1":"Something home made", "choice2":"Something expensive"}
#var event1 = {"name":"WorkLate", "type":"generic", "description":"I have to work late again tonight", "choice1":"Are you cheating?", "choice2":"You work so hard!"}
#var event2 = {"name":"Vacation", "type":"personal", "description":"My friends want me to come on vacation with them", "choice1":"Have a great break!", "choice2":"No way, I'll take you somewhere!"}
#var event3 = {"name":"Pet", "type":"generic", "description":"I want a pet!", "choice1":"That'll be so cute!", "choice2":"That'll be so much work!"}

@onready var availableEvents = $AvailableEvents.availableEvents

var pickedEvent = ""

func _ready() -> void:
	print("Event manager ready")

func _on_generate_event_button_pressed() -> void:
	pick_event()
	var event = event_scene.instantiate()
	$Events.add_child(event)
	update_Debug_UI()
	
func pick_event():
	print("Picking event")
	pickedEvent = availableEvents.pick_random()
	print("Picked event: ", pickedEvent.name)
	
func update_Debug_UI():
	$DebugUI/VBoxContainer2/VBoxContainer/HBoxContainer/Label2.text = pickedEvent.name
	$DebugUI/VBoxContainer2/VBoxContainer/HBoxContainer2/Label2.text = pickedEvent.type
	$DebugUI/VBoxContainer2/VBoxContainer/HBoxContainer3/Label2.text = pickedEvent.description
	$DebugUI/VBoxContainer2/VBoxContainer/HBoxContainer4/Label2.text = pickedEvent.choice1
	$DebugUI/VBoxContainer2/VBoxContainer/HBoxContainer5/Label2.text = pickedEvent.choice2
