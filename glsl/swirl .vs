#define PI 3.14159
#iChannel0 "img/Background.jpg"
#iChannel1 "img/hole.png"

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    float effectRadius = 0.5;
    float effectAngle = 1. * PI;
    
    vec2 center = iMouse.xy / iResolution.xy;
    center = center == vec2(0., 0.) ? vec2(.5, .5) : center;
    
    vec2 uv = fragCoord.xy / iResolution.xy - center;
    
    float len = length(uv * vec2(iResolution.x / iResolution.y, 1.));
    float angle = atan(uv.y, uv.x) + effectAngle * smoothstep(effectRadius, 0., len) * sin(iTime) * 10.;
    float radius = length(uv);

    vec4 col2 = texture(iChannel1, vec2(radius * cos(angle), radius * sin(angle)) + center);
    fragColor = col2;
}