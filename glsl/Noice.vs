#iChannel0 "https://66.media.tumblr.com/tumblr_mcmeonhR1e1ridypxo1_500.jpg"
 

const int fps = 15;
const float delta = 1.0f / float(fps);

float Random(float t)
{
    return fract(
        sin(
            dot(vec2(t, t), vec2(12.9898, 78.233))
        ) * 43758.5453123
    );
}

float getTickedTime()
{
    float time = iTime;
    float garbage = mod(time, delta);
    return time - garbage;
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = fragCoord/iResolution.xy;
    float glitchstep = mix(4.0f, 32.0f, Random(getTickedTime()));
    
    vec4 screenColor = texture(iChannel0, uv);
    
    uv.x = round(uv.x * glitchstep) / glitchstep;
    vec4 glitchColor = texture(iChannel0, uv);

    fragColor = mix(screenColor, glitchColor, vec4(0.3f));
}