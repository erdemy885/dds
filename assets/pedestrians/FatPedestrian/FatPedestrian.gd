extends Node3D
var moveSpeed;

@export var moveComponent : MoveComponent

# Called when the node enters the scene tree for the first time.
func _ready():
	var pedSpeedMin = 50;
	var pedSpeedMax = 100;
	var distance = 40; 
	var initDistance = randi_range(0, distance / 2); #0 is placeholder
	moveSpeed = moveComponent.calcMovement(randi_range(pedSpeedMin, pedSpeedMax), 
	distance, initDistance);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_parent().apply_central_force(moveSpeed * Vector3.FORWARD * delta);
