local lg = love.graphics
posX = 0
veloc = 60 --pixels por 60/s
tamanho = 200
x, y = 10, 100 -- posição inicial da figura

function love.load()
  lg.setBackgroundColor(1,1,1,1)
end

function love.update(dt)
  if posX < lg.getWidth() then 
      posX = posX + veloc * dt
  else
    posX = -tamanho
  end
end

function love.draw()
  lg.setColor(1,0,0,1)
  lg.line(0,0,lg.getHeight() * 3, lg.getWidth())
  
  lg.setColor(0,0,1,1)
  lg.line(0, lg.getHeight() / 2, lg.getWidth(), lg.getHeight() / 2)
  
  lg.setColor(0,1,0,1)
  lg.polygon("fill", {posX+ x,y,posX + x+tamanho,y,posX + x+tamanho,y+tamanho, posX + x,y+tamanho})
end