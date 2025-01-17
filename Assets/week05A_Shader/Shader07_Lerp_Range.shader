Shader "My/SurfaceShader/LerpRange"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex1 ("Albedo (RGB)", 2D) = "white" {}
        _MainTex2 ("Albedo (RGB)", 2D) = "white" {}
        _LerpRange ("Lerp Range", Range(0, 1)) = 0

        _Red ("Red", Range(0, 1)) = 0
        _Green ("Green", Range(0, 1)) = 0
        _Blue ("Blue", Range(0, 1)) = 0
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        CGPROGRAM
        #pragma surface surf Standard fullforwardshadows

        sampler2D _MainTex1;
        sampler2D _MainTex2;
        float _LerpRange;

        struct Input
        {
            float2 uv_MainTex1;
            float2 uv_MainTex2;
        };

        fixed4 _Color;
        float _Red;
        float _Green;
        float _Blue;

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            fixed4 c = tex2D (_MainTex1, IN.uv_MainTex1);
            fixed4 d = tex2D (_MainTex2, IN.uv_MainTex2);
            //o.Albedo = c.rgb;
            o.Albedo = lerp(c.rgb, d.rgb, _LerpRange);
            o.Albedo = float3(_Red, _Green, _Blue);
            o.Alpha = c.a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
