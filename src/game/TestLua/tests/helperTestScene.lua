
--
-- Created by IntelliJ IDEA.
-- User: wangys
-- Date: 2015/7/28
-- Time: 11:06
-- To change this template use File | Settings | File Templates.
-- TestLuaScene 测试场景
local BaseTestScene = require("game.TestLua.tests.BaseTestScene")
local helperTestScene = class("helperTestScene", BaseTestScene)

function helperTestScene:onCreate()
    BaseTestScene.onCreate(self)
    
end

function helperTestScene:getFileDataTest()
end

return helperTestScene
