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
    log:info("TetrisScene onCreate")
    local layout = require("layout.TetrisScene").create()
    self.btnLeft = layout['btn_left']
    self.btnShift = layout['btn_shift']
    self.btnRight = layout['btn_right']
    self.bg = layout['panel']
    self.nextBg = layout['next_bg']
    self.scoreText = layout['lb_score']
    self.btnPlay = layout['btn_play']
    self.btnDown = layout['btn_down']
    self.grids = {}
    self.id = 0
    self.blockMap = {}
    self.checkDownCount = 0 -- 计数器

    self:addObject(layout["root"], "scene")
    self.scoreText:setText("0")

    -- 添加事件
    self.btnShift:addClickEventListener(handler(self, self.handleShift))
    self.btnLeft:addClickEventListener(handler(self, self.handleLeft))
    self.btnRight:addClickEventListener(handler(self, self.handleRight))
    self.btnPlay:addClickEventListener(handler(self, self.playGame))
    self.btnDown:addClickEventListener(handler(self, self.handleDown))
    scheduler.scheduleGlobal(handler(self, self.doUpdate), 0.5)

    -- 初始化grid
    self:initGrid(397, 875)

    -- 初始化背景
    -- self.bg = cc.LayerColor:create(ccc4(0x9C, 0xA3, 0xFC, 0xCC), 479, 570)
    -- self.bg:setPosition(cc.p(display.cx / 2, 70))
    -- self:addChild(self.bg)

    -- 初始化方块
    self.blocks = {}
    self.angle = 0
    -- for i=1, 7 do
    --     local block = self:createRandomBlock(i)
    --     block:setPosition(cc.p(100 + (i - 1) * 150, 300))
    --     self:addChild(block)
    --     table.insert(self.blocks, block)
    -- end
    self.nextBlock = self:createRandomBlock()
    log:info("blockType:%s, contentSize:%s",self.nextBlock.blockType, self.nextBlock.width)
    self.nextBlock:setPosition(cc.p(60 - self.nextBlock.width / 2, 100))
    self.nextBg:addChild(self.nextBlock)

end

