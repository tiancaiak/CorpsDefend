--[[
音效管理类
]]
local AudioManager = {}

AudioManager.Music_Path = "music/"
--AudioManager.Music_Suffix = ".ogg"

--背景音乐类型
AudioManager.Ground_Music_Type=
{
    Music_Login = "login.ogg",
    Music_Lake_Town = "S500.ogg",
    Music_Fight_Dungen = "S510.ogg",
    Music_Fight = "S001.ogg"
}
--音效类型
AudioManager.Sound_Effect_Type=
    {
        Button_Click_Sound = "S0003.ogg",
        Hero_Equip_Sound = "S0004.ogg", --点击英雄装备音效
        UnEquip_Sound = "S0005.ogg",    --卸下道具
        UI_Open_Sound = "S0000.ogg",
        UI_Switch_Sound = "",   --切换页面音效
        UI_Close_Sound = "S0001.ogg",
        Player_Walk_Sound = "",
        Player_Lv_Update_Sound = "",    --人物等级变化音效
        Player_Exp_Update_Sound = "",  --人物经验变化音效
        Player_Money_Update_Sound = "",  --人物金钱变化音效
        Hero_Up_Lv_Sound = "",      --英雄升级音效
        Hero_On_Sound = "",   --英雄上阵音效
        Fight_Win_Sound = "S00001.ogg",
        Fight_Lose_Sound = "S00002.ogg",
        Use_Goods_Sound = "",   --使用物品音效
        Logo_Sount = "logo.ogg",
        Chain_Up_Sound = "chainUp.ogg",
        Chain_Down_Sound = "chainDown.ogg"
    }

--播放背景音乐
--_musicType音乐类型
--_isLoop是否循环
function AudioManager.playGroundMusic(_musicType,_isLoop)
    _isLoop = _isLoop or false
    audio.playMusic(AudioManager.Music_Path.._musicType,_isLoop)
end

--播放音效
--_soundType音效类型
--_isLoop是否循环
function AudioManager.playSoundEffect(_soundType,_isLoop)
    _isLoop = _isLoop or false
    audio.playSound(AudioManager.Music_Path.._soundType,_isLoop)
end

--播放技能音效
--_soundPath音效路径
--_isLoop是否循环
function AudioManager.playSkillSound(_soundPath,_isLoop)
    _isLoop = _isLoop or false
    audio.playSound(_soundPath,_isLoop)
end

--播放三消连击音效
--_comboNum连击次数
--_isLoop是否循环
function AudioManager.playComboSound(_comboNum,_isLoop)
    _comboNum = _comboNum or 0
    _isLoop = _isLoop or false
    local str
    if _comboNum<10 then
        str = "0".._comboNum
    else
        str = _comboNum
    end
    audio.playSound(AudioManager.Music_Path.."S000"..str..".ogg",_isLoop)
end

return AudioManager