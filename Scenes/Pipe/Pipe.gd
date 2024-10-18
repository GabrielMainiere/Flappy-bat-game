class_name Pipe
extends Node2D

var pipeSpeed : float
var score : int = 0


func _init(speed: float = 185) -> void:
	pipeSpeed = speed
	
	
func get_pipeSpeed() -> float:
	return pipeSpeed

func set_pipeSpeed(speed: float) -> void:
	pipeSpeed = speed
	

func _ready():
	pass

	
func _process(delta: float) -> void:
	movePipe(delta)


func movePipe(delta: float) -> void:
	position.x -= (pipeSpeed * delta)
	if position.x < -680:
		queue_free()


func _on_PipePair_body_entered(body):
	if body.is_in_group("player"):  
		get_tree().reload_current_scene() 
	


func _on_Area2D_body_entered(body): 
	if body.is_in_group("player"):
		var main = get_tree().current_scene
		if main.has_method("updateScore"):
			main.updateScore()
