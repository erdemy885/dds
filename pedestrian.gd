extends RigidBody3D

@onready var anim_player = get_node("AnimationPlayer")

var dead = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	anim_player.play("Running")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not dead:
		return
	
	#linear_velocity.y = -1.0
	
func _on_body_entered(body: Node):
	if not body is VehicleBody3D:
		return
	
	var figure: MeshInstance3D = $"Armature/Figure"
	var ragdoll_skeleton: Skeleton3D = $"Armature/RagdollSkeleton"
	var anim_player = $"AnimationPlayer"
	
	anim_player.stop()
	figure.set_skeleton_path("../RagdollSkeleton")
	ragdoll_skeleton.physical_bones_start_simulation()
	
	linear_velocity = Vector3(0, 0, 0)
	angular_velocity = Vector3(0, 0, 0)
	
	var dead = true
