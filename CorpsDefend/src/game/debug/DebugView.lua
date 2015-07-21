local DebugView = class("DebugView",function()
    return display.newNode()
end)

function DebugView:ctor()
    self:setTouchSwallowEnabled(false)
    self.infoList = cc.ui.UIListView.new {
        bgColor = cc.c4b(200, 200, 200, 120),
        bgScale9 = true,
        viewRect = cc.rect(display.left, app:getDisHeight()-300, 400, 300),
        direction = cc.ui.UIScrollView.DIRECTION_VERTICAL}
        :onTouch(handler(self, self.touchListener))
        :addTo(self)
        
    self.m_infoText = cc.ui.UILabel.new(
        {text = "debug info",
            size = 20,
            align = cc.ui.TEXT_ALIGN_LEFT,
            color = display.COLOR_BLACK})
    self.m_infoText:setWidth(300)
    
    local item = self.infoList:newItem()
    item:addContent(self.m_infoText) 
    item:setItemSize(400,300)
    self.infoList:addItem(item)
    self.infoList:reload()
end

function DebugView:touchListener()
	
end

function DebugView:showDebugInfo(_info)
    local text = self.m_infoText:getString().."\n".._info
    self.m_infoText:setString(text)
end

return DebugView