Shader "Custom/ZTestColor"
{
    Properties
    {
        _Color ("Color",Color) = (1,1,1,1)
    }

    SubShader
    {
        Pass
        {
            ZTest Greater

            CGPROGRAM
            #pragma vertex vertexShader
            #pragma fragment fragmentShader

            struct vertexInput
            {
                float4 vertex : POSITION;
            };

            struct vertexOutput
            {
                float4 vertex : SV_POSITION;
            };

            float4 _Color;

            vertexOutput vertexShader(vertexInput i)
            {
                vertexOutput o;
                o.vertex = UnityObjectToClipPos(i.vertex);
                return o;
            }

            float4 fragmentShader(vertexOutput o) : SV_Target
            {
                return _Color;
            }
            ENDCG
        }
    }
}
