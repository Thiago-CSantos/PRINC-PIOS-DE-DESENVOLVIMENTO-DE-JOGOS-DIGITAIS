function love.load()
  love.graphics.setColor(0,0,0,1)
  love.graphics.setBackgroundColor(1,1,1,1)
end

function love.draw()
  love.graphics.line(100,200, 150,100, 200,200, 100,200)
  
  cantos = {500,100, 600,100, 550,200}
  love.graphics.polygon('fill', cantos)
end