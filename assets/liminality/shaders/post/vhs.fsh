#version 330

#moj_import <minecraft:globals.glsl>

uniform sampler2D InSampler;

in vec2 texCoord;

layout(std140) uniform SamplerInfo {
    vec2 OutSize;
    vec2 InSize;
};

layout(std140) uniform VhsConfig {
    float power;
};

out vec4 fragColor;

float rand(vec2 co){
    return fract(sin(dot(co, vec2(12.9898, 78.233))) * 43758.5453);
}

void main(){
    vec2 offset = texCoord - 0.5;

    vec4 color = texture(InSampler, texCoord);

    float random = rand(vec2(rand(texCoord), GameTime));

    fragColor = mix(color, vec4(random, random, random, 1.0), 0.05);
}
