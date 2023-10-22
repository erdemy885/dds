extends Node3D
class_name MoveComponent

#pedSpeed should be in hundreds (250, 300, etc.) distance in 10s and initDistance in 10s
func calcMovement(pedSpeed, distance, initDistance) -> int:
	return ((100 * pedSpeed) / (distance + (initDistance / 2)));
