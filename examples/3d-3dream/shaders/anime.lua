-- Anime/toon material shader for 3DreamEngine.
-- Register with dream:registerShader("examples/3d-3dream/shaders/anime", "anime")
-- Then set pixelShader = "anime" in a 3DreamEngine material definition.
-- This quantizes the albedo palette; it is a stylized material pass, not a
-- replacement for the engine's physically based lighting or a screen-space outline pass.
local sh = {}

sh.type = "pixel"
sh.meshFormat = "simple"

function sh:buildDefines(mat, shadow)
    return [[
        varying vec3 VaryingMaterial;
        #ifdef VERTEX
        attribute vec4 VertexMaterial;
        #endif
    ]]
end

function sh:buildPixel(mat)
    return [[
        vec3 animeColor = VaryingColor.rgb;
        // Four restrained color bands give the material a clean cel-art palette.
        animeColor = floor(animeColor * 4.0 + 0.5) / 4.0;
        albedo = animeColor;
        alpha = VaryingColor.a;
        roughness = max(VaryingMaterial.x, 0.72);
        metallic = 0.0;
        emission = vec3(0.0);
    ]]
end

function sh:buildVertex(mat)
    return [[
        VaryingMaterial = VertexMaterial.xyz;
    ]]
end

return sh
