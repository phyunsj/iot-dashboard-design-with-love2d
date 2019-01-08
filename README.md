# IoT Dashboard Design with [LÖVE](https://love2d.org/) 2D Game Framework

### macOS

```
1. $ brew install lua
2. Download love.app from https://love2d.org/
3. $ vi ~/.bash_profile   <- alias love="/Applications/love.app/Contents/MacOS/love"
4. $ love <game-directroy>
```

3.5" Screen Size (480 x 320 pixels). The data was simulated.

<p align="center">
<img src="https://github.com/phyunsj/iot-dashboard-design-with-love2d/blob/master/images/dashboard-love2d-480x320.gif" width="400px"/>
</p>


Look familiar? The basic layout & color scheme were borrowed from [freeboard.io](https://freeboard.io/)


>:pushpin: **The intention of this excericse is to demonstrate 1. script-based (lua) 2. faster UI design (+ easy deployment) 3. Direct LCD display**


### iOS

The data was simulated.

<p align="center">
<img src="https://github.com/phyunsj/iot-dashboard-design-with-love2d/blob/master/images/dashboard-love2d-ios-sim.gif" width="400px"/>
</p>

From [Getting Started->iOS](https://love2d.org/wiki/Getting_Started).
```
1. Download iOS source from https://love2d.org.
2. Open the Xcode project found at love/platform/xcode/love.xcodeproj and select the "love-ios" target
3. Choose an iOS Simulator device 
4. Click the Build-and-Run ▶︎ button
5. Create <your-game>.love  <-  "zip -9 -r dash.love ."
6. Drag <your-game>.love onto LÖVE app.
```

### Raspberry Pi3

3.5" Screen Size (480 x 320 pixels). The data was simulated.

<p align="center">
<img src="https://github.com/phyunsj/iot-dashboard-design-with-love2d/blob/master/images/dash-love2d-pi3.gif" width="400px"/>
</p>

Reference : [**Developing Games on the Raspberry Pi**](https://www.amazon.com/Developing-Games-Raspberry-Pi-Programming/dp/148424169X/ref=sr_1_1?ie=UTF8&qid=1546957565&sr=8-1&keywords=Developing+Games+on+the+Raspberry+Pi)
```
Prepare microSD card for Pi3.
 
1. Download the Fedberry(Fedora) LXQT image from https://github.com/fedberry/fedberry/releases
2. Download and install the Etcher application from www.balena.io/etcher
3. In the Etcher window, select the Fedberry image file.(fedberry-xfce-29.1.raw.xz for this example)
4. Select the SD card as the destination.
5. Click the Flash button.

Install LÖVE & additional packages after boot

1. $ sudo dnf install lua
2. $ sudo dnf install git
3. Download LÖVE rpm (Last modified 2018-09-16) from klaatu.fedorapeople.org
4. $ sudo dnf install ~/Downloads/love-99f37ac-1.fc27.armv7hl.rpm

Run  LÖVE

1. $ git clone git@github.com:phyunsj/iot-dashboard-design-with-love2d.git
2. $ cd iot-dashboard-design-with-love2d/dash_love2d
3. $ love .
```

### How-To LÖVE

**LÖVE** calls 3 functions in [main.lua](https://github.com/phyunsj/iot-dashboard-design-with-love2d/blob/master/dash_love2d/main.lua). It calls `love.load()` first then `love.update()` and `love.draw()` repeatedly. In other words, `love.load`-> `love.update` -> `love.draw` -> `love.update` -> `love.draw` -> `love.update` -> ... .

**LÖVE** Dashboard Components : [Label](https://github.com/phyunsj/iot-dashboard-design-with-love2d/blob/master/dash_love2d/label.lua) (RED), [Gauge](https://github.com/phyunsj/iot-dashboard-design-with-love2d/blob/master/dash_love2d/gauge.lua) (GREEN), [Chart](https://github.com/phyunsj/iot-dashboard-design-with-love2d/blob/master/dash_love2d/chart.lua) (BLUE) 

<p align="center">
<img src="https://github.com/phyunsj/iot-dashboard-design-with-love2d/blob/master/images/dashboard_love2d_components.png" width="400px"/>
</p>

The major task is to calculate x- and y-coordinates accordingly. For example, **Chart:draw()** in [chart.lua](https://github.com/phyunsj/iot-dashboard-design-with-love2d/blob/master/dash_love2d/chart.lua):

```
    love.graphics.setColor(gray2Color)
    love.graphics.setNewFont(10)
    love.graphics.print("100", self.start_x+10, chart_y)
    love.graphics.print("75", self.start_x+10, chart_y + self.chart_height/4)
    love.graphics.print("50", self.start_x+10, chart_y + 2*self.chart_height/4)
    love.graphics.print("25", self.start_x+10, chart_y + 3*self.chart_height/4)
    love.graphics.line( chart_x, chart_y + self.chart_height/4, 
                        chart_x + self.chart_width, chart_y + self.chart_height/4) 
    love.graphics.line( chart_x, chart_y + 2*self.chart_height/4, 
                        chart_x + self.chart_width, chart_y + 2*self.chart_height/4) 
    love.graphics.line( chart_x, chart_y + 3*self.chart_height/4, 
                        chart_x + self.chart_width, chart_y + 3*self.chart_height/4) 
```

<p align="center">
<img src="https://github.com/phyunsj/iot-dashboard-design-with-love2d/blob/master/images/love2d_chart_1.png" width="200px"/>
</p>

```
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
 ```
 
<p align="center">
<img src="https://github.com/phyunsj/iot-dashboard-design-with-love2d/blob/master/images/love2d_chart_2.png" width="200px"/>
</p>

```
    love.graphics.setColor(whiteColor)
    love.graphics.line( chart_x, chart_y , chart_x, chart_y + self.chart_height) 
    love.graphics.line( chart_x, chart_y + self.chart_height, 
                        chart_x + self.chart_width, chart_y + self.chart_height) 
```

<p align="center">
<img src="https://github.com/phyunsj/iot-dashboard-design-with-love2d/blob/master/images/love2d_chart_3.png" width="200px"/>
</p>

### Related Posts

- [**Lua** Programming Language](https://www.lua.org/)
- [**LÖVE**](https://love2d.org/) 2D game framework made with C++,OpenGL
- [**LÖVE** libraries, projects, and resources](https://github.com/love2d-community/awesome-love2d)
- [**SUIT** : Simple User Interface Toolkit for LÖVE](https://github.com/vrld/SUIT)
- [Let's make some games with **LÖVE** 11](https://simplegametutorials.github.io/)
- [**freeboard** : open source real-time dashboard builder for IoT](https://github.com/Freeboard/freeboard)
- [**Developing Games on the Raspberry Pi**](https://www.amazon.com/Developing-Games-Raspberry-Pi-Programming/dp/148424169X/ref=sr_1_1?ie=UTF8&qid=1546957565&sr=8-1&keywords=Developing+Games+on+the+Raspberry+Pi)
