# IoT Dashboard with LÖVE 2D Game Framework

Sample example to use [LÖVE(love2d.org)](https://love2d.org/) 2D game framework for IoT Dashboard Design (3.5" screen, 320 x 240)

<p align="center">
<img src="https://github.com/phyunsj/iot-dashboard-design-with-love2d/blob/master/images/dashboard-love2d-480x320.gif" width="400px"/>
</p>

Look familiar? The basic layout & color scheme were borrowed from [freeboard.io](https://freeboard.io/)

>:pushpin: **The intention of this excericse is to demonstrate 1. script-based (lua) 2. faster UI design (easy deployment) 3. Direct LCD display**

**macOS** (UI Development Phase)
```
$ brew install lua
Download love.app from https://love2d.org/
$ vi ~/.bash_profile   <- alias love="/Applications/love.app/Contents/MacOS/love"
$ love <game-directroy>
```

**LÖVE** calls 3 functions in [main.lua](https://github.com/phyunsj/iot-dashboard-design-with-love2d/blob/master/dash_love2d/main.lua). It calls `love.load()` first then `love.update()` and `love.draw()` repeatedly. In other words, `love.load`-> `love.update` -> `love.draw` -> `love.update` -> `love.draw` -> `love.update` -> ... .

**LÖVE** Dashboard Components : [Label](https://github.com/phyunsj/iot-dashboard-design-with-love2d/blob/master/dash_love2d/label.lua)(RED), [Gauge](https://github.com/phyunsj/iot-dashboard-design-with-love2d/blob/master/dash_love2d/gauge.lua)(GREEN), [Chart](https://github.com/phyunsj/iot-dashboard-design-with-love2d/blob/master/dash_love2d/chart.lua)(Blue) 

<p align="center">
<img src="https://github.com/phyunsj/iot-dashboard-design-with-love2d/blob/master/images/dashboard_love2d_components.png" width="400px"/>
</p>



### Related Posts

- [**Lua** Programming Language](https://www.lua.org/)
- [LÖVE](https://love2d.org/) 2D game framework made with C++,OpenGL
- [LÖVE libraries, projects, and resources](https://github.com/love2d-community/awesome-love2d)
- [**SUIT** : Simple User Interface Toolkit for LÖVE](https://github.com/vrld/SUIT)
- [Let's make some games with LÖVE 11](https://simplegametutorials.github.io/)
- [freeboard](https://github.com/Freeboard/freeboard)
