extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	apply_values()


func apply_values():
	$Box/MenuPanel/Menu1/Button.text = str(int(Global.settings["played"]))
	$Box/MenuPanel/Menu2/Button.text = str(int(Global.settings["all_clear"]))
	$Box/MenuPanel/Menu3/Button.text = str(int(Global.settings["best_score"]))


func _on_invisible_bg_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		visible = false
