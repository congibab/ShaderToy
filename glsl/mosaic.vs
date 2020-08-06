#iChannel0 "img/image.png"

float _TileNumX = 50.0;
float _TileNumY = 50.0;

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = fragCoord/iResolution.xy;
    vec2 TileNum = vec2(_TileNumX, _TileNumY);
    vec2 uv2 = floor(uv * TileNum) / TileNum;
    //uv -= uv2;
    //uv *= TileNum; 
    
    vec4 col = texture2D(iChannel0, uv2);
    //vec4 col = texture2D(iChannel0, uv2 + vec2(step(1.0 - uv.y, uv.x) / (2.0 * _TileNumX),
    //                                      vec2(step(uv.x, uv.y) / (2.0 * _TileNumY))));

    fragColor = col;
}