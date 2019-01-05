require "color"
Object = require "classic"

Chart = Object:extend()

function Chart:new ( x, y, title, unit, value, displayColor)

    self.start_x = x or 0
    self.start_y = y or 0
    self.title = title
    self.unit = unit
    self.value = value or {0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0,0,0} -- 20 elements
    self.displayColor = displayColor

    self.chart_height = 100
    self.chart_width  = 200

    self.minValue = 0
    self.maxValue = 100
    self.interval = 10

end

function Chart:setValue(newValue)
    self.value = newValue
end

function Chart:getValue()
    return self.value
end

function Chart:draw ()

    love.graphics.setNewFont(14)
    love.graphics.setColor(self.displayColor)
    love.graphics.print(self.title .. " " .. self.value[ #self.value ] .." "..self.unit, self.start_x+35, self.start_y)
    
    local chart_x = self.start_x
    local chart_y = self.start_y + 10

    love.graphics.setColor(gray2Color)
    love.graphics.setNewFont(10)
    love.graphics.print("100", self.start_x+10, chart_y)
    love.graphics.print("75", self.start_x+10, chart_y + self.chart_height/4)
    love.graphics.print("50", self.start_x+10, chart_y + 2*self.chart_height/4)
    love.graphics.print("25", self.start_x+10, chart_y + 3*self.chart_height/4)
    love.graphics.line( chart_x, chart_y + self.chart_height/4, chart_x + self.chart_width, chart_y + self.chart_height/4) 
    love.graphics.line( chart_x, chart_y + 2*self.chart_height/4, chart_x + self.chart_width, chart_y + 2*self.chart_height/4) 
    love.graphics.line( chart_x, chart_y + 3*self.chart_height/4, chart_x + self.chart_width, chart_y + 3*self.chart_height/4) 

    -- display time-series values
    local preX = 0
    local preY = 0
    local curX = 0
    local curY = 0
    love.graphics.setColor(self.displayColor)
    for key, value in ipairs(self.value)
    do 
        curX = (key * self.interval) + chart_x - self.interval
        curY = chart_y + self.chart_height - self.value[key]
        if key == 1 then  -- first element. Same as curX, curY
            preX = curX
            preY = curY
        else
            preX = (key-1) * self.interval + chart_x - self.interval
            preY = chart_y + self.chart_height - self.value[key-1]
        end
        love.graphics.circle("fill", curX, curY, 2)
        love.graphics.line( preX, preY, curX, curY)
    end

    love.graphics.setColor(whiteColor)
    love.graphics.line( chart_x, chart_y , chart_x, chart_y + self.chart_height) -- vertical
    love.graphics.line( chart_x, chart_y + self.chart_height, chart_x + self.chart_width, chart_y + self.chart_height) -- horizontal

end