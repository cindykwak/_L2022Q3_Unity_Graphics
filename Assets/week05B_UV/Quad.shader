Shader "My/Quad"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _MainTex2 ("Albedo (RGB)", 2D) = "white" {}
    }
    SubShader
    {
        Tags { "RenderType"="Transparent" "Queue" = "Transparent"} //����Ÿ�� ����, ť���� ����

        CGPROGRAM
        #pragma surface surf Standard fullforwardshadows alpha:fade //�����԰� �������� ��踦 �ε巴�� ó����

        sampler2D _MainTex;
        sampler2D _MainTex2;

        struct Input
        {
            float2 uv_MainTex;
            float2 uv_MainTex2;// vertex�� �ִ� uv ������
        };

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex);
            fixed4 d = tex2D (_MainTex2, float2(IN.uv_MainTex.x, IN.uv_MainTex.y - _Time.y)); //�׳� y���ϸ� �밢�������帧
            o.Albedo = c.rgb;                                          //���� �帣������� ���̳ʽ� �� ó��
            //o.Emission = IN.uv_MainTex.x;
            //o.Emission = IN.uv_MainTex.y;
           // o.Emission = float3(IN.uv_MainTex.x, IN.uv_MainTex.y, 0); // U --> Red, V --> Green
           o.Emission = c.rgb *d.rgb; //���ؼ� ���� ��ȭ�Ӱ�
           o.Alpha = c.a *d.a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
