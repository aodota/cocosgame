--
-- Created by IntelliJ IDEA.
-- User: wangys
-- Date: 2015/7/27
-- Time: 16:44
-- To change this template use File | Settings | File Templates.
-- BaseScence 基础Scene，其他Scence应该继承自它

local BaseScence = class("BaseScence", cc.Node)

--------------------------------
-- 构造函数
-- @function [parent=#BaseScence] ctor
-- @param App app 应用对象，全局单例
-- @param string name 场景名称
function BaseScence:ctor(app, name, args)
    self:enableNodeEvents()
    self.app = app
    self.name = name
    self.args = args

    -- 调用init方法
    self:init()

    -- 调用onCreate方法
    if self.onCreate then
        self:onCreate()
    end
end

--------------------------------
-- 初始化方法
-- @function [parent=#BaseScence] init
function BaseScence:init()
    -- 初始化层次
    for key, value in pairs(layers) do
        local layer = cc.Layer:create()
        self:addChild(layer, value * 100, value)
    end
end


--------------------------------
-- 获取指定Layer
-- @param string layer layer名称
-- @function [parent=#BaseScence] getLayer
function BaseScence:getLayer(layerName)
    if layers[layerName] then
        return self:getChildByTag(layers[layerName])
    else
        log:error("找不到%s层", layerName)
    end
end

--------------------------------
-- 获取指定Layer
-- @param Node obj 显示对象
-- @param string layerName layer名称
-- @param int zorder z轴
-- @param int tag tag
-- @function [parent=#BaseScence] addObject
function BaseScence:addObject(obj, layerName, zorder, tag)
    zorder = zorder or 0
    tag = tag or 0

    local layer = self:getLayer(layerName)
    if layer and obj then
        layer:addChild(obj, zorder, tag)
    end
end

--------------------------------
-- 获取应用
-- @function [parent=#BaseScence] getApp
function BaseScence:getApp()
    return self.app
end

--------------------------------
-- 获取场景名称
-- @function [parent=#BaseScence] getName
function BaseScence:getName()
    return self.name
end


--------------------------------
-- 显示场景
-- @function [parent=#BaseScence] getName
function BaseScence:showWithScene(transition, time, more)
    self:setVisible(true)
    local scene = display.newScene(self.name, self.args)
    scene:addChild(self)
    display.runScene(scene, transition, time, more)
    
    return self
end

--------------------------------
-- 压入场景
-- @function [parent=#BaseScence] getName
function BaseScence:pushWithScene(transition, time, more)
    self:setVisible(true)
    local scene = display.newScene(self.name, self.args)
    scene:addChild(self)

    -- 创建过渡动画
    if transition then
        scene = display.wrapScene(scene, transition, time, more)
    end

    -- 压入场景
    director:pushScene(scene)
    return self
end

--------------------------------
-- 资源清理
-- @function [parent=#BaseScence] onCleanup
function BaseScence:onCleanup()
    rmgr:removeUnusedTextures()
end

return BaseScence

