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
    self.fixTime = 0
    self.currTime = cc.Util:getCurrentTime()
    self.scheduler = scheduler.scheduleUpdateGlobal(handler(self, self.update))
    self.schedulers = {}
    self.timeScale = 1
    self.frameNum = 0
    self.serverFrameNum = 0
    self.serverFrame = {}
    self.serverFrameHandler = nil
    self.fillFrame = 0 -- 补充帧
    self.fixTimeScale = 1
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
-- 添加网络帧handler
-- @function [parent=#fixscheduler] addServerFrameHandler
function fixscheduler:addServerFrameHandler(handler)
    self.serverFrameHandler = handler
end

--------------------------------
-- 更新网络帧频
-- @function [parent=#fixscheduler] updateServerFrameNum
function fixscheduler:updateServerFrameNum(frameNum)
    self.serverFrameNum = frameNum
    if self.timeScale > 1 and self.serverFrameNum > 0 then
        self.fillFrame = self.timeScale - 1
    end
end

--------------------------------
-- 添加网络帧内容
-- @function [parent=#fixscheduler] addServerFrame
function fixscheduler:addServerFrame(frameNum, event)
    if self.serverFrameHandler == nil then
        return
    end

    if not self.serverFrame[frameNum] then
        self.serverFrame[frameNum] = {}
    end
    table.insert(self.serverFrame[frameNum], event)
    if event.protoId == 1 and event.keyCode == 100 then
        log:info("addServerFrame keyCode 100 frameNum:%s, localFrameNum:%s", frameNum, self.frameNum)
    end
end

--------------------------------
-- 更新操作
-- @function [parent=#fixscheduler] update
function fixscheduler:update()
    if self.serverFrameNum ~= -1 
        and self.frameNum >= self.serverFrameNum
        and self.fillFrame <= 0 then
         -- 等待网络帧频
         self.currTime = cc.Util:getCurrentTime()
         self.gameTime = self.dt
         self.fixTime = self.dt
         return
    end

    local currTime = cc.Util:getCurrentTime()
    local _dt = currTime - self.currTime
    local timeScale = self.timeScale * self.fixTimeScale

    self.gameTime = self.gameTime + (_dt * timeScale) -- 显示帧率
    self.fixTime = self.fixTime + (_dt * self.fixTimeScale) -- 固定帧率

    if (self.gameTime >= self.dt) then
        -- 补充帧处理
        if self.fillFrame > 0 then
            self.fillFrame = self.fillFrame - 1
        end
        self.gameTime = self.gameTime - self.dt

        -- 本地帧 + 1
        if self.fixTime >= self.dt and self.frameNum < self.serverFrameNum then
            self.frameNum = self.frameNum + 1
            self.fixTime = self.fixTime - self.dt
        end
        
        -- if self.fillFrame > 0 then
            -- log:info("update frame serverFrameNum:%s, localFrameNum:%s, fillFrame:%s", self.serverFrameNum, self.frameNum, self.fillFrame)
        -- end
        -- 帧循环
        self:doUpdate(self.dt * timeScale, self.callbackdt)

        -- 处理服务器网络返回
        self:doServerFrame()
    end
    self.currTime = currTime

    -- 加速追帧
    local diff = self.serverFrameNum - self.frameNum
    if diff > 1 then
        log:info("frame diff :%s", diff)
        log:info("update frame serverFrameNum:%s, localFrameNum:%s, fillFrame:%s", self.serverFrameNum, self.frameNum, self.fillFrame)
    end
    -- if diff < 4 then
    --     self.fixTimeScale = 1
    -- else
    --     self.fixTimeScale = 5
    -- end
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
-- 处理网络帧
-- @function [parent=#fixscheduler] doServerFrame
function fixscheduler:doServerFrame()
    if nil == self.serverFrameHandler then
        return
    end

    local eventList = self.serverFrame[self.frameNum]
    if nil ~= eventList then
        self.serverFrameHandler(eventList)
    end
    self.serverFrame[self.frameNum] = {}
end

--------------------------------
-- 设置加速
-- @function [parent=#fixscheduler] setTimeScale
function fixscheduler:setTimeScale(scale)
    self.timeScale = scale
    self.gameTime = 0
    self.fillFrame = 0
    for _, task in pairs(self.schedulers) do
        task:resetGameTime()
    end
end

function fixscheduler:destroy()
    scheduler.unscheduleGlobal(self.scheduler)
end

return fixscheduler