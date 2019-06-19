//RealToon V5.0.3 (LWRP)
//MJQStudioWorks
//2019

Shader "Lightweight Render Pipeline/RealToon/Version 5/Default/Fade Transparency"
{
    Properties
    {

		[Enum(Off,2,On,0)] _DoubleSided("Double Sided", int) = 2

        _MainTex ("Texture", 2D) = "white" {}
        [MaterialToggle] _TexturePatternStyle ("Texture Pattern Style", Float ) = 0
        [HDR] _MainColor ("Main Color", Color) = (0.2156863,0.2156863,0.2156863,1)

		[HDR] _HighlightColor ("Highlight Color", Color) = (1,1,1,1)
        _HighlightColorPower ("Highlight Color Power", Float ) = 1

        _Opacity ("Opacity", Range(0, 1)) = 1
		_TransparentThreshold ("Transparent Threshold", Float ) = 0
        _MaskTransparency ("Mask Transparency", 2D) = "black" {}

        _NormalMap ("Normal Map", 2D) = "bump" {}
        _NormalMapIntensity ("Normal Map Intensity", Float ) = 1

        _Saturation ("Saturation", Range(0, 2)) = 1

        _OutlineWidth ("Width", Float ) = 0.5
        _OutlineWidthControl ("Width Control", 2D) = "white" {}

		[Enum(Normal,0,Origin,1)] _OutlineExtrudeMethod("Outline Extrude Method", int) = 0

		_ReduceOutlineBackFace ("Reduce Outline Backface", Range(0, 1)) = 0

		_OutlineOffset ("Outline Offset", Vector) = (0,0,0)
		_OutlineZPostionInCamera ("Outline Z Position In Camera", Float) = 0

		[Enum(Off,1,On,0)] _DoubleSidedOutline("Double Sided Outline", int) = 1

        [HDR] _OutlineColor ("Color", Color) = (0,0,0,1)
        _NoisyOutlineIntensity ("Noisy Outline Intensity", Range(0, 1)) = 0
        [MaterialToggle] _DynamicNoisyOutline ("Dynamic Noisy Outline", Float ) = 0
        [MaterialToggle] _LightAffectOutlineColor ("Light Affect Outline Color", Float ) = 0

        [MaterialToggle] _OutlineWidthAffectedByViewDistance ("Outline Width Affected By View Distance", Float ) = 0
		_FarDistanceMaxWidth ("Far Distance Max Width", Float ) = 10

        [MaterialToggle] _VertexColorRedAffectOutlineWitdh ("Vertex Color Red Affect Outline Witdh", Float ) = 0

        _SelfLitIntensity ("Intensity", Range(0, 1)) = 0
        [HDR] _SelfLitColor ("Color", Color) = (1,1,1,1)
        _SelfLitPower ("Power", Float ) = 2
        [MaterialToggle] _SelfLitHighContrast ("High Contrast", Float ) = 1
        _MaskSelfLit ("Mask Self Lit", 2D) = "white" {}

        _GlossIntensity ("Intensity", Range(0, 1)) = 1
        _Glossiness ("Glossiness", Range(0, 1)) = 0.6
        _GlossSoftness ("Softness", Range(0, 1)) = 0
        [HDR] _GlossColor ("Color", Color) = (1,1,1,1)
        _GlossColorPower ("Color Power", Float ) = 10
        _MaskGloss ("Mask Gloss", 2D) = "white" {}

        _GlossTexture ("Gloss Texture", 2D) = "black" {}
        _GlossTextureSoftness ("Softness", Float ) = 0
        _GlossTextureRotate ("Rotate", Float ) = 0
        [MaterialToggle] _GlossTextureFollowObjectRotation ("Follow Object Rotation", Float ) = 0
        _GlossTextureFollowLight ("Follow Light", Range(0, 1)) = 0

        [HDR] _OverallShadowColor ("Overall Shadow Color", Color) = (0,0,0,1)
        _OverallShadowColorPower ("Overall Shadow Color Power", Float ) = 1

        [MaterialToggle] _SelfShadowShadowTAtViewDirection ("Self Shadow & ShadowT At View Direction", Float ) = 0

        _SelfShadowIntensity ("Self Shadow Intensity", Range(0, 1)) = 1
        _SelfShadowThreshold ("Threshold", Range(0, 1)) = 0.85
        [MaterialToggle] _VertexColorGreenControlSelfShadowThreshold ("Vertex Color Green Control Self Shadow Threshold", Float ) = 0
        _SelfShadowHardness ("Hardness", Range(0, 1)) = 1
        [HDR] _SelfShadowColor ("Color", Color) = (1,1,1,1)
        _SelfShadowColorPower ("Color Power", Float ) = 1
        [MaterialToggle] _SelfShadowAffectedByLightShadowStrength ("Self Shadow Affected By Light Shadow Strength", Float ) = 0

        _SmoothObjectNormal ("Smooth Object Normal", Range(0, 1)) = 0
        [MaterialToggle] _VertexColorBlueControlSmoothObjectNormal ("Vertex Color Blue Control Smooth Object Normal", Float ) = 0
        _XYZPosition ("XYZ Position", Vector) = (0,0,0,0)
        _XYZHardness ("XYZ Hardness", Float ) = 14
        [MaterialToggle] _ShowNormal ("Show Normal", Float ) = 0

        _ShadowColorTexture ("Shadow Color Texture", 2D) = "white" {}
        _ShadowColorTexturePower ("Shadow Color Texture (Power)", Float ) = 0

        _ShadowTIntensity ("Intensity", Range(0, 1)) = 1
        _ShadowT ("ShadowT", 2D) = "white" {}
        _ShadowTLightThreshold ("Light Threshold", Float ) = 50
        _ShadowTShadowThreshold ("Shadow Threshold", Float ) = 0
        [HDR] _ShadowTColor ("Color", Color) = (1,1,1,1)
        _ShadowTColorPower ("Color Power", Float ) = 1
        _ShadowTHardness ("Hardness", Range(0, 1)) = 1

		[Toggle(N_F_STIS_ON)] _N_F_STIS ("Show In Shadow", Float ) = 0

		[Toggle(N_F_STIAL_ON)] _N_F_STIAL ("Show In Ambient Light", Float ) = 0
        _ShowInAmbientLightShadowIntensity ("Show In Ambient Light Intensity", Range(0, 1)) = 1
        _ShowInAmbientLightShadowThreshold ("Show In Ambient Light & Shadow Threshold", Float ) = 0.4

        [MaterialToggle] _LightFalloffAffectShadowT ("Light Falloff Affect ShadowT", Float ) = 0

        _PTexture ("PTexture", 2D) = "white" {}
        _PTexturePower ("Power", Float ) = 1

        [MaterialToggle] _GIFlatShade ("GI Flat Shade", Float ) = 0
        _GIShadeThreshold ("GI Shade Threshold", Range(0, 1)) = 0

        [MaterialToggle] _LightAffectShadow ("Light Affect Shadow", Float ) = 0
        _LightIntensity ("Light Intensity", Float ) = -1

        _EnvironmentalLightingIntensity ("Environmental Lighting Intensity", Float ) = 1

		[MaterialToggle] _UseTLB ("Use Traditional Light Blend", Float ) = 0
		[Toggle(N_F_EAL_ON)] _N_F_EAL ("Enable Additional Lights", Float ) = 1

		_DirectionalLightIntensity ("Directional Light Intensity", Float ) = 0
		_PointSpotlightIntensity ("Point and Spot Light Intensity", Float ) = 0.3
		_LightFalloffSoftness ("Light Falloff Softness", Range(0, 1)) = 1

        _CustomLightDirectionIntensity ("Intensity", Range(0, 1)) = 0
        [MaterialToggle] _CustomLightDirectionFollowObjectRotation ("Follow Object Rotation", Float ) = 0
        _CustomLightDirection ("Custom Light Direction", Vector) = (0,0,10,0)

        _ReflectionIntensity ("Intensity", Range(0, 1)) = 0
        _ReflectionRoughtness ("Roughtness", Float ) = 0
		_RefMetallic ("Metallic", Range(0,1) ) = 0

        _MaskReflection ("Mask Reflection", 2D) = "white" {}

        [MaterialToggle] _UseFReflection ("Use FReflection", Float ) = 0
        _FReflection ("FReflection", 2D) = "black" {}

        _RimLightUnfill ("Unfill", Float ) = 1.5
        [HDR] _RimLightColor ("Color", Color) = (1,1,1,1)
        _RimLightColorPower ("Color Power", Float ) = 10
        _RimLightSoftness ("Softness", Range(0, 1)) = 1
        [MaterialToggle] _RimLightInLight ("Rim Light In Light", Float ) = 1
        [MaterialToggle] _LightAffectRimLightColor ("Light Affect Rim Light Color", Float ) = 0

		_RefVal ("ID", int ) = 0
        [Enum(None,8,A,0,B,2)] _Oper("Set 1", int) = 8
        [Enum(None,8,A,6,B,7)] _Compa("Set 2", int) = 8

		[Toggle(N_F_NM_ON)] _N_F_NM ("Normal Map", Float ) = 0
		[Toggle(N_F_O_ON)] _N_F_O ("Outline", Float ) = 0
		[Toggle(N_F_CA_ON)] _N_F_CA ("Color Adjustment", Float ) = 0
		[Toggle(N_F_SL_ON)] _N_F_SL ("Self Lit", Float ) = 0
		[Toggle(N_F_GLO_ON)] _N_F_GLO ("Gloss", Float ) = 0
		[Toggle(N_F_GLOT_ON)] _N_F_GLOT ("Gloss Texture", Float ) = 0
		[Toggle(N_F_SS_ON)] _N_F_SS ("Self Shadow", Float ) = 1
		[Toggle(N_F_SON_ON)] _N_F_SON ("Smooth Object Normal", Float ) = 0
		[Toggle(N_F_SCT_ON)] _N_F_SCT ("Shadow Color Texture", Float ) = 0
		[Toggle(N_F_ST_ON)] _N_F_ST ("ShadowT", Float ) = 0
		[Toggle(N_F_PT_ON)] _N_F_PT ("PTexture", Float ) = 0
		[Toggle(N_F_CLD_ON)] _N_F_CLD ("Custom Light Direction", Float ) = 0
		[Toggle(N_F_R_ON)] _N_F_R ("Reflection", Float ) = 0
		[Toggle(N_F_FR_ON)] _N_F_FR ("FReflection", Float ) = 0
		[Toggle(N_F_RL_ON)] _N_F_RL ("Rim Light", Float ) = 0
		[Enum(On,1,Off,0)] _ZWrite("ZWrite", int) = 0

		[Toggle(N_F_DCS_ON)] _N_F_DCS ("Disable Cast Shadow", Float ) = 0
		[Toggle(N_F_NLASOBF_ON)] _N_F_NLASOBF ("No Light On BackFace", Float ) = 0
    }

    SubShader
    {

        Tags{"Queue"="Transparent" "RenderType"="Transparent" "RenderPipeline" = "LightweightPipeline" "IgnoreProjector" = "True"}
        LOD 300

		Pass {
            Name "Outline"
            Tags {
            }
            Cull [_DoubleSidedOutline]

			Stencil {
            	Ref[_RefVal]
            	Comp [_Compa]
            	Pass [_Oper]
            	Fail [_Oper]
            }

            HLSLPROGRAM

            #pragma prefer_hlslcc gles
            #pragma only_renderers d3d9 d3d11 vulkan glcore gles3 gles metal xboxone ps4 wiiu switch
            #pragma target 3.0

			#pragma multi_compile _ _ADDITIONAL_LIGHTS
            #pragma multi_compile_fog
            #pragma multi_compile_instancing

            #pragma vertex LitPassVertex
            #pragma fragment LitPassFragment

			#include "Packages/com.unity.render-pipelines.lightweight/ShaderLibrary/Core.hlsl"
            #include "Packages/com.unity.render-pipelines.lightweight/ShaderLibrary/Lighting.hlsl"

			#pragma shader_feature N_F_CO_ON
			#pragma shader_feature N_F_EAL_ON
			#pragma shader_feature N_F_O_ON

#ifdef N_F_O_ON

			CBUFFER_START(UnityPerMaterial)

            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform sampler2D _MaskTransparency; uniform float4 _MaskTransparency_ST;
            uniform half _Opacity;
            uniform half _TexturePatternStyle;
            uniform half _OutlineWidth;
            uniform half4 _OutlineColor;
            uniform half _LightAffectOutlineColor;
            uniform half _VertexColorRedAffectOutlineWitdh;
            uniform sampler2D _OutlineWidthControl; uniform float4 _OutlineWidthControl_ST;
            uniform half _OutlineWidthAffectedByViewDistance;
            uniform half _DynamicNoisyOutline;
            uniform half _NoisyOutlineIntensity;
			uniform half _ReduceOutlineBackFace;
			uniform half3 _OutlineOffset;
			uniform float3 _OEM;
            uniform int _OutlineExtrudeMethod;
			uniform half _OutlineZPostionInCamera;
			uniform half _FarDistanceMaxWidth;
			uniform half _TransparentThreshold;

			CBUFFER_END

#endif

			struct Attributes
            {
#ifdef N_F_O_ON
                float4 positionOS   : POSITION;
                float3 normalOS     : NORMAL;
				float4 tangentOS    : TANGENT;
                float2 uv           : TEXCOORD0;
				float4 vertexColor	: COLOR;
                UNITY_VERTEX_INPUT_INSTANCE_ID
#endif
            };

            struct Varyings
            {
#ifdef N_F_O_ON
                float2 uv                       : TEXCOORD0;
				half3  normalWS                 : TEXCOORD1;
                float4 positionWSAndFogFactor   : TEXCOORD2; 
				float4 posWorld					: TEXCOORD3;
#ifdef _MAIN_LIGHT_SHADOWS
                float4 shadowCoord              : TEXCOORD6; 
#endif
				float4 projPos					: TEXCOORD7;
				float4 vertexColor				: COLOR;
                float4 positionCS               : SV_POSITION;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
#endif
            };


			Varyings LitPassVertex(Attributes input)
            {
                Varyings output = (Varyings)0;

#ifdef N_F_O_ON

				UNITY_SETUP_INSTANCE_ID (input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
                UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				output.uv = input.uv;

                output.vertexColor = input.vertexColor;

				VertexNormalInputs vertexNormalInput = GetVertexNormalInputs(input.normalOS, input.tangentOS);
				VertexPositionInputs vertexInput = GetVertexPositionInputs(input.positionOS.xyz);

				output.normalWS = vertexNormalInput.normalWS;
                output.posWorld = mul(unity_ObjectToWorld, input.positionOS);

                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );

                half _VertexColorRedAffectOutlineWitdh_var = lerp( _OutlineWidth, (_OutlineWidth*(1.0 - output.vertexColor.r)), _VertexColorRedAffectOutlineWitdh );

                half node_1229 = distance(objPos.rgb,_WorldSpaceCameraPos);

                half4 _OutlineWidthControl_var = tex2Dlod(_OutlineWidthControl,float4(TRANSFORM_TEX(output.uv, _OutlineWidthControl),0.0,0));

                float4 node_427 = _Time;

                float node_4658_ang = node_427.g;

                float node_4658_spd = 0.002;

                float node_4658_cos = cos(node_4658_spd*node_4658_ang);

                float node_4658_sin = sin(node_4658_spd*node_4658_ang);

                float2 node_4658_piv = float2(0.5,0.5);

                half2 node_4658 = (mul(output.uv-node_4658_piv,float2x2( node_4658_cos, -node_4658_sin, node_4658_sin, node_4658_cos))+node_4658_piv);

                half2 _DynamicNoisyOutline_var = lerp( output.uv, node_4658, _DynamicNoisyOutline );

                float2 node_9863_skew = _DynamicNoisyOutline_var + 0.2127+_DynamicNoisyOutline_var.x*0.3713*_DynamicNoisyOutline_var.y;

                float2 node_9863_rnd = 4.789*sin(489.123*(node_9863_skew));

                half node_9863 = frac(node_9863_rnd.x*node_9863_rnd.y*(1+node_9863_skew.x));

				_OEM = lerp(input.normalOS, normalize(input.positionOS), _OutlineExtrudeMethod );

				output.positionCS = mul(GetWorldToHClipMatrix(), mul(GetObjectToWorldMatrix(), float4((input.positionOS.xyz + _OutlineOffset.xyz * 0.01) + _OEM*((lerp( _VertexColorRedAffectOutlineWitdh_var, ( clamp(_VertexColorRedAffectOutlineWitdh_var*node_1229, _VertexColorRedAffectOutlineWitdh_var, _FarDistanceMaxWidth) ), _OutlineWidthAffectedByViewDistance )*0.01)*_OutlineWidthControl_var.r*lerp(1.0,node_9863,_NoisyOutlineIntensity)),1) ) );
				
				#if defined(SHADER_API_GLCORE) || defined(SHADER_API_GLES) || defined(SHADER_API_GLES3)
					output.positionCS.z += _OutlineZPostionInCamera * 0.0005;
				#else
					output.positionCS.z -= _OutlineZPostionInCamera * 0.0005;
				#endif
				
                output.projPos = ComputeScreenPos (output.positionCS);

				float fogFactor = ComputeFogFactor(vertexInput.positionCS.z);

				output.positionWSAndFogFactor = float4(vertexInput.positionWS, fogFactor);

#endif

                return output;
            }

            half4 LitPassFragment(Varyings input) : SV_Target
            {

#ifdef N_F_O_ON

				UNITY_SETUP_INSTANCE_ID (input);

                float3 positionWS = input.positionWSAndFogFactor.xyz;

                Light mainLight = GetMainLight();

				half3 color = 1;

				input.normalWS = normalize(input.normalWS);

                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - input.posWorld.xyz);

				float3 normalDirection = input.normalWS;

                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );

                float2 sceneUVs = (input.projPos.xy / input.projPos.w);

                half node_1229 = distance(objPos.rgb,_WorldSpaceCameraPos);

                half2 node_9146 = (float2((sceneUVs.x * 2 - 1)*(_ScreenParams.r/_ScreenParams.g), sceneUVs.y * 2 - 1).rg*node_1229);

                half2 _TexturePatternStyle_var = lerp( input.uv, node_9146, _TexturePatternStyle );

                half4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(_TexturePatternStyle_var, _MainTex));

                half4 _MaskTransparency_var = tex2D(_MaskTransparency,TRANSFORM_TEX(input.uv, _MaskTransparency));

                half node_7861 = lerp(( smoothstep(clamp(-20,1,_TransparentThreshold),1,_MainTex_var.a) *_MaskTransparency_var.r), smoothstep(clamp(-20,1,_TransparentThreshold) , 1, _MainTex_var.a) ,_Opacity);

                clip(saturate(( 0.74 > 0.5 ? (1.0-(1.0-2.0*(0.74-0.5))*(1.0-node_7861)) : (2.0*0.74*node_7861) )) - 0.5);
                
				float oc = (1.0-dot(normalDirection, viewDirection));
                clip(smoothstep( lerp(4,1.7,_ReduceOutlineBackFace), 0, oc ) - 0.5);
				
				float3 lightColor =  mainLight.color.rgb;
                float node_3413 = 0.0;
		

#ifdef _ADDITIONAL_LIGHTS

#ifdef N_F_EAL_ON

                int additionalLightsCount = GetAdditionalLightsCount();
                for (int i = 0; i < additionalLightsCount; ++i)
                {
                    Light light = GetAdditionalLight(i, positionWS);
					lightColor += light.color * light.distanceAttenuation;
				}
#endif

#endif
                float fogFactor = input.positionWSAndFogFactor.w;

				half3 finalRGBA = lerp( _OutlineColor.rgb, lerp(float3(node_3413,node_3413,node_3413),_OutlineColor.rgb,lightColor.rgb), _LightAffectOutlineColor );

                color = MixFog(finalRGBA, fogFactor);
                return half4(color, 1);

				#else

					return 0;

#endif

            }

			ENDHLSL
        }

        Pass
        {

            Name "StandardLit"
            Tags{"LightMode" = "LightweightForward"}

            Cull [_DoubleSided]
			Blend SrcAlpha OneMinusSrcAlpha
			ZWrite [_ZWrite]

			Stencil {
            	Ref[_RefVal]
            	Comp [_Compa]
            	Pass [_Oper]
            	Fail [_Oper]
            }

            HLSLPROGRAM

            #pragma prefer_hlslcc gles
            #pragma only_renderers d3d9 d3d11 vulkan glcore gles3 gles metal xboxone ps4 wiiu switch
            #pragma target 3.0

            #pragma multi_compile _ _MAIN_LIGHT_SHADOWS
            #pragma multi_compile _ _MAIN_LIGHT_SHADOWS_CASCADE
            #pragma multi_compile _ _ADDITIONAL_LIGHTS
            #pragma multi_compile _ _ADDITIONAL_LIGHT_SHADOWS
            #pragma multi_compile _ _SHADOWS_SOFT

            #pragma multi_compile_fog
            #pragma multi_compile_instancing
            #pragma vertex LitPassVertex
            #pragma fragment LitPassFragment

            #include "Packages/com.unity.render-pipelines.lightweight/ShaderLibrary/Core.hlsl"
            #include "Packages/com.unity.render-pipelines.lightweight/ShaderLibrary/Lighting.hlsl"

			#pragma shader_feature _USETLB_ON

			#pragma shader_feature N_F_NM_ON
			#pragma shader_feature N_F_SL_ON
			#pragma shader_feature N_F_CA_ON
			#pragma shader_feature N_F_GLO_ON
			#pragma shader_feature N_F_GLOT_ON
			#pragma shader_feature N_F_SS_ON
			#pragma shader_feature N_F_SCT_ON
			#pragma shader_feature N_F_ST_ON
			#pragma shader_feature N_F_STIS_ON
			#pragma shader_feature N_F_STIAL_ON 
			#pragma shader_feature N_F_SON_ON
			#pragma shader_feature N_F_PT_ON
			#pragma shader_feature N_F_CLD_ON
			#pragma shader_feature N_F_R_ON
			#pragma shader_feature N_F_FR_ON
			#pragma shader_feature N_F_RL_ON
			#pragma shader_feature N_F_EAL_ON
			#pragma shader_feature N_F_NLASOBF_ON

			CBUFFER_START(UnityPerMaterial)

			uniform half _SelfShadowHardness;
            uniform half _SelfShadowThreshold;
            uniform half4 _HighlightColor;
            uniform half4 _SelfShadowColor;
            uniform half _SelfShadowColorPower;
            uniform half _HighlightColorPower;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform half4 _MainColor;
            uniform sampler2D _ShadowColorTexture; uniform float4 _ShadowColorTexture_ST;
            uniform half _ShadowColorTexturePower;
            uniform sampler2D _ShadowT; uniform float4 _ShadowT_ST;
            uniform half _ShadowTShadowThreshold;
            uniform half _LightFalloffAffectShadowT;
            uniform half _ShadowTLightThreshold;
            uniform half _ShadowTHardness;
            uniform half4 _ShadowTColor;
            uniform half _ShadowTColorPower;
            uniform half4 _OverallShadowColor;
            uniform half _OverallShadowColorPower;
            uniform half _Glossiness;
            uniform half _GlossSoftness;
            uniform half4 _GlossColor;
            uniform half _GlossColorPower;
            uniform sampler2D _GlossTexture; uniform float4 _GlossTexture_ST;
            uniform half _GlossTextureFollowLight;
            uniform half _GlossTextureFollowObjectRotation;
            uniform sampler2D _MaskGloss; uniform float4 _MaskGloss_ST;
            uniform sampler2D _FReflection; uniform float4 _FReflection_ST;
            uniform half _ReflectionIntensity;
            uniform sampler2D _MaskReflection; uniform float4 _MaskReflection_ST;
            uniform half _GlossTextureSoftness;
            uniform half4 _SelfLitColor;
            uniform half _SelfLitHighContrast;
            uniform half _SelfLitPower;
            uniform half _SelfLitIntensity;
            uniform sampler2D _MaskSelfLit; uniform float4 _MaskSelfLit_ST;
            uniform sampler2D _PTexture; uniform float4 _PTexture_ST;
            uniform half _PTexturePower;
            uniform half _RimLightInLight;
            uniform half _RimLightUnfill;
            uniform half4 _RimLightColor;
            uniform half _RimLightColorPower;
            uniform half _RimLightSoftness;
            uniform half _SelfShadowShadowTAtViewDirection;
            uniform half _XYZHardness;
            uniform float4 _XYZPosition;
            uniform half _SmoothObjectNormal;
            uniform half _ShowNormal;
            uniform half4 _CustomLightDirection;
            uniform half _CustomLightDirectionFollowObjectRotation;
            uniform half _CustomLightDirectionIntensity;
            uniform half _VertexColorGreenControlSelfShadowSize;
            uniform half _VertexColorBlueControlSmoothObjectNormal;
            uniform half _LightAffectRimLightColor;
            uniform sampler2D _NormalMap; uniform float4 _NormalMap_ST;
            uniform half _NormalMapIntensity;
            uniform half _UseFReflection;
            uniform half _ReflectionRoughtness;
            uniform half _GIFlatShade;
            uniform half _GIShadeThreshold;
            uniform half _GlossTextureRotate;
            uniform half _LightIntensity;
            uniform half _LightAffectShadow;
            uniform sampler2D _MaskTransparency; uniform float4 _MaskTransparency_ST;
            uniform half _Opacity;
            uniform half _TexturePatternStyle;
            uniform half _Saturation;
            uniform half _ShowInAmbientLightShadowIntensity;
            uniform half _EnvironmentalLightingIntensity;
            uniform half _ShadowTIntensity;
            uniform half _ShowInAmbientLightShadowThreshold;
            uniform half _SelfShadowIntensity;
            uniform half _SelfShadowAffectedByLightShadowStrength;
            uniform half _GlossIntensity;
			uniform half _LightFalloffSoftness;
			uniform half _DirectionalLightIntensity;
			uniform half _PointSpotlightIntensity;
			uniform half _RefMetallic;
			uniform half _TransparentThreshold;

			CBUFFER_END
            
			half3 AL_GI( float3 N ){
				return SampleSH(N);
            }
            
            half N_F_SS( half A , half B ){
            #ifdef N_F_SS_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            half3 N_F_SCT( half3 A ){
            #ifdef N_F_SCT_ON
            
            return A;
            
            #else
            
            return 1;
            
            #endif
            }
            
            half N_F_PT( half A ){
            #ifdef N_F_PT_ON
            
            return A;
            
            #else
            
            return 1;
            
            #endif
            }
            
            half3 N_F_ST( half3 A , half3 B ){
            #ifdef N_F_ST_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            half3 N_F_GLO( half3 A , half3 B ){
            #ifdef N_F_GLO_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            half3 N_F_GLOT( half A , half B ){
            #ifdef N_F_GLOT_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            half3 N_F_R( half3 A , half3 B ){
            #ifdef N_F_R_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            half3 N_F_SL( half3 A , half3 B ){
            #ifdef N_F_SL_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            half3 N_F_RL( half3 A , half3 B ){
            #ifdef N_F_RL_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            half3 N_F_SL_1( half3 A , half3 B ){
            #ifdef N_F_SL_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            half3 N_F_RL_1( half3 A , half3 B ){
            #ifdef N_F_RL_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            half3 N_F_SON( half3 A , half3 B ){
            #ifdef N_F_SON_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            half3 N_F_SON_1( half3 A ){
            #ifdef N_F_SON_ON
            
            return A;
            
            #else
            
            return 1;
            
            #endif
            }
            
            half3 N_F_CLD( half3 A , half3 B ){
            #ifdef N_F_CLD_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            float3 Ref( half3 VR , half Mip ){
				float4 skyData = SAMPLE_TEXTURECUBE_LOD(unity_SpecCube0, samplerunity_SpecCube0, VR, Mip);
				return DecodeHDREnvironment(skyData, unity_SpecCube0_HDR);
            }
            
            half3 N_F_FR( half3 A , half3 B ){
            #ifdef N_F_FR_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            half3 N_F_CA( half3 A , half3 B ){
            #ifdef N_F_CA_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            half3 N_F_STIAL( half3 A ){
            #ifdef N_F_ST_ON
            
            	#ifdef N_F_STIAL_ON
            
            	return A;
            
            	#else
            
            	return 1;
            
            	#endif
            
            #else
            
            return 1;
            
            #endif
            }
            
            half3 N_F_STIS( half3 A ){
            #ifdef N_F_ST_ON
            
            	#ifdef N_F_STIS_ON
            
            	return A;
            
            	#else
            
            	return 1;
            
            	#endif
            
            #else
            
            return 1;
            
            #endif
            }

            half C_SS(){
				return (1.0 - _MainLightShadowData.x);
            }

            struct Attributes
            {
                float4 positionOS   : POSITION;
                float3 normalOS     : NORMAL;
                float4 tangentOS    : TANGENT;
                float2 uv           : TEXCOORD0;
				float4 vertexColor	: COLOR;
                UNITY_VERTEX_INPUT_INSTANCE_ID
            };

            struct Varyings
            {
                float2 uv                       : TEXCOORD0;
                float4 positionWSAndFogFactor   : TEXCOORD2; 
                half3  normalWS                 : TEXCOORD3;
                half3  tangentWS                : TEXCOORD4;
                half3  bitangentWS              : TEXCOORD5;

#ifdef _MAIN_LIGHT_SHADOWS
                float4 shadowCoord              : TEXCOORD6; 
#endif
				float4 projPos					: TEXCOORD7;
				float4 posWorld					: TEXCOORD8;
				float4 vertexColor				: COLOR;
                float4 positionCS               : SV_POSITION;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
            };

            Varyings LitPassVertex(Attributes input)
            {
                Varyings output = (Varyings)0;

				UNITY_SETUP_INSTANCE_ID (input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
                UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

                VertexPositionInputs vertexInput = GetVertexPositionInputs(input.positionOS.xyz);

				output.positionCS = vertexInput.positionCS;

				VertexNormalInputs vertexNormalInput = GetVertexNormalInputs(input.normalOS, input.tangentOS);

				float fogFactor = ComputeFogFactor(vertexInput.positionCS.z);

                output.positionWSAndFogFactor = float4(vertexInput.positionWS, fogFactor);
				
                output.normalWS = vertexNormalInput.normalWS;
                output.tangentWS = vertexNormalInput.tangentWS;
                output.bitangentWS = vertexNormalInput.bitangentWS;

                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );

                output.posWorld = mul(unity_ObjectToWorld, input.positionOS);

                output.projPos = ComputeScreenPos (output.positionCS);
			
				output.uv = input.uv;

                output.vertexColor = input.vertexColor;

#ifdef _MAIN_LIGHT_SHADOWS

                output.shadowCoord = GetShadowCoord(vertexInput);
#endif

                return output;
            }

            half4 LitPassFragment(Varyings input, float facing : VFACE) : SV_Target
            {
				half isFrontFace = ( facing >= 0 ? 1 : 0 );

				UNITY_SETUP_INSTANCE_ID (input);

                float3 positionWS = input.positionWSAndFogFactor.xyz;

#ifdef _MAIN_LIGHT_SHADOWS

                Light mainLight = GetMainLight(input.shadowCoord);
#else
                Light mainLight = GetMainLight();
#endif

				half3 color = 0;

				float3 A_L_O = 0;

				float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );

                input.normalWS = normalize(input.normalWS);

                float3x3 tangentTransform = float3x3( input.tangentWS, input.bitangentWS, input.normalWS);

                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - input.posWorld.xyz);

				#ifdef N_F_NM_ON
					half3 _NormalMap_var = UnpackNormal(tex2D(_NormalMap,TRANSFORM_TEX(i.uv0, _NormalMap)));
					float3 normalLocal = lerp(half3(0,0,1),_NormalMap_var.rgb,_NormalMapIntensity);
				#else
					float3 normalLocal = half3(0,0,1);
				#endif

                float3 normalDirection = normalize(mul( normalLocal, tangentTransform ));

                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );

                float2 sceneUVs = (input.projPos.xy / input.projPos.w);

                 half node_1229 = distance(objPos.rgb,_WorldSpaceCameraPos);

                half2 node_9146 = (float2((sceneUVs.x * 2 - 1)*(_ScreenParams.r/_ScreenParams.g), sceneUVs.y * 2 - 1).rg*node_1229);

                half2 _TexturePatternStyle_var = lerp( input.uv, node_9146, _TexturePatternStyle );

                half4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(_TexturePatternStyle_var, _MainTex));

                half4 _MaskTransparency_var = tex2D(_MaskTransparency,TRANSFORM_TEX(input.uv, _MaskTransparency));

                half node_7861 = lerp(( smoothstep(clamp(-20,1,_TransparentThreshold),1,_MainTex_var.a) *_MaskTransparency_var.r), smoothstep(clamp(-20,1,_TransparentThreshold) , 1, _MainTex_var.a) ,_Opacity);

                float3 lightDirection = mainLight.direction;

				#ifdef N_F_NLASOBF_ON
					float3 lightColor = lerp(0,mainLight.color.rgb,isFrontFace);
				#else
					float3 lightColor = mainLight.color.rgb;
				#endif

                float3 halfDirection = normalize(viewDirection+lightDirection);

                float attenuation = 1;

                half3 node_7946 = (_MainTex_var.rgb*_MainColor.rgb);

                float node_3622 = 0.0;

				float node_491 = 1.0;

                float3 node_76 = mul( unity_WorldToObject, float4((input.posWorld.rgb-objPos.rgb),0) ).xyz.rgb.rgb;

                half3 node_5206 = lerp(normalDirection,mul( unity_ObjectToWorld, float4(float3((_XYZPosition.r+(_XYZHardness*node_76.r)),(_XYZPosition.g+(_XYZHardness*node_76.g)),(_XYZPosition.b+(_XYZHardness*node_76.b))),0) ).xyz.rgb,lerp( _SmoothObjectNormal, (_SmoothObjectNormal*(1.0 - input.vertexColor.b)), _VertexColorBlueControlSmoothObjectNormal ));
                
				half3 node_3134 = N_F_SON( node_5206 , normalDirection );

                float node_2183 = 0;

                float node_8383 = 0.01;

                half3 node_9546 = (AL_GI( lerp(float3(node_3622,node_3622,node_3622),float3(node_491,node_491,node_491),lerp( (node_3134*_GIShadeThreshold), float3(smoothstep( float2(node_2183,node_2183), float2(node_8383,node_8383), (node_3134.rb*_GIShadeThreshold) ),0.0), _GIFlatShade )) )*_EnvironmentalLightingIntensity);
                
				half4 _MaskSelfLit_var = tex2D(_MaskSelfLit,TRANSFORM_TEX(input.uv, _MaskSelfLit));

                float node_3456 = 1.0;

                half node_4736 = 1.0;

                half4 _ShadowColorTexture_var = tex2D(_ShadowColorTexture,TRANSFORM_TEX(input.uv, _ShadowColorTexture));

                half3 node_9600 = N_F_SCT( lerp(_ShadowColorTexture_var.rgb,(_ShadowColorTexture_var.rgb*_ShadowColorTexture_var.rgb),_ShadowColorTexturePower) );

                half4 _PTexture_var = tex2D(_PTexture,TRANSFORM_TEX(node_9146, _PTexture));

                half node_8910 = N_F_PT( lerp((1.0 - _PTexturePower),1.0,_PTexture_var.r) );

                half3 node_7102 = (_OverallShadowColor.rgb*_OverallShadowColorPower);

                half3 node_338 = ((_ShadowTColor.rgb*_ShadowTColorPower)*node_9600*node_8910*node_7102);

                float node_7121 = 1.0;

                float node_6045 = lerp(0.0,0.22,_ShadowTHardness);

                float node_3187 = 0.22;

                half4 _ShadowT_var = tex2D(_ShadowT,TRANSFORM_TEX(input.uv, _ShadowT));

                float3 node_5343 = lerp(float3(node_4736,node_4736,node_4736),lerp(node_338,float3(node_7121,node_7121,node_7121),smoothstep( node_6045, node_3187, (_ShowInAmbientLightShadowThreshold*_ShadowT_var.r) )),_ShadowTIntensity);
                
				float node_4824 = 1.0;

                float4 node_6613_k = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);

                float4 node_6613_p = lerp(float4(float4(lightColor.rgb,0.0).zy, node_6613_k.wz), float4(float4(lightColor.rgb,0.0).yz, node_6613_k.xy), step(float4(lightColor.rgb,0.0).z, float4(lightColor.rgb,0.0).y));

                float4 node_6613_q = lerp(float4(node_6613_p.xyw, float4(lightColor.rgb,0.0).x), float4(float4(lightColor.rgb,0.0).x, node_6613_p.yzx), step(node_6613_p.x, float4(lightColor.rgb,0.0).x));

                float node_6613_d = node_6613_q.x - min(node_6613_q.w, node_6613_q.y);

                float node_6613_e = 1.0e-10;

                half3 node_6613 = float3(abs(node_6613_q.z + (node_6613_q.w - node_6613_q.y) / (6.0 * node_6613_d + node_6613_e)), node_6613_d / (node_6613_q.x + node_6613_e), node_6613_q.x);

                half node_938 = saturate(node_6613.b);

                half3 node_1860 = ((_SelfShadowColor.rgb*_SelfShadowColorPower)*node_7102*node_9600*node_8910);

                half3 node_6694 = (_LightIntensity+lightColor.rgb);

                half3 node_2779 = (_HighlightColor.rgb*_HighlightColorPower+_DirectionalLightIntensity);

                float node_49 = 0.0;

                float node_5992_ang = _GlossTextureRotate;

                float node_5992_spd = 1.0;

                float node_5992_cos = cos(node_5992_spd*node_5992_ang);

                float node_5992_sin = sin(node_5992_spd*node_5992_ang);

                float2 node_5992_piv = float2(0.5,0.5);

                half3 node_2832 = reflect(lerp(viewDirection,halfDirection,_GlossTextureFollowLight),normalDirection);

                half2 node_9280 = lerp( node_2832, mul( unity_WorldToObject, float4(node_2832,0) ).xyz.rgb, _GlossTextureFollowObjectRotation ).rg;

                half2 node_5992 = (mul(float2((-1*node_9280.r),node_9280.g)-node_5992_piv,float2x2( node_5992_cos, -node_5992_sin, node_5992_sin, node_5992_cos))+node_5992_piv);

                half2 node_8759 = (node_5992*0.5+0.5);

                half4 _GlossTexture_var = tex2Dlod(_GlossTexture,float4(TRANSFORM_TEX(node_8759, _GlossTexture),0.0,_GlossTextureSoftness));

                half4 _MaskGloss_var = tex2D(_MaskGloss,TRANSFORM_TEX(input.uv, _MaskGloss));

                half3 node_2687 = N_F_GLO( lerp(node_2779,lerp(node_2779,(_GlossColor.rgb*_GlossColorPower),lerp(float3(node_49,node_49,node_49),N_F_GLOT( _GlossTexture_var.r , smoothstep( 0.1, lerp(0.1,1.0,_GlossSoftness), pow(max(0,dot(halfDirection,normalDirection)),exp2(lerp(-2,15,_Glossiness))) ) ),_GlossIntensity)),_MaskGloss_var.r) , node_2779 );
                
				float node_4353 = 0.0;
                
				float node_3687 = 0.0;

                half3 node_4858 = lerp(float3(node_4353,node_4353,node_4353),(lerp( _RimLightColor.rgb, lerp(float3(node_3687,node_3687,node_3687),_RimLightColor.rgb,lightColor.rgb), _LightAffectRimLightColor )*_RimLightColorPower),smoothstep( 1.71, lerp(1.70,0.29,_RimLightSoftness), pow(abs( 1.0-max(0,dot(normalDirection, viewDirection)) ),(1.0 - _RimLightUnfill)) ));
                
				half3 node_2500 = (N_F_RL_1( lerp(node_2687,(node_2687+node_4858),_RimLightInLight) , node_2687 )*N_F_SON_1( lerp( 1.0, node_5206, _ShowNormal ) )*lightColor.rgb);
                
				half node_573 = 0.5*dot(lerp( N_F_CLD( lerp(lightDirection,lerp( _CustomLightDirection.rgb, mul( unity_ObjectToWorld, float4(_CustomLightDirection.rgb,0) ).xyz.rgb, _CustomLightDirectionFollowObjectRotation ),_CustomLightDirectionIntensity) , lightDirection ), viewDirection, _SelfShadowShadowTAtViewDirection ),node_3134)+0.5;
                
				half node_5901 = 1.0;
                
				half node_9545 = smoothstep( lerp(0.3,1.0,_SelfShadowHardness), 1.0, (node_573*lerp(7,lerp( _SelfShadowThreshold, (_SelfShadowThreshold*(1.0 - input.vertexColor.g)), _VertexColorGreenControlSelfShadowSize ),_SelfShadowThreshold)) );
                
				half3 node_2388 = (node_7946*lerp((lerp(node_1860,(node_1860+node_6694),_LightAffectShadow)*node_938*N_F_STIS( lerp(1,node_5343,_ShowInAmbientLightShadowIntensity) )),N_F_ST( lerp((lerp(node_338,(node_338+node_6694),_LightAffectShadow)*node_938),node_2500,lerp(node_4736,smoothstep( node_6045, node_3187, ((_ShadowT_var.r*(1.0 - _ShadowTShadowThreshold))*(lerp( node_573, (attenuation*node_573), _LightFalloffAffectShadowT )*_ShadowTLightThreshold*0.01)) ),_ShadowTIntensity)) , node_2500 ),N_F_SS( lerp(node_5901,(lerp( node_9545, lerp(node_9545,node_5901,C_SS()), _SelfShadowAffectedByLightShadowStrength )*attenuation),_SelfShadowIntensity) , lerp(node_5901,attenuation,_SelfShadowIntensity) )));
                
				float3 node_9694 = Ref( viewReflectDirection , _ReflectionRoughtness );
                
				half2 node_8431 = reflect(viewDirection,normalDirection).rg;

                half2 node_4207 = (float2(node_8431.r,(-1*node_8431.g))*0.5+0.5);

                half4 _FReflection_var = tex2Dlod(_FReflection,float4(TRANSFORM_TEX(node_4207, _FReflection),0.0,_ReflectionRoughtness));

                half4 _MaskReflection_var = tex2D(_MaskReflection,TRANSFORM_TEX(input.uv, _MaskReflection));

                half3 node_2704 = N_F_R( lerp(node_2388,lerp(node_2388,N_F_FR( lerp( node_9694, _FReflection_var.rgb, _UseFReflection ) , node_9694 )  * lerp( 1, (9 * (node_7946 - (9 * 0.005) ) ) , _RefMetallic ) ,_MaskReflection_var.r),_ReflectionIntensity) , node_2388 );

                half3 node_7395 = N_F_SL_1( lerp(node_2704,lerp(node_2704,node_7946,_MaskSelfLit_var.r),_SelfLitIntensity) , node_2704 );

                half3 node_5922 = ((node_7946*N_F_SL( lerp(node_9546,lerp(node_9546,((_SelfLitColor.rgb*node_7946*lerp( 1.0, node_7946, _SelfLitHighContrast ))*_SelfLitPower),_MaskSelfLit_var.r),_SelfLitIntensity) , node_9546 )*N_F_STIAL( lerp(lerp(float3(node_3456,node_3456,node_3456),node_5343,_ShowInAmbientLightShadowIntensity),float3(node_4824,node_4824,node_4824),clamp((node_938*8.0),0,1)) ))+N_F_RL( lerp((node_7395+node_4858),node_7395,_RimLightInLight) , node_7395 ));
      
				float3 main_light_output = N_F_CA( lerp(node_5922,dot(node_5922,float3(0.3,0.59,0.11)),(1.0 - _Saturation)) , node_5922 );
               

