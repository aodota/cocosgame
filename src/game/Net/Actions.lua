--
-- Created by IntelliJ IDEA.
-- User: wangys
-- Date: 2016/12/28
-- Time: 13:54
-- To change this template use File | Settings | File Templates.
-- 网络定义模块
local Action = class("Action")

--------------------------------
-- 构造函数
-- @function [parent=#Action] ctor
function Action:ctor(command, args)
    self.command = command
    self.args = args
end

-- 暴露actions
cc.exports.actions = {}

-- 获取用户信息
actions.getPlayerInfo = Action.new("player@getPlayerInfo", "")
actions.joinFight = Action.new("fight@join", "")
actions.cancelFight = Action.new("fight@cancel", "")
actions.quitFight = Action.new("fight@quit", "")
actions.readyFight = Action.new("fight@ready", "")
actions.addInputFight = Action.new("fight@addInput", "frameNum=%s&keyCode=%s")

actions.PUSH_FIGHT = "push@fight"




