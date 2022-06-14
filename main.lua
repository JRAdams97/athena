-- ====================================================================================================================
--  GLOBAL VARIABLES
-- ====================================================================================================================

Object = require 'lib.classic'

-- ====================================================================================================================
--  GAME LOOP
-- ====================================================================================================================

function love.load()
  requireObjs('obj', {})
end

function love.update(dt)
end

function love.draw()
end

-- ====================================================================================================================
--  UTILITY FUNCTIONS
-- ====================================================================================================================

function requireObjs(dir, obj_list)
  local objs = love.filesystem.getDirectoryItems(dir)

  for _, obj in ipairs(objs) do
    local file = dir .. '/' .. obj
    local info = love.filesystem.getInfo(file)

    if info.type == 'file' then
        table.insert(obj_list, file)
    elseif info.type == 'directory' then
        recursiveEnumerate(file, obj_list)
    end
  end

  for _, file in ipairs(obj_list) do
    local file = file:sub(1, -5)
    require(file)
  end
end
