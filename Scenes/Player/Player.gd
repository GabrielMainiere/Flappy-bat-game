class_name Player
extends KinematicBody2D

var gravity : float
var flapIntensity : float
var velocity : Vector2


func _init():
	gravity = 800.0
	flapIntensity = -400.0
	velocity = Vector2(0,0)


func set_gravity(value: float) -> void:
	gravity = value

func get_gravity() -> float:
	return gravity
	
func set_flap_intensity(value: float) -> void:
	flapIntensity = value

func get_flap_intensity() -> float:
	return flapIntensity

func set_velocity(value: Vector2) -> void:
	velocity = value

func get_velocity() -> Vector2:
	return velocity
	
	
func _process(delta):
	applyGravity(delta)
	flap()
	move()
	avoidEvasion()
	colisionWithFloor()


func applyGravity(delta) -> void:
	velocity.y += gravity * delta


func avoidEvasion() -> void:
	if position.y < 0:
		position.y = 0
	elif position.y > 720:
		position.y = 720


func flap() -> void:
	if Input.is_action_just_pressed("Flap"):
		velocity.y = flapIntensity


func move() -> void:
	move_and_slide(velocity)


func colisionWithFloor() -> void:
	if position.y >= 720:
		get_tree().reload_current_scene()
