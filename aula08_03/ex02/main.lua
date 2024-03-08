-- Controle de elementos graficos - Animação com rotação
local personagem = {}
function love.load()
  personagem.x =200
  personagem.y =200
  personagem.raio = 50
  personagem.angulo = 0
  love.graphics.setBackgroundColor(0.5,0.1,0)
  love.graphics.setColor(1,0,0.3,1)
end

function love.draw()
  love.graphics.rotate(personagem.angulo)
  love.graphics.circle('fill', personagem.x, personagem.y, personagem.raio)
end

function love.update(dt)
  -- D Rotaciona horario
  if love.keyboard.isDown("d") then
    personagem.angulo = personagem.angulo + math.pi * dt
  -- A rotaciona sentido anti-horario 
  elseif love.keyboard.isDown("a") then
    personagem.angulo = personagem.angulo - math.pi * dt
    end
end