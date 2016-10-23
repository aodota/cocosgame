--
-- User: wangys
-- BaseBlock 俄罗斯方块 - 方块1
--   | 4 | 3 |   |
--   |   | 1 | 2 |
--   |   |   |   |

--   |   |   | 4 |
--   |   | 1 | 3 |
--   |   | 2 |   |

--   |   |   |   |
--   | 2 | 1 |   |
--   |   | 3 | 4 |


--   |   | 2 |   |
--   | 3 | 1 |   |
--   | 4 |   |   |


local BaseBlock = import(".BaseBlock")

local Block7 = class("Block7", BaseBlock)


--------------------------------
-- 构造函数
-- @function [parent=#Block7] ctor
function Block7:ctor(angle, min, max)
    BaseBlock.ctor(self, 7, angle, min, max)
    
    self:createBlock()
    self:rotation()
end

--------------------------------
-- 创建Block
-- @function [parent=#Block7] createBlock
function Block7:createBlock()
    local bg = cc.Sprite:create()--cc.LayerColor:create(ccc4(0xFF, 0x00, 0x00, 0x80), 90, 60)
    bg:setContentSize(cc.size(90,60))
    bg:setAnchorPoint(0, 0)
    
    local sprite1 = cc.Sprite:create('tetris/fangkuai.png')
    local sprite2 = cc.Sprite:create('tetris/fangkuai.png')
    local sprite3 = cc.Sprite:create('tetris/fangkuai.png')
    local sprite4 = cc.Sprite:create('tetris/fangkuai.png')

    sprite1:setPosition(cc.p(30, 0))
    sprite1:setAnchorPoint(cc.p(0, 0))

    sprite2:setPosition(cc.p(60, 0))
    sprite2:setAnchorPoint(cc.p(0, 0))

    sprite3:setPosition(cc.p(30, 30))
    sprite3:setAnchorPoint(cc.p(0, 0))

    sprite4:setPosition(cc.p(0, 30))
    sprite4:setAnchorPoint(cc.p(0, 0))

    bg:addChild(sprite1)
    bg:addChild(sprite2)
    bg:addChild(sprite3)
    bg:addChild(sprite4)
    self:addChild(bg)
    self.width = 90

    self.sprite1 = sprite1
    self.sprite2 = sprite2
    self.sprite3 = sprite3
    self.sprite4 = sprite4

    return rtnSprite
end


--------------------------------
-- 进行翻转
-- @function [parent=#Block7] rotation
function Block7:rotation()
    if self.angle < 0 then
        self.angle = 0
        return
    end

    if self.angle == 0 then
        self.angle = 90
        self.sprite2:setPosition(cc.p(30, -30))
        self.sprite3:setPosition(cc.p(60, 0))
        self.sprite4:setPosition(cc.p(60, 30))
        
        self.offsetLeft = -30
        self.offsetRight = 0
    elseif self.angle == 90 then
        self.angle = 180
        self.sprite1:setPosition(cc.p(30, 0))
        self.sprite2:setPosition(cc.p(60, 0))
        self.sprite3:setPosition(cc.p(30, 30))
        self.sprite4:setPosition(cc.p(0, 30))

        self.offsetLeft = 0
        self.offsetRight = 0
    elseif self.angle == 180 then
        self.angle = 270
        self.sprite2:setPosition(cc.p(30, -30))
        self.sprite3:setPosition(cc.p(60, 0))
        self.sprite4:setPosition(cc.p(60, 30))
        
        self.offsetLeft = -30
        self.offsetRight = 0
    elseif self.angle == 270 then
        self.angle = 0
        self.sprite2:setPosition(cc.p(60, 0))
        self.sprite3:setPosition(cc.p(30, 30))
        self.sprite4:setPosition(cc.p(0, 30))

        self.offsetLeft = 0
        self.offsetRight = 0
    end

     self:fixPosition()
end



return Block7