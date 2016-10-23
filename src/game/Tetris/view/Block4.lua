--
-- User: wangys
-- BaseBlock 俄罗斯方块 - 方块4
--   |   | 4 |   |   |
--   |   | 3 |   |   |
--   | 1 | 2 |   |   |
--   |   |   |   |   |

--   |   |   |   |   |
--   |   | 1 |   |   |
--   |   | 2 | 3 | 4 |
--   |   |   |   |   |

--   |   |   |   |   |
--   |   |   |   |   |
--   |   | 2 | 1 |   |
--   |   | 3 |   |   |
--   |   | 4 |   |   |

--   |   |   |   |   |
--   |   |   |   |   |
--   |4  | 3 | 2 |   |
--   |   |   | 1 |   |
--   |   |   |   |   |


local BaseBlock = import(".BaseBlock")

local Block4 = class("Block4", BaseBlock)


--------------------------------
-- 构造函数
-- @function [parent=#Block4] ctor
function Block4:ctor(angle, min, max)
    BaseBlock.ctor(self, 4, angle, min, max)
    self.max = self.max + 30

    self:createBlock()
    self:rotation()
end

--------------------------------
-- 创建Block
-- @function [parent=#Block4] createBlock
function Block4:createBlock()
    local bg = cc.Sprite:create()--cc.LayerColor:create(ccc4(0xFF, 0x00, 0x00, 0x80), 60, 90)
    bg:setContentSize(cc.size(60,90))
    bg:setAnchorPoint(0, 0)
    
    local sprite1 = cc.Sprite:create('tetris/fangkuai.png')
    local sprite2 = cc.Sprite:create('tetris/fangkuai.png')
    local sprite3 = cc.Sprite:create('tetris/fangkuai.png')
    local sprite4 = cc.Sprite:create('tetris/fangkuai.png')

    sprite1:setPosition(cc.p(0, 0))
    sprite1:setAnchorPoint(cc.p(0, 0))

    sprite2:setPosition(cc.p(30, 0))
    sprite2:setAnchorPoint(cc.p(0, 0))

    sprite3:setPosition(cc.p(30, 30))
    sprite3:setAnchorPoint(cc.p(0, 0))

    sprite4:setPosition(cc.p(30, 60))
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
-- @function [parent=#Block4] rotation
function Block4:rotation()
    if self.angle < 0 then
        self.angle = 0
        return
    end

    if self.angle == 0 then
        self.angle = 90
        self.sprite1:setPosition(cc.p(0, 30))
        self.sprite2:setPosition(cc.p(0, 0))
        self.sprite3:setPosition(cc.p(30, 0))
        self.sprite4:setPosition(cc.p(60, 0))
        self.offsetLeft = 0
        self.offsetRight = -30
    elseif self.angle == 90 then
        self.angle = 180
        self.sprite1:setPosition(cc.p(30, 60))
        self.sprite2:setPosition(cc.p(0, 60))
        self.sprite3:setPosition(cc.p(0, 30))
        self.sprite4:setPosition(cc.p(0, 0))
    elseif self.angle == 180 then
        self.angle = 270
        self.sprite1:setPosition(cc.p(30, 0))
        self.sprite2:setPosition(cc.p(30, 30))
        self.sprite3:setPosition(cc.p(0, 30))
        self.sprite4:setPosition(cc.p(-30, 30))
        self.offsetLeft = 30
        self.offsetRight = 0
    elseif self.angle == 270 then
        self.angle = 0
        self.sprite1:setPosition(cc.p(0, 0))
        self.sprite2:setPosition(cc.p(30, 0))
        self.sprite3:setPosition(cc.p(30, 30))
        self.sprite4:setPosition(cc.p(30, 60))
        self.offsetLeft = 0
        self.offsetRight = 0
    end

    self:fixPosition()
    
end



return Block4