extends Node2D
@onready var brickObject = preload("res://Scenes/brick.tscn")

#  Blocks Grid 
var columns = 32
var rows = 7
var margin = 50

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	setupLevel()

func setupLevel():
	# Rows inc with level difficulty
	rows = 2 + GameManager.level
	# Cap difficulty at 9 rows
	if rows > 9:
		rows = 9
	
	
	
	var colours = getColours()
	colours.shuffle()
	
	#Procedural level Gen 
	for r in rows:
		for c in columns:
			# introduces randomness of block generation
			var randomNumber = randi_range(0,2)
			
			if randomNumber > 0:
				var newBrick = brickObject.instantiate()
				add_child(newBrick)
				newBrick.position = Vector2(margin + (34 * c), margin + (34 * r))
			
				var sprite = newBrick.get_node('Sprite2D')
				if r >= 9:
					sprite.modulate =  colours[0]
				if r < 7:
					sprite.modulate =  colours[1]
				if r < 5:
					sprite.modulate =  colours[2]
				if r < 3:
					sprite.modulate =  colours[3]
				
			
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func getColours():
	var colours = [
		Color(0.937, 0.267, 0.137, 1.0),
		Color(1.0, 0.584, 0.149, 1.0),
		Color(0.31, 0.686, 0.267, 1.0),
		Color(0.965, 0.922, 0.078, 1.0),
		]
	return colours
