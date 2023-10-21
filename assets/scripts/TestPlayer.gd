extends CharacterBody3D

var gravity = 3.0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var movement_vec = Input.get_vector("move_forward", "move_backward", "strafe_left", "strafe_right")

	velocity.y -= gravity * delta
	velocity.x = movement_vec.x
	velocity.z = movement_vec.y

	#move_and_collide(velocity)
	move_and_slide()
