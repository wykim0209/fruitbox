extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var btn1 = $Box/MenuPanel/Menu1/Button
	if Global.settings["is_bgm_on"]:
		btn1.text = "ON"
	else:
		btn1.text = "OFF"
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_invisible_bg_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		visible = false


func _on_button1_pressed() -> void:
	var btn1 = $Box/MenuPanel/Menu1/Button
	if Global.settings["is_bgm_on"]:
		btn1.text = "OFF"
		Global.settings["is_bgm_on"] = false
	else:
		btn1.text = "ON"
		Global.settings["is_bgm_on"] = true
	Global.apply_settings()
	Global.save_settings()
