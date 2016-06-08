
--
-- Created by IntelliJ IDEA.
-- User: wangys
-- Date: 2015/7/28
-- Time: 11:06
-- To change this template use File | Settings | File Templates.
-- TestLuaScene 测试场景
local BaseTestScene = class("BaseTestScene", BaseScene)

function BaseTestScene:onCreate()
    self.menuLayer = cc.Layer:create()

    self:addChild(self.menuLayer, 3000)

    local btn = ccui.Button:create()
    btn:setTitleText("RETURN")
    btn:setTitleColor(cc.c3b(0, 128, 0))
    btn:setTitleFontSize(32)
    btn:addClickEventListener(function (event)
        self:getApp():changeScene("TestLua", {}, "random", 1)
    end)
    btn:setPosition(cc.p(display.right - 80, display.bottom + 30))
    self.menuLayer:addChild(btn)

    local text = "=====   " .. self.__cname .. "  ====="
    local label = cc.Label:createWithSystemFont(text,"Arial",24)
    label:setTextColor(cc.c3b(0, 255, 0))
    label:setPosition(cc.p(display.cx, display.top - 60))
    self.menuLayer:addChild(label)
end

return BaseTestScene