float iTime;
float scale;

float rand(float2 st)
{
    return frac(sin(dot(st, float2(12.9898, 78.233)) * 43758.5453));
}

float wave(float2 st, float n)
{
    st = (floor(st*n) + 0.5) / n;
    float d = distance(0.5, st);
    return (1 + sin(d * 3 - iTime * 0.02)) * 0.4;
}

float box(float2 st, float size)
{
    size = 0.5 + size * 0.5;
    st = step(st, size) * step(1.0 - st, size);
    return st.x * st.y;
}

float box_size(float2 st, float n)
{
    st = (floor(st*n) + 0.5) / n;
    float offs = rand(st) * 5;
    return (1+sin(iTime * 0.05 + offs)) * 0.5;
}


float4 main(in float2 uv: TEXCOORD0): SV_TARGET
{
    float n = 10;
    float2 st = frac(uv * n);

    //float size = wave(uv, n);
    float size = box_size(uv,n);
    return box(st, size);
}