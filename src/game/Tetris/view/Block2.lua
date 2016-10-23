--
-- User: wangys
-- BaseBlock 俄罗斯方块 - 方块2
--   | 3 | 4 |   |
--   | 1 | 2 |   |
--   |   |   |   |



local BaseBlock = import(".BaseBlock")

local Block2 = class("Block2", BaseBlock)


--------------------------------
-- 构造函数
-- @function [parent=#Block2] ctor
function Block2:ctor(angle, min, max)
    BaseBlock.ctor(self, 2, angle, min, max)
    self.offsetRight = 30

    self:createBlock()
    self:rotation()
end

--------------------------------
-- 创建Block
-- @function [parent=#Block2] createBlock
function Block2:createBlock()
    local bg = cc.Sprite:create() -- cc.LayerColor:create(ccc4(0xFF, 0x00, 0x00, 0x80), 60, 60) -- --
    bg:setContentSize(cc.size(60,60))
    bg:setAnchorPoint(0, 0)

    local sprite1 = cc.Sprite:create('tetris/fangkuai.png')
    local sprite2 = cc.Sprite:create('tetris/fangkuai.png')
    local sprite3 = cc.Sprite:create('tetris/fangkuai.png')
    local sprite4 = cc.Sprite:create('tetris/fangkuai.png')

    sprite1:setPosition(cc.p(0, 0))
    sprite1:setAnchorPoint(cc.p(0, 0))

    sprite2:setPosition(cc.p(30, 0))
    sprite2:setAnchorPoint(cc.p(0, 0))

    sprite3:setPosition(cc.p(0, 30))
    sprite3:setAnchorPoint(cc.p(0, 0))

    sprite4:setPosition(cc.p(30, 30))
    sprite4:setAnchorPoint(cc.p(0, 0))

    bg:addChild(sprite1)
    bg:addChild(sprite2)
    bg:addChild(sprite3)
    bg:addChild(sprite4)
    self:addChild(bg)
    self.width = 60

    self.sprite1 = sprite1
    self.sprite2 = sprite2
    self.sprite3 = sprite3
    self.sprite4 = sprite4

    return rtnSprite
end


--------------------------------
-- 进行翻转
-- @function [parent=#Block2] rotation
function Block2:rotation()
    if self.angle < 0 then
        self.angle = 0
        return
    end
    
    return
end



return Block2