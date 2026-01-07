void main()
{
    vec2 texSize = textureSize(InputTexture, 0);
    vec2 uv = TexCoord;
    
    vec4 src = texture(InputTexture, TexCoord);
    vec4 c = vec4(src.rgb, 1.0);
    
    vec4 flareAccum = vec4(0.0);
    int totalSamples = 0;
    int numSamples = int(samples);
    
    if (numSamples <= 0) numSamples = 1;
    if (numSamples > 32) numSamples = 32;
    
    float size = elem0_size;
    vec3 elem0_tint = vec3(elem0_tint_r, elem0_tint_g, elem0_tint_b);
    float intensity0 = elem0_intensity;
    
    if (intensity0 > 0.01)
    {
        for (int i = 0; i < numSamples; i++)
        {
            float sampleSize = size + distance * float(i) * elem0_scale;
            vec2 tc = TexCoord;
            
            if (elem0_scale > 0.0)
                tc = (tc - 0.5) * (1.0 - sampleSize) + 0.5;
            else
                tc = (tc - 0.5) * sampleSize + 0.5;
            
            vec4 smp = texture(InputTexture, tc);
            flareAccum += vec4(smp.rgb * elem0_tint * intensity0, 1.0);
            totalSamples++;
        }
    }
    
    size = elem1_size;
    vec3 elem1_tint = vec3(elem1_tint_r, elem1_tint_g, elem1_tint_b);
    for (int i = 0; i < numSamples; i++)
    {
        float sampleSize = size + distance * float(i) * elem1_scale;
        vec2 tc = TexCoord;
        
        if (elem1_scale > 0.0)
            tc = (tc - 0.5) * (1.0 - sampleSize) + 0.5;
        else
            tc = (tc - 0.5) * sampleSize + 0.5;
        
        vec4 smp = texture(InputTexture, tc);
        flareAccum += vec4(smp.rgb * elem1_tint * elem1_intensity, 1.0);
        totalSamples++;
    }
    
    size = elem2_size;
    vec3 elem2_tint = vec3(elem2_tint_r, elem2_tint_g, elem2_tint_b);
    for (int i = 0; i < numSamples; i++)
    {
        float sampleSize = size + distance * float(i) * elem2_scale;
        vec2 tc = TexCoord;
        
        if (elem2_scale > 0.0)
            tc = (tc - 0.5) * (1.0 - sampleSize) + 0.5;
        else
            tc = (tc - 0.5) * sampleSize + 0.5;
        
        vec4 smp = texture(InputTexture, tc);
        flareAccum += vec4(smp.rgb * elem2_tint * elem2_intensity, 1.0);
        totalSamples++;
    }
    
    size = elem3_size;
    vec3 elem3_tint = vec3(elem3_tint_r, elem3_tint_g, elem3_tint_b);
    for (int i = 0; i < numSamples; i++)
    {
        float sampleSize = size + distance * float(i) * elem3_scale;
        vec2 tc = TexCoord;
        
        if (elem3_scale > 0.0)
            tc = (tc - 0.5) * (1.0 - sampleSize) + 0.5;
        else
            tc = (tc - 0.5) * sampleSize + 0.5;
        
        vec4 smp = texture(InputTexture, tc);
        flareAccum += vec4(smp.rgb * elem3_tint * elem3_intensity, 1.0);
        totalSamples++;
    }
    
    size = elem4_size;
    vec3 elem4_tint = vec3(elem4_tint_r, elem4_tint_g, elem4_tint_b);
    for (int i = 0; i < numSamples; i++)
    {
        float sampleSize = size + distance * float(i) * elem4_scale;
        vec2 tc = TexCoord;
        
        if (elem4_scale > 0.0)
            tc = (tc - 0.5) * (1.0 - sampleSize) + 0.5;
        else
            tc = (tc - 0.5) * sampleSize + 0.5;
        
        vec4 smp = texture(InputTexture, tc);
        flareAccum += vec4(smp.rgb * elem4_tint * elem4_intensity, 1.0);
        totalSamples++;
    }
    
    size = elem5_size;
    vec3 elem5_tint = vec3(elem5_tint_r, elem5_tint_g, elem5_tint_b);
    for (int i = 0; i < numSamples; i++)
    {
        float sampleSize = size + distance * float(i) * elem5_scale;
        vec2 tc = TexCoord;
        
        if (elem5_scale > 0.0)
            tc = (tc - 0.5) * (1.0 - sampleSize) + 0.5;
        else
            tc = (tc - 0.5) * sampleSize + 0.5;
        
        vec4 smp = texture(InputTexture, tc);
        flareAccum += vec4(smp.rgb * elem5_tint * elem5_intensity, 1.0);
        totalSamples++;
    }
    
    flareAccum /= float(totalSamples);
    flareAccum -= threshold;
    flareAccum = clamp(flareAccum, 0.0, 1000000.0);
    
    vec4 chromaticFlare = vec4(0.0);
    vec2 toCenter = TexCoord - 0.5;
    float dist = length(toCenter);
    
    if (dist > 0.01)
    {
        vec2 direction = normalize(toCenter);
        float aberration = distance * chromaticStrength;
        
        float r = texture(InputTexture, TexCoord + direction * aberration * 0.002).r;
        float g = texture(InputTexture, TexCoord).g;
        float b = texture(InputTexture, TexCoord - direction * aberration * 0.002).b;
        
        vec4 chromatic = vec4(r, g, b, 1.0);
        chromatic -= threshold;
        chromatic = clamp(chromatic, 0.0, 1000000.0);
        
        float chromaticStrengthFinal = smoothstep(0.1, 0.7, dist) * chromaticBlend;
        chromaticFlare = chromatic * chromaticStrengthFinal;
    }
    
    vec4 finalFlare = (flareAccum * 0.7 + chromaticFlare * 0.3) * vec4(0.8, 0.8, 1.0, 1.0);
    FragColor = vec4(c.rgb + finalFlare.rgb * amount, c.a);
}

