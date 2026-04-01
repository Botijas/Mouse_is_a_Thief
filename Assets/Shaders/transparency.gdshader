shader_type canvas_item;

uniform float alpha : hint_range(0.0, 1.0) = 1;

void fragment() {
	vec4 tex = texture(TEXTURE, UV);
	tex.a *= alpha;
	COLOR = tex;
}
