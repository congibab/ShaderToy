#iChannel0 "img/image.png"

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
   	vec2 uv = fragCoord.xy / iResolution.xy;
    vec4 col = texture(iChannel0, uv);

    
    float gray = col.r * 0.3 + col.g * 0.6 + col.b * 0.1;

    col = vec4(gray, gray, gray, 1);
    fragColor = col;
}