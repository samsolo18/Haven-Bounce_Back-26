extends Node2D

var score: int = 0
var goblins: Array = []

func _ready():
	var heights = [520, 380, 240, 100]
	for y_pos in heights:
		var new_goblin = $Goblin.duplicate()
		new_goblin.position = Vector2(randf_range(80.0, 400.0), y_pos)
		add_child(new_goblin)
		goblins.append(new_goblin)

func _process(delta):
	if $Player.position.y < 0:
		#$Player.position = Vector2(240, 580)
		$Player.velocity = Vector2.ZERO 
		#score += 100
		#$ScoreLabel.text = "Score: " + str(score)
		#for g in goblins:
		#	g.position.x = randf_range(80.0, 400.0)

func update_hearts(current_hearts: int) -> void:
	$Heart1.visible = current_hearts >= 1
	$Heart2.visible = current_hearts >= 2
	$Heart3.visible = current_hearts >= 3
	
