
cc.FileUtils:getInstance():setPopupNotify(false)
cc.FileUtils:getInstance():addSearchPath("/../../res/")



require "config"
require "cocos.init"
require "core.init"

local function main()
    local game = require("game.Game").new("game")
    game:startup()
end

local status, msg = xpcall(main, __G__TRACKBACK__)
if not status then
    print(msg)
end
