Shader "Custom/TextureUv"
{
    Properties
    {
        _MainTex("Texture",2D) = "white" {}
    }

    SubShader
    {
        Pass
        {
            CGPROGRAM
            #pragma vertex vertexShader
            #pragma fragment fragmentShader

            #include "UnityCG.cginc"
            
            sampler2D _MainTex;
            float4 _MainTex_ST;

            struct vertexInput
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct vertexOutput
            {
                float2 uv : TEXCOORD0;
                float4 vertexPixels : SV_POSITION;
            };

            vertexOutput vertexShader (vertexInput i)
            {
                vertexOutput o;
                o.vertexPixels = UnityObjectToClipPos(i.vertex);
                o.uv = TRANSFORM_TEX(i.uv, _MainTex);
                return o;
            }

            fixed4 fragmentShader (vertexOutput o) : SV_Target
            {
                fixed4 col = tex2D(_MainTex, o.uv);
                return col;
            }
            ENDCG
        }
    }
}
