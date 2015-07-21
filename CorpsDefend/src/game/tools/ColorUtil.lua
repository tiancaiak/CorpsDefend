local ColorUtil = {}

---红色
ColorUtil.Red_c3b = cc.c3b(204,4,1)
---绿色
ColorUtil.Green_c3b = cc.c3b(0,213,23)
---黄色
ColorUtil.Yellow_c3b = cc.c3b(255,255,0)
---蓝色
ColorUtil.Blue_c3b = cc.c3b(12,29,199)
---浅蓝色
ColorUtil.LightBlue_c3b = cc.c3b(11,130,208)
---黑色
ColorUtil.Black_c3b = cc.c3b(0,0,0)
---紫色
ColorUtil.Purple_c3b = cc.c3b(119,10,199)
---深紫色
ColorUtil.DeepPurple_c3b = cc.c3b(145,62,209)
---橙色
ColorUtil.Orange_c3b = cc.c3b(188,96,6)
---橙黄色
ColorUtil.Orangeyellow_c3b = cc.c3b(255,170,0)
---橘橙
ColorUtil.Orangeorange_c3b = cc.c3b(223,121,21)
---白色
ColorUtil.White_c3b = cc.c3b(255,255,255)
---土黄色
ColorUtil.Khaki_c3b = cc.c3b(255,206,103)
---土橙色
ColorUtil.Soilorange_c3b = cc.c3b(255,178,82)
---蛋壳色
ColorUtil.Eggshell_c3b = cc.c3b(239,208,179)
---棕色
ColorUtil.Brown_c3b = cc.c3b(210,157,81)
---淡金
ColorUtil.Palegold_c3b = cc.c3b(255,216,118)
---暗金
ColorUtil.Uniquegold_c3b = cc.c3b(201,164,124)
---灰色
ColorUtil.Gray_c3b = cc.c3b(98,95,92)
--暗银
ColorUtil.Darksilver_c3b = cc.c3b(179,169,159)

----以下均是装备系统所用叫不出名的颜色
ColorUtil.Color1 = cc.c3b(45,35,25)
ColorUtil.Color2 = cc.c3b(236,192,43)
ColorUtil.Color3 = cc.c3b(177,212,35)

function ColorUtil.Red_4b(_alpha)
    _alpha = _alpha or 0
    return { r = ColorUtil.Red_c3b.r, g = ColorUtil.Red_c3b.g, b = ColorUtil.Red_c3b.b, a = _alpha }
end

function ColorUtil.Blue_c4b(_alpha)
    return { r = ColorUtil.Blue_c3b.r, g = ColorUtil.Blue_c3b.g, b = ColorUtil.Blue_c3b.b, a = _alpha }
end

function ColorUtil.Green_c4b(_alpha)
    return { r = ColorUtil.Green_c3b.r, g = ColorUtil.Green_c3b.g, b = ColorUtil.Green_c3b.b, a = _alpha }
end

function ColorUtil.Yellow_c4b(_alpha)
    return { r = ColorUtil.Yellow_c3b.r, g = ColorUtil.Yellow_c3b.g, b = ColorUtil.Yellow_c3b.b, a = _alpha }
end

function ColorUtil.LightBlue_c4b(_alpha)
    return { r = ColorUtil.LightBlue_c3b.r, g = ColorUtil.LightBlue_c3b.g, b = ColorUtil.LightBlue_c3b.b, a = _alpha }
end

function ColorUtil.Black_c4b(_alpha)
    return { r = ColorUtil.Black_c3b.r, g = ColorUtil.Black_c3b.g, b = ColorUtil.Black_c3b.b, a = _alpha }
end

function ColorUtil.Purple_c4b(_alpha)
	return { r = ColorUtil.Purple_c3b.r, g = ColorUtil.Purple_c3b.g, b = ColorUtil.Purple_c3b.b, a = _alpha }
end

function ColorUtil.DeepPurple_c4b(_alpha)
    return { r = ColorUtil.DeepPurple_c3b.r, g = ColorUtil.DeepPurple_c3b.g, b = ColorUtil.DeepPurple_c3b.b, a = _alpha }
end

