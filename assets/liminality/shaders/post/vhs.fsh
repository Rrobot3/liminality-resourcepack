#version 330

uniform sampler2D InSampler;

in vec2 texCoord;

layout(std140) uniform SamplerInfo {
    vec2 OutSize;
    vec2 InSize;
    vec2 ScreenSize;
};

layout(std140) uniform VhsAberrationConfig {
    float RShift;
    float GShift;
    float BShift;
};

out vec4 fragColor;

float rand(vec3 co){
    return fract(sin(dot(co, vec3(12.9898, 78.233, 37.3735))) * 43758.5453);
}

void main(){
    vec2 offset = texCoord - 0.5;

    vec4 color = texture(InSampler, texCoord);

    float random = rand(vec3(texCoord, 0.0));

    fragColor = mix(color, vec4(random, random, random, 1.0), 0.02);
}
