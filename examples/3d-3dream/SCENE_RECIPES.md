# 3DreamEngine scene recipes

These recipes intentionally build on the upstream public API shown in its README. Confirm the API and asset paths against the exact revision you vendor before use.

## 1. Clean PBR showcase

Start from `main.lua` and load a model with properly licensed PBR maps. The upstream engine documents albedo, normal, roughness, metallic, AO and emission maps. Prefer real maps over arbitrary color-only materials. Begin with one light and one shadow, then add bloom/reflections/SSAO one at a time.

## 2. Anime / toon art direction

A convincing anime look is a coordinated material and lighting setup, not just an outline:
- Use deliberate palette groups and clean, readable silhouettes.
- Author separate skin, hair, eye, cloth and environment materials.
- Use controlled shadow bands and highlights where the pinned renderer exposes compatible material/shader hooks.
- Add rim lighting and outlines as optional effects; avoid heavy outlines on every object.
- Keep face and eye highlights as authored material details so they remain stable under mobile lighting.
- Do not assume Unity Shader Graph, URP or HDRP shaders can be loaded directly by LÖVE/3DreamEngine.

No toon shader is automatically installed by this recipe. Implement and validate a material shader against the selected 3DreamEngine revision before advertising it as supported.

## 3. Cinematic environment

Use licensed high-resolution meshes and physically based textures, a suitable HDRI/sky, directional sun, fog and shadow cascades where supported. Tune exposure and bloom together to avoid washed-out highlights. Use reflections and water only where the mobile GPU budget permits.

## 4. Mobile fallback

- Disable expensive post effects first when frame time rises.
- Reduce shadow map size and number of shadow-casting lights.
- Limit transparent particles and overdraw.
- Use compressed textures and appropriately sized mipmapped assets.
- Stream/load large assets carefully and release scene resources when leaving a scene.
- Keep a visible FPS/frame-time diagnostic in performance demos.

## Known dependency requirements

The library and its example assets must be installed separately. See the upstream project and documentation:
- https://github.com/3dreamengine/3DreamEngine
- https://3dreamengine.github.io/3DreamEngine/

A sample that loads on desktop is not proof that its shaders, assets or memory footprint are Android-compatible.
