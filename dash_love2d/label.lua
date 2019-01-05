require "color"

Object = require "classic"

Label = Object:extend()

function Label:new (x, y, title, unit, value)

   self.start_x = x or 0
   self.start_y = y or 0
   self.title = title
   self.unit = unit
   self.value = value or 0

end

function Label:setValue(newValue)
   self.value = newValue
end

function Label:draw ()

    love.graphics.setColor(fontColor)
    love.graphics.setNewFont(14)
    love.graphics.print(self.title, self.start_x+5, self.start_y+20)

    love.graphics.setNewFont(100)
    love.graphics.print(self.value,  self.start_x+5, self.start_y+30)
    love.graphics.setNewFont(24)
    if self.value < 10 then love.graphics.print(self.unit,  self.start_x+70, self.start_y+100)
    else love.graphics.print(self.unit,  self.start_x+130, self.start_y+100)
    end
    
end