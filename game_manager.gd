extends Node

var score = 0

@onready var choco_label: Label = $ChocoLabel

func add_point():
	score += 1
	choco_label.text = "Recogiste " + str(score) + " Chocolates"
