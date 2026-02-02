#version 330


uniform sampler2D InSampler;

in vec2 texCoord;

layout(std140) uniform SamplerInfo {
    vec2 OutSize;
    vec2 InSize;
    vec2 ScreenSize;
};

layout(std140) uniform ChromaticAberrationConfig {
    float RShift;
    float GShift;
    float BShift;
};

out vec4 fragColor;



void main(){
    vec2 offset = texCoord - 0.5;

    float Red = texture(InSampler, texCoord + offset * RShift).r;
    float Green = texture(InSampler, texCoord + offset * GShift).g;
    float Blue = texture(InSampler, texCoord + offset * BShift).b;
    
    fragColor = vec4(Red, Green, Blue, 1);

}
