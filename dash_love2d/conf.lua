
function love.conf( t )
    t.identity      = "IoT"
    t.window.title  = "Dashboad"
    -- 3.5"  480 X 320
    t.window.width  = 480 -- love.graphics.getWidth()
    t.window.height = 320 -- love.graphics.getHeight()
    t.window.borderless = false     
    t.window.resizable = false  
    t.window.fullscreen = false -- development mode. production mode  = true
    t.window.fsaa   = 4
    t.window.vsync  = true
end