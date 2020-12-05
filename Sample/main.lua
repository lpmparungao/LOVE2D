Window_width = 800
Window_height = 500

player = {}
platform = {}

function love.load()
    love.window.setMode(Window_width, Window_height, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })
    love.window.setTitle('Blue Box')
    img = love.image.newImageData('png.png')
    love.window.setIcon(img)

    sounds = {
        ['jump'] = love.audio.newSource('jump.wav', 'static'),
        ['hit'] = love.audio.newSource('hit_hurt.wav', 'static')
    }

    platform.Height = Window_height
    platform.Width = Window_width
    platform.x = 0
    platform.y = platform.Height / 1.5

    player.img = love.graphics.newImage('png.png')
    player.x = Window_width / 2
    player.y = Window_height / 1.5

    player.speed = 300
    player.jumpHeigth = 300
    player.gravity = 1000
    player.velocity = 0
    player.ground = player.y
end

function love.update(dt)
    if love.keyboard.isDown('d') then
        if player.x < (Window_width - player.img:getWidth()) then
            player.x = player.x + player.speed * dt
        end
    end

    if love.keyboard.isDown('a') then
        if player.x > 0 then
            player.x = player.x - player.speed * dt
        end
    end

    if love.keyboard.isDown('s') then
        if player.y < (Window_height - player.img:getHeight()) then
            player.y= player.y + player.speed * dt
        end
    end

    if love.keyboard.isDown('w') then
        if player.y > 30 then
            player.y = player.y - player.speed * dt
        end
    end

    if love.keyboard.isDown('space') then
        if player.velocity == 0 then
            player.velocity = -player.jumpHeigth
            sounds['jump']:play()
        end
    end

    if player.velocity ~= 0 then
        player.y = player.y + player.velocity * dt
        player.velocity = player.velocity + player.gravity * dt
    end

    if player.y > player.ground then
        player.velocity = 0
        player.y = player.ground
        sounds['hit']: play()
    end
end

function love.draw()
    love.graphics.draw(player.img, player.x, player.y, 0, 1, 1, 0, 32)

    love.graphics.setColor(342/255, 10, 0)
    love.graphics.rectangle('fill', platform.x, platform.y, platform.Width, platform.Height)
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end
