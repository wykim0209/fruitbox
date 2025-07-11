extends RigidBody2D

var min_speed = 1000.0
var max_speed = 2000.0
var min_angle = -150.0
var max_angle = -30.0
var custom_gravity_scale = 10.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var speed = randf_range(min_speed, max_speed)
	var angle_degrees = randf_range(min_angle, max_angle)
	var angle_radians = deg_to_rad(angle_degrees)
	var velocity = Vector2.RIGHT.rotated(angle_radians) * speed
	linear_velocity = velocity
	gravity_scale = custom_gravity_scale


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_destruct_timer_timeout() -> void:
	queue_free()
