function love.load()
      love.graphics.setColor(1, 1, 1, 1)
end

function love.update(dt)

end

function love.draw()
      -- Tela x-800 y-600
      -- love.graphics.print(love.graphics.getHeight())
      -- love.graphics.print(love.graphics.getWidth())

      love.graphics.line(50, 100, 50, 150, 200, 300, 300, 250, 300, 200, 150, 50, 50, 100, 200, 250, 200, 300, 200, 250,
            300, 200)
end
