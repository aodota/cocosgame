--
-- Created by IntelliJ IDEA.
-- User: wangys
-- Date: 2015/7/27
-- Time: 16:44
-- To change this template use File | Settings | File Templates.
-- BaseView 除Scene之外的显示场景

local BaseView = class("BaseView", cc.Node)

--------------------------------
-- 构造函数
-- @function [parent=#BaseView] ctor
-- @param Scene scene 场景
-- @param string name View名称
function BaseView:ctor(scene, name, args)
    self:enableNodeEvents()
    self.scene = scene
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
-- 获取View名称
-- @function [parent=#BaseView] getName
function BaseView:getName()
    return self.name
end

--------------------------------
-- 获取View名称
-- @function [parent=#BaseView] getName
function BaseView:getScene()
    return self.scene
end


--------------------------------
-- 添加到指定层级
-- @function [parent=#BaseView] addTo
function BaseView:addTo(layerName)
    self:setVisible(true)
    self.scene:addObject(self, layerName)
end

--------------------------------
-- 显示出来
-- @function [parent=#BaseView] show
function BaseView:show(layerName)
    self:setVisible(true)
    self.scene:addObject(self, layerName)
end

--------------------------------
-- 显示出来
-- @function [parent=#BaseView] showWithUI
function BaseView:showWithUI()
    self:setVisible(true)
    self.scene:addObject(self, "ui")
end

return BaseView

