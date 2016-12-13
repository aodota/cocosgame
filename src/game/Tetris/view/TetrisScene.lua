--
-- Created by IntelliJ IDEA.
-- User: wangys
-- Date: 2015/7/28
-- Time: 11:06
-- To change this template use File | Settings | File Templates.
-- TetrisScene 俄罗斯方块
local TetrisScene = class("TetrisScene", BaseScene)
local Block1 = import(".Block1")
local Block2 = import(".Block2")
local Block3 = import(".Block3")
local Block4 = import(".Block4")
local Block5 = import(".Block5")
local Block6 = import(".Block6")
local Block7 = import(".Block7")

--------------------------------
-- 创建方法
-- @function [parent=#TetrisScene] onCreate
function TetrisScene:onCreate()
    log:info("TetrisScene onCreate1112")
    local layout = require("layout.TetrisScene").create()
    self:fixLayout(layout)

    self.btnLeft = layout['btn_left']
    self.btnShift = layout['btn_shift']
    self.btnRight = layout['btn_right']
    self.bg = layout['tetris_bg']
    self.nextBg = layout['next_bg']
    self.scoreText = layout['lb_score']
    self.scoreHang = layout['lb_hang']
    self.btnPlay = layout['btn_play']
    self.btnDown = layout['btn_down']
    self.btnDownLow = layout['btn_down_low']
    self.grids = {}
    self.id = 0
    self.blockMap = {}
    self.checkDownCount = 0 -- 计数器
    self.blockWidth = 27
    self.fixPixel = 3
    self.gameOver = false
    self.hang = 0

    self:addObject(layout["root"], "scene")
    self.scoreText:setString("0")
    self.scoreHang:setString("0")

    -- 添加事件
    self.btnShift:addClickEventListener(handler(self, self.handleShift))
    -- self.btnShift:addLongPressEventListener(handler(self, self.handleShift), 0.1)

    self.btnLeft:addClickEventListener(handler(self, self.handleLeft))
    self.btnLeft:addLongPressEventListener(handler(self, self.handleLeft), 0.2)

    self.btnRight:addClickEventListener(handler(self, self.handleRight))
    self.btnRight:addLongPressEventListener(handler(self, self.handleRight), 0.2)

    self.btnPlay:addClickEventListener(handler(self, self.playGame))
    self.btnDown:addClickEventListener(handler(self, self.handleDown))

    self.btnDownLow:addClickEventListener(handler(self, self.handleDownLow))
    self.btnDownLow:addLongPressEventListener(handler(self, self.handleDownLow), 0.1)

    scheduler.scheduleGlobal(handler(self, self.doUpdate), 1)

    -- 初始化grid
    self:initGrid(378, 810)

    -- 初始化背景
    -- self.bg = cc.LayerColor:create(ccc4(0x9C, 0xA3, 0xFC, 0xCC), 479, 570)
    -- self.bg:setPosition(cc.p(display.cx / 2, 70))
    -- self:addChild(self.bg)

    -- 初始化方块
    self.blocks = {}
    self.angle = 0
    -- for i=1, 7 do
    --     local block = self:createRandomBlock(i)
    --     block:setPosition(cc.p(10 + (i - 1) * 150, 300))
    --     self.bg:addChild(block)
    --     table.insert(self.blocks, block)
    -- end
    self.nextBlock = self:createRandomBlock()
    -- 处理居中
    local offsetx, offsety = self.nextBlock:getOffset()
    self.nextBlock:setPosition(cc.p(offsetx + self.nextBlock.nextOffset, offsety))
    self.nextBg:addChild(self.nextBlock)


    -- 处理长按


end

--------------------------------
-- 每一帧运行
-- @function [parent=#TetrisScene] playGame
function TetrisScene:doUpdate()
    if self.gameOver or self.btnLeft.longPress or self.btnRight.longPress then
        return
    end

    if self.block ~= nil then
        local x, y = self.block:getPosition()
        if self.block:checkDown(self.grids) then
            self.checkDownCount = self.checkDownCount + 1
            if self.checkDownCount == 2 then
                -- 处理向下
                self:_handleDown(self.block, false)
                self.checkDownCount = 0
            end
        else
            self.block:setPosition(cc.p(x, y - self.blockWidth))
            self.checkDownCount = 0
        end
    end
end

--------------------------------
-- 开始游戏
-- @function [parent=#TetrisScene] playGame
function TetrisScene:playGame()
    self.btnPlay:setVisible(false)

    self:reset()
    self:next()
end

--------------------------------
-- 下一个方块
-- @function [parent=#TetrisScene] playGame
function TetrisScene:next() 
    self.block = self:createBlock(self.nextBlock.blockType, self.nextBlock.angle, self.nextBlock.pic)
    self.block:setPosition(cc.p(165, 759))

    -- self.vrblock = self:createBlock(self.nextBlock.blockType, self.nextBlock.angle, self.nextBlock.pic)
    -- self.vrblock:setPosition(cc.p(165, 3))
    -- self.vrblock:setOpacity(125)
    -- self:_handleDown(self.vrblock, true)

    self.bg:addChild(self.block)
    -- self.bg:addChild(self.vrblock)

    self.nextBg:removeChild(self.nextBlock)
    self.nextBlock = self:createRandomBlock()
    local offsetx, offsety = self.nextBlock:getOffset()
 
    self.nextBlock:setPosition(cc.p(offsetx + self.nextBlock.nextOffset, offsety))
    self.nextBg:addChild(self.nextBlock)

    self.btnShift.ended = true
    self.btnLeft.ended = true
    self.btnRight.ended = true
    self.btnDownLow.ended = true
    if self.downScheduler then
        scheduler.unscheduleGlobal(self.downScheduler)
        self.downScheduler = nil
        scheduler.setTimeScale(1)
    end
end

--------------------------------
-- 清理
-- @function [parent=#TetrisScene] reset
function TetrisScene:reset() 
    for i = 1, #self.grids do
        for j = 1, #self.grids[i] do
            if self.grids[i] ~= nil and self.grids[i][j] ~= 0 then
                self.grids[i][j]:removeFromParent()
                self.grids[i][j] = 0
            end
        end
    end
    if self.block ~= nil then
        self.block:removeFromParent()
        self.block = nil
    end
    if self.vrblock ~= nil then
        self.vrblock:removeFromParent()
        self.vrblock = nil
    end
    self.scoreText:setString("0")
    self.gameOver = false
end

--------------------------------
-- 初始化Grid
-- @function [parent=#TetrisScene] initGrid
function TetrisScene:initGrid(width, height)
    local x = width / self.blockWidth
    local y = height / self.blockWidth
    for i = 1, y do
        for j = 1, x do
            if self.grids[i] == nil then
                self.grids[i] = {}
            end
            table.insert(self.grids[i], 0)
        end
    end
end


--------------------------------
-- 处理翻转
-- @function [parent=#TetrisScene] handleShift
function TetrisScene:handleShift()
    if self.block == nil then
        return
    else
        local x, y = self.block:getPosition()
        -- self.vrblock:setPosition(cc.p(x, y))

        self.block:doRotation(self.grids)
        -- self.vrblock:doRotation(self.grids)
        -- self:_handleDown(self.vrblock, true)
        return
    end
    -- if self.block.angle == 0 then
    --     self.block:setRotation(self.blockWidth * 3)
    --     self.block.angle = self.blockWidth * 3
    -- elseif self.block.angle == self.blockWidth * 3 then
    --     self.block:setRotation(180)
    --     self.block.angle = 180
    -- elseif self.block.angle == 180 then
    --     self.block:setRotation(270)
    --     self.block.angle = 270
    -- elseif self.block.angle == 270 then
    --     self.block:setRotation(0)
    --     self.block.angle = 0
    -- end
end

--------------------------------
-- 处理左移动
-- @function [parent=#TetrisScene] handleLeft
function TetrisScene:handleLeft()
    if self.block == nil then
        return
    end

    local x, y = self.block:getPosition()
    -- self.vrblock:setPosition(cc.p(x, y))

    self.block:handleLeft(self.grids)
    -- self.vrblock:handleLeft(self.grids)
    -- self:_handleDown(self.vrblock, true)
end

--------------------------------
-- 处理右移动
-- @function [parent=#TetrisScene] handleRight
function TetrisScene:handleRight()
    if self.block == nil then
        return
    end

    local x, y = self.block:getPosition()
    -- self.vrblock:setPosition(cc.p(x, y))

    self.block:handleRight(self.grids)
    -- self.vrblock:handleRight(self.grids)
    -- self:_handleDown(self.vrblock, true)
end

--------------------------------
-- 处理极速下降
-- @function [parent=#TetrisScene] handleDown
function TetrisScene:handleDown()
    if self.block == nil then
        return
    end

    self:_handleDown(self.block, false)
    self:shake(self, 0.05)
end

--------------------------------
-- 处理加速下降
-- @function [parent=#TetrisScene] handleDownLow
function TetrisScene:handleDownLow()
    if self.downScheduler then
        scheduler.unscheduleGlobal(self.downScheduler)
        self.downScheduler = nil
        scheduler.setTimeScale(1) 
    elseif self.btnDownLow.ended and self.btnDownLow.longPressTrigger then
        return
    end

    -- 加速
    scheduler.setTimeScale(20)
    self.downInterval = 0

    -- 计时间
    self.downScheduler = scheduler.scheduleUpdateGlobal(function(dt) 
        self.downInterval = self.downInterval + dt
        if not self.btnDownLow.longPress and self.downInterval > 2 then
            scheduler.setTimeScale(1)
            scheduler.unscheduleGlobal(self.downScheduler)
            self.downScheduler = nil
        end
    end)
end

--------------------------------
-- 处理向下
-- @function [parent=#TetrisScene] _handleDown
function TetrisScene:_handleDown(block, simulate)
    if block == nil then
        return
    end

    -- 处理掉了
    if not block:handleDown(self.grids, simulate) and not simulate then
        self.btnPlay:setVisible(true)
        self.gameOver = true
    elseif not simulate then
        -- 消除判断
        local maxLine = -1
        local removeLines = {}
        for i = 1, #self.grids do
            local canRemove = true
            for j = 1, #self.grids[i] do
                -- log:info("remove check, y:%s , x:%s, block:%s", i, j, self.grids[i][j])
                if self.grids[i][j] == 0 then
                    canRemove = false
                    break
                end
            end
            if canRemove then
                table.insert(removeLines, i)
                maxLine = i
            end
        end

        -- 消除处理
        local removeBlocks = {}
        for _, line in pairs(removeLines) do
            for i = 1, #self.grids[line] do
                -- log:info("remove block, y:%s , x:%s, block:%s", line, i, self.grids[line][i])
                -- self.grids[line][i]:removeFromParent()
                table.insert(removeBlocks, self.grids[line][i])
                self.grids[line][i] = 0
            end
        end

        self.maxLine = maxLine
        self.removeLineNums = #removeLines
        self.callbackNums = #removeBlocks
        self.callbackCount = 0
        log:info("init remove callback callbackCount:%s, callbackNums:%s", self.callbackCount, self.callbackNums)

        -- 闪烁效果
        if #removeBlocks > 0 then
            scheduler.setTimeScale(1)
            if self.btnDownLow.longPress then
                self.btnDownLow.ended = true
            end
            local action = cc.Blink:create(0.8, 5)
            for _, block in pairs(removeBlocks) do
                local sequence = cc.Sequence:create(action:clone(), cc.CallFunc:create(handler(self, self.removeCallBack), {sender = block}))
                block:runAction(sequence)
            end
        end

        if #removeBlocks == 0 then
            self:removeCallBack()
        end
    end

    
end

function TetrisScene:removeCallBack(sender)
    log:info("remove callback sender:%s, callbackCount:%s, callbackNums:%s", sender, self.callbackCount, self.callbackNums)
    if sender then
        sender:removeFromParent()
    end

    self.callbackCount = self.callbackCount + 1
    if self.callbackCount < self.callbackNums then
        return
    end

    -- 处理上面的方块
    if self.maxLine ~= -1 then
        local removeLineNums = self.removeLineNums
        for i = self.maxLine + 1, #self.grids do
            for j = 1, #self.grids[i] do
                -- log:info("reset block, y:%s , x:%s, block:%s", i, j, self.grids[i][j])
                if self.grids[i][j] ~= 0 then
                    local block = self.grids[i][j]
                    local x, y = block:getPosition()
                    block:setPosition(cc.p(x, y - self.blockWidth * removeLineNums))
                    self.grids[i][j] = 0
                    self.grids[i - removeLineNums][j] = block
                end
            end           
        end
    end

    -- 随机下一个
    self.block = nil

    -- 移除vr
    -- self.vrblock:removeFromParent()
    -- self.vrblock = nil
    self:next()

    -- 更新分数
    self.hang = self.hang + self.removeLineNums
    self.scoreHang:setString(self.hang)
    self.scoreText:setString(self.hang * 10)

    self.maxLine = -1
    self.removeLineNums = 0
end

--------------------------------
-- 创建一个随机方块
-- @function [parent=#TetrisScene] createRandomBlock
function TetrisScene:createRandomBlock()
    local type = RandomUtil:nextInt(7)
    local angleType = 1 -- RandomUtil:nextInt(4)
    local pic = 'tetris/fangkuai' .. RandomUtil:nextInt(7) .. '.png'
    angle = 0
    if angleType == 1 then
        angle = 0
    elseif angleType == 2 then
        angle = self.blockWidth * 3
    elseif angleType == 3 then
        angle = 180
    else
        angle = 270
    end
    return self:createBlock(type, angle, pic)
end

--------------------------------
-- 创建一个随机方块
-- @function [parent=#TetrisScene] createRandomBlock
function TetrisScene:createBlock(type, angle, pic)
    local block = nil
    if type == 1 then
        block = Block1:create(angle, 3, 300, pic)
    elseif type == 2 then
        block = Block2:create(angle, 3, 300, pic)
    elseif type == 3 then
        block = Block3:create(angle, 3, 300, pic)
    elseif type == 4 then
        block = Block4:create(angle, 3, 300, pic)
    elseif type == 5 then
        block = Block5:create(angle, 3, 300, pic)
    elseif type == 6 then
        block = Block6:create(angle, 3, 300, pic)
    elseif type == 7 then
        block = Block7:create(angle, 3, 300, pic)
    end

    return block
end

--------------------------------
-- 卸载资源
-- @function [parent=#TetrisScene] onExit
function TetrisScene:onExit()
    -- 卸载资源
end

--------------------------------
-- 震屏效果
-- @function [parent=#TetrisScene] shake
function TetrisScene:shake(node, interval)
    local x, y = node:getPosition()
    local _interval = 0
    local schedulerHandle = nil
    schedulerHandle = scheduler.scheduleUpdateGlobal(function(dt) 
        _interval = _interval + dt
        if _interval < interval then
            node:setPosition(x, y - 400 * dt)
        else
            node:setPosition(x, y)
            scheduler.unscheduleGlobal(schedulerHandle)
        end
    end)

end


return TetrisScene

