float iTime;
float scale;

float box(float2 st, float size)
{
    size = 0.5 + size * 0.5;
    st = step(st, size) * step(1.0 - st, size);
    return st.x * st.y;
}

float4 main(in float2 uv: TEXCOORD0): SV_TARGET
{
    float n = 10;
    float2 st = frac(uv * n) ;
    return box(st, abs(sin(iTime * 0.02)));
}