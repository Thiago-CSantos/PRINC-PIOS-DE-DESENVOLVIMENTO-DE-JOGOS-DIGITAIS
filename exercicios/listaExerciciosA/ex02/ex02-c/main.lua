function love.load()
      love.graphics.setColor(1, 1, 1, 1)
end

function love.update(dt)

end

function love.draw()
      -- Tela x-800 y-600
      -- love.graphics.print(love.graphics.getHeight())
      -- love.graphics.print(love.graphics.getWidth())

      love.graphics.circle('line', 200, 150, 100)
      love.graphics.line(200,150, 200,50) 
      
      curva = love.math.newBezierCurve(200,150, 240,165, 250,200, 240,235, 200, 250)
      love.graphics.line(curva:render())

      
end
