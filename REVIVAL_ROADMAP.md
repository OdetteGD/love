# LÖVE Android Revival: IDE + 3D Roadmap

Keep upstream LÖVE as the runtime foundation. This fork's revival plan adds a mobile-first Lua authoring workflow and an optional 3D path powered by the separate 3DreamEngine library.

## Goals
- Preserve existing LÖVE games and Lua APIs.
- Add an Android project browser, Lua editor, diagnostics/console, and run/stop/restart workflow.
- Offer a 3D project template using https://github.com/3dreamengine/3DreamEngine.
- Keep 3D optional; ordinary LÖVE projects must not require the library.
- Preserve upstream and third-party licenses.

## Milestones

### 1. Baseline
- Build current fork for supported desktop and Android targets.
- Record CMake, NDK, Lua/LuaJIT, SDL and packaging versions.
- Run existing tests and retain CI logs before renderer or ABI changes.

### 2. Mobile Lua IDE
- Create/open/import/export project folders and .love archives.
- Lua syntax highlighting, indentation, bracket matching, search/replace and undo/redo.
- Diagnostics panel with file/line navigation, runtime console and stack traces.
- Save/recovery, run/stop/restart, touch-friendly controls and external keyboard support.
- Templates for 2D and 3D projects; use Android Storage Access Framework where appropriate.

### 3. Optional 3D integration
- Ship a documented 3DreamEngine sample, not a copy of the entire dependency by default.
- Pin a tested library revision for reproducible builds.
- Validate shader/GPU support on target Android devices before claiming compatibility.
- Test GLB/glTF/OBJ loading as supported by the pinned version, lighting, shadows, memory pressure, resize and lifecycle.

### 4. Android release
- Produce debug APKs in CI and publish artifacts only after successful jobs.
- Test install, launch, project import, Lua execution, touch, pause/resume and shutdown on real devices.
- Document supported Android versions and GPU limitations.

## Architecture
1. LÖVE runtime: engine and public Lua APIs.
2. IDE shell: editing, project/file management, diagnostics and run controls; initially keep it separate from engine core.
3. 3D library: game projects load 3DreamEngine with require("3DreamEngine"); this documentation does not bundle it.
4. Build/QA: repeatable CI and device tests; never claim an APK works until verified.

## First acceptance checks
- Existing upstream test suite passes.
- Minimal 2D project starts and draws.
- 3DreamEngine sample runs on a compatible desktop setup with the pinned dependency.
- Android build succeeds and the app launches on a device.
- Editor changes persist after restart and errors include useful source locations.

## Scope of this commit
This commit adds documentation and a starter sample only. It does not implement the IDE UI, port 3DreamEngine to Android, change the renderer, or certify APK/device compatibility. Those require source implementation, builds and device testing.