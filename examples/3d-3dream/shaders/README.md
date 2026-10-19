# Anime / toon material starter

This folder adds a small 3DreamEngine pixel-shader extension that quantizes the material albedo into a restrained cel-art palette. It intentionally keeps 3DreamEngine's lighting pipeline intact, so shadows and the engine's other render passes can continue to contribute.

## Register the shader

After `dream:init()` in `main.lua`:

```lua
dream:registerShader("examples/3d-3dream/shaders/anime", "anime")
```

Use `pixelShader = "anime"` in a material Lua file loaded by 3DreamEngine. The shader expects the engine's `simple` mesh format, including its `VertexMaterial` attribute.

## Current scope

- Included: albedo palette quantization and a high-roughness, non-metallic anime-material baseline.
- Not included: inverted-hull outlines, face-shadow masks, hair anisotropy, eye highlights, temporal anti-aliasing, or a full anime post-processing pipeline.
- Keep the default PBR shader for realistic materials; use the anime shader only on materials authored for the simple mesh format.
- Shader compilation and visual output must be validated against the exact 3DreamEngine revision and GPU. Do not treat source addition as proof of Android compatibility.

For high-end anime realism, pair this material pass with authored normals, high-quality skin/hair/eye textures, controlled key/fill/rim lights, contact shadows, a suitable environment, and a high-detail rigged GLB. Use the mobile tier to reduce shadow resolution and post effects.
