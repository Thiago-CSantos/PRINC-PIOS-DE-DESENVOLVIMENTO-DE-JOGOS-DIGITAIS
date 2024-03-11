function love.load()
      love.graphics.setColor(1, 1, 1, 1)

      centro_x = love.graphics.getWidth() / 2
      centro_y = love.graphics.getHeight() / 2
end

function love.update(dt)

end

function love.draw()
      -- Tela x-800 y-600
      -- love.graphics.print(centro_x) --400
      -- love.graphics.print(centro_y) --300
      curva = love.math.newBezierCurve(200,400, 130,350, 200,300)
      curva2 = love.math.newBezierCurve(500,200, 510,200, 500,300  )

      love.graphics.circle("line",200, 250, 50)
      love.graphics.line(200, 200, 500, 200)

      love.graphics.circle("line",500, 350, 50)
      love.graphics.line(200,400, 500,400)

      love.graphics.line(curva:render())
      love.graphics.line(curva2:render())

end
