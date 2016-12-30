--
-- Created by IntelliJ IDEA.
-- User: wangys
-- Date: 2015/7/27
-- Time: 16:44
-- To change this template use File | Settings | File Templates.
-- Game 游戏App

-- mvc导入
cc.exports.BaseScene = require "core.mvc.BaseScene"
cc.exports.BaseApp = require "core.mvc.BaseApp"
cc.exports.BasePanel = require "core.mvc.BasePanel"

local Game = class("MyApp", BaseApp)

--------------------------------
-- 创建方法
-- @function [parent=#Game] onCreate
function Game:onCreate()
end

--------------------------------
-- 启动游戏
-- @function [parent=#Game] startup
function Game:startup()
    -- 游戏core初始化
    require "core.init"

    -- 初始化Actions
    require "game.Net.Actions"

    -- net.WebUtil.sendRequest("https://proxy-zjzr.aoshitang.com/root/version.action", function(data) 
    --     log:info("https echo:%s", data.data)
    -- end, "GET")

    -- 进行连接
    cmgr:open("127.0.0.1", 8010)

    -- app暴露给全局
    cc.exports.app = self
    
    -- 切换到入口函数
    self:changeScene("Tetris")
end

return Game
