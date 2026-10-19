# LÖVE Revival — 3D, Anime and Photoreal Rendering Roadmap

This fork keeps LÖVE's core runtime stable while making 3DreamEngine-based 3D projects easier to start, style, profile and ship on Android.

## Upstream relationship and licensing

- 3DreamEngine upstream: https://github.com/3dreamengine/3DreamEngine
- Upstream documentation: https://3dreamengine.github.io/3DreamEngine/
- 3DreamEngine is a separate Lua library, not part of LÖVE core. Integrate a reviewed, pinned revision as a project dependency; do not blindly copy upstream files or assets.
- Preserve upstream copyright and license notices when distributing dependencies. Check every model, texture, font and HDRI license independently.
- This repository currently provides integration examples and a roadmap; it does not claim to contain the complete upstream engine.

## Target visual quality

### Stylized / anime
- Tunable ramp-based toon lighting with configurable shadow bands and highlight threshold.
- Optional rim light, outline pass, controlled specular response and color grading.
- Anime material presets: skin, hair, cloth, eye highlights, cel-shaded environment and emissive accents.
- Keep outline width resolution-aware and provide a low-cost mobile mode.

### PBR / cinematic
- Use 3DreamEngine's supported metalness workflow: albedo, normal, roughness, metallic, AO and emission.
- Enable HDR/bloom, reflections/refractions, SSAO, fog, god rays, dynamic sky and shadows only after checking support and frame cost on the target GPU.
- High-quality water should use the engine's supported water/reflection shaders and correct scene setup, not a fake flat-color plane.
- Photoreal output depends on licensed high-quality meshes, textures, lighting and art direction; shader code alone cannot supply missing assets.

### Unity-like authoring experience
- Project browser, scene/asset organization, inspector-like material settings and reusable Lua components.
- Scene templates for empty 3D, anime courtyard, PBR showcase, sky/water showcase and mobile performance test.
- Import GLB/GLTF/OBJ/DAE/VOX according to the exact pinned 3DreamEngine revision's supported formats.
- Provide actionable diagnostics for missing dependencies, model paths, shader compilation and asset loading.

## Android performance tiers

| Tier | Suggested defaults | Goal |
|---|---|---|
| Compatibility | One key light, limited shadows, low-resolution effects, no expensive post-processing | Broad device coverage |
| Balanced | One shadowed key light, restrained bloom, optional fog and reduced-resolution SSAO | Mid-range phones |
| High | Higher-resolution shadows, HDR/bloom, reflections and selected post effects | Devices validated by profiling |
| Showcase | Full supported post stack and high-detail assets | Benchmark/demo mode, not a universal mobile default |

These are design profiles, not guaranteed performance promises. Choose defaults only after profiling real devices.

## Implementation gates

1. Pin and document the upstream 3DreamEngine revision and required assets.
2. Validate the starter scene on desktop and Android; record device, GPU, frame time, memory and known limitations.
3. Add material presets only through APIs confirmed in that pinned revision.
4. Add toon/rim/outline effects as opt-in passes with fallback paths.
5. Profile each effect independently; expose quality tiers and safe defaults.
6. Add screenshot-based visual regression scenes and an automated Android build.
7. Mark features complete only after code, tests and device validation exist.

## Current state

The `examples/3d-3dream` directory is an optional integration starter. LÖVE Studio in `tools/love-studio` is a UI/prototype direction, not yet a complete Android IDE. Android CI can validate packaging/build steps, but a successful CI build alone does not prove runtime rendering on physical hardware.
