function love.load()
      -- Largura e Altura
      width = love.graphics.getWidth() * 0.25
      height = love.graphics.getHeight() * 0.30

      centro_x = (love.graphics.getWidth() - width) / 2
      centro_y = (love.graphics.getHeight() - height) / 2
end

function love.update(dt)

end

function love.draw()
      love.graphics.print(love.graphics.getHeight())
      love.graphics.setColor(1, 1, 1)

      love.graphics.rectangle("fill", centro_x, centro_y, width, height)
end
