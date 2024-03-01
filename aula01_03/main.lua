function love.load()
  love.graphics.setColor(0,0,1,1)
  love.graphics.setBackgroundColor(1,0.86,0.78)
end

function love.draw()
  --Circulo
love.graphics.circle('fill', 200, 200,50)
-- Retangulo
love.graphics.rectangle('fill', 300,300,100,100)
love.graphics.arc('fill', 450, 300, 100, 36*math.pi / 180, 90 * math.pi /180)
love.graphics.ellipse('fill', 100, 100, 75, 50, 30)

-- LInha
love.graphics.line(0,300,800,300)
-- Conjunto de linhas
love.graphics.line(200,50, 400,50, 500,280, 100,280, 200,50)

love.graphics.polygon('fill',100,100, 200, 100, 150, 200)

end