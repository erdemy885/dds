extends RigidBody3D
class_name PedestrianParent
var moveSpeed;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#distance from one side of crosswalk to the other.
	var distance = 40; #40 is placeholder
	#how far the the pedestrian spawns in the crosswalk.
	#random variable that will never go beyond a certain point
	#(halfway maybe?);
	var initDistance = randi_range(0, distance / 2); #0 is placeholder
	#pedestrian's speed. Based on factors like NPC age.
	#Might want to also base off initDistance to ensure it isn't too fast.
	var pedSpeedMax = 300;
	var pedSpeedMin = 250;
	var pedSpeed = randi_range(pedSpeedMin, pedSpeedMax);
	#moveSpeed will have pedestrians move depending on their 
	#base speed and the distance they spawn from the other end
	#of the corsswalk, this way the move speed can vary.
	moveSpeed = ((100 * pedSpeed) / (distance - (initDistance / 2))); 
	#pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	apply_central_force(moveSpeed * Vector3.FORWARD * delta);
	#pass
