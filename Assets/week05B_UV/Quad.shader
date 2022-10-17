Shader "My/Quad"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _MainTex2 ("Albedo (RGB)", 2D) = "white" {}
    }
    SubShader
    {
        Tags { "RenderType"="Transparent" "Queue" = "Transparent"} //랜더타입 투명, 큐값도 투명

        CGPROGRAM
        #pragma surface surf Standard fullforwardshadows alpha:fade //투명함과 불투명함 경계를 부드럽게 처리함

        sampler2D _MainTex;
        sampler2D _MainTex2;

        struct Input
        {
            float2 uv_MainTex;
            float2 uv_MainTex2;// vertex에 있는 uv 데이터
        };

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex);
            fixed4 d = tex2D (_MainTex2, float2(IN.uv_MainTex.x, IN.uv_MainTex.y - _Time.y)); //그냥 y로하면 대각선으로흐름
            o.Albedo = c.rgb;                                          //위로 흐르고싶으면 마이너스 값 처리
            //o.Emission = IN.uv_MainTex.x;
            //o.Emission = IN.uv_MainTex.y;
           // o.Emission = float3(IN.uv_MainTex.x, IN.uv_MainTex.y, 0); // U --> Red, V --> Green
           o.Emission = c.rgb *d.rgb; //곱해서 좀더 조화롭게
           o.Alpha = c.a *d.a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
