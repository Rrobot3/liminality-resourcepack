#version 330

float cubeVolume(vec3 pos, vec3 size, vec3 look, float face) {
    look *= face;
    vec3 negative = (pos - size) / look;
    vec3 positive = (pos + size) / look;
    float dist = -1.0 / 0.0;

    if (look.x > 0.0 && negative.x > dist) dist = negative.x;
    if (look.y > 0.0 && negative.y > dist) dist = negative.y;
    if (look.z > 0.0 && negative.z > dist) dist = negative.z;

    if (look.x < 0.0 && positive.x > dist) dist = positive.x;
    if (look.y < 0.0 && positive.y > dist) dist = positive.y;
    if (look.z < 0.0 && positive.z > dist) dist = positive.z;

    return dist * face;
}

float sphereVolume(vec3 pos, float radius, vec3 look, float face) {
    float n = dot(look, pos);
    float len = length(pos);
    float delta = n * n - len * len + radius * radius;
    return n + face * delta;
}
