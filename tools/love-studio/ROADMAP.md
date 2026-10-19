# LÖVE Studio — editor implementation roadmap

The current `index.html` is a front-end prototype. This roadmap separates present UI work from the native Android and engine integrations still required.

## Product direction

A clean, mobile-first workspace for Lua and LÖVE projects with a Unity-inspired project/scene workflow. Keep the editor independent of the LÖVE runtime so it does not add editor-only dependencies to game builds.

## Milestones

### A — Reliable project workspace
- Create, open, import and export folders and `.love` archives.
- Use Android Storage Access Framework for user-selected files.
- File tree, tabs, Lua syntax highlighting, indentation, bracket matching, search and undo/redo.
- Safe saves, dirty-buffer indicators, autosave/recovery and explicit overwrite confirmation.

### B — Run and diagnose
- Run, stop and restart a selected project through a defined runner interface.
- Stream stdout/stderr and LÖVE errors into a log panel.
- Parse common Lua stack traces; tapping a diagnostic opens the matching file/line.
- Preserve raw logs when parsing fails; never hide the original error.

### C — 3D project workflow
- Optional 3DreamEngine template and dependency setup guide.
- Scene/asset browser, material presets, light/camera properties and quality profiles.
- Model preview for supported formats only after a real loader is integrated.
- Toon/anime and PBR scene templates; no claim of Unity project compatibility.

### D — Native Android integration
- Integrate only after identifying the actual Android activity, storage model and packaging conventions in this fork.
- Test pause/resume, rotation, background/foreground, low-memory termination and external keyboard.
- Add CI checks for editor assets and Android build; add physical-device smoke tests separately.

## Quality and security requirements
- Imported scripts run only after the user explicitly taps Run.
- Do not expose arbitrary shell execution to project scripts.
- Do not request broad storage permissions when a document picker is sufficient.
- Clearly label unsupported language-server/debugger features; syntax coloring is not a full LSP.
- Never report an editor feature as complete without implementation and a repeatable test.
- Keep the interface responsive on small screens, with accessible contrast, scalable text and touch-sized controls.
