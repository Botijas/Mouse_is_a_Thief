shader_type canvas_item;

uniform float progress : hint_range(0.0, 1.0) = 0.5;

uniform float alpha : hint_range(0.0, 1.0) = 1;

void fragment() {
	vec2 center = vec2(0.5);
	vec2 uv = UV - center;
	
	float angle = atan(uv.y, uv.x);
	float normalized_angle = (angle + PI) / (2.0 * PI);
	
	if (normalized_angle > progress) {
		discard;
		}
	
	COLOR = texture(TEXTURE, UV);
	
	vec4 tex = texture(TEXTURE, UV);
	tex.a *= alpha;
	COLOR = tex;
}
