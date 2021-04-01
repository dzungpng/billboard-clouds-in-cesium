precision highp float;

uniform mat3 u_normalMatrix;
uniform mat4 u_modelViewMatrix;
uniform mat4 u_projectionMatrix;

attribute vec3 a_position;
attribute vec2 a_texcoord0;

attribute vec3 a_normal;
attribute vec3 a_textangent;
attribute vec3 a_texbinormal;

varying vec3 v_normal;
varying vec3 v_tangent;
varying vec3 v_bitangent;

varying vec3 v_vertex;
varying vec2 v_texcoord0;

void main(void) {

    // pass on attributes to Fragment Shader
    v_texcoord0 = a_texcoord0;

    // normal in viewSpace
    v_normal = normalize(czm_normal * a_normal);
    v_tangent = normalize(czm_normal * a_textangent);                       // tangent in eye coordinates
    v_bitangent = normalize(czm_normal * a_texbinormal);                   // bitangent in eye coordinates

    // vertex in viewSpace
    vec4 vertexVS = u_modelViewMatrix * vec4(a_position, 1.0);
    v_vertex = vec3(vertexVS);

    // standard positioning
    gl_Position = u_projectionMatrix * vertexVS;
}
