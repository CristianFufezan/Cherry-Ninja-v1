extends Node

@onready var label: Label = %Label

var points = 0

func add_point():
	points += 1
	print(points)
	label.text = "Cherries" + str(points)  
