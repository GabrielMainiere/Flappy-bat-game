class_name Main
extends Node2D

var spawnPipes
onready var pipes = preload("res://Scenes/Pipe/Pipe.tscn")	
var score: int = 0
onready var score_label = $scoreLabel


func _on_Timer_timeout():
	spawnPipes = pipes.instance()
	spawnPipes.position.x = 1280
	spawnPipes.position.y = rand_range(100,-120)
	add_child(spawnPipes)
	$Timer.start()
	
	
func updateScore() -> void:
	score += 1  
	score_label.text = ("SCORE: ")+ str(score)  
