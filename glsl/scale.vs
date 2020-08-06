#iChannel0 "img/image.png"

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 offset = vec2(0.5, 0.5);

   	vec2 uv = fragCoord.xy / iResolution.xy;
    mat2 scal = mat2(sin(iTime), 0,
                    0, sin(iTime));

    uv = scal * (uv - offset) + offset;
    vec4 col = texture(iChannel0, uv);
     
    fragColor = col;
}