extends Node2D

@onready var main_scene = load("res://scenes/main.tscn")


func _on_play_button_pressed() -> void:
	ButtonPlayer.play()
	get_tree().change_scene_to_packed(main_scene)


func _on_setting_button_pressed() -> void:
	$Settings.apply_values()
	ButtonPlayer.play()
	$Settings.visible = true


func _on_info_button_pressed() -> void:
	ButtonPlayer.play()


func _on_stat_button_pressed() -> void:
	$Stats.apply_values()
	ButtonPlayer.play()
	$Stats.visible = true


func _on_shop_button_pressed() -> void:
	ButtonPlayer.play()
