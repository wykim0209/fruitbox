extends Node

var settings := {
	"is_bgm_on": true,
}

const SAVE_PATH := "user://settings.json"

func save_settings():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	var json = JSON.stringify(settings)
	file.store_string(json)
	file.close()

func load_settings():
	if not FileAccess.file_exists(SAVE_PATH):
		return
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	var content = file.get_as_text()
	file.close()

	var result = JSON.parse_string(content)
	if typeof(result) == TYPE_DICTIONARY:
		settings = result

func apply_settings():
	if settings["is_bgm_on"]:
		BgmPlayer.play()
	else:
		BgmPlayer.stop()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_settings()
	apply_settings()
