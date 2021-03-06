--
-- Created by IntelliJ IDEA.
-- User: wangys
-- Date: 2015/7/27
-- Time: 17:31
-- To change this template use File | Settings | File Templates.
-- init 用来初始化该模块

-- 系统常量
cc.exports.fileUtils = cc.FileUtils:getInstance()
cc.exports.director = cc.Director:getInstance()

-- 用户常量
-- 资源组
cc.exports.ResourceGroup = {
    Base = "Base",
    Common = "Common",
    Module = "Module"
}

-- layers 定义
cc.exports.layers = require "core.Layers"
cc.exports.log = (require "core.log").new()

-- 重新定义traceback
__G__TRACKBACK__ = function(msg)
    local msg = debug.traceback(msg, 2)
    log:error(msg)
    return msg
end

-- quick framework
-- LOAD_SHORTCODES_API = false
-- require("core.framework.init")

-- util init
cc.exports.utils = require("core.util.init")
cc.exports.json = require("core.util.json")
require("core.component.init")


-- net
cc.exports.scheduler = require("core.scheduler")
cc.exports.net = require("core.net.init")


-- game init
cc.exports.rmgr = require "core.manager.ResourceManager".new()
cc.exports.cmgr = require "core.manager.ConnectManager".new(false)

-- 初始化Actions
require "game.Net.Actions"





