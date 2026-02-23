#version 330

#define volume(method, shape, ray, maxdepth) max(min(method(shape, ray, 1.0), maxdepth) - max(method(shape, ray, -1.0), 0.0))

struct Ray {
    vec3 pos;
    vec3 look;
};

struct Cube {
    vec3 pos;
    vec3 size;
};

float cubeVolume(Cube cube, Ray ray, float face) {
    vec3 relativePos = cube.pos - ray.pos;

    ray.look *= face;
    vec3 negative = (relativePos - cube.size) / ray.look;
    vec3 positive = (relativePos + cube.size) / ray.look;
    float dist = -1.0 / 0.0;

    if (ray.look.x > 0.0 && negative.x > dist) dist = negative.x;
    if (ray.look.y > 0.0 && negative.y > dist) dist = negative.y;
    if (ray.look.z > 0.0 && negative.z > dist) dist = negative.z;

    if (ray.look.x < 0.0 && positive.x > dist) dist = positive.x;
    if (ray.look.y < 0.0 && positive.y > dist) dist = positive.y;
    if (ray.look.z < 0.0 && positive.z > dist) dist = positive.z;

    return dist * face;
}

struct Sphere {
    vec3 pos;
    float radius;
};

float sphereVolume(Sphere sphere, Ray ray, float face) {
    vec3 relativePos = sphere.pos - ray.pos;
    float n = dot(ray.look, relativePos);
    float len = length(relativePos);
    float delta = n * n - len * len + sphere.radius * sphere.radius;
    return n + face * delta;
}

struct Cone {
    vec3 pos;
    vec3 look;
};
