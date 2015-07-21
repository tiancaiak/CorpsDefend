--[[
工具类
]]
local Tools = {}

Tools.Font_HuaKangHB_Path = "font/huakhb.ttf"

local ColorUtil = import(".ColorUtil")
local Scheduler = require("framework.scheduler")

-- 秒转时分秒 Tools.secToFromat(91) 返回 "00:01:31"
function Tools.secToFromat(sec)
    local h,lastT = math.modf(sec/60/60);
    local mTemp = math.modf(sec/60);
    local m = mTemp%60;
    local s = sec%60;
    return Tools.numTo0Fromat(h, 2)..":"..Tools.numTo0Fromat(m, 2)..":"..Tools.numTo0Fromat(s, 2)
end

-- 位数不足用0补齐,如：Tools.numTo0Fromat(82, 4) 返回 "0082"
function Tools.numTo0Fromat(value, len)
    local strValue = tostring(value);
    if string.len(strValue)>=len then
        return strValue;
    else
        local last0len = len - string.len(strValue);
        local last0str = string.rep("0", last0len);
        return last0str..strValue
    end
end

function Tools.createArmature(_name, _path)
    local armatureName = _name
    local armaturePath = _path

--    if not SourceCache:isCache(armaturePath) then
        local manager = ccs.ArmatureDataManager:getInstance()
        manager:addArmatureFileInfo(armaturePath)
--        SourceCache:cache(armaturePath)
--    end

    local armature = ccs.Armature:create(armatureName)
    armature:setAnchorPoint(cc.p(0.5,0.5));
    armature:getAnimation():playWithIndex(0);
    return armature;    
end

function Tools.createArmatureEx(_name, _path)
    local armatureName = _name
    local armaturePath = _path
--    if not SourceCache:isCache(armaturePath) then
        local manager = ccs.ArmatureDataManager:getInstance()
        manager:addArmatureFileInfo(armaturePath)
--        SourceCache:cache(armaturePath)
--    end

    local armature = ccs.Armature:create(armatureName)
    armature:setAnchorPoint(cc.p(0.5,0.5));
    return armature;    
end

function Tools.createHandGuide()
    local guideArmatureName = "handGuide"
    local guideArmaturePath = "effect/handGuide/handGuide.ExportJson"

    return Tools.createArmature(guideArmatureName, guideArmaturePath)
end

function Tools.createArrowTipGuide()
    local armatureName = "arrowTipGuide"
    local armaturePath = "effect/arrowTipGuide/arrowTipGuide.ExportJson"
    return Tools.createArmature(armatureName, armaturePath)
end

function Tools.createModel(_modelId)
    local param = {type = ELEMENT_TYPE.TYPE_PLAYER, modelId = _modelId};
    local model = require("game.view.element.LiveThing").new(param);
    model:setDirect(LIVETHING_DIRECTION.DIRECT_RIGHT);
    local armature = model:getArmature();
--    armature:setAnchorPoint(cc.p(0.5,0.5));
    return model
end

--获取程序启动运行的时间以秒为单位
function Tools.getSysTime()
    return os.clock()
end

--延迟调用函数
function Tools.delayCallFunc(_delayTime,_callFunc)
    return Scheduler.performWithDelayGlobal(_callFunc,_delayTime)
end

--创建华康海报体文本
function Tools.newHuaKangLable(_options)
    _options.font = Tools.Font_HuaKangHB_Path
    return display.newTTFLabel(_options)
end

--[[
    获取多色文本框
--_options:{
    {color=xxx,size=xxx,value=xxx},
    {color=xxx,size=xxx,value=xxx},
    ...
  }
]]
function Tools.getMultiColorLable(_options)
    if (not _options) or #_options<=0 then
    	return nil
    end
    local resNode = display.newNode()
    local attrText
    local _x = 0
    for i=1, #_options do
        attrText = display.newTTFLabel({
            text = _options[i].value,                                             
            size = _options[i].size or 20,
            color = _options[i].color or ColorUtil.White_c3b,
            align = cc.ui.TEXT_ALIGN_LEFT})
        attrText:setAnchorPoint(0,0)
        attrText:setPosition(_x,0)
        _x = _x + attrText:getContentSize().width
        resNode:addChild(attrText)
    end
    return resNode
end

--截取table数组
function Tools.subTables(_arr,_num)
    local _res = {}
    _num = _num>#_arr and #_arr or _num
    for i=1, _num do
        table.insert(_res,i,_arr[1])
        table.remove(_arr,1)
    end
    return _res
end
--检测元素是否在table数组或字典里
--@param1:待检测元素
--@param2:目标数组字典
--@return:有的话返回元素所在索引，没有则返回nil
function Tools.checkInTables(_element,_arr)
    for key, var in pairs(_arr) do
        if _element == var then
    		return key
    	end
    end
    return
end

return Tools