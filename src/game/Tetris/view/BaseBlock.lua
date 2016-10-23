--
-- User: wangys
-- BaseBlock 俄罗斯方块 - 基础方块
local BaseBlock = class("BaseBlock", cc.Node)


--------------------------------
-- 构造函数
-- @function [parent=#BaseBlock] ctor
function BaseBlock:ctor(blockType, angle, min, max)
    self.blockType = blockType
    self.angle = angle - 90
    self.offsetLeft = 0
    self.offsetRight = 0
    self.min = min
    self.max = max
end

--------------------------------
-- 修正位置
-- @function [parent=#BaseBlock] fixPosition
function BaseBlock:fixPosition() 
    local x, y = self:getPosition()
    local max = self.max + self.offsetRight
    local min = (self.min + self.offsetLeft)

    if x > max then
        self:setPosition(max, y)
    elseif x < min then
        self:setPosition(min, y)
    end
end

--------------------------------
-- 处理左移动
-- @function [parent=#BaseBlock] handleLeft
function BaseBlock:handleLeft()
    local x, y = self:getPosition()
    log:info("handleLeft x:%s, y:%s, offsetX:%s", x, y, self.offsetLeft)
    x = x - 30
    local min = (self.min + self.offsetLeft)
    -- if min > self.min then
    --     min = self.min
    -- end
    
    if x < min then
        x = min
    end
    self:setPosition(cc.p(x, y))
end

--------------------------------
-- 处理右移动
-- @function [parent=#BaseBlock] handleRight
function BaseBlock:handleRight()
    local x, y = self:getPosition()
    log:info("handleRight x:%s, y:%s, offsetX:%s", x, y, self.offsetRight)
    x = x + 30
    local max = self.max + self.offsetRight
    -- if max < self.max then
    --     max = self.max
    -- end

    if x > max  then
        x = max
    end
    self:setPosition(cc.p(x, y))
end

--------------------------------
-- 处理向下
-- @function [parent=#BaseBlock] checkDown
function BaseBlock:checkDown(grids)
    -- 计算需要占用的格子
    array = {}
    local x, y = self.sprite1:getPosition()
    table.insert(array, {x / 30, y / 30, self.sprite1})

    x, y = self.sprite2:getPosition()
    table.insert(array, {x / 30, y / 30, self.sprite2})

    x, y = self.sprite3:getPosition()
    table.insert(array, {x / 30, y / 30, self.sprite3})

    x, y = self.sprite4:getPosition()
    table.insert(array, {x / 30, y / 30, self.sprite4})
    
    local minx = 0
    local miny = 0
    for _, value in pairs(array) do
        if value[1] < minx then
            minx = value[1]
        end
        if value[2] < miny then
            miny = value[2]
        end
    end
    local offsetX = 0
    local offsetY = 0
    if minx < 0 then
        offsetX = -minx
    end
    if miny < 0 then
        offsetY = -miny
    end
    if offsetX > 0 or offsetY > 0 then
        for _, value in pairs(array) do
            value[1] = value[1] + offsetX
            value[2] = value[2] + offsetY
        end
    end

    x, y = self:getPosition()
    local gridX = x / 30 + 1
    local gridY = y / 30 + 1 + miny
    if gridY <= 1 then
        return true
    end
    log:info("checkDown, gridY:%s, gridX:%s", gridY, gridX)
    for i = gridY, #grids do
        fit = true
        for _, value in pairs(array) do
            log:info("checkDown grid y:%s, x:%s", i + value[2], gridX + value[1])
            if grids[i + value[2]] ~= nil and grids[i + value[2]][gridX + value[1]] ~= 0 then
                return true
            end
        end
    end

    return false
end

--------------------------------
-- 处理向下
-- @function [parent=#BaseBlock] handleDown
function BaseBlock:handleDown(grids)
    -- 计算需要占用的格子
    array = {}
    local x, y = self.sprite1:getPosition()
    table.insert(array, {x / 30, y / 30, self.sprite1})

    x, y = self.sprite2:getPosition()
    table.insert(array, {x / 30, y / 30, self.sprite2})

    x, y = self.sprite3:getPosition()
    table.insert(array, {x / 30, y / 30, self.sprite3})

    x, y = self.sprite4:getPosition()
    table.insert(array, {x / 30, y / 30, self.sprite4})
    
    local minx = 0
    local miny = 0
    for _, value in pairs(array) do
        if value[1] < minx then
            minx = value[1]
        end
        if value[2] < miny then
            miny = value[2]
        end
    end
    local offsetX = 0
    local offsetY = 0
    if minx < 0 then
        offsetX = -minx
    end
    if miny < 0 then
        offsetY = -miny
    end
    if offsetX > 0 or offsetY > 0 then
        for _, value in pairs(array) do
            value[1] = value[1] + offsetX
            value[2] = value[2] + offsetY
        end
    end

    x, y = self:getPosition()
    local gridX = x / 30 + 1
    
    local gridY = 1
    local fit  = false
    for i = 1, #grids do
        gridY = i
        fit = true
        for _, value in pairs(array) do
            log:info("check grid y:%s, x:%s, block:%s", gridY + value[2], gridX + value[1], grids[gridY + value[2]][gridX + value[1]])
            if grids[gridY + value[2]][gridX + value[1]] ~= 0 then
                fit = false
                break
            end
        end
        if fit then
            break
        end
    end

    if fit then
        for _, value in pairs(array) do
            log:info("fill grid y:%s, x:%s", gridY + value[2], gridX + value[1])
            grids[gridY + value[2]][gridX + value[1]] = value[3]
        end
        self:setPosition(cc.p(x, (gridY + offsetY - 1) * 30))
        return true
    end

    return false
end



return BaseBlock