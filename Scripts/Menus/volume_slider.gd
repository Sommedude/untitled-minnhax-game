extends HSlider

@export var bus_name: String ## Set and export the bus name
@export var bus_index: int ## Set and export the bus index

func _ready() -> void:
	bus_index = AudioServer.get_bus_index(bus_name) ## Lookup the name of the audio bus from its index
	value = db_to_linear(AudioServer.get_bus_volume_db(bus_index)) ## Set the starting visual value of the slider to the current volume from the bus

@warning_ignore("shadowed_variable_base_class")
func _on_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value)) ## When the slider value changes, set whatever its value is 0-1 to a reasonable representation of that in DB
	print(bus_name)
	print(AudioServer.get_bus_volume_db(bus_index))
