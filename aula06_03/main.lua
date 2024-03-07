local l = 300 -- Largura do objeto
local a = 200 -- altura do objeto 
local x = (love.graphics.getWidth() - l) / 2
local y = (love.graphics.getHeight() - a) / 2

function love.load()
  love.graphics.setColor(0,0,1,1)
  love.graphics.setBackgroundColor(0.8,0.8,0.8,1)
  love.graphics.setFont(love.graphics.newFont(20))
end

function love.draw()
  love.graphics.rectangle('fill', x,y,l,a)
end