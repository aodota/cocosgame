--------------------------------------------------------------
-- This file was automatically generated by Cocos Studio.
-- Do not make changes to this file.
-- All changes will be lost.
--------------------------------------------------------------

local luaExtend = require "LuaExtend"

-- using for layout to decrease count of local variables
local layout = nil
local localLuaFile = nil
local innerCSD = nil
local innerProject = nil
local localFrame = nil

local Result = {}
------------------------------------------------------------
-- function call description
-- create function caller should provide a function to 
-- get a callback function in creating scene process.
-- the returned callback function will be registered to 
-- the callback event of the control.
-- the function provider is as below :
-- Callback callBackProvider(luaFileName, node, callbackName)
-- parameter description:
-- luaFileName  : a string, lua file name
-- node         : a Node, event source
-- callbackName : a string, callback function name
-- the return value is a callback function
------------------------------------------------------------
function Result.create(callBackProvider)

local result={}
setmetatable(result, luaExtend)

--Create Scene
local Scene=cc.Node:create()
Scene:setName("Scene")

--Create root
local root = ccui.Layout:create()
root:ignoreContentAdaptWithSize(false)
root:setBackGroundColorType(1)
root:setBackGroundColor(cc.c3b(150, 200, 255))
root:setBackGroundColorOpacity(102)
root:setLayoutComponentEnabled(true)
root:setName("root")
root:setTag(32)
root:setCascadeColorEnabled(true)
root:setCascadeOpacityEnabled(true)
root:setAnchorPoint(0.0000, 0.0000)
root:setPosition(0.0000, 0.0000)
root:setColor(cc.c3b(250, 248, 239))
layout = ccui.LayoutComponent:bindLayoutComponent(root)
layout:setPositionPercentX(0.0000)
layout:setPositionPercentY(0.0000)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize(cc.size(1136.0000, 640.0000))
layout:setLeftMargin(0.0000)
layout:setRightMargin(0.0000)
layout:setTopMargin(0.0000)
layout:setBottomMargin(0.0000)
Scene:addChild(root)

--Create gamePanel
local gamePanel = ccui.Layout:create()
gamePanel:ignoreContentAdaptWithSize(false)
gamePanel:setBackGroundColorType(1)
gamePanel:setBackGroundColor(cc.c3b(150, 200, 255))
gamePanel:setBackGroundColorOpacity(102)
gamePanel:setLayoutComponentEnabled(true)
gamePanel:setName("gamePanel")
gamePanel:setTag(36)
gamePanel:setCascadeColorEnabled(true)
gamePanel:setCascadeOpacityEnabled(true)
gamePanel:setAnchorPoint(0.0000, 0.0000)
gamePanel:setPosition(0.0000, 0.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(gamePanel)
layout:setPositionPercentX(0.0000)
layout:setPositionPercentY(0.0000)
layout:setPercentWidth(2.0286)
layout:setPercentHeight(0.8750)
layout:setSize(cc.size(1136.0000, 600.0000))
layout:setLeftMargin(0.0000)
layout:setRightMargin(-576.0000)
layout:setTopMargin(80.0000)
layout:setBottomMargin(0.0000)
root:addChild(gamePanel)

--Create lb_title
local lb_title = ccui.Text:create()
lb_title:ignoreContentAdaptWithSize(true)
lb_title:setTextAreaSize(cc.size(0, 0))
lb_title:setFontSize(20)
lb_title:setString([[== 2048 ==]])
lb_title:setLayoutComponentEnabled(true)
lb_title:setName("lb_title")
lb_title:setTag(33)
lb_title:setCascadeColorEnabled(true)
lb_title:setCascadeOpacityEnabled(true)
lb_title:setPosition(553.8055, 612.1237)
lb_title:setColor(cc.c3b(0, 0, 0))
layout = ccui.LayoutComponent:bindLayoutComponent(lb_title)
layout:setPositionPercentX(0.0049)
layout:setPositionPercentY(0.9564)
layout:setSize(cc.size(100.0000, 20.0000))
layout:setLeftMargin(503.8055)
layout:setRightMargin(112996.1953)
layout:setTopMargin(17.8763)
layout:setBottomMargin(602.1237)
root:addChild(lb_title)

--Create lb_score
local lb_score = ccui.Text:create()
lb_score:ignoreContentAdaptWithSize(true)
lb_score:setTextAreaSize(cc.size(0, 0))
lb_score:setFontSize(20)
lb_score:setString([[SCORE：0]])
lb_score:setLayoutComponentEnabled(true)
lb_score:setName("lb_score")
lb_score:setTag(34)
lb_score:setCascadeColorEnabled(true)
lb_score:setCascadeOpacityEnabled(true)
lb_score:setPosition(683.4969, 613.2587)
lb_score:setColor(cc.c3b(0, 128, 0))
layout = ccui.LayoutComponent:bindLayoutComponent(lb_score)
layout:setPositionPercentX(0.0060)
layout:setPositionPercentY(0.9582)
layout:setSize(cc.size(80.0000, 20.0000))
layout:setLeftMargin(643.4969)
layout:setRightMargin(112876.5000)
layout:setTopMargin(16.7413)
layout:setBottomMargin(603.2587)
root:addChild(lb_score)

--Create btn_play
local btn_play = ccui.Button:create()
btn_play:ignoreContentAdaptWithSize(false)
btn_play:loadTextureNormal("GreenButton.png",0)
btn_play:loadTexturePressed("GreenScale9Block.png",0)
btn_play:loadTextureDisabled("GreenButton.png",0)
btn_play:setTitleFontSize(20)
btn_play:setTitleText("New Game")
btn_play:setTitleColor(cc.c3b(65, 65, 70))
btn_play:setScale9Enabled(true)
btn_play:setCapInsets(cc.rect(15,11,18,26))
btn_play:setLayoutComponentEnabled(true)
btn_play:setName("btn_play")
btn_play:setTag(35)
btn_play:setCascadeColorEnabled(true)
btn_play:setCascadeOpacityEnabled(true)
btn_play:setPosition(622.6242, 343.6990)
layout = ccui.LayoutComponent:bindLayoutComponent(btn_play)
layout:setPositionPercentX(0.0055)
layout:setPositionPercentY(0.5370)
layout:setPercentWidth(0.3571)
layout:setPercentHeight(0.0938)
layout:setSize(cc.size(200.0000, 60.0000))
layout:setLeftMargin(522.6242)
layout:setRightMargin(112877.3750)
layout:setTopMargin(266.3010)
layout:setBottomMargin(313.6990)
root:addChild(btn_play)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Scene
return result;
end

return Result

