extends Node

var water := 6	
signal water_updated


func check_water() -> bool:
	if water > 0:
		water -= 1
		water_updated.emit()
		return true
	else:
		return false
		
