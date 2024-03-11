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
      drawSemiCircle(150, 200, -100, -50, 30, (math.pi / 180) * (-90), (math.pi / 180) * 95)
      drawSemiCircle(250, 200, 100, 50, 30, (math.pi / 180) * 90, (math.pi / 180) * (-95))
      drawSemiCircle(200, 150, 50, 100, 30, (math.pi / 180) * 0, (math.pi / 180) * (-186))
      drawSemiCircle(200, 250, -50, -100, 30, (math.pi / 180) * 0, (math.pi / 180) * (-186))
      love.graphics.circle("line", 200, 200, 50)
end

function drawSemiCircle(centerX, centerY, radiusX, radiusY, segments, angleStart, angleEnd)
      local semicirclePoints = {}

      for i = 0, segments do
            local angle = angleStart + (i / segments) * (angleEnd - angleStart)
            local x = centerX + radiusX * math.cos(angle)
            local y = centerY + radiusY * math.sin(angle)

            table.insert(semicirclePoints, x)
            table.insert(semicirclePoints, y)
      end

      table.remove(semicirclePoints, #semicirclePoints - 1)
      table.remove(semicirclePoints, #semicirclePoints)
      love.graphics.line(semicirclePoints)
end
