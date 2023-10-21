extends RigidBody3D
var distance;
var initDistance;
var pedSpeed;
var moveSpeed;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#distance from one side of crosswalk to the other.
	distance = 40; #40 is placeholder
	#how far the the pedestrian spawns in the crosswalk.
	#random variable that will never go beyond a certain point
	#(halfway maybe?);
	initDistance = 0; #0 is placeholder
	#pedestrian's speed. Based on factors like NPC age.
	#Might want to also base off initDistance to ensure it isn't too fast.
	pedSpeed = 3; #3 is placeholder
	#moveSpeed will have pedestrians move depending on their 
	#base speed and the distance they spawn from the other end
	#of the corsswalk, this way the move speed can vary.
	moveSpeed = ((10000 * pedSpeed) / (distance - initDistance)); 
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	apply_central_force(moveSpeed * Vector3.FORWARD * delta);
	pass
