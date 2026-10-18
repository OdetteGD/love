# LÖVE Studio — Android Lua IDE design

This folder specifies a mobile-first editor layer for the LÖVE fork. Initially build it as a separate Android app/module that launches projects with the LÖVE runtime; avoid pulling editor dependencies into engine core.

## MVP contract
- Create/open/import/export a LÖVE project folder or .love archive.
- Edit Lua/text files with syntax highlighting, indentation, bracket matching, search and undo/redo.
- Save safely and recover unsaved buffers after process death.
- Run/stop/restart projects and show logs, Lua errors and stack traces.
- Tap a diagnostic to open its file and line.
- Include 2D and optional 3DreamEngine project templates.
- Support touch layouts, portrait/landscape, external keyboards and accessible controls.
- Use Android Storage Access Framework for user-selected files; don't assume unrestricted filesystem access.

## Phases
1. Prototype editor UI and project model independently from native engine.
2. Define a runner interface: launch(projectUri), stop(), restart(), observeLogs().
3. Parse common Lua trace formats but preserve raw logs.
4. Add templates and archive import/export.
5. Integrate with the Android LÖVE activity only after verifying the fork's actual activity and packaging structure.
6. Test persistence, file permissions, log parsing and process lifecycle.

## Security and scope
- Never execute an imported project without user consent.
- Do not silently request broad storage permissions.
- Do not expose arbitrary shell commands to project scripts.
- Do not claim full LSP/debugger support until a language server/debug protocol is integrated.

This is an implementation plan, not a finished IDE application.