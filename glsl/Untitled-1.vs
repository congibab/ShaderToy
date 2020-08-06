#iChannel1 "https://66.media.tumblr.com/tumblr_mcmeonhR1e1ridypxo1_500.jpg"

void mainImage(out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = fragCoord/iResolution.xy;
    uv.y += 0.05 * sin(iTime + uv.x * 10.0);
    uv.x += 0.05 * sin(iTime + uv.x * 10.0);
    vec4 color = texture(iChannel1, uv);
    //color = color * color;
    fragColor = color;
}