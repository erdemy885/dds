extends Node3D
var moveSpeed;

@export var moveComponent : MoveComponent

@onready var rng = RandomNumberGenerator.new()


# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	var pedSpeedMin = 10
	var pedSpeedMax = 50;
	var distance = 40; 
	var initDistance = rng.randi_range(0, distance / 2); #0 is placeholder
	moveSpeed = calcMovement(rng.randi_range(pedSpeedMin, pedSpeedMax), 
	distance, initDistance);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var parent = get_parent()
	parent.apply_central_force(moveSpeed * -parent.transform.basis.z * delta);

func calcMovement(pedSpeed, distance, initDistance) -> int:
	return ((100 * pedSpeed) / (distance + (initDistance / 2)))
