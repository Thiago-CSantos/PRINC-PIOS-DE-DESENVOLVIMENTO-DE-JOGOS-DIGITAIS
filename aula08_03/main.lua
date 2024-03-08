-- Controle de elementos graficos
local passo = 1000;

function love.load()
  personagem = {} -- Criar uma tabela vazia
  personagem.x = 300
  personagem.y=400
  personagem.lado = 100
  -- Definindo as cores da janela e elementos
  love.graphics.setBackgroundColor(1,0.8,0.8,1)
  love.graphics.setColor(0,0,1,1)
end

function love.update(dt)
  if love.keyboard.isDown("d") then
    personagem.x = personagem.x + passo * dt

  elseif love.keyboard.isDown("a") then
    personagem.x = personagem.x - passo * dt
  end
  
  if love.keyboard.isDown("w") then
    personagem.y = personagem.y - passo * dt
  elseif love.keyboard.isDown("s") then
    personagem.y = personagem.y + passo * dt
  end
end

function love.draw()
  --  Renderizar o personagem
  love.graphics.rectangle('fill', personagem.x, personagem.y, personagem.lado, personagem.lado)
end