---@diagnostic disable: redundant-value
local lg = love.graphics
local angulo = 0
local x, y = 400, 300

function love.load()
  lg.setBackgroundColor(1,1,1,1)
  imagem = lg.newImage("bola.jpg")
  l = imagem:getWidth()
  a = imagem:getHeight()
end

function love.update(dt)
  angulo = angulo + 0.5 *dt
  x, y = 400, math.cos(angulo) * 100, 300 + math.sin(angulo) * 100
end

function love.draw()
  rot = angulo * 180 / math.pi
  ex, ey = math.cos(angulo), math.sin(angulo)
  lg.draw(imagem, x, y, rot, ex/10, ey/10, 1/2, a/2)
  lg.draw(imagem, 100, 100, angulo)
  
end