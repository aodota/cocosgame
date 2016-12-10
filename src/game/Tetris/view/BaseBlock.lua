--
-- User: wangys
-- BaseBlock 俄罗斯方块 - 基础方块
local BaseBlock = class("BaseBlock", cc.Node)


--------------------------------
-- 构造函数
-- @function [parent=#BaseBlock] ctor
function BaseBlock:ctor(blockType, angle, min, max)
    self.blockWidth = 27
    self.blockType = blockType
    self.angle = angle - self.blockWidth * 3
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
    local min = self.min + self.offsetLeft

    if x > max then
        self:setPosition(max, y)
    elseif x < min then
        self:setPosition(min, y)
    end
end


--------------------------------
-- 设置透明度
-- @function [parent=#BaseBlock] setOpacity
function BaseBlock:setOpacity(opacity) 
    self.sprite1:setOpacity(opacity)
    self.sprite2:setOpacity(opacity)
    self.sprite3:setOpacity(opacity)
    self.sprite4:setOpacity(opacity)
end

--------------------------------
-- 修正位置
-- @function [parent=#BaseBlock] fixPosition
function BaseBlock:doRotation(grids)
    self._angle = self.angle
    self:rotation()

    if self:checkCollision(grids) then
        -- 旋转导致了重叠，旋转回来
        if self._angle == 0 then
            self.angle = 270
        else
            self.angle = self._angle - self.blockWidth * 3
        end
        self:rotation()
    end
end

--------------------------------
-- 处理左移动
-- @function [parent=#BaseBlock] handleLeft
function BaseBlock:handleLeft(grids)
    local x, y = self:getPosition()
    local sx, sy = x, y
    log:info("handleLeft x:%s, y:%s, offsetX:%s, angle:%s", x, y, self.offsetLeft, self.angle)
    x = x - self.blockWidth
    local min = (self.min + self.offsetLeft)
    -- if min > self.min then
    --     min = self.min
    -- end
    
    if x < min then
        x = min
    end
    self:setPosition(cc.p(x, y))
    if self:checkCollision(grids) then
        -- 不可以移动了
        self:setPosition(cc.p(sx, sy))
    end
end

--------------------------------
-- 处理右移动
-- @function [parent=#BaseBlock] handleRight
function BaseBlock:handleRight(grids)
    local x, y = self:getPosition()
    local sx, sy = x, y
    log:info("handleRight x:%s, y:%s, offsetX:%s, angle:%s", x, y, self.offsetRight, self.angle)
    x = x + self.blockWidth
    local max = self.max + self.offsetRight
    -- if max < self.max then
    --     max = self.max
    -- end

    if x > max  then
        x = max
    end
    
    self:setPosition(cc.p(x, y))
    if self:checkCollision(grids) then
        -- 不可以移动了
        self:setPosition(cc.p(sx, sy))
    end
end

--------------------------------
-- 处理向下
-- @function [parent=#BaseBlock] checkDown
function BaseBlock:checkDown(grids)
    -- 计算需要占用的格子
    array = {}
    local x, y = self.sprite1:getPosition()
    table.insert(array, {x / self.blockWidth, y / self.blockWidth, self.sprite1})

    x, y = self.sprite2:getPosition()
    table.insert(array, {x / self.blockWidth, y / self.blockWidth, self.sprite2})

    x, y = self.sprite3:getPosition()
    table.insert(array, {x / self.blockWidth, y / self.blockWidth, self.sprite3})

    x, y = self.sprite4:getPosition()
    table.insert(array, {x / self.blockWidth, y / self.blockWidth, self.sprite4})
    
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
    local gridX = x / self.blockWidth + 1 + minx
    local gridY = y / self.blockWidth + miny
    if gridY < 1 then
        return true
    end
    -- log:info("checkDown, gridY:%s, gridX:%s", gridY, gridX)
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
-- @function [parent=#BaseBlock] checkCollision
function BaseBlock:checkCollision(grids)
    -- 计算需要占用的格子
    array = {}
    local x, y = self.sprite1:getPosition()
    table.insert(array, {x / self.blockWidth, y / self.blockWidth, self.sprite1})

    x, y = self.sprite2:getPosition()
    table.insert(array, {x / self.blockWidth, y / self.blockWidth, self.sprite2})

    x, y = self.sprite3:getPosition()
    table.insert(array, {x / self.blockWidth, y / self.blockWidth, self.sprite3})

    x, y = self.sprite4:getPosition()
    table.insert(array, {x / self.blockWidth, y / self.blockWidth, self.sprite4})
    
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
    local gridX = x / self.blockWidth + 1 + minx
    local gridY = y / self.blockWidth + 1 + miny


    for _, value in pairs(array) do
        log:info("checkCollision grid y:%s, x:%s", gridY + value[2], gridX + value[1])
        if grids[gridY + value[2]] ~= nil and grids[gridY + value[2]][gridX + value[1]] ~= 0 then
            return true
        end
    end

    return false
end

--------------------------------
-- 处理向下
-- @function [parent=#BaseBlock] handleDown
function BaseBlock:handleDown(grids, simulate)
    -- 计算需要占用的格子
    array = {}
    local x, y = self.sprite1:getPosition()
    table.insert(array, {x / self.blockWidth, y / self.blockWidth, self.sprite1})

    x, y = self.sprite2:getPosition()
    table.insert(array, {x / self.blockWidth, y / self.blockWidth, self.sprite2})

    x, y = self.sprite3:getPosition()
    table.insert(array, {x / self.blockWidth, y / self.blockWidth, self.sprite3})

    x, y = self.sprite4:getPosition()
    table.insert(array, {x / self.blockWidth, y / self.blockWidth, self.sprite4})
    
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
    local gridX = x / self.blockWidth + 1 + minx
    local gridY = 1
    local fit  = false
    for i = 1, #grids do
        gridY = i
        fit = true
        for _, value in pairs(array) do
            -- log:info("check grid y:%s, x:%s, block:%s", gridY + value[2], gridX + value[1], grids[gridY + value[2]][gridX + value[1]])
            if grids[gridY + value[2]] ~= nil and grids[gridY + value[2]][gridX + value[1]] ~= 0 then
                fit = false
                break
            end
        end
        if fit then
            break
        end
    end

    if fit then
        if not simulate then
            for _, value in pairs(array) do
                if grids[gridY + value[2]] == nil then
                    return false
                end
                log:info("fill grid y:%s, x:%s", gridY + value[2], gridX + value[1])
                grids[gridY + value[2]][gridX + value[1]] = value[3]
            end
        end
        self:setPosition(cc.p(x, (gridY + offsetY - 1) * self.blockWidth))
        return true
    end

    return false
end



return BaseBlock