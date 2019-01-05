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
    --[[
    love.graphics.setColor(fontColor)
    love.graphics.setNewFont(14)
    love.graphics.print(gauge.title, gauge.start_x+5, gauge.start_y+20)

    love.graphics.setNewFont(100)
    love.graphics.print(gauge.value,  gauge.start_x+5, gauge.start_y+30)
    love.graphics.setNewFont(24)
    if gauge.value < 10 then love.graphics.print(gauge.unit,  gauge.start_x+70, gauge.start_y+100)
    else love.graphics.print(gauge.unit,  gauge.start_x+130, gauge.start_y+100)
    end
    ]]

    ----------------------
    -- Temperature Gauge
    ----------------------
    temperatureGauge:draw()

    --[[local gauge_y = gauge.panel_height + gauge.start_x - 30
    local gauge_x = gauge.panel_width / 2  + gauge.start_y 

    if     gauge.value < 30 then  love.graphics.setColor(greenColor)
    elseif gauge.value < 50 then  love.graphics.setColor(yellowColor)
    elseif gauge.value < 80 then  love.graphics.setColor(orangeColor)
    else   love.graphics.setColor(redColor)
    end
    love.graphics.arc( "fill", gauge_x, gauge_y, 80, 0, -math.pi )

    local portion = math.pi * gauge.value / 100
    local degree = ( math.pi - portion )
    love.graphics.setColor(whiteColor)
    love.graphics.arc( "line", gauge_x, gauge_y, 80, -degree, 0  )
    love.graphics.arc( "fill", gauge_x, gauge_y, 80, -degree, 0  )

    love.graphics.setColor(grayColor)
    love.graphics.arc( "line", gauge_x, gauge_y, 80, 0, -math.pi )
    love.graphics.arc( "line", gauge_x, gauge_y, 50, 0, -math.pi )
    love.graphics.arc( "fill", gauge_x, gauge_y, 50, 0, -math.pi )
    
    -- temperature label
    love.graphics.setColor(fontColor)
    love.graphics.setNewFont(24)
    if gauge.value < 10 then love.graphics.print(gauge.value .. gauge.unit,    gauge_x - 23 , gauge_y - 20)
    else love.graphics.print(gauge.value .. gauge.unit,    gauge_x - 25 , gauge_y - 20)
    end
    -- min/max label
    love.graphics.setNewFont(12)
    love.graphics.print(0,    gauge_x - 70, gauge_y + 5)
    love.graphics.print(100,  gauge_x + 50, gauge_y + 5)
    ]]
end