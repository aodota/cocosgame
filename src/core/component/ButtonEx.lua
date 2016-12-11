local Button = ccui.Button

local longPressCheckInterval = 0.1

--------------------------------
-- 构造函数
-- @function [parent=#Button] onTouch
function Button.onTouch(target, event)
    if event == ccui.TouchEventType.began then
        target:setScale(1.2)

        -- 处理长按事件
        if target.longPressListener then
            target.tick = 0
            target.ended = false
            target.longPress = false
            target.longPressTrigger = false
            target.scheduler = scheduler.scheduleGlobal(handler(target, target.onLongPress), longPressCheckInterval)
        end
    elseif event == ccui.TouchEventType.canceled or event == ccui.TouchEventType.ended then
        target:setScale(1)
        
        -- 结束点击，取消全局监听器
        if target.scheduler then
            target.ended = true
            target.longPress = false
            scheduler.unscheduleGlobal(target.scheduler)
        end
    end
end

--------------------------------
-- 处理长按事件
-- @function [parent=#Button] onLongPress
function Button:onLongPress()
    if not self.ended and self.longPressListener then
        self.tick = self.tick + longPressCheckInterval
        if self.tick >= self.longPressInterval then
            self.longPress = true
            self.longPressTrigger = true
            self.longPressListener()
        end
    end
end


--------------------------------
-- 添加长按监听事件
-- @function [parent=#Button] addLongPressEventListener
function Button:addLongPressEventListener(listener, interval)
    interval = interval or 1
    self.longPressListener = listener
    self.longPressInterval = interval
end