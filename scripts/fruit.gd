extends Area2D

var fruit_pop_scene = load("res://scenes/fruit_pop.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func on_hit_by_drag():
	var hud = get_tree().get_root().get_node("Main/HUD")
	hud.add_score()
	
	var fruit_pop = fruit_pop_scene.instantiate()
	fruit_pop.position = self.position
	#fruit_pop.scale = Vector2(1.0625, 1.0625)
	fruit_pop.get_node("Label").text = $Label.text
	get_tree().current_scene.add_child(fruit_pop)
	
	queue_free()


func _on_area_entered(area: Area2D) -> void:
	$Shadow.visible = true
	$SelectSound.play()


func _on_area_exited(area: Area2D) -> void:
	$Shadow.visible = false
