extends CanvasLayer

var home_scene = load("res://scenes/home.tscn")
var score = 0
var game_time = 120

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for child in $Result.get_children():
		if child is CanvasItem or child is Node3D:
			child.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_game_timer_timeout() -> void:
	game_time -= 1
	update_game_time(game_time)
	if game_time == 0:
		$GameTimer.stop()
		update_result()
		show_result()

func update_game_time(time):
	$GameTime.text = str(time)
	$ProgressBar.value = time
	
func add_score():
	score += 1
	$Score.text = str(score)

func show_result():
	for child in $Result.get_children():
		if child is CanvasItem or child is Node3D:
			child.visible = true
	$Result/Score.text = str(score)

func update_result():
	Global.settings["played"] += 1
	if score == 9 * 18:
		Global.settings["all_clear"] += 1
	if score > Global.settings["best_score"]:
		Global.settings["best_score"] = score
	Global.save_settings()
	$Stats.apply_values()

func _on_redo_button_pressed() -> void:
	ButtonPlayer.play()
	var scene_path = get_tree().current_scene.scene_file_path
	var scene = load(scene_path)
	get_tree().change_scene_to_packed(scene)


func _on_home_button_pressed() -> void:
	ButtonPlayer.play()
	get_tree().change_scene_to_packed(home_scene)


func _on_stat_button_pressed() -> void:
	ButtonPlayer.play()
	$Stats.visible = true


func _on_top_home_button_pressed() -> void:
	ButtonPlayer.play()
	get_tree().change_scene_to_packed(home_scene)
