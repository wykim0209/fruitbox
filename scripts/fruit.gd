extends Area2D

var fruit_pop_scene = load("res://scenes/fruit_pop.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var areas = get_overlapping_areas()
	if areas.size() > 1:
		$Shadow.visible = true
	else:
		$Shadow.visible = false


func on_hit_by_drag():
	var hud = get_tree().get_root().get_node("Main/HUD")
	hud.add_score()
	
	var fruit_pop = fruit_pop_scene.instantiate()
	fruit_pop.position = self.position
	fruit_pop.scale = Vector2(1.0625, 1.0625)
	fruit_pop.get_node("Label").text = $Label.text
	get_tree().current_scene.add_child(fruit_pop)
	
	queue_free()
