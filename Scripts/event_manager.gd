extends Node2D

var event_scene = preload("res://Scenes/event.tscn")

@onready var availableEvents = $AvailableEvents.availableEvents.duplicate(true) ## Generate a copy of the list of all available events from available_events.tscn. This is our deck of events for this scene.

var pickedEvent = ""
var playerChoice = ""

func _ready() -> void:
	print("Event manager ready")
	$MainContainer/HBoxContainer/VBoxContainer/RemainingEvents/Label2.text = str(len(availableEvents))


func _on_generate_event_button_pressed() -> void:
	## Pick an event from the available list and instantiate it as a scene
	pick_event()
	var event = event_scene.instantiate() ##TODO: set relevant details in the Event scene from the picked event
	$Events.add_child(event)
	update_Debug_UI()


func _on_reset_events_button_pressed() -> void:
	## Reset the deck, get the full list of events from available_events.tscn
	reset_events()
	update_Debug_UI()


func pick_event():
	print("Picking event")
	## Pick a random event, then remove it from the deck of events, so we don't get repeat picks
	if len(availableEvents) > 0:
		pickedEvent = availableEvents.pick_random()
		var index = availableEvents.find(pickedEvent, 0)
		availableEvents.pop_at(index)
		playerChoice = ""
	else:
		push_error("No available events left in event_manager availableEvents")
		
func reset_events():
	print("Resetting events")
	availableEvents = $AvailableEvents.availableEvents.duplicate(true)
	
func update_Debug_UI():
	## Chosen event details
	$MainContainer/HBoxContainer/VBoxContainer2/ChosenEventDetails/EventName/Label2.text = pickedEvent.name
	$MainContainer/HBoxContainer/VBoxContainer2/ChosenEventDetails/EventType/Label2.text = pickedEvent.type
	$MainContainer/HBoxContainer/VBoxContainer2/ChosenEventDetails/EventDescription/Label2.text = pickedEvent.description
	$MainContainer/HBoxContainer/VBoxContainer2/ChosenEventDetails/Choice1/Label2.text = pickedEvent.choice1
	$MainContainer/HBoxContainer/VBoxContainer2/ChosenEventDetails/Choice2/Label2.text = pickedEvent.choice2
	
	## Player chose details
	#$MainContainer/HBoxContainer/VBoxContainer/PlayerChoice/Label2.text = pickedEvent.choice1 ## TODO: Update this to reflect the player's actual choice
	if(playerChoice == "choice1"):
		$MainContainer/HBoxContainer/VBoxContainer/PlayerChoice/Label2.text = pickedEvent.choice1
	elif(playerChoice == "choice2"):
		$MainContainer/HBoxContainer/VBoxContainer/PlayerChoice/Label2.text = pickedEvent.choice2
	else:
		$MainContainer/HBoxContainer/VBoxContainer/PlayerChoice/Label2.text = ""
	
	
	## Events remaining details
	$MainContainer/HBoxContainer/VBoxContainer/RemainingEvents/Label2.text = str(len(availableEvents))
	
