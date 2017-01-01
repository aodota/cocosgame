--
-- Created by IntelliJ IDEA.
-- User: wangys
-- Date: 2016/12/28
-- Time: 19:13
-- To change this template use File | Settings | File Templates.
-- 固定帧率scheduler

-- 定时任务
local ScheduleTask = class("ScheduleTask")

--------------------------------
-- 构造函数
-- @function [parent=#ScheduleTask] ctor
function ScheduleTask:ctor(callback, dt)
    self.dt = dt
    self.callback = callback
    self.gameTime = 0
end

--------------------------------
-- 更新函数
-- @function [parent=#ScheduleTask] update
function ScheduleTask:update(dt, callbackdt)
    self.gameTime = self.gameTime + dt
    if self.gameTime >= self.dt then
        self.gameTime = self.gameTime - self.dt
        self.callback(callbackdt)
    end
end

--------------------------------
-- 重置GameTime
-- @function [parent=#ScheduleTask] resetGameTime
function ScheduleTask:resetGameTime()
    self.gameTime = 0
end

-- 固定帧率定时器
local fixscheduler = class("fixscheduler")

--------------------------------
-- 构造函数
-- @function [parent=#fixscheduler] ctor
function fixscheduler:ctor(dt)
    self.dt = dt * 1000
    self.callbackdt = dt
    self.gameTime = 0
    self.currTime = cc.Util:getCurrentTime()
    self.scheduler = scheduler.scheduleUpdateGlobal(handler(self, self.update))
    self.schedulers = {}
    self.timeScale = 1
end

--------------------------------
-- 添加定时任务
-- @function [parent=#fixscheduler] scheduleTask
function fixscheduler:scheduleTask(callback, interval)
    interval = interval or self.callbackdt
    local _interval = interval * 1000
    _interval = math.max(self.dt, _interval)

    local task = ScheduleTask.new(callback, _interval)
    table.insert(self.schedulers, task)
    return task
end

--------------------------------
-- 移除定时任务
-- @function [parent=#fixscheduler] unscheduleTask
function fixscheduler:unscheduleTask(task)
    for index, value in pairs(self.schedulers) do
        if value == task then
            table.remove(self.schedulers, index)
            break
        end
    end

end

--------------------------------
-- 更新操作
-- @function [parent=#fixscheduler] update
function fixscheduler:update()
    local currTime = cc.Util:getCurrentTime()
    local _dt = currTime - self.currTime
    self.gameTime = self.gameTime + (_dt * self.timeScale)

    if (self.gameTime >= self.dt) then
        self.gameTime = self.gameTime - self.dt
        self:doUpdate(self.dt * self.timeScale, self.callbackdt)
    end
    self.currTime = currTime
end

--------------------------------
-- 执行更新操作
-- @function [parent=#fixscheduler] doUpdate
function fixscheduler:doUpdate(dt, callbackdt)
    for _, task in pairs(self.schedulers) do
        task:update(dt, callbackdt)
    end
end

--------------------------------
-- 设置加速
-- @function [parent=#fixscheduler] setTimeScale
function fixscheduler:setTimeScale(scale)
    self.timeScale = scale
    self.gameTime = 0
    for _, task in pairs(self.schedulers) do
        task:resetGameTime()
    end
end

function fixscheduler:destroy()
    scheduler.unscheduleGlobal(self.scheduler)
end

return fixscheduler