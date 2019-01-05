require "color"
Object = require "classic"

Gauge = Object:extend()

function Gauge:new (x, y, title, unit, value)

    self.start_x = x or 0
    self.start_y = y or 0
    self.title = title;
    self.unit = unit;
    self.value = value or 0

    self.gauge_height = 150
    self.gauge_width = 220
    self.minValue = 0
    self.maxValue = 100

end

function Gauge:setValue(newValue)
    self.value = newValue
end

function Gauge:draw ()
    
    local gauge_y = self.gauge_height + self.start_y - 30
    local gauge_x = self.gauge_width / 2  + self.start_x 

    -- adjust color based on self.value
    if     self.value < 30 then  love.graphics.setColor(greenColor)
    elseif self.value < 50 then  love.graphics.setColor(yellowColor)
    elseif self.value < 80 then  love.graphics.setColor(orangeColor)
    else   love.graphics.setColor(redColor)
    end
    love.graphics.arc( "fill", gauge_x, gauge_y, 80, 0, -math.pi )

    local portion = math.pi * self.value / 100
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
    if self.value < 10 then love.graphics.print(self.value .. self.unit,    gauge_x - 23 , gauge_y - 20)
    else love.graphics.print(self.value .. self.unit,    gauge_x - 25 , gauge_y - 20)
    end
    -- min/max label
    love.graphics.setNewFont(12)
    love.graphics.print(self.minValue,  gauge_x - 70, gauge_y + 5)
    love.graphics.print(self.maxValue,  gauge_x + 50, gauge_y + 5)

end