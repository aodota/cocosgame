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

--Create slider_bg
local slider_bg = cc.Sprite:create("ui/slider/slider_bg.png")
slider_bg:setName("slider_bg")
slider_bg:setTag(12)
slider_bg:setCascadeColorEnabled(true)
slider_bg:setCascadeOpacityEnabled(true)
slider_bg:setPosition(480.0000, 320.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(slider_bg)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.4938)
layout:setPercentHeight(0.0938)
layout:setSize({width = 474.0000, height = 60.0000})
layout:setLeftMargin(243.0000)
layout:setRightMargin(243.0000)
layout:setTopMargin(290.0000)
layout:setBottomMargin(290.0000)
slider_bg:setBlendFunc({src = 1, dst = 771})
Scene:addChild(slider_bg)

--Create slider
local slider = ccui.Slider:create()
slider:ignoreContentAdaptWithSize(false)
slider:loadBarTexture("ui/slider/slider_2.png",0)
slider:loadProgressBarTexture("ui/slider/slider_1.png",0)
slider:loadSlidBallTextureNormal("ui/slider/slider.png",0)
slider:loadSlidBallTexturePressed("ui/slider/slider.png",0)
slider:loadSlidBallTextureDisabled("Default/SliderNode_Disable.png",0)
slider:setPercent(22)
slider:setLayoutComponentEnabled(true)
slider:setName("slider")
slider:setTag(13)
slider:setCascadeColorEnabled(true)
slider:setCascadeOpacityEnabled(true)
slider:setPosition(269.0000, 30.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(slider)
layout:setPositionPercentX(0.5675)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.7932)
layout:setPercentHeight(0.3000)
layout:setSize({width = 376.0000, height = 18.0000})
layout:setLeftMargin(81.0000)
layout:setRightMargin(17.0000)
layout:setTopMargin(21.0000)
layout:setBottomMargin(21.0000)
slider_bg:addChild(slider)

--Create progress_title
local progress_title = ccui.Text:create()
progress_title:ignoreContentAdaptWithSize(true)
progress_title:setTextAreaSize({width = 0, height = 0})
progress_title:setFontSize(24)
progress_title:setString([[滑动百分比：]])
progress_title:enableShadow({r = 0, g = 0, b = 0, a = 255}, {width = 1, height = -1}, 0)
progress_title:setLayoutComponentEnabled(true)
progress_title:setName("progress_title")
progress_title:setTag(14)
progress_title:setCascadeColorEnabled(true)
progress_title:setCascadeOpacityEnabled(true)
progress_title:setPosition(317.0000, 386.0000)
progress_title:setTextColor({r = 0, g = 128, b = 0})
layout = ccui.LayoutComponent:bindLayoutComponent(progress_title)
layout:setPositionPercentX(0.3302)
layout:setPositionPercentY(0.6031)
layout:setPercentWidth(0.1500)
layout:setPercentHeight(0.0375)
layout:setSize({width = 144.0000, height = 24.0000})
layout:setLeftMargin(245.0000)
layout:setRightMargin(571.0000)
layout:setTopMargin(242.0000)
layout:setBottomMargin(374.0000)
Scene:addChild(progress_title)

--Create progress_txt
local progress_txt = ccui.Text:create()
progress_txt:ignoreContentAdaptWithSize(true)
progress_txt:setTextAreaSize({width = 0, height = 0})
progress_txt:setFontSize(24)
progress_txt:setString([[100]])
progress_txt:setLayoutComponentEnabled(true)
progress_txt:setName("progress_txt")
progress_txt:setTag(15)
progress_txt:setCascadeColorEnabled(true)
progress_txt:setCascadeOpacityEnabled(true)
progress_txt:setAnchorPoint(0.7500, 0.5417)
progress_txt:setPosition(405.0000, 387.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(progress_txt)
layout:setPositionPercentX(0.4219)
layout:setPositionPercentY(0.6047)
layout:setPercentWidth(0.0375)
layout:setPercentHeight(0.0375)
layout:setSize({width = 36.0000, height = 24.0000})
layout:setLeftMargin(378.0000)
layout:setRightMargin(546.0000)
layout:setTopMargin(242.0000)
layout:setBottomMargin(374.0000)
Scene:addChild(progress_txt)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Scene
return result;
end

return Result

