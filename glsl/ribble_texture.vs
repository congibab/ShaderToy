#iChannel0 "img/image.png"

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
   	vec2 uv = fragCoord.xy / iResolution.xy;
    vec3 col = texture(iChannel0, uv).rgb;

    float d = distance(vec2(0.5, 0.5), uv);
    d = d * 30.;
    d = abs(sin(d - iTime * 2.));
    d = step(0.5,d);

    float a = abs(sin(iTime)) * 0.4;
    
    vec3 b = vec3(step(a,d));

    fragColor = vec4(vec3(d) * col ,1);
}
