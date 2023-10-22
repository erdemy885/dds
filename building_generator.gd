extends Node3D

@onready var short_building = load("res://assets/models/short_building.glb")
@onready var medium_building = load("res://assets/models/medium_building.glb")
@onready var tall_building = load("res://assets/models/tall_building.glb")
@onready var wide_building = load("res://assets/models/wide_building.glb")
@onready var rng = RandomNumberGenerator.new()

@export var amount = 1
@export var offset = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(amount): 
			var random_num = randi() % 4
			
			var chosen_building = short_building
			
			if random_num == 1:
				chosen_building = medium_building
			elif random_num == 2:
				chosen_building = tall_building
			elif random_num == 3:
				chosen_building = wide_building	
			
			var building_instance = chosen_building.instance()
			
			building_instance.TranslateObjectLocal(Vector3(0, 0, i * offset))
			building_instance.transform = building_instance.transform

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
