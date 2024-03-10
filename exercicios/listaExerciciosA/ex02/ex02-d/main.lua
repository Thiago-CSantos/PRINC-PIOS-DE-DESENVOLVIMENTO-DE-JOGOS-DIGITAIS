local campoW = 600
local campoH = 400

function love.load()
      love.graphics.setColor(1, 1, 1, 1)
      love.graphics.setBackgroundColor(0, 0.5, 0)

      centro_x = love.graphics.getWidth() / 2
      centro_y = love.graphics.getHeight() / 2
end

function love.update(dt)

end

function love.draw()
      -- Tela x-800 y-600
      -- love.graphics.print(centro_x) --400
      -- love.graphics.print(centro_y) -- 300

      love.graphics.line(350,100, 350,150, 450,150, 450,100)
      love.graphics.circle("line", centro_x, centro_y, 50)
      love.graphics.rectangle("line", centro_x-300, centro_y - 200, campoW, campoH)
end