#ifdef _ADDITIONAL_LIGHTS

#ifdef N_F_EAL_ON

                int additionalLightsCount = GetAdditionalLightsCount();

                for (int i = 0; i < additionalLightsCount; ++i)
                {
                    Light light = GetAdditionalLight(i, positionWS);

                float3 lightDirection = light.direction;

				#ifdef N_F_NLASOBF_ON
					float3 lightColor = lerp(0,light.color.rgb,isFrontFace);
				#else
					float3 lightColor = light.color.rgb;
				#endif

                float3 halfDirection = normalize(viewDirection+lightDirection);

				half attenuation = 1; 
				half lightfos = smoothstep(0, _LightFalloffSoftness ,light.distanceAttenuation);

				float4 node_6613_k = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);

                float4 node_6613_p = lerp(float4(float4(lightColor.rgb,0.0).zy, node_6613_k.wz), float4(float4(lightColor.rgb,0.0).yz, node_6613_k.xy), step(float4(lightColor.rgb,0.0).z, float4(lightColor.rgb,0.0).y));

                float4 node_6613_q = lerp(float4(node_6613_p.xyw, float4(lightColor.rgb,0.0).x), float4(float4(lightColor.rgb,0.0).x, node_6613_p.yzx), step(node_6613_p.x, float4(lightColor.rgb,0.0).x));

                float node_6613_d = node_6613_q.x - min(node_6613_q.w, node_6613_q.y);

                float node_6613_e = 1.0e-10;

                half3 node_6613 = float3(abs(node_6613_q.z + (node_6613_q.w - node_6613_q.y) / (6.0 * node_6613_d + node_6613_e)), node_6613_d / (node_6613_q.x + node_6613_e), node_6613_q.x);;

                half node_938 = saturate(node_6613.b);

                half3 node_6694 = (_LightIntensity+lightColor.rgb);

                half3 node_2779 = (_HighlightColor.rgb*_HighlightColorPower+_PointSpotlightIntensity);

                half3 node_2832 = reflect(lerp(viewDirection,halfDirection,_GlossTextureFollowLight),normalDirection);

                half2 node_9280 = lerp( node_2832, mul( unity_WorldToObject, float4(node_2832,0) ).xyz.rgb, _GlossTextureFollowObjectRotation ).rg;

                half2 node_5992 = (mul(float2((-1*node_9280.r),node_9280.g)-node_5992_piv,float2x2( node_5992_cos, -node_5992_sin, node_5992_sin, node_5992_cos))+node_5992_piv);

				half2 node_8759 = (node_5992*0.5+0.5);

                half4 _GlossTexture_var = tex2Dlod(_GlossTexture,float4(TRANSFORM_TEX(node_8759, _GlossTexture),0.0,_GlossTextureSoftness));

                half3 node_2687 = N_F_GLO( lerp(node_2779,lerp(node_2779,(_GlossColor.rgb*_GlossColorPower),lerp(float3(node_49,node_49,node_49),N_F_GLOT( _GlossTexture_var.r , smoothstep( 0.1, lerp(0.1,1.0,_GlossSoftness), pow(max(0,dot(halfDirection,normalDirection)),exp2(lerp(-2,15,_Glossiness))) ) ),_GlossIntensity)),_MaskGloss_var.r) , node_2779 );

				half3 node_4858 = lerp(float3(node_4353,node_4353,node_4353),(lerp( _RimLightColor.rgb, lerp(float3(node_3687,node_3687,node_3687),_RimLightColor.rgb,lightColor.rgb), _LightAffectRimLightColor )*_RimLightColorPower),smoothstep( 1.71, lerp(1.70,0.29,_RimLightSoftness), pow(abs (1.0-max(0,dot(normalDirection, viewDirection)) ),(1.0 - _RimLightUnfill)) ));

                half3 node_2500 = (N_F_RL_1( lerp(node_2687,(node_2687+node_4858),_RimLightInLight) , node_2687 )*N_F_SON_1( lerp( 1.0, node_5206, _ShowNormal ) )*lightColor.rgb);
                
				half node_573 = 0.5*dot(lerp( N_F_CLD( lerp(lightDirection,lerp( _CustomLightDirection.rgb, mul( unity_ObjectToWorld, float4(_CustomLightDirection.rgb,0) ).xyz.rgb, _CustomLightDirectionFollowObjectRotation ),_CustomLightDirectionIntensity) , lightDirection ), viewDirection, _SelfShadowShadowTAtViewDirection ),node_3134)+0.5;
                
				half node_9545 = smoothstep( lerp(0.3,1.0,_SelfShadowHardness), 1.0, (node_573*lerp(7,lerp( _SelfShadowThreshold, (_SelfShadowThreshold*(1.0 - input.vertexColor.g)), _VertexColorGreenControlSelfShadowSize ),_SelfShadowThreshold)) );
                
				half3 node_2388 = (node_7946*lerp((lerp(node_1860,(node_1860+node_6694),_LightAffectShadow)*node_938*N_F_STIS( lerp(1,node_5343,_ShowInAmbientLightShadowIntensity) )),N_F_ST( lerp((lerp(node_338,(node_338+node_6694),_LightAffectShadow)*node_938),node_2500,lerp(node_4736,smoothstep( node_6045, node_3187, ((_ShadowT_var.r*(1.0 - _ShadowTShadowThreshold))*(lerp( node_573, (lightfos*node_573), _LightFalloffAffectShadowT )*_ShadowTLightThreshold*0.01)) ),_ShadowTIntensity)) , node_2500 ),N_F_SS( lerp(node_5901,(lerp( node_9545, lerp(node_9545,node_5901, (1.0 - _AdditionalShadowStrength[i]) ), _SelfShadowAffectedByLightShadowStrength )*attenuation),_SelfShadowIntensity) , lerp(node_5901,attenuation,_SelfShadowIntensity) ))*lightfos);
                
			    half3 node_2704 = N_F_R( lerp(node_2388,lerp(node_2388,N_F_FR( lerp( node_9694, _FReflection_var.rgb, _UseFReflection ) , node_9694 )  * lerp(1,(9 * (node_7946 - (9 * 0.005) ) ) , _RefMetallic) ,_MaskReflection_var.r)*lightfos,_ReflectionIntensity) , node_2388 );
               
			    half3 node_7395 = N_F_SL_1( lerp(node_2704,lerp(node_2704,node_7946,_MaskSelfLit_var.r),_SelfLitIntensity) , node_2704 );
                
				half3 node_5922 = ((node_7946*N_F_SL( lerp(0,lerp(0,((_SelfLitColor.rgb*node_7946*lerp( 1.0, node_7946, _SelfLitHighContrast ))*_SelfLitPower),_MaskSelfLit_var.r),_SelfLitIntensity) , 0 )*N_F_STIAL( lerp(lerp(float3(node_3456,node_3456,node_3456),node_5343,_ShowInAmbientLightShadowIntensity),float3(node_4824,node_4824,node_4824),clamp((node_938*8.0),0,1)) ))+N_F_RL( lerp((node_7395+node_4858)*lightfos,node_7395,_RimLightInLight) , node_7395 ));

				float3 add_light_output = N_F_CA( lerp(node_5922,dot(node_5922,float3(0.3,0.59,0.11)),(1.0 - _Saturation)) , node_5922 );

				#ifdef _USETLB_ON
					A_L_O = add_light_output + A_L_O;
				#else
					A_L_O = max (add_light_output,A_L_O);
				#endif

                }
