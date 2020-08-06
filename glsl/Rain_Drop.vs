#iChannel0 "img/image.png"
#iChannel1 "img/noise.png"

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = fragCoord/iResolution.xy;
    vec2 n = texture2D(iChannel1, uv * 0.1).rg;
    
    fragColor = textureLod(iChannel0, uv, 2.5);

    for(float i = 4.0; i > 0.0; i--)
    {
        vec2 x =  iResolution.xy * i * 0.015;
        vec2 p = 6.28 * uv * x + (n - 0.5) * 2.0;
        vec2 s = sin(p);

        vec4 d = texture2D(iChannel1, round(uv * x - 0.25) / x); 

        float t = (s.x + s.y) * max(0.0, 1.0 - fract(iTime * (d.b + 0.1) + d.g) * 2.0);

        if(d.r < (5.0, -i) * 0.08 && t > 0.5)
        {
            vec3 v = normalize(-vec3(cos(p), mix(0.2, 2.0, t-0.5)));
            fragColor = texture2D(iChannel0, uv - v.xy * 0.3);
        }
    }
}
