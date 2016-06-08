local Button = ccui.Button

--------------------------------
-- 构造函数
-- @function [parent=#Button] onTouch
function Button.onTouch(target, event)
    if event == ccui.TouchEventType.began then
        target:setScale(1.2)
    elseif event == ccui.TouchEventType.canceled or event == ccui.TouchEventType.ended then
        target:setScale(1)
    end
end