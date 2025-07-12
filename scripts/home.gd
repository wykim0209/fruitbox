extends Node2D

var main_scene = load("res://scenes/main.tscn")
var fruit_scene = load("res://scenes/fruit.tscn")
@onready var background: ColorRect = $Background

const num_row = 9
const num_col = 18


func reset_fruits():
	var collsion_shape = $FruitArea.get_node("CollisionShape2D")
	var pos = collsion_shape.global_position
	var shape = collsion_shape.shape as RectangleShape2D
	var size = shape.extents * 2
	var l = pos[0] - size[0] / 2
	var u = pos[1] - size[1] / 2
	var w = size[0] / num_col
	var h = size[1] / num_row
	
	for r in range(num_row):
		var y = u + h * (r + 0.5)
		for c in range(num_col):
			var x = l + w * (c + 0.5)
			
			var fruit = fruit_scene.instantiate()
			fruit.position = Vector2(x, y)
			fruit.scale = Vector2(1.0625, 1.0625)
			fruit.z_index = -1
			fruit.get_node("Label").text = str(randi() % 9 + 1)
			add_child(fruit)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	background.z_index = -2
	reset_fruits()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_packed(main_scene)


func _on_setting_button_pressed() -> void:
	$Settings.apply_values()
	$Settings.visible = true


func _on_stat_button_pressed() -> void:
	$Stats.apply_values()
	$Stats.visible = true
