local LoginScene = class("LoginScene",function()
    return display.newScene("LoginScene")
end)

function LoginScene:ctor()
    local temp = display.cx;
    --设置背景
    self:addChild(display.newColorLayer(cc.c4b(0,0,0,0)))
    --登陆按钮
    local btn = cc.ui.UIPushButton.new("login.png");
    btn:onButtonPressed(function(_event)
            _event.target:setScale(1.1)
        end)
    btn:onButtonRelease(function(_event)
            _event.target:setScale(1)
        end)
    btn:onButtonClicked(function(_event)
            AudioManager.playSoundEffect(AudioManager.Sound_Effect_Type.Button_Click_Sound,false)
            app:enterMainScene();
        end)
    btn:addTo(self)
    btn:setAnchorPoint(cc.p(0.5,0.5))
    btn:setPosition(display.cx, display.cy);
        
        
end

function LoginScene:onEnterTransitionFinish()
    AudioManager.playGroundMusic(AudioManager.Ground_Music_Type.Music_Login,true)
    self:setScaleY(app:getSceneScaleY());
end

return LoginScene