
#if (I3L_LIGHTMODEL == I3L_LIGHTMODEL_GI1)
float3 GetLightingColor(	float3 litDiffuse, float3 litSpecular,
				float3 diffColor, float3 specColor, float specPow, float3 Normal, float3 csPos, float3 lightPos,
				float litted)
{
	float3 sColor, secondColor;
	
	sColor = _getSpecular( Normal, csPos, specColor, specPow, lightPos);
	
	secondColor = _highlight( diffColor, litted);
	
	return ((secondColor * diffColor) + sColor) * litDiffuse * litted;
}

#define STEP		(1.0f / 6.0f)

float3 GetLighingColor_Dir(	float3 litDiffuse, float3 litSpecular,
				float3 diffColor, float3 specColor, float specPow, float3 Normal, float3 csPos, float3 lightDir,
				float litted)
{
	half3 sColor, secondColor;
	
	sColor = _getSpecular_Dir( Normal, csPos, specColor, specPow, lightDir);
	
	secondColor = _highlight( diffColor, litted);
	
	float vcos = saturate( dot( -lightDir, Normal));
	float3 reverseColor = g_SecondaryColor * vcos * diffColor;
	
	vcos = pow( (1.0f - vcos), 8.0f);
	float3 indirectColor = vcos * g_TetraColor * diffColor;

	return ((diffColor * secondColor + sColor) * litDiffuse * litted) + reverseColor + indirectColor;
}
#endif