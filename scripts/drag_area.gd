extends Area2D

var start_pos: Vector2
var dragging: bool = false

@onready var hud: CanvasLayer = %HUD
@onready var collision_shape: CollisionShape2D = $CollisionShape2D
@onready var color_rect: ColorRect = $ColorRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	monitoring = false
	collision_shape.disabled = true
	color_rect.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _input(event):
	if hud.game_time == 0:
		return
	if event is InputEventScreenTouch or event is InputEventMouseButton:
		if event.pressed:
			dragging = true
			start_pos = event.position
			monitoring = true
			color_rect.visible = true
			update_drag_area(start_pos, event.position)
		else:
			dragging = false
			check_overlaps()
			monitoring = false
			collision_shape.disabled = true
			color_rect.visible = false
	elif (event is InputEventScreenDrag or event is InputEventMouseMotion) and dragging:
		update_drag_area(start_pos, event.position)

func update_drag_area(start: Vector2, current: Vector2):
	var rect = Rect2(start, current - start).abs()

	# Update collision shape
	collision_shape.shape.extents = rect.size / 2.0
	position = rect.position + rect.size / 2.0
	collision_shape.disabled = false

	# Update ColorRect
	color_rect.position = rect.position - position
	color_rect.size = rect.size

func check_overlaps():
	var overlapping_areas = get_overlapping_areas()
	
	# calculate sum
	var sum = 0
	for area in overlapping_areas:
		if area.has_method("on_hit_by_drag"):
			sum += int(area.get_node("Label").text)
	
	# delete if sum is 10
	if sum == 10:
		for area in overlapping_areas:
			if area.has_method("on_hit_by_drag"):
				area.on_hit_by_drag()
