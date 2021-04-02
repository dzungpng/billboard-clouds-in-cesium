precision highp float;
uniform sampler2D u_diffuse;
varying vec2 v_texcoord0;

void main(void) {

    vec4 color;
    vec4 diffuse;
    float alpha;

    // diffuse
    diffuse = texture2D(u_diffuse, v_texcoord0);

    // sum
    alpha = diffuse.x; // take alpha from red channel
    color = vec4(vec3(1.0, 1.0, 1.0), alpha);
    gl_FragColor = color;
}
