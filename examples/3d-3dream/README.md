# 3DreamEngine example

This is an optional 3D starter for the LÖVE fork. 3DreamEngine is a separate Lua library and is not bundled here.

## Setup
1. Get a compatible revision from https://github.com/3dreamengine/3DreamEngine and review its MIT license.
2. Place the library where Lua can resolve require("3DreamEngine"), following that revision's docs.
3. Include the example model/assets shipped with the same revision, or change the object path in main.lua.
4. Run with a compatible LÖVE build.

The sample follows the upstream README flow: load the library, configure/init it, load an object, create a light, then call prepare, addLight, draw and present. APIs and asset paths may change between revisions.

## Android status
This sample does not guarantee Android support. Validate shader/GPU support, assets, memory use, touch/lifecycle behavior and performance on target devices. If initialization fails, the sample displays the error rather than pretending the 3D renderer started.