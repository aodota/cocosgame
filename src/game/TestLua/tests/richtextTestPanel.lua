
--
-- Created by IntelliJ IDEA.
-- User: wangys
-- Date: 2015/7/28
-- Time: 11:06
-- To change this template use File | Settings | File Templates.
-- uiTestScene 测试场景
-- local BaseTestScene = require("game.TestLua.tests.BaseTestScene")
local richtextTestPanel = class("richtextTestPanel", BasePanel)
local RichLabel = require("core.component.richlabel.RichLabel")
function richtextTestPanel:onCreate()
    -- BaseTestScene.onCreate(self)

    local test_text = {
        "<div fontcolor=#ff0000>hello</div><div fontcolor=#00ff00>hello</div><div fontsize=12>你</div><div fontSize=26 fontcolor=#ff00bb>好</div>ok",
        "<div outline=1,#ff0000>hello</div>",
        "<div glow=#ff0000 >hello</div>"
    }
    for i=1, #test_text do
	    local label = RichLabel.new {
	        fontSize = 20,
	        fontColor = cc.c3b(255, 255, 255),
	        maxWidth=200,
	        lineSpace=0,
	        charSpace=0,
	    }
	    label:setString(test_text[i])
	    label:setPosition(cc.p(380,500-i*30))
	    label:playAnimation()
	    self:addChild(label)

	    -- label:debugDraw()
	end 
end

function richtextTestPanel:onExit()
    -- 重新注册事件
    self:getScene().btn:addClickEventListener(function (event)
        app:changeScene("TestLua", {}, "random", 1)
    end)
end



return richtextTestPanel
