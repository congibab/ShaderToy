#iChannel0 "img/image.png"

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
   	vec2 uv = fragCoord.xy / iResolution.xy;
    float angle = iTime;

    vec2 offset = vec2(0.5, 0.5);
    mat2 rot = mat2( cos(angle), sin(angle),
                     -sin(angle), cos(angle)); 
                    
    uv = rot * (uv - offset) + offset;

    vec4 col = texture(iChannel0, uv);

    fragColor = col;
}