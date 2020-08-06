//https://www.shadertoy.com/view/ll2Xzd
//https://gamedev.stackexchange.com/questions/144702/how-can-i-make-a-soft-outline-shader
//https://www.shadertoy.com/view/tlfSRS

#iChannel0 "img/image.png"
#iChannel1 "img/noise.png"

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
   	vec2 uv = fragCoord.xy / iResolution.xy;
    vec3 pixel = vec3(.0);
    float height = texture(iChannel1, uv.xy).r;
    pixel = texture(iChannel0,uv.xy).rgb;

     float condition = step(height, sin(iTime));
    //float condition = smoothstep(height , 1. , sin(iTime));


    pixel = pixel * (1. - condition);

    fragColor = vec4(pixel,1.0);
}