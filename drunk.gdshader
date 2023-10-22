shader_type spatial;

uniform float bac : hint_range(0.0, 5.0);

void fragment() {
	ALBEDO = vec3(0.0, 0.0, 0.0);
	ALPHA = 1.0 - (bac/5.0);
}
