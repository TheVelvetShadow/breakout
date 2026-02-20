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
	
	#Procedural level Gen 
	for r in rows:
		for c in columns:
			var newBrick = brickObject.instantiate()
			add_child(newBrick)
			newBrick.position = Vector2(margin + (34 * c), margin + (34 * r))
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
