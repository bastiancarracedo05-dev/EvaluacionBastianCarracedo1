extends CharacterBody2D


const SPEED = 125
const JUMP_VELOCITY = -400.0
var currentcoins: int = 0

func recolectar_moneda()->void:
	currentcoins+=1 
	print("monedas obtenidas", currentcoins)
	
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_key_pressed(KEY_R):
		print("Reinicio Telca")
		get_tree().reload_current_scene()
		return

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)


	move_and_slide()
	
