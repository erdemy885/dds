extends Node3D

@export var sections: Array[PackedScene] = []
var amount = 10
var rng = RandomNumberGenerator.new()
var offset = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	for n in amount:
		spawnSection(n * offset)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spawnSection(n):
	rng.randomize()
	var num = rng.randi_range(0, sections.size() - 1)
	var instance = sections[num].instantiate()
	instance.position.x = n
	add_child(instance)
