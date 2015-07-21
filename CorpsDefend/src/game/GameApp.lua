
require("framework.init")
require("config")

--自定义事件管理类
import(".events.GameDispatcher"):getInstance()

AudioManager = import(".tools.AudioManager")
Tools = import(".tools.Tools")
StringUtil = import(".tools.StringUtil")

local GameApp = class("GameApp", cc.mvc.AppBase)

function GameApp:ctor()
    GameApp.super.ctor(self,"gameApp","game")
    self.m_objects = {}
    --设置随机种子，并抛去三个随机数
    math.randomseed(tonumber(tostring(os.time()):reverse():sub(1,6)))
    math.random();math.random();math.random()
    
    self.m_contentScaleY_ = 1
    if display.sizeInPixels.height>DESIGN_SCREEN_HEIGHT*(display.sizeInPixels.width/DESIGN_SCREEN_WIDTH) then
        self.m_contentScaleY_ = display.sizeInPixels.height/((display.sizeInPixels.width/DESIGN_SCREEN_WIDTH)*DESIGN_SCREEN_HEIGHT)
    end
end

function GameApp:run()
    cc.FileUtils:getInstance():addSearchPath("res/")
    self:enterScene("LogoScene")
end

--进入登录场景
function GameApp:enterLoginScene()
    self:enterScene("LoginScene")
end

--进入游戏主场景
function GameApp:enterMainScene()
    self:enterScene("MainScene")
end

--用于屏幕输出相关调试信息
function GameApp:debug(_tipText)
    if not MOBILE_DEBUG then
    	return
    end
    local runScene = display.getRunningScene()
    if self.m_debug and self.m_debug:getParent()~=runScene then
        self.m_debug:removeFromParent()
        self.m_debug = nil
    end
    if self.m_debug == nil then
    	self.m_debug = require("game.view.debug.DebugView").new()
    	runScene:addChild(self.m_debug,ZORDER.SCREEN_DEBUG_ZORDER)
    end
    self.m_debug:showDebugInfo(_tipText)
end

function GameApp:getSceneScaleY()
    return self.m_contentScaleY_
end

function GameApp:getDisHeight()
    return display.height;
end

function GameApp:getMapY()
    -- 实际高-地图据左上角距离
    local reMapY = 0;
    local scaleX = display.width/DESIGN_SCREEN_WIDTH;
    local scaleY = display.height/DESIGN_SCREEN_HEIGHT;
    if scaleX>scaleY then
        reMapY = DESIGN_MAP_Y * display.width/DESIGN_SCREEN_WIDTH;
    else
        reMapY = (display.height - (DESIGN_SCREEN_HEIGHT - DESIGN_MAP_Y) * display.width/DESIGN_SCREEN_WIDTH);
    end
    return reMapY
end

function GameApp:getInstanceMapY()
    -- 实际高-地图据左上角距离
    local reMapY = 0;
    local scaleX = display.width/DESIGN_SCREEN_WIDTH;
    local scaleY = display.height/DESIGN_SCREEN_HEIGHT;
    if scaleX>scaleY then
        reMapY = DESIGN_MAP_INSTANCE_SCENE_Y * display.width/DESIGN_SCREEN_WIDTH;
    else
        reMapY = (display.height - (DESIGN_SCREEN_HEIGHT - DESIGN_MAP_INSTANCE_SCENE_Y) * display.width/DESIGN_SCREEN_WIDTH);
    end
    return reMapY
end

function GameApp:getMapScaleY()
    -- 缩放后的地图，再次缩放
    -- 自动缩放后的地图高度
    local alreadyY = DESIGN_MAP_Y * display.width/DESIGN_SCREEN_WIDTH;
    local alreadyH = DESIGN_MAP_HEIGHT * display.width/DESIGN_SCREEN_WIDTH;
    local bottom = DESIGN_BOTTOM_HEIGHT;
    -- 目标高
    local destMapY = self:getMapY()
    local destMapH = destMapY - bottom;
    local scaleY = destMapH/alreadyH
    return scaleY
end

function GameApp:getInstanceMapScaleY()
    -- 缩放后的地图，再次缩放
    -- 自动缩放后的地图高度
    local alreadyY = DESIGN_MAP_INSTANCE_SCENE_Y * display.width/DESIGN_SCREEN_WIDTH;
    local alreadyH = DESIGN_MAP_HEIGHT * display.width/DESIGN_SCREEN_WIDTH;
    local bottom = DESIGN_BOTTOM_HEIGHT;
    -- 目标高
    local destMapY = self:getMapY()
    local destMapH = destMapY - bottom;
    local scaleY = destMapH/alreadyH
    return scaleY
end

return GameApp
