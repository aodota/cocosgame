
--
-- Created by IntelliJ IDEA.
-- User: wangys
-- Date: 2015/7/28
-- Time: 11:06
-- To change this template use File | Settings | File Templates.
-- TestLuaScene 测试场景
local TestLuaScene = class("TestLuaScene", BaseScene)


function TestLuaScene:onCreate()
    log:info("onCreate")
    local items = {
        "helper",
        "native",
        "display",
        "crypto",
        "network",
        "luabinding",
        "event",
        "interface",
        "socketTcp",
        "timer",
        "gamestate",
        "transition",
        "nvgdrawnode",
        "clone"
    }
    self.layout = require("layout.TestLuaLayout").create()
    self:createMenu(items, handler(self, self.openTest))
    self:addObject(self.layout["root"], "ui")
    self.bListViewMove = false
end

function TestLuaScene:createMenu( items, callback )
    local menuList = self.layout['menu_list']
    local menuBtn = self.layout['menu_btn']
    for i, v in ipairs(items) do
        local content = ccui.Button:create()
        content:setTitleText(v)
        content:setTitleColor(cc.c3b(0, 128, 0))
        content:setTitleFontSize(32)
        content:addClickEventListener(
            function(event)
                callback(v)
            end
        )
        menuList:pushBackCustomItem(content)
    end
end

function TestLuaScene:openTest(name)
    log:info("test %s", name)
    self:getApp():changeScene("TestLua.tests." .. name .. "Test", {}, "random", 1)
    -- display.replaceScene(require("tests." .. name .. "Test").new(), "random", 1)
end

function TestLuaScene:onEnter()
end

return TestLuaScene