function ColorUtil.White_c4b(_alpha)
    return { r = ColorUtil.White_c3b.r, g = ColorUtil.White_c3b.g, b = ColorUtil.White_c3b.b, a = _alpha }
end

function ColorUtil.Khaki_c4b(_alpha)
    return { r = ColorUtil.Khaki_c3b.r, g = ColorUtil.Khaki_c3b.g, b = ColorUtil.Khaki_c3b.b, a = _alpha }
end

function ColorUtil.Soilorange_c4b(_alpha)
    return { r = ColorUtil.Soilorange_c3b.r, g = ColorUtil.Soilorange_c3b.g, b = ColorUtil.Soilorange_c3b.b, a = _alpha }
end

function ColorUtil.Eggshell_c4b(_alpha)
    return { r = ColorUtil.Eggshell_c3b.r, g = ColorUtil.Eggshell_c3b.g, b = ColorUtil.Eggshell_c3b.b, a = _alpha }
end

function ColorUtil.Brown_c4b(_alpha)
    return { r = ColorUtil.Brown_c3b.r, g = ColorUtil.Brown_c3b.g, b = ColorUtil.Brown_c3b.b, a = _alpha }
end

function ColorUtil.Orangeyellow_c4b(_alpha)
    return { r = ColorUtil.Orangeyellow_c3b.r, g = ColorUtil.Orangeyellow_c3b.g, b = ColorUtil.Orangeyellow_c3b.b, a = _alpha }
end

function ColorUtil.Orangeorange_c4b(_alpha)
    return { r = ColorUtil.Orangeorange_c3b.r, g = ColorUtil.Orangeorange_c3b.g, b = ColorUtil.Orangeorange_c3b.b, a = _alpha }
end

function ColorUtil.Palegold_c4b(_alpha)
    return { r = ColorUtil.Palegold_c3b.r, g = ColorUtil.Palegold_c3b.g, b = ColorUtil.Palegold_c3b.b, a = _alpha }
end

function ColorUtil.Uniquegold_c4b(_alpha)
    return { r = ColorUtil.Uniquegold_c3b.r, g = ColorUtil.Uniquegold_c3b.g, b = ColorUtil.Uniquegold_c3b.b, a = _alpha }
end

function ColorUtil.Gray_c4b(_alpha)
    return { r = ColorUtil.Gray_c3b.r, g = ColorUtil.Gray_c3b.g, b = ColorUtil.Gray_c3b.b, a = _alpha }
end

function ColorUtil.Darksilver_c4b(_alpha)
    return { r = ColorUtil.Darksilver_c3b.r, g = ColorUtil.Darksilver_c3b.g, b = ColorUtil.Darksilver_c3b.b, a = _alpha }
end

--根据英雄品质获取颜色
--_quality:品质
function ColorUtil.getHeroColor_c3b(_quality)
    --白
    if 1 == _quality then
        return ColorUtil.White_c3b
	end
	--绿
    if 2 <= _quality and _quality <= 3 then
        return ColorUtil.Green_c3b
    end
    --蓝
    if 4 <= _quality and _quality  <= 6 then
        return ColorUtil.Blue_c3b
    end
    --紫
    if 7 <= _quality and _quality <= 10 then
        return ColorUtil.Purple_c3b
    end
    --橙
    if 11 <= _quality and _quality <= 14 then
        return ColorUtil.Orange_c3b
    end
    --红
    if 15 == _quality then
        return ColorUtil.Red_c3b
    end
end
--_quality:品质
--_alpha:透明度
function ColorUtil.getHeroColor_c4b(_quality,_alpha)
    --白
    if 1 == _quality then
        return ColorUtil.White_c4b(_alpha)
    end
    --绿
    if 2 == _quality then
        return ColorUtil.Green_c4b(_alpha)
    end
    --蓝
    if 3 == _quality then
        return ColorUtil.Blue_c4b(_alpha)
    end
    --紫
    if 4 == _quality then
        return ColorUtil.Purple_c4b(_alpha)
    end
    --橙
    if 5 == _quality then
        return ColorUtil.Yellow_c4b(_alpha)
    end
    --红
    if 6 == _quality then
        return ColorUtil.Red_c4b(_alpha)
    end
end

return ColorUtil