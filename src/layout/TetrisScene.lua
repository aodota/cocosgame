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

--Create panel
local panel = ccui.Layout:create()
panel:ignoreContentAdaptWithSize(false)
panel:setClippingEnabled(false)
panel:setTouchEnabled(true);
panel:setLayoutComponentEnabled(true)
panel:setName("panel")
panel:setTag(34)
panel:setCascadeColorEnabled(true)
panel:setCascadeOpacityEnabled(true)
panel:setAnchorPoint(0.5000, 0.5000)
panel:setPosition(320.0000, 568.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(panel)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 640.0000, height = 1136.0000})
Scene:addChild(panel)

--Create scene_bg
local scene_bg = ccui.ImageView:create()
scene_bg:ignoreContentAdaptWithSize(false)
scene_bg:loadTexture("ui/tetris/scene_bg.png",0)
scene_bg:setLayoutComponentEnabled(true)
scene_bg:setName("scene_bg")
scene_bg:setTag(64)
scene_bg:setCascadeColorEnabled(true)
scene_bg:setCascadeOpacityEnabled(true)
scene_bg:setPosition(320.0000, 568.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(scene_bg)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(1.3313)
layout:setPercentHeight(1.0000)
layout:setSize({width = 852.0000, height = 1136.0000})
layout:setLeftMargin(-106.0000)
layout:setRightMargin(-106.0000)
panel:addChild(scene_bg)

--Create bg_bk
local bg_bk = ccui.ImageView:create()
bg_bk:ignoreContentAdaptWithSize(false)
bg_bk:loadTexture("ui/tetris/bg_bk.png",0)
bg_bk:setLayoutComponentEnabled(true)
bg_bk:setName("bg_bk")
bg_bk:setTag(63)
bg_bk:setCascadeColorEnabled(true)
bg_bk:setCascadeOpacityEnabled(true)
bg_bk:setAnchorPoint(0.0000, 0.0000)
bg_bk:setPosition(-13.2597, 240.5854)
layout = ccui.LayoutComponent:bindLayoutComponent(bg_bk)
layout:setPositionPercentX(-0.0207)
layout:setPositionPercentY(0.2118)
layout:setPercentWidth(1.0453)
layout:setPercentHeight(0.8037)
layout:setSize({width = 669.0000, height = 913.0000})
layout:setLeftMargin(-13.2597)
layout:setRightMargin(-15.7403)
layout:setTopMargin(-17.5855)
layout:setBottomMargin(240.5854)
panel:addChild(bg_bk)

--Create tetris_bg
local tetris_bg = cc.Sprite:create("ui/tetris/bg.png")
tetris_bg:setName("tetris_bg")
tetris_bg:setTag(13)
tetris_bg:setCascadeColorEnabled(true)
tetris_bg:setCascadeOpacityEnabled(true)
tetris_bg:setPosition(226.5000, 693.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(tetris_bg)
layout:setPositionPercentX(0.3539)
layout:setPositionPercentY(0.6105)
layout:setPercentWidth(0.5984)
layout:setPercentHeight(0.7174)
layout:setSize({width = 383.0000, height = 815.0000})
layout:setLeftMargin(35.0000)
layout:setRightMargin(222.0000)
layout:setTopMargin(35.0000)
layout:setBottomMargin(286.0000)
tetris_bg:setBlendFunc({src = 1, dst = 771})
panel:addChild(tetris_bg)

--Create btn_down_low
local btn_down_low = ccui.Button:create()
btn_down_low:ignoreContentAdaptWithSize(false)
btn_down_low:loadTextureNormal("ui/tetris/down.png",0)
btn_down_low:loadTexturePressed("ui/tetris/down.png",0)
btn_down_low:loadTextureDisabled("ui/tetris/down.png",0)
btn_down_low:setTitleFontSize(28)
btn_down_low:setScale9Enabled(true)
btn_down_low:setCapInsets({x = 15, y = 11, width = 66, height = 74})
btn_down_low:setLayoutComponentEnabled(true)
btn_down_low:setName("btn_down_low")
btn_down_low:setTag(15)
btn_down_low:setCascadeColorEnabled(true)
btn_down_low:setCascadeOpacityEnabled(true)
btn_down_low:setPosition(153.5000, 78.0914)
layout = ccui.LayoutComponent:bindLayoutComponent(btn_down_low)
layout:setPositionPercentX(0.2398)
layout:setPositionPercentY(0.0687)
layout:setPercentWidth(0.1500)
layout:setPercentHeight(0.0845)
layout:setSize({width = 96.0000, height = 96.0000})
layout:setLeftMargin(105.5000)
layout:setRightMargin(438.5000)
layout:setTopMargin(1009.9090)
layout:setBottomMargin(30.0914)
panel:addChild(btn_down_low)

--Create btn_down
local btn_down = ccui.Button:create()
btn_down:ignoreContentAdaptWithSize(false)
btn_down:loadTextureNormal("ui/tetris/down_fast.png",0)
btn_down:loadTexturePressed("ui/tetris/down_fast.png",0)
btn_down:loadTextureDisabled("ui/tetris/down_fast.png",0)
btn_down:setTitleFontSize(28)
btn_down:setScale9Enabled(true)
btn_down:setCapInsets({x = 15, y = 11, width = 66, height = 74})
btn_down:setLayoutComponentEnabled(true)
btn_down:setName("btn_down")
btn_down:setTag(42)
btn_down:setCascadeColorEnabled(true)
btn_down:setCascadeOpacityEnabled(true)
btn_down:setPosition(417.6349, 205.9041)
layout = ccui.LayoutComponent:bindLayoutComponent(btn_down)
layout:setPositionPercentX(0.6526)
layout:setPositionPercentY(0.1813)
layout:setPercentWidth(0.1500)
layout:setPercentHeight(0.0845)
layout:setSize({width = 96.0000, height = 96.0000})
layout:setLeftMargin(369.6349)
layout:setRightMargin(174.3651)
layout:setTopMargin(882.0959)
layout:setBottomMargin(157.9041)
panel:addChild(btn_down)

--Create lb_score_title
local lb_score_title = ccui.Text:create()
lb_score_title:ignoreContentAdaptWithSize(true)
lb_score_title:setTextAreaSize({width = 0, height = 0})
lb_score_title:setFontSize(28)
lb_score_title:setString([[SCORE]])
lb_score_title:setLayoutComponentEnabled(true)
lb_score_title:setName("lb_score_title")
lb_score_title:setTag(38)
lb_score_title:setCascadeColorEnabled(true)
lb_score_title:setCascadeOpacityEnabled(true)
lb_score_title:setAnchorPoint(0.5578, 0.8825)
lb_score_title:setPosition(504.8406, 1075.6860)
lb_score_title:setTextColor({r = 0, g = 0, b = 0})
layout = ccui.LayoutComponent:bindLayoutComponent(lb_score_title)
layout:setPositionPercentX(0.7888)
layout:setPositionPercentY(0.9469)
layout:setPercentWidth(0.1563)
layout:setPercentHeight(0.0282)
layout:setSize({width = 100.0000, height = 32.0000})
layout:setLeftMargin(449.0606)
layout:setRightMargin(90.9394)
layout:setTopMargin(56.5544)
layout:setBottomMargin(1047.4460)
panel:addChild(lb_score_title)

--Create score_bg
local score_bg = ccui.Layout:create()
score_bg:ignoreContentAdaptWithSize(false)
score_bg:setClippingEnabled(false)
score_bg:setBackGroundColorType(1)
score_bg:setBackGroundColor({r = 57, g = 141, b = 234})
score_bg:setBackGroundColorOpacity(102)
score_bg:setTouchEnabled(true);
score_bg:setLayoutComponentEnabled(true)
score_bg:setName("score_bg")
score_bg:setTag(37)
score_bg:setCascadeColorEnabled(true)
score_bg:setCascadeOpacityEnabled(true)
score_bg:setPosition(443.2690, 839.8694)
layout = ccui.LayoutComponent:bindLayoutComponent(score_bg)
layout:setPositionPercentX(0.6926)
layout:setPositionPercentY(0.7393)
layout:setPercentWidth(0.1875)
layout:setPercentHeight(0.1761)
layout:setSize({width = 120.0000, height = 200.0000})
layout:setLeftMargin(443.2690)
layout:setRightMargin(76.7310)
layout:setTopMargin(96.1306)
layout:setBottomMargin(839.8694)
panel:addChild(score_bg)

--Create lb_score
local lb_score = ccui.Text:create()
lb_score:ignoreContentAdaptWithSize(true)
lb_score:setTextAreaSize({width = 0, height = 0})
lb_score:setFontSize(32)
lb_score:setString([[100]])
lb_score:setLayoutComponentEnabled(true)
lb_score:setName("lb_score")
lb_score:setTag(39)
lb_score:setCascadeColorEnabled(true)
lb_score:setCascadeOpacityEnabled(true)
lb_score:setPosition(57.5464, 109.9988)
layout = ccui.LayoutComponent:bindLayoutComponent(lb_score)
layout:setPositionPercentX(0.4796)
layout:setPositionPercentY(0.5500)
layout:setPercentWidth(0.4500)
layout:setPercentHeight(0.1850)
layout:setSize({width = 54.0000, height = 37.0000})
layout:setLeftMargin(30.5464)
layout:setRightMargin(35.4536)
layout:setTopMargin(71.5012)
layout:setBottomMargin(91.4988)
score_bg:addChild(lb_score)

--Create lb_next_title
local lb_next_title = ccui.Text:create()
lb_next_title:ignoreContentAdaptWithSize(true)
lb_next_title:setTextAreaSize({width = 0, height = 0})
lb_next_title:setFontSize(28)
lb_next_title:setString([[NEXT]])
lb_next_title:setLayoutComponentEnabled(true)
lb_next_title:setName("lb_next_title")
lb_next_title:setTag(36)
lb_next_title:setCascadeColorEnabled(true)
lb_next_title:setCascadeOpacityEnabled(true)
lb_next_title:setAnchorPoint(0.4821, 0.6071)
lb_next_title:setPosition(500.3559, 796.5410)
lb_next_title:setTextColor({r = 0, g = 0, b = 0})
layout = ccui.LayoutComponent:bindLayoutComponent(lb_next_title)
layout:setPositionPercentX(0.7818)
layout:setPositionPercentY(0.7012)
layout:setPercentWidth(0.1172)
layout:setPercentHeight(0.0282)
layout:setSize({width = 75.0000, height = 32.0000})
layout:setLeftMargin(464.1984)
layout:setRightMargin(100.8016)
layout:setTopMargin(326.8862)
layout:setBottomMargin(777.1138)
panel:addChild(lb_next_title)

--Create next_bg
local next_bg = ccui.Layout:create()
next_bg:ignoreContentAdaptWithSize(false)
next_bg:setClippingEnabled(false)
next_bg:setBackGroundColorType(1)
next_bg:setBackGroundColor({r = 57, g = 141, b = 234})
next_bg:setBackGroundColorOpacity(102)
next_bg:setTouchEnabled(true);
next_bg:setLayoutComponentEnabled(true)
next_bg:setName("next_bg")
next_bg:setTag(35)
next_bg:setCascadeColorEnabled(true)
next_bg:setCascadeOpacityEnabled(true)
next_bg:setPosition(446.3487, 569.5376)
layout = ccui.LayoutComponent:bindLayoutComponent(next_bg)
layout:setPositionPercentX(0.6974)
layout:setPositionPercentY(0.5014)
layout:setPercentWidth(0.1875)
layout:setPercentHeight(0.1761)
layout:setSize({width = 120.0000, height = 200.0000})
layout:setLeftMargin(446.3487)
layout:setRightMargin(73.6513)
layout:setTopMargin(366.4624)
layout:setBottomMargin(569.5376)
panel:addChild(next_bg)

--Create btn_play
local btn_play = ccui.Button:create()
btn_play:ignoreContentAdaptWithSize(false)
cc.SpriteFrameCache:getInstance():addSpriteFrames("res/pack.plist")
btn_play:loadTextureNormal("PlayButton.png",1)
cc.SpriteFrameCache:getInstance():addSpriteFrames("res/pack.plist")
btn_play:loadTexturePressed("PlayButton.png",1)
cc.SpriteFrameCache:getInstance():addSpriteFrames("res/pack.plist")
btn_play:loadTextureDisabled("PlayButton.png",1)
btn_play:setTitleFontSize(14)
btn_play:setTitleColor({r = 65, g = 65, b = 70})
btn_play:setScale9Enabled(true)
btn_play:setCapInsets({x = 15, y = 11, width = 210, height = 98})
btn_play:setLayoutComponentEnabled(true)
btn_play:setName("btn_play")
btn_play:setTag(41)
btn_play:setCascadeColorEnabled(true)
btn_play:setCascadeOpacityEnabled(true)
btn_play:setPosition(191.0040, 499.4929)
layout = ccui.LayoutComponent:bindLayoutComponent(btn_play)
layout:setPositionPercentX(0.2984)
layout:setPositionPercentY(0.4397)
layout:setPercentWidth(0.3750)
layout:setPercentHeight(0.1056)
layout:setSize({width = 240.0000, height = 120.0000})
layout:setLeftMargin(71.0040)
layout:setRightMargin(328.9960)
layout:setTopMargin(576.5071)
layout:setBottomMargin(439.4929)
panel:addChild(btn_play)

--Create btn_shift
local btn_shift = ccui.Button:create()
btn_shift:ignoreContentAdaptWithSize(false)
btn_shift:loadTextureNormal("ui/tetris/shift.png",0)
btn_shift:loadTexturePressed("ui/tetris/shift.png",0)
btn_shift:loadTextureDisabled("ui/tetris/shift.png",0)
btn_shift:setTitleFontSize(28)
btn_shift:setScale9Enabled(true)
btn_shift:setCapInsets({x = 15, y = 11, width = 123, height = 131})
btn_shift:setLayoutComponentEnabled(true)
btn_shift:setName("btn_shift")
btn_shift:setTag(27)
btn_shift:setCascadeColorEnabled(true)
btn_shift:setCascadeOpacityEnabled(true)
btn_shift:setPosition(536.1125, 104.8277)
layout = ccui.LayoutComponent:bindLayoutComponent(btn_shift)
layout:setPositionPercentX(0.8377)
layout:setPositionPercentY(0.0923)
layout:setPercentWidth(0.2391)
layout:setPercentHeight(0.1347)
layout:setSize({width = 153.0000, height = 153.0000})
layout:setLeftMargin(459.6125)
layout:setRightMargin(27.3875)
layout:setTopMargin(954.6723)
layout:setBottomMargin(28.3277)
panel:addChild(btn_shift)

--Create btn_right
local btn_right = ccui.Button:create()
btn_right:ignoreContentAdaptWithSize(false)
btn_right:loadTextureNormal("ui/tetris/right.png",0)
btn_right:loadTexturePressed("ui/tetris/right.png",0)
btn_right:loadTextureDisabled("ui/tetris/right.png",0)
btn_right:setTitleFontSize(28)
btn_right:setScale9Enabled(true)
btn_right:setCapInsets({x = 15, y = 11, width = 66, height = 74})
btn_right:setLayoutComponentEnabled(true)
btn_right:setName("btn_right")
btn_right:setTag(26)
btn_right:setCascadeColorEnabled(true)
btn_right:setCascadeOpacityEnabled(true)
btn_right:setPosition(224.0002, 205.3395)
layout = ccui.LayoutComponent:bindLayoutComponent(btn_right)
layout:setPositionPercentX(0.3500)
layout:setPositionPercentY(0.1808)
layout:setPercentWidth(0.1500)
layout:setPercentHeight(0.0845)
layout:setSize({width = 96.0000, height = 96.0000})
layout:setLeftMargin(176.0002)
layout:setRightMargin(367.9998)
layout:setTopMargin(882.6605)
layout:setBottomMargin(157.3395)
panel:addChild(btn_right)

--Create btn_left
local btn_left = ccui.Button:create()
btn_left:ignoreContentAdaptWithSize(false)
btn_left:loadTextureNormal("ui/tetris/left.png",0)
btn_left:loadTexturePressed("ui/tetris/left.png",0)
btn_left:loadTextureDisabled("ui/tetris/left.png",0)
btn_left:setTitleFontSize(28)
btn_left:setLayoutComponentEnabled(true)
btn_left:setName("btn_left")
btn_left:setTag(25)
btn_left:setCascadeColorEnabled(true)
btn_left:setCascadeOpacityEnabled(true)
btn_left:setPosition(83.0001, 205.1349)
layout = ccui.LayoutComponent:bindLayoutComponent(btn_left)
layout:setPositionPercentX(0.1297)
layout:setPositionPercentY(0.1806)
layout:setPercentWidth(0.1500)
layout:setPercentHeight(0.0845)
layout:setSize({width = 96.0000, height = 96.0000})
layout:setLeftMargin(35.0001)
layout:setRightMargin(508.9999)
layout:setTopMargin(882.8651)
layout:setBottomMargin(157.1349)
panel:addChild(btn_left)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Scene
return result;
end

return Result