--------------------------------
-- 每一帧运行
-- @function [parent=#TetrisScene] playGame
function TetrisScene:doUpdate()
    if self.block ~= nil then
        local x, y = self.block:getPosition()
        if self.block:checkDown(self.grids) then
            self.checkDownCount = self.checkDownCount + 1
            log:info("doUpdate checkDownCount:%s", self.checkDownCount)
            if self.checkDownCount == 2 then
                -- 处理向下
                self:_handleDown(self.block, false)
                self.checkDownCount = 0
            end
        else
            self.block:setPosition(cc.p(x, y - 30))
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
    self.block = self:createBlock(self.nextBlock.blockType, self.nextBlock.angle)
<<<<<<< HEAD
    self.block:setPosition(cc.p(210, 870))
=======
    self.block:setPosition(cc.p(210, 480))

    self.vrblock = self:createBlock(self.nextBlock.blockType, self.nextBlock.angle)
    self.vrblock:setPosition(cc.p(210, 480))
    self.vrblock:setOpacity(125)
    self:_handleDown(self.vrblock, true)

>>>>>>> 9a5226322d76c276a2b2febf51b55507d9e562ce
    self.bg:addChild(self.block)
    self.bg:addChild(self.vrblock)

    self.nextBg:removeChild(self.nextBlock)
    self.nextBlock = self:createRandomBlock()
    self.nextBlock:setPosition(cc.p(60 - self.nextBlock.width / 2, 100))
    self.nextBg:addChild(self.nextBlock)
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
    self.scoreText:setText("0")
end

--------------------------------
-- 初始化Grid
-- @function [parent=#TetrisScene] initGrid
function TetrisScene:initGrid(width, height)
    local x = width / 30
    local y = height / 30
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
        self.vrblock:setPosition(cc.p(x, y))

        self.block:doRotation(self.grids)
        self.vrblock:doRotation(self.grids)
        self:_handleDown(self.vrblock, true)
        return
    end
    if self.block.angle == 0 then
        self.block:setRotation(90)
        self.block.angle = 90
    elseif self.block.angle == 90 then
        self.block:setRotation(180)
        self.block.angle = 180
    elseif self.block.angle == 180 then
        self.block:setRotation(270)
        self.block.angle = 270
    elseif self.block.angle == 270 then
        self.block:setRotation(0)
        self.block.angle = 0
    end
end

--------------------------------
-- 处理左移动
-- @function [parent=#TetrisScene] handleLeft
function TetrisScene:handleLeft()
    if self.block == nil then
        return
    end

    local x, y = self.block:getPosition()
    self.vrblock:setPosition(cc.p(x, y))

    self.block:handleLeft(self.grids)
    self.vrblock:handleLeft(self.grids)
    self:_handleDown(self.vrblock, true)
end

--------------------------------
-- 处理右移动
-- @function [parent=#TetrisScene] handleRight
function TetrisScene:handleRight()
    if self.block == nil then
        return
    end

    local x, y = self.block:getPosition()
    self.vrblock:setPosition(cc.p(x, y))

    self.block:handleRight(self.grids)
    self.vrblock:handleRight(self.grids)
    self:_handleDown(self.vrblock, true)
end

--------------------------------
-- 处理向下
-- @function [parent=#TetrisScene] handleDown
function TetrisScene:handleDown()
    if self.block == nil then
        return
    end

    self:_handleDown(self.block, false)
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
        self.scoreText:setText("GAME OVER")
        self.btnPlay:setVisible(true)
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
        for _, line in pairs(removeLines) do
            for i = 1, #self.grids[line] do
                -- log:info("remove block, y:%s , x:%s, block:%s", line, i, self.grids[line][i])
                self.grids[line][i]:removeFromParent()
                self.grids[line][i] = 0
            end
        end

        -- 处理上面的方块
        if maxLine ~= -1 then
            local removeNums = #removeLines
            for i = maxLine + 1, #self.grids do
                for j = 1, #self.grids[i] do
                    -- log:info("reset block, y:%s , x:%s, block:%s", i, j, self.grids[i][j])
                    if self.grids[i][j] ~= 0 then
                        local block = self.grids[i][j]
                        local x, y = block:getPosition()
                        block:setPosition(cc.p(x, y - 30 * removeNums))
                        self.grids[i][j] = 0
                        self.grids[i - removeNums][j] = block
                    end
                end           
            end
        end

        -- 随机下一个
        self.block = nil

        -- 移除vr
        self.vrblock:removeFromParent()
        self.vrblock = nil
        self:next()
    end

    
end

--------------------------------
-- 创建一个随机方块
-- @function [parent=#TetrisScene] createRandomBlock
function TetrisScene:createRandomBlock()
    local type = RandomUtil:nextInt(7)
    angleType = RandomUtil:nextInt(4)
    angle = 0
    if angleType == 1 then
        angle = 0
    elseif angleType == 2 then
        angle = 90
    elseif angleType == 3 then
        angle = 180
    else
        angle = 270
    end
    return self:createBlock(type, angle)
end

--------------------------------
-- 创建一个随机方块
-- @function [parent=#TetrisScene] createRandomBlock
function TetrisScene:createBlock(type, angle)
    local block = nil
    if type == 1 then
        block = Block1:create(angle, 0, 390)
    elseif type == 2 then
        block = Block2:create(angle, 0, 390)
    elseif type == 3 then
        block = Block3:create(angle, 0, 390)
    elseif type == 4 then
        block = Block4:create(angle, 0, 390)
    elseif type == 5 then
        block = Block5:create(angle, 0, 390)
    elseif type == 6 then
        block = Block6:create(angle, 0, 390)
    elseif type == 7 then
        block = Block7:create(angle, 0, 390)
    end
    -- block:setRotation(angle)

    return block
end

--------------------------------
-- 卸载资源
-- @function [parent=#TetrisScene] onExit
function TetrisScene:onExit()
    -- 卸载资源
end


return TetrisScene

