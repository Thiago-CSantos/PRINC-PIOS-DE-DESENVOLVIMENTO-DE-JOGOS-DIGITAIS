function love.load()
  w = love.graphics.getWidth()
  h = love.graphics.getHeight()
  love.graphics.setFont(love.graphics.newFont(20))
end

function love.update(dt)
  
end

function love.draw()
 local x, y = love.mouse.getPosition()
 love.graphics.print("Mouse em ["..x..",".. y.. "]",50,50)
 
 if love.mouse.isDown(1) then
   love.graphics.print("Botão esquerdo pressionado", 50,70)
 elseif love.mouse.isDown(2) then 
   love.graphics.print("Botão direito pressionado", 60,80)
 elseif love.mouse.isDown(3) then
   love.graphics.print("Scroll do mouse")
   end
end