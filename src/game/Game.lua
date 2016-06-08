--
-- Created by IntelliJ IDEA.
-- User: wangys
-- Date: 2015/7/27
-- Time: 16:44
-- To change this template use File | Settings | File Templates.
-- Game 游戏App

local Game = class("MyApp", BaseApp)

--------------------------------
-- 创建方法
-- @function [parent=#Game] onCreate
function Game:onCreate()
    log:info("Game Created")
    local paths = cc.FileUtils:getInstance():getSearchPaths()
    for _, path in pairs(paths) do
        log:info("search path %s", path)
    end
end

--------------------------------
-- 启动游戏
-- @function [parent=#Game] startup
function Game:startup()
    self:changeScene("Main")
end

return Game
