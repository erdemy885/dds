extends VehicleBody3D

@onready var gulp_sfx = get_node("gulp_sfx")
@onready var bac_counter = get_node("bac_counter")
@onready var score_counter = get_node("score_counter")

@onready var music = get_node("game_music")

@export var score = 0
@export var bac = 0

var max_rpm = 100
var max_torque = 400
var steering_speed = 5.0
var time_since_last_drink = 0
var prev_score = 0

func _ready():
	music.play()

func _physics_process(delta):
	time_since_last_drink += delta
	
	if time_since_last_drink >= 10:
		steering_speed += 0.5
		if steering_speed > 5.0:
			steering_speed = 5.0
		time_since_last_drink = 0.0
	
	if Input.is_action_just_pressed("drink") && time_since_last_drink > 5.0:
		steering_speed -= 0.5
		if steering_speed < 0.0:
			steering_speed = 0.0
		time_since_last_drink = 0
		gulp_sfx.play()
	
	bac = 0.4 - (0.4 * (steering_speed / 5))
	bac_counter.text = "BAC: {}%".format([bac], "{}")
	
	if prev_score != score:
		score += bac * 10
	score_counter.text = "SCORE: {}".format([score], "{}")
		
	var drunk = $CameraPivot/Camera3D/drunk
	var drunk_mat = drunk.get_active_material(0)
	drunk_mat.set_shader_parameter("bac", steering_speed)
  
	steering = lerp(steering, Input.get_axis("right", "left") * 0.3, steering_speed * delta)
	var acceleration = Input.get_axis("back", "forward")
	var rpm = $back_left.get_rpm()
	$back_left.engine_force = acceleration * max_torque * (1 - rpm / max_rpm)
	rpm = $back_right.get_rpm()
	$back_right.engine_force = acceleration * max_torque * (1 - rpm / max_rpm)

	prev_score = score
	
func _on_pedestrian_pedestrian_hit():
	print("hit")
