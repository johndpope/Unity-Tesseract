﻿Shader "Tesseract/Lines"
{
	Properties
	{
		_Color ("Brightness", Color) = (1, 1, 1, 0.2)
	}
	SubShader
	{
		Tags { "RenderType"="Opague" "IgnoreProjector"="True" "Queue"="Transparent+2" }

		Cull Off
		ZWrite Off
		Blend DstColor SrcColor

		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			
			#include "UnityCG.cginc"

			uniform fixed4 _Color;

			struct appdata
			{
				float4 vertex : POSITION;
				fixed4 color : COLOR;
			};

			struct v2f
			{
				float4 vertex : SV_POSITION;
				fixed4 color : COLOR;
			};
			
			v2f vert (appdata v)
			{
				v2f o;
				o.vertex = mul(UNITY_MATRIX_MVP, v.vertex);
				o.color = v.color;

				return o;
			}
			
			fixed4 frag (v2f i) : SV_Target
			{
				return i.color+_Color;
			}
			ENDCG
		}
	}
}
