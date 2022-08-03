Shader"Custom/SimpleColor"
{
	//02
	Properties
	{
		_Color("Tint", Color) = (1,1,1,1)
	}

	//03
	SubShader
	{

		//04
		Pass
		{
			//05
			CGPROGRAM
			//Pragma
			#pragma vertex vertexShader
			#pragma fragment fragmentShader

			fixed4 _Color;

			//Vertex input
			struct vertexInput
			{
				fixed4 vertex : POSITION; //objects space
			};

			//Vertex Output
			struct vertexOutput
			{
				fixed4 position : SV_POSITION; //projection space
				fixed4 color : COLOR; //pixel color
			};

			//Vertex shaders
			vertexOutput vertexShader(vertexInput i)
			{
				vertexOutput o;
				o.position = UnityObjectToClipPos(i.vertex); // Local a projection
				o.color = _Color;
				return o;
			}

			//Fragment shader
			fixed4 fragmentShader(vertexOutput o) : SV_TARGET
			{
				return o.color;
			}

			ENDCG
		}
	}

	Fallback "Mobile/VertexLit"
}