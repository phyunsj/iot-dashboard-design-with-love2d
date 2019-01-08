#!/usr/bin/lua
require "color"
require "label"
require "gauge"

panelL = {}

function panelL.init( title, location, unit, x, y)
    panelL.panel_width  = 220 
    panelL.panel_height = 300

    panelL.start_x = x
    panelL.start_y = y

    panelL.location = location

    temperatureLabel = Label(x, y, title, unit, 0)
    temperatureGauge = Gauge(x, y+150, title, unit, 0)
end

function panelL.setValue(value)
    panelL.value = value

    temperatureLabel:setValue(value)
    temperatureGauge:setValue(value)
end

function panelL.setXY(x, y)
    panelL.start_x = x 
    panelL.start_y = y

    temperatureLabel:setXY(x, y)
    temperatureGauge:setXY(x, y+120)
end

function panelL.draw()
    
    love.graphics.setColor(grayColor)
    love.graphics.rectangle("fill", panelL.start_x, panelL.start_y, panelL.panel_width, panelL.panel_height )

    -- display location
    love.graphics.setColor(fontColor)
    love.graphics.setNewFont(12)
    love.graphics.print(panelL.location, panelL.start_x+5, panelL.start_y+5)
    
    -- draw a line under the location
    love.graphics.setColor(lineColor)
    love.graphics.line( panelL.start_x +5 , panelL.start_y + 20 , panelL.start_x + panelL.panel_width - 5, panelL.start_y + 20 )

    ----------------------
    -- Temperature Label
    ----------------------
    temperatureLabel:draw()

    ----------------------
    -- Temperature Gauge
    ----------------------
    temperatureGauge:draw()

end