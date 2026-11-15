extends CharacterBody2D

var speed: float = 120.0
var direction: int = 1
var gravity: float = 980.0

func _physics_process(delta):
	velocity.x = direction * speed
	move_and_slide()
	if position.x >= 440:
		direction = -1
	elif position.x <= 40:
		direction = 1
	#print(Score.score)

func _on_head_stomp_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.bounce()
		#Score.score +=50
		


func _on_hurt_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.take_damage()
