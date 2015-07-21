
local LogoScene = class("LogoScene", function()
    return display.newScene("LogoScene")
end)

function LogoScene:ctor()
    self:addChild(display.newColorLayer(cc.c4b(255,255,255,255)))
    self.sprite = display.newSprite("logo/logo.png")
    self.sprite:setPosition(display.cx, display.cy)
    self:addChild(self.sprite)    
    
    self:runAction(transition.sequence({
        cc.FadeOut:create(1.5),
        cc.CallFunc:create(function()
           app:enterLoginScene()
        end)
    }))
end

function LogoScene:onEnterTransitionFinish()
    self:setScaleY(app:getSceneScaleY());
end

function LogoScene:onEnter()
end

function LogoScene:onExit()
    return;
end

return LogoScene
