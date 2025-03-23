extends Node

var acorns := 3
var water := 2

signal refresh_text

func check_water() -> bool:
	return water > 0

func decrement_water() -> void:
	water -= 1
	refresh_text.emit()

func check_acorns() -> bool:
	if acorns > 0:
		acorns -= 1
		refresh_text.emit()
		return true
	else:
		return false
