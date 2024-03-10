function love.load()
      -- Raio do círculo como metade da altura da janela
      raio = love.graphics.getHeight() / 2
      
      centro_x = love.graphics.getWidth() / 2
      centro_y = love.graphics.getHeight() / 2
end

function love.update(dt)

end

function love.draw()
      love.graphics.setColor(1, 1, 1)
      
      love.graphics.circle("fill", centro_x, centro_y, raio)
end
