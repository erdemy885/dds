extends Node3D

@onready var level = $"../"
@export var speed = 10

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= speed * delta
	if position.x < -15: 
		level.spawnSection(position.x + level.amount*level.offset)
		queue_free()
