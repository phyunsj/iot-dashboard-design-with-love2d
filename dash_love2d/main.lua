
require "color"
require "panelL"
require "panelR"

local frame = 0

function love.load() 
    love.graphics.setColor ({ 0,0,0,1 })
    frame = 0
    panelL.init( "Current Temperature", "Living Room", "°C", 10, 10 )
    panelR.init( "Temperature vs. Humidity", "Temperature", "Humidity", 250, 10 )
end

function love.update(dt)
    
    -- not time-sensitive instrument. 1 sec.
    frame = frame + dt
    local time_series_1 = {}
    local time_series_2 = {}
    local randomTemperature = 0
    local randomHumidity = 0

    if frame > 1 then

        -- randome generation : temperature, humidity (Demo)
        randomTemperature = math.random ( 20, 90 )    
        randomHumidity = math.random ( 40, 70 )


        -- Left Panel
        panelL.setValue ( randomTemperature )

        -- Right Panel  
        time_series_1, time_series_2 = panelR.getValues()        
        if #time_series_1 > 0 then
           table.remove(time_series_1, 1) -- remove the first element
           table.insert(time_series_1, randomTemperature) -- append to time-series-array
        end
        if #time_series_2 > 0 then
            table.remove(time_series_2, 1) -- remove the first element
            table.insert(time_series_2, randomHumidity) -- append to time-series-array
        end
        panelR.setValues( time_series_1,  time_series_2 )
        -- clear "frame"
        frame = 0
    end 
end

function love.draw()
    panelL.draw()
    panelR.draw()
end