-- Optional LÖVE + 3DreamEngine starter.
-- Install a compatible 3DreamEngine revision and its example assets first.
local dream, object, light
local startupError

function love.load()
    local ok, result = pcall(require, "3DreamEngine")
    if not ok then
        startupError = "3DreamEngine is missing. Add the library to this project first.\n\n" .. tostring(result)
        return
    end
    dream = result
    local initialized, err = pcall(function()
        dream:setBloom(1)
        dream:init()
        -- Register the optional anime material shader. A material can opt in
        -- with pixelShader = "anime"; default PBR materials remain unchanged.
        dream:registerShader("examples/3d-3dream/shaders/anime", "anime")
        object = dream:loadObject("examples/monkey/object")
        light = dream:newLight("point", dream.vec3(3, 2, 1), dream.vec3(1.0, 0.82, 0.62), 35.0)
        light:addNewShadow()
    end)
    if not initialized then
        startupError = "3DreamEngine initialization failed:\n" .. tostring(err)
        dream = nil
    end
end

function love.update(dt)
    if dream then dream:update(dt) end
end

function love.draw()
    if startupError then
        love.graphics.clear(0.08, 0.09, 0.12, 1)
        love.graphics.setColor(1, 0.75, 0.65, 1)
        love.graphics.printf(startupError, 24, 24, math.max(100, love.graphics.getWidth() - 48))
        love.graphics.setColor(1, 1, 1, 1)
        return
    end
    if not dream or not object then
        love.graphics.clear(0.08, 0.09, 0.12, 1)
        love.graphics.printf("Loading 3D scene...", 0, love.graphics.getHeight() / 2, love.graphics.getWidth(), "center")
        return
    end
    dream:prepare()
    dream:addLight(light)
    object:resetTransform()
    object:rotateY(love.timer.getTime() * 0.5)
    object:translate(0, 0, -3)
    dream:draw(object)
    dream:present()
end

function love.resize(width, height)
    -- Add viewport handling after confirming the API in the pinned engine revision.
end
