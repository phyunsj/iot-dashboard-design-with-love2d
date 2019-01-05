require "color"
require "chart"

local frame = 0

panelR = {}

function panelR.init( title, target_label_1, target_label_2, x, y)

    panelR.panel_width  = 220 
    panelR.panel_height = 300
    panelR.start_x = x
    panelR.start_y = y
    panelR.title = title

    chart_top    = Chart( x+10, y+35,  target_label_1, "°C", {0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0,0,0} , orangeColor) -- 20 elements
    chart_bottom = Chart( x+10, y+170, target_label_2, "%",  {0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0,0,0} , greenColor)

end

function panelR.setValues(value_1, value_2)

    chart_top:setValue(value_1)
    chart_bottom:setValue(value_2)
    
end

function panelR.getValues()

    return chart_top:getValue() , chart_bottom:getValue()

end

function panelR.draw()
    
    love.graphics.setColor(grayColor)
    love.graphics.rectangle("fill", panelR.start_x, panelR.start_y, panelR.panel_width, panelR.panel_height )

    love.graphics.setColor(fontColor)
    love.graphics.setNewFont(12)
    love.graphics.print(panelR.title, panelR.start_x+5, panelR.start_y+5)
    
    -- draw a line under the title
    love.graphics.setColor(lineColor)
    love.graphics.line( panelR.start_x +5 , panelR.start_y + 20 , panelR.start_x + panelR.panel_width - 5, panelR.start_y + 20 )

    ----------------
    -- chart top
    ----------------
    chart_top:draw()

    ----------------
    -- chart bottom
    ----------------
    chart_bottom:draw()

end