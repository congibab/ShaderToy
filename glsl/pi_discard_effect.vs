#iChannel0 "img/image.png"

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
   	vec2 uv = (fragCoord.xy / iResolution.xy) - 0.5;
    vec3 col = texture(iChannel0, uv + 0.5).rgb;
    float rad = atan(uv.y, uv.x);

    float value = (rad + 3.14)/(3.14 * 2.);
    
    //fragColor = vec4(vec3(value), 1);
    fragColor = vec4(col * step(value, sin(iTime)), 1);
}
