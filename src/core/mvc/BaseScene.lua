--
-- Created by IntelliJ IDEA.
-- User: wangys
-- Date: 2015/7/27
-- Time: 16:44
-- To change this template use File | Settings | File Templates.
-- BaseScene 基础Scene，其他Scence应该继承自它

local BaseScene = class("BaseScene", cc.Node)

--------------------------------
-- 构造函数
-- @function [parent=#BaseScene] ctor
-- @param App app 应用对象，全局单例
-- @param string name 场景名称
function BaseScene:ctor(app, name, args)
    log:debug("enter %s curr resource info:\n%s", name, rmgr:getCachedTextureInfo())
    log:info("enterScene name:%s, args:%s", name, args)
    self:enableNodeEvents()
    self.app = app
    self.name = name
    self.args = args
    self.panelStack = {}

    -- 调用init方法
    self:init()

    -- 调用onCreate方法
    if self.onCreate then
        self:onCreate(unpack(args))
    end
end

--------------------------------
-- 初始化方法
-- @function [parent=#BaseScene] init
function BaseScene:init()
    -- 初始化层次
    for key, value in pairs(layers) do
        local layer = cc.Layer:create()
        self:addChild(layer, value * 100, value)
    end
end


--------------------------------
-- 获取指定Layer
-- @param string layer layer名称
-- @function [parent=#BaseScene] getLayer
function BaseScene:getLayer(layerName)
    if layers[layerName] then
        return self:getChildByTag(layers[layerName])
    else
        log:error("找不到%s层", layerName)
    end
end

--------------------------------
-- 打开指定面板，该动作会清空Panel堆栈中所有Panel
-- @param string panelName Panel面板名称
-- @function [parent=#BaseScene] openPanel
function BaseScene:openPanel(panelName, args)
    local panel = self:createPanel(panelName, "open", args)
    log:info("openPanel %s %s", panelName, panel)
    if panel then
        -- 关闭其他
        self:closeAllPanel()

        -- 显示
        panel:showWithUI()

        -- 压栈
        self:pushStack(panel)
    end
end

--------------------------------
-- 打开指定面板，该Panel置于栈顶
-- @param string panelName Panel面板名称
-- @function [parent=#BaseScene] pushPanel
function BaseScene:pushPanel(panelName, args)
    local panel = self:createPanel(panelName, "push", args)
    log:info("pushPanel %s %s", panelName, panel)
    if panel then
        -- 隐藏其他
        self:hideAllPanel()

        -- 显示
        panel:showWithUI()

        -- 压栈
        self:pushStack(panel)
    end
end

--------------------------------
-- 打开指定面板，该Panel置于栈顶
-- @param string panelName Panel面板名称
-- @function [parent=#BaseScene] pushPanel
function BaseScene:popAndPushPanel(panelName, args)
    local panel = self:createPanel(panelName, "push", args)
    log:info("popAndPushPanel %s %s", panelName, panel)
    if panel then
        -- 弹出顶栈
        self:popPanel()
        
        -- 隐藏其他
        self:hideAllPanel()

        -- 显示
        panel:showWithUI()

        -- 压栈
        self:pushStack(panel)
    end
end

--------------------------------
-- 移除栈顶面板
-- @function [parent=#BaseScene] popPanel
function BaseScene:popPanel(cleanup)
    cleanup = cleanup or true
    if #self.panelStack > 0 then
        -- 获取栈顶面板
        local topPanel = table.remove(self.panelStack, #self.panelStack)
        
        -- 移除
        topPanel:removeFromParent(cleanup)

        -- 显示新的栈顶面板
        topPanel = self:peekPanel()
        if topPanel then
            topPanel:setVisible(true)
        end
    end
end

--------------------------------
-- 获取栈顶面板
-- @function [parent=#BaseScene] peekPanel
function BaseScene:peekPanel()
    if #self.panelStack > 0 then
        return self.panelStack[#self.panelStack]
    end
end

--------------------------------
-- 关闭所有面板
-- @function [parent=#BaseScene] closeAllPanel
function BaseScene:closeAllPanel(cleanup)
    cleanup = cleanup or true
    for _, panel in pairs(self.panelStack) do
        panel:removeFromParent(cleanup)
    end
    self.panelStack = {}
end

--------------------------------
-- 关闭所有面板
-- @function [parent=#BaseScene] hideAllPanel
function BaseScene:hideAllPanel()
    for _, panel in pairs(self.panelStack) do
        panel:setVisible(false)
    end
end

--------------------------------
-- 关闭所有面板
-- @param userdata panel 面板
-- @function [parent=#BaseScene] pushStack
function BaseScene:pushStack(panel)
    table.insert(self.panelStack, panel)
end

--------------------------------
-- 构造函数
-- @param string panelName 场景名称
-- @param table args 参数
-- @function [parent=#BaseApp] createPanel
function BaseScene:createPanel(panelName, openMethod, args)
    local currPanel = self:peekPanel()
    local currPanelName = currPanel and currPanel:getName()
    if panelName ~= currPanelName then
        local packageName = ""
        if string.find(panelName, "%.") ~= nil then
            packageName = string.format("%s.%sPanel", self.app.scenesRoot, panelName)
        else
            packageName = string.format("%s.%s.view.%sPanel", self.app.scenesRoot, panelName, panelName)
        end
        local status, panel = xpcall(
            function()
                return require(packageName)
            end,
            function(msg)
                if not string.find(msg, string.format("'%s' not found:", packageName)) then
                    print("load view error: ", msg)
                end
            end
        )
        local t = type(panel)
        if status and (t == "table" or t == "userdata") then
            if panel.NeedLoading and currPanelName ~= "Loading" then
                -- 需要Loading
                local _args = {panel, panelName, openMethod, args}
                self:pushPanel("Loading", _args)
                return nil
            else
                -- 无需Loading
                return panel:create(self, panelName, checktable(args))
            end
        end
        
        return nil
    else
        log:error("已经在当前Panel中 %s", currPanelName)
    end
end

--------------------------------
-- 获取指定Layer
-- @param Node obj 显示对象
-- @param string layerName layer名称
-- @param int zorder z轴
-- @param int tag tag
-- @function [parent=#BaseScene] addObject
function BaseScene:addObject(obj, layerName, zorder, tag)
    zorder = zorder or 0
    tag = tag or 0

    local layer = self:getLayer(layerName)
    if layer and obj then
        layer:addChild(obj, zorder, tag)
    end
end

--------------------------------
-- 获取应用
-- @function [parent=#BaseScene] getApp
function BaseScene:getApp()
    return self.app
end

--------------------------------
-- 获取场景名称
-- @function [parent=#BaseScene] getName
function BaseScene:getName()
    return self.name
end


--------------------------------
-- 显示场景
-- @function [parent=#BaseScene] getName
function BaseScene:showWithScene(transition, time, more)
    self:setVisible(true)
    local scene = display.newScene(self.name)
    scene:addChild(self)
    display.runScene(scene, transition, time, more)
    
    return self
end

--------------------------------
-- 压入场景
-- @function [parent=#BaseScene] getName
function BaseScene:pushWithScene(transition, time, more)
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
-- @function [parent=#BaseScene] onCleanup
function BaseScene:onCleanup()
    rmgr:removeUnusedTextures()
end

--------------------------------
-- 资源清理
-- 传入一个<br/>
-- {
--   {type="plist", key="res.plist"},
--   {type="image", key="ui.png"}
--   ... ...
-- }<br/>
-- 支持的type有["plist", "plist_group", "image", "armature", "armature_group", "animation"]
-- @function [parent=#BaseScene] cleanResources
function BaseScene:cleanResources(resources)
    for _, res in pairs(resources) do
        if res.type == "plist_group" then
            rmgr:removeSpriteFramesByGroup(res.key)
        elseif res.type == "plist" then
            rmgr:removeSpriteFrames(res.key)
        elseif res.type == "image" then
            rmgr:removeTexture(res.key)
        elseif res.type == "armature" then
            rmgr:removeArmature(res.key)
        elseif res.type == "armature_group" then
            rmgr:removeArmatureByGroup(res.key)
        elseif res.type == "animation" then
            rmgr:removeAnimation(res.key)
        else
            log:warn("clean fail, unknow resource type %s key %s", res.type, res.key)
        end
    end
    rmgr:removeUnusedTextures()
end

return BaseScene

