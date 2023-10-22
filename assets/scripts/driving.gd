extends VehicleBody3D

@onready var gulp_sfx = get_node("gulp_sfx")
@onready var bac_counter = get_node("bac_counter")

var max_rpm = 100
var max_torque = 400
var steering_speed = 5
var time_since_last_drink = 0

func _physics_process(delta):
	time_since_last_drink += delta
	
	if time_since_last_drink >= 10.0:
		steering_speed += 0.5
		if steering_speed > 5:
			steering_speed = 5
		time_since_last_drink = 0.0
	
	if Input.is_action_just_pressed("drink") && time_since_last_drink > 5.0:
		steering_speed -= 0.5
		if steering_speed < 0:
			steering_speed = 0
		time_since_last_drink = 0
		
		gulp_sfx.play()
		
	var bac = 0.4 - (0.4 * (steering_speed / 5))
	bac_counter.text = "BAC: {}%".format([bac], "{}")
		
	steering = lerp(steering, Input.get_axis("right", "left") * 0.3, steering_speed * delta)
	var acceleration = Input.get_axis("back", "forward")
	var rpm = $back_left.get_rpm()
	$back_left.engine_force = acceleration * max_torque * (1 - rpm / max_rpm)
	rpm = $back_right.get_rpm()
	$back_right.engine_force = acceleration * max_torque * (1 - rpm / max_rpm)
	
