extends CharacterBody2D
 
var speed: float = 300.0
var jump_velocity: float = -550.0
var bounce_velocity: float = -750.0
var gravity: float = 980.0

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity
	var direction = Input.get_axis("move_left", "move_right")
	velocity.x = direction * speed
	move_and_slide()

func bounce():
	velocity.y = bounce_velocity
	
var hearts : int = 3
var can_take_damage: bool = true
	
func take_damage() -> void:
		
	if not can_take_damage:		
		return
			
	can_take_damage = false
	hearts -= 1
	get_parent().update_hearts(hearts)
	velocity.y = -350.0

	if hearts <= 0:
		get_tree().reload_current_scene()
		return

	modulate.a = 0.4
	await get_tree().create_timer(1.0).timeout
	modulate.a = 1.0
	can_take_damage = true
