
void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = fragCoord/iResolution.xy;
    fragColor = vec4(uv.x,uv.y,0,1.0);
    
}
/*
float4 frag(v2f_img i) : Target
{
    return float4(i.uv.x, i.uv.y, 0, 1);
}
*/