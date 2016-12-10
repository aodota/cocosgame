--
-- User: wangys
-- BaseBlock 俄罗斯方块 - 方块1
--   |   | 3 | 4 |
--   | 1 | 2 |   |
--   |   |   |   |

--   |   | 1 |   |
--   |   | 2 | 3 |
--   |   |   | 4 |

--   |   |   |   |
--   |   | 2 | 1 |
--   | 4 | 3 |   |


--   | 4 |   |   |
--   | 3 | 2 |   |
--   |   | 1 |   |


local BaseBlock = import(".BaseBlock")

local Block1 = class("Block1", BaseBlock)


--------------------------------
-- 构造函数
-- @function [parent=#Block1] ctor
function Block1:ctor(angle, min, max)
    BaseBlock.ctor(self, 1, angle, min, max)
    self:createBlock()
    self:rotation()
end

--------------------------------
-- 创建Block
-- @function [parent=#Block1] createBlock
function Block1:createBlock()
    local bg = cc.Sprite:create()--cc.LayerColor:create(ccc4(0xFF, 0x00, 0x00, 0x80), self.blockWidth * 3, self.blockWidth * 2)
    bg:setContentSize(cc.size(self.blockWidth * 3,self.blockWidth * 2))
    bg:setAnchorPoint(0, 0)

    local sprite1 = cc.Sprite:create('tetris/fangkuai.png')
    local sprite2 = cc.Sprite:create('tetris/fangkuai.png')
    local sprite3 = cc.Sprite:create('tetris/fangkuai.png')
    local sprite4 = cc.Sprite:create('tetris/fangkuai.png')

    sprite1:setPosition(cc.p(0, 0))
    sprite1:setAnchorPoint(cc.p(0, 0))

    sprite2:setPosition(cc.p(self.blockWidth, 0))
    sprite2:setAnchorPoint(cc.p(0, 0))

    sprite3:setPosition(cc.p(self.blockWidth, self.blockWidth))
    sprite3:setAnchorPoint(cc.p(0, 0))

    sprite4:setPosition(cc.p(self.blockWidth * 2, self.blockWidth))
    sprite4:setAnchorPoint(cc.p(0, 0))

    bg:addChild(sprite1)
    bg:addChild(sprite2)
    bg:addChild(sprite3)
    bg:addChild(sprite4)
    self:addChild(bg)
    self.width = self.blockWidth * 3

    self.sprite1 = sprite1
    self.sprite2 = sprite2
    self.sprite3 = sprite3
    self.sprite4 = sprite4

    return rtnSprite
end


--------------------------------
-- 进行翻转
-- @function [parent=#Block1] rotation
function Block1:rotation()
    if self.angle < 0 then
        self.angle = 0
        return
    end

    if self.angle == 0 then
        self.angle = self.blockWidth * 3
        self.sprite1:setPosition(cc.p(self.blockWidth, self.blockWidth))
        self.sprite3:setPosition(cc.p(self.blockWidth * 2, 0))
        self.sprite4:setPosition(cc.p(self.blockWidth * 2, -self.blockWidth))
        
        self.offsetLeft = -self.blockWidth
        self.offsetRight = 0
    elseif self.angle == self.blockWidth * 3 then
        self.angle = 180
        self.sprite1:setPosition(cc.p(0, 0))
        self.sprite3:setPosition(cc.p(self.blockWidth, self.blockWidth))
        self.sprite4:setPosition(cc.p(self.blockWidth * 2, self.blockWidth))

        self.offsetLeft = 0
        self.offsetRight = 0
    elseif self.angle == 180 then
        self.angle = 270
        self.sprite1:setPosition(cc.p(self.blockWidth, self.blockWidth))
        self.sprite3:setPosition(cc.p(self.blockWidth * 2, 0))
        self.sprite4:setPosition(cc.p(self.blockWidth * 2, -self.blockWidth))

        self.offsetLeft = -self.blockWidth
        self.offsetRight = 0
    elseif self.angle == 270 then
        self.angle = 0
        self.sprite1:setPosition(cc.p(0, 0))
        self.sprite3:setPosition(cc.p(self.blockWidth, self.blockWidth))
        self.sprite4:setPosition(cc.p(self.blockWidth * 2, self.blockWidth))

        self.offsetLeft = 0
        self.offsetRight = 0
    end

    self:fixPosition()
    
end



return Block1