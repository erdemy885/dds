extends Node3D

@onready var short_building = preload("res://short_building.tscn")
@onready var medium_building = preload("res://medium_building.tscn")
@onready var tall_building = preload("res://tall_building.tscn")
@onready var wide_building = preload("res://wide_building.tscn")
@onready var rng = RandomNumberGenerator.new()

@onready var materials = [
	preload("res://assets/textures/red_mat.tres"),
	preload("res://assets/textures/green_mat.tres"),
	preload("res://assets/textures/purple_mat.tres"),
	preload("res://assets/textures/yellow_mat.tres"),
	preload("res://assets/textures/turq_mat.tres"),
	preload("res://assets/textures/blue_mat.tres")
]

@onready var pedestrian = preload("res://pedestrian.tscn")

@export var amount = 100
@export var offset = 20

var prev_wide = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(amount): 
			var random_num = randi() % 3
			
			var chosen_building = short_building
			var mesh_node_path = "ShortBuilding"
			var wide_offset = 0
			
			if random_num == 1:
				chosen_building = medium_building
				mesh_node_path = "MediumBuilding"
			elif random_num == 2:
				chosen_building = tall_building
				mesh_node_path = "TallBuilding"
			elif random_num == 3:
				chosen_building = wide_building
				
			if prev_wide:
				wide_offset = 25
			
			rng.randomize()
			
			var building_instance = chosen_building.instantiate()
			
			building_instance.transform = building_instance.transform.rotated(Vector3(0, 1, 0), -PI/2)
			building_instance.transform = building_instance.transform.translated(Vector3(offset * i - wide_offset, 1.6, -28.7))
			
			var mesh_node: MeshInstance3D = building_instance.get_node(mesh_node_path)
			var mat_index = rng.randi_range(0, materials.size() - 1)
			mesh_node.set_surface_override_material(0, materials[mat_index])
			
			add_child(building_instance)
			
			building_instance = chosen_building.instantiate()
			building_instance.transform = building_instance.transform.rotated(Vector3(0, 1, 0), PI/2)
			building_instance.transform = building_instance.transform.translated(Vector3(offset * i - wide_offset, 1.6, 32.5))
			
			mesh_node = building_instance.get_node(mesh_node_path)
			mat_index = rng.randi_range(0, materials.size() - 1)
			
			mesh_node.set_surface_override_material(0, materials[mat_index])
			
			add_child(building_instance)
			
			var pedestrian_instance = pedestrian.instantiate()
			var rand_angle = rng.randf_range(0, 2*PI)
			var rand_z = rng.randf_range(-25, 30)
			
			print(pedestrian_instance.transform.basis)
			
			pedestrian_instance.transform = pedestrian_instance.transform.rotated(Vector3(0, 1, 0), rand_angle)
			pedestrian_instance.transform = pedestrian_instance.transform.translated(Vector3(offset * i - wide_offset, 0, rand_z))
			
			print(pedestrian_instance.transform.basis)
			
			add_child(pedestrian_instance)
			
			if random_num == 3:
				prev_wide = true
			else:
				prev_wide = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
