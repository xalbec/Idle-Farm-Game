@tool
extends Control

const SPRITE_SIZE = Vector2(15,15)

@export var background_color: Color
@export var line_color: Color
@export var highlight_color: Color
@export var outer_radius: int = 256
@export var inner_radius: int = 64
@export var line_width: int = 4
@export var options: Array[CompressedTexture2D]

var offset = SPRITE_SIZE/-2
var selection = 0

func _draw():
	draw_circle(Vector2.ZERO, outer_radius, background_color)
	draw_arc(Vector2.ZERO, inner_radius, 0, TAU, 128, line_color, line_width, false)
	
	if len(options) >= 3:
		for i in range(len(options) - 1):
			var rads = TAU * i / (len(options) - 1)
			var point = Vector2.from_angle(rads)
			draw_line(
				point*inner_radius,
				point*outer_radius,
				line_color,
				line_width,
				false
			)
		
		if selection == 0:
			draw_circle(Vector2.ZERO, inner_radius, highlight_color)
		
		draw_texture_rect(
			options[0],
			Rect2(offset, SPRITE_SIZE),
			false
		)
		
		#Outer edge logic
		for i in range(1, len(options)):
			var start_angle = TAU * (i - 1) / (len(options) - 1)
			var end_angle = TAU * i / (len(options) - 1)
			var mid_angle = (start_angle + end_angle)/2 * -1
			var mid_radius = (inner_radius + outer_radius)/2
			var draw_pos = mid_radius * Vector2.from_angle(mid_angle) + offset
			
			#Highlight the outer edges if selected
			if selection == i:
				var points_per_arc = 32
				var points_inner = PackedVector2Array()
				var points_outer = PackedVector2Array()
				#Creates arrays of points that draw out an arc representing the outer selections
				for j in range(points_per_arc + 1):
					var angle = start_angle + j * (end_angle - start_angle) / points_per_arc
					points_inner.append(inner_radius * Vector2.from_angle(TAU - angle))
					points_outer.append(outer_radius * Vector2.from_angle(TAU - angle))
				#Reverse the order of the outer array for drawing a convex shape
				points_outer.reverse()
				#Draw the highlight
				draw_polygon(
					points_inner + points_outer,
					PackedColorArray([highlight_color])
				)
			#Draw the sprite for the outer selections
			draw_texture_rect(
				options[i],
				Rect2(draw_pos, SPRITE_SIZE),
				false
				)

func _process(_delta: float) -> void:
	var mouse_pos = get_local_mouse_position()
	var mouse_radius = mouse_pos.length()
	
	if mouse_radius < inner_radius:
		selection = 0
	else:
		var mouse_angle = fposmod(mouse_pos.angle() * -1, TAU)
		selection = ceil(mouse_angle/TAU * (len(options)- 1))
	
	queue_redraw()