#endif

#endif
				#ifdef _USETLB_ON
					color = main_light_output + A_L_O;
				#else
					color = max (main_light_output,A_L_O);
				#endif

                float fogFactor = input.positionWSAndFogFactor.w;

                color = MixFog(color, fogFactor);
                return half4(color, node_7861);

            }

            ENDHLSL

        }

        Pass
        {
            Name "ShadowCaster"
            Tags{"LightMode" = "ShadowCaster"}

            Cull Off

            HLSLPROGRAM
            #pragma prefer_hlslcc gles
            #pragma only_renderers d3d9 d3d11 vulkan glcore gles3 gles metal xboxone ps4 wiiu switch 
            #pragma target 3.0

            #pragma multi_compile_instancing

            #pragma vertex ShadowPassVertex
            #pragma fragment ShadowPassFragment

			#include "Packages/com.unity.render-pipelines.lightweight/ShaderLibrary/Core.hlsl"

			CBUFFER_START(UnityPerMaterial)

            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform sampler2D _MaskTransparency; uniform float4 _MaskTransparency_ST;
            uniform half _Opacity;
            uniform half _TexturePatternStyle;
			uniform sampler3D _DitherMaskLOD;
			uniform half _TransparentThreshold;

			CBUFFER_END

			float4 _ShadowBias;
			float3 _LightDirection;

			struct Attributes
			{
				float4 positionOS   : POSITION;
				float3 normalOS     : NORMAL;
				float2 texcoord     : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct Varyings
			{
				float2 uv           : TEXCOORD0;
				float4 positionCS   : SV_POSITION;
				float4 projPos		: TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			float4 GetShadowPositionHClip(Attributes input)
			{
				float3 positionWS = TransformObjectToWorld(input.positionOS.xyz);
				float3 normalWS = TransformObjectToWorldDir(input.normalOS);

				float invNdotL = 1.0 - saturate(dot(_LightDirection, normalWS));
				float scale = invNdotL * _ShadowBias.y;

				positionWS = _LightDirection * _ShadowBias.xxx + positionWS;
				positionWS = normalWS * scale.xxx + positionWS;
				float4 positionCS = TransformWorldToHClip(positionWS);

			#if UNITY_REVERSED_Z
				positionCS.z = min(positionCS.z, positionCS.w * UNITY_NEAR_CLIP_VALUE);
			#else
				positionCS.z = max(positionCS.z, positionCS.w * UNITY_NEAR_CLIP_VALUE);
			#endif

			return positionCS;

			}

			Varyings ShadowPassVertex(Attributes input)
			{
				Varyings output = (Varyings)0;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
                UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				output.uv = input.texcoord;

				float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );

				VertexPositionInputs vertexInput = GetVertexPositionInputs(input.positionOS.xyz);

                output.positionCS = vertexInput.positionCS;

                output.projPos = ComputeScreenPos (output.positionCS);

				output.positionCS = GetShadowPositionHClip(input);

				return output;

			}

			half4 ShadowPassFragment(Varyings input) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(input);

                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );

                float2 sceneUVs = (input.projPos.xy / input.projPos.w);

                half node_1229 = distance(objPos.rgb,_WorldSpaceCameraPos);

                half2 node_9146 = (float2((sceneUVs.x * 2 - 1)*(_ScreenParams.r/_ScreenParams.g), sceneUVs.y * 2 - 1).rg*node_1229);

                half2 _TexturePatternStyle_var = lerp( input.uv, node_9146, _TexturePatternStyle );

                half4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(_TexturePatternStyle_var, _MainTex));

                half4 _MaskTransparency_var = tex2D(_MaskTransparency,TRANSFORM_TEX(input.uv, _MaskTransparency));

                half node_7861 = lerp(( smoothstep(clamp(-20,1,_TransparentThreshold),1,_MainTex_var.a) *_MaskTransparency_var.r), smoothstep(clamp(-20,1,_TransparentThreshold) , 1, _MainTex_var.a) ,_Opacity);

				float dither = tex3D(_DitherMaskLOD, float3(input.positionCS.xy * 0.25, node_7861 * 0.99)).a;

				clip(saturate(( 0.74 > 0.5 ? (1.0-(1.0-2.0*(0.74-0.5))*(1.0-dither)) : (2.0*0.74*dither) )) - 0.5);

				return 0;
			}

            ENDHLSL
        }

		Pass
        {
            Name "DepthOnly"
            Tags{"LightMode" = "DepthOnly"}

            Cull [_DoubleSided]

            HLSLPROGRAM

            #pragma prefer_hlslcc gles
            #pragma only_renderers d3d9 d3d11 vulkan glcore gles3 gles metal xboxone ps4 wiiu switch 
            #pragma target 3.0

            #pragma vertex DepthOnlyVertex
            #pragma fragment DepthOnlyFragment

            #pragma multi_compile_instancing

			#include "Packages/com.unity.render-pipelines.lightweight/ShaderLibrary/Core.hlsl"

			struct Attributes
			{
				float4 position     : POSITION;
				float2 texcoord     : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct Varyings
			{
				float2 uv           : TEXCOORD0;
				float4 positionCS   : SV_POSITION;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			Varyings DepthOnlyVertex(Attributes input)
			{
				Varyings output = (Varyings)0;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				output.positionCS = TransformObjectToHClip(input.position.xyz);
				return output;
			}

			half4 DepthOnlyFragment(Varyings input) : SV_TARGET
			{
				return 0;
			}


            ENDHLSL
        }

    }

    FallBack "Hidden/InternalErrorShader"

    CustomEditor "RealToonShaderGUI_RP"
}